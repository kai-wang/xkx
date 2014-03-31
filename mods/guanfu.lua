require "wait"
require "tprint"
require "utils"
require "var"

module ("guanfu", package.seeall)


main = function()
	EnableTriggerGroup("guanfu", true)
	--[[
	msg.subscribe("msg_slowwalk_ok", guanfu.notfound)
	msg.subscribe("msg_slowwalk_fail", guanfu.fail)
	]]--
	Execute("set brief;fly wm;e;s;s;w;s;s;e;jie wenshu;fly wm;kan wenshu")
end


exit = function()
	walk.abort()
	fight.stop()
	EnableTriggerGroup("guanfu", false)
	--[[
	msg.unsubscribe("msg_slowwalk_ok")
	msg.unsubscribe("msg_slowwalk_fail")
	msg.unsubscribe("msg_slowwalk_stop")
	]]--
	msg.broadcast("msg_guanfu_exit")
end


available = function(t)
	if(t == nil or t == 0) then msg.broadcast("msg_guanfu_available")
	else
		wait.make(function()
			wait.time(t)
			msg.broadcast("msg_guanfu_available")
		end)
	end
end

done = function()
	var.gf_status = "done"
	exit()
	available()
end

fail = function()
	var.gf_status = "fail"
	fight.stop()
	walk.stop()
	exit()
	Execute("halt;fly wm")
end


start = function(name, line, wildcards)
	local npc, city, loc = wildcards[2], wildcards[3], wildcards[4]
	
	var.gf_npc = npc
	var.gf_city = city
	var.gf_loc = loc
	
	print(city .. " " .. loc .. " " .. npc)
	var.gf_found = false
	
	local busy_list = {}--me.profile.busy_list
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

--[[
foundnpc = function(name, line, wildcards)
	if(wildcards[4] ~= nil and wildcards[4] ~= "") then var.gf_id = string.lower(wildcards[4]) end
	msg.subscribe("msg_slowwalk_stop", function()
		var.gf_found = true
		startFight()
	end)
	
	walk.stop()
end
]]--


startFight = function()
	local busy_list = {}--me.profile.busy_list
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
	if(walk.stopped()) then earchTask() end
	--searchTask()
end

searchTask = function()
	busy_test(function()
		walk.walkaround(3, var.gf_escape_dir, guanfu.fail, guanfu.fail, guanfu.foundnpc)
	end)
	--[[
	wait.make(function()
		repeat
			wait.time(1)
			Execute("suicide")
			local l, w = wait.regexp("^(> )*(你正忙着呢，没空自杀！)|(请用 suicide -f 确定自杀。)$")
		until(l:match("确定自杀") ~= nil)
		walk.walkaround(3, var.gf_escape_dir, guanfu.fail, guanfu.fail, guanfu.foundnpc)
	end)
	]]--
end

----看到npc死了，把东西捡起来------------------------------------
npcdie = function(name, line, wildcards)
	wait.make(function()
		walk.stop()
		fight.stop()
		Execute("wancheng corpse")
		wait.time(3)
		item.lookandget(guanfu.cleanup)
	end)
end


----task结束后的善后工作，疗伤学习打坐----------------------------
cleanup = function()
	Execute("fly wm;jiali 0;er;et")
	me.full(function()
		me.useqn(function()
			wait.make(function()
				me.updateHP(function()
					if(tonumber(me["nl"]) > tonumber(me["nl_max"]) * 1.2) then 
						Execute("er;et;fly wm")
						guanfu.done() 
					else
						wait.time(1)
						Execute("halt;fly wm;u")
						dazuo.start(function()
							Execute("er;et;d")
							guanfu.done()
						end)
					end
				end)
			end)
		end)
	end)
--[[
	Execute("fly wm;jiali 0;er;et")
	me.updateHP(function()
		me.full(function()
			msg.subscribe("msg_study_done", me.updateHP(function()
				wait.make(function()
					if(tonumber(me["nl"]) > tonumber(me["nl_max"]) * 1.2) then 
						Execute("er;et;fly wm")
						guanfu.done() 
					else
						wait.time(1)
						Execute("halt;fly wm;u")
						dazuo.start(function()
							Execute("er;et;d")
							guanfu.done()
						end)
					end
				end)
			end))
			me.useqn()
		end)
	end)
]]--
end


yesno = function(name, line, wildcards)
	if(var.gf_money == "yes") then
		wait.make(function()
			Execute("yes")
			EnableTriggerGroup("guanfu", false)
			wait.time(1)
			fail()
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
		--msg.subscribe("msg_slowalk_stop", guanfu.notfound)
		walk.sl(var.gf_city, var.gf_loc, guanfu.notfound, guanfu.fail, guanfu.foundnpc)
	end)
end