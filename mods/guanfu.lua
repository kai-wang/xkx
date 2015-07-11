require "wait"
require "tprint"
require "utils"
require "var"

module ("guanfu", package.seeall)

local context = {}


main = function(f_done, f_fail)
	context.f_done = f_done
	context.f_fail = f_fail
	
	EnableTriggerGroup("guanfu", true)
	Execute("set brief;fly wm;e;s;s;w;s;s;e;jie wenshu;fly wm;kan wenshu")
end


init = function()
	walk.abort()
	fight.stop()
	EnableTriggerGroup("guanfu", false)
end


available = function()
	return tonumber(var.gf_available_time) < os.time()
end

done = function()
	busy_test(function()
		init()
		safeback("halt;fly wm", function() 
			Execute("er;et;ef")
			var.gf_available_time = os.time()
			clean(context.f_done)
		end)
		--Execute("halt;fly wm;nw;er;et;ef")
		--var.gf_available_time = os.time()
		--clean(context.f_done)
		--me.cleanup(context.f_done)
	end)
end

fail = function()
	busy_test(function()
		init()
		safeback("halt;fly wm", function() 
			Execute("er;et;ef")
			clean(context.f_fail)
		end)
		--Execute("halt;fly wm;nw;er;et;ef")
		--clean(context.f_fail)
		--me.cleanup(context.f_fail)
	end)
end

clean = function(f)
	if(var.gf_money == "yes") then
		me.full(function()
			me.check_money(function()
				me.recover(f)
			end)
		end)
	else
		me.cleanup(f)
	end
end


start = function(name, line, wildcards)
	local npc, city, loc = wildcards[2], wildcards[3], wildcards[4]
	
	var.gf_npc = npc
	var.gf_city = city
	var.gf_loc = loc
	
	print(city .. " " .. loc .. " " .. npc)
	var.gf_found = false
	var.gf_status = "start"
	var.gf_available_time = os.time() + 600 -- 官府失败，10分钟后重试
	
	local busy_list = me.profile.busy_list
	local attack_list = me.profile.attack_list1
	fight.prepare(busy_list, attack_list)
	
	--如果slowwalk走完还没有stop，说明没找到
	--msg.subscribe("msg_slowalk_stop", guanfu.notfound)
	walk.sl(var.gf_city, var.gf_loc, guanfu.notfound, guanfu.fail, guanfu.foundnpc)
end

notfound = function()
	var.gf_found = false
	fight.stop()
	Execute("halt")
	--如果walkaround走完还没找到，就retry吧
	--msg.subscribe("msg_slowwalk_ok", guanfu.fail)
	walk.walkaround(5, nil, guanfu.fail, guanfu.fail, guanfu.foundnpc)
end


foundnpc = function()
	var.gf_found = true
	startFight()
end


startFight = function()
	local busy_list = me.profile.busy_list
	local attack_list = me.profile.attack_list1
	fight.prepare(busy_list, attack_list)
	
	fight.start("kill " .. var.gf_id)
end


-------- task 跑了，在原地范围内进行深度为5的遍历-----------------------------------
search = function(name, line, wildcards)
	print("guanfu 往【" .. wildcards[3] .. "】跑了")
	local dir = wildcards[3]
	dir = dir:gsub("边","")
	dir = dir:gsub("面", "")
	var.gf_escape_dir = dir
	
	--walk.stop()
	if(walk.stopped()) then searchTask() end
	--searchTask()
end

searchTask = function()
	busy_test(function()
		if(var.gf_status == "done") then return end
		walk.walkaround(3, var.gf_escape_dir, guanfu.fail, guanfu.fail, guanfu.foundnpc)
	end)
end

----看到npc死了，把东西捡起来------------------------------------
npcdie = function(name, line, wildcards)
	wait.make(function()
		var.gf_status = "done"
		walk.stop()
		fight.stop()
		Execute("wancheng corpse")
		--wait.time(3)
		busy_test(function()
			item.lookandget(done)
		end)
	end)
end

yesno = function(name, line, wildcards)
	if(var.gf_money == "yes") then
		wait.make(function()
			Execute("yes")
			wait.time(1)
			busy_test(function()
				item.lookandget(fail)
			end)
		end)
	end
end

flee = function(name, line, wildcards)
	--msg.unsubscribe("msg_slowwalk_stop")
	fight.stop()
	walk.abort()

	local city, loc
	if(string.match(line, "目标好像往")) then
		city, loc = wildcards[2], wildcards[4]
	else
		city, loc = wildcards[3], wildcards[5]
	end

	var.gf_city = city
	var.gf_loc = loc

	print(city .. " " .. loc)
	var.gf_found = false

	wait.make(function()
		wait.time(2)
		Execute("yun recover")
		wait.time(1)
		Execute("halt")
		walk.sl(var.gf_city, var.gf_loc, notfound, fail, foundnpc)
	end)
end

init()