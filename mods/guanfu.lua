require "wait"
require "tprint"
require "utils"
require "var"
require("worlds\\xkx\\mods\\core")

module ("guanfu", package.seeall)

local context = {}


function main(f_done, f_fail)
	context.f_done = f_done
	context.f_fail = f_fail
	var.walk_danger_level = var.gf_walk_danger_level

	EnableTriggerGroup("guanfu_ask", true)
	Execute("set brief;fly wm;e;s;s;w;s;s;e;jie wenshu;fly wm;kan wenshu")
end


function init()
	walk.abort()
	fight.stop()
	EnableTriggerGroup("guanfu", false)
	EnableTriggerGroup("guanfu_fight", false)
	EnableTriggerGroup("guanfu_ask", false)
end

function available()
	return tonumber(var.gf_available_time) < os.time()
end

function done()
	init()
	core.safeback(function()
		Execute("er;et;ef")
		var.gf_available_time = os.time()
		clean(context.f_done)
	end, 1)
end

function fail()
	init()
	core.safeback(function()
		Execute("er;et;ef")
		clean(context.f_fail)
	end, 1)
end

function clean(f)
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


function start(name, line, wildcards)
	local npc, city, loc = wildcards[2], wildcards[3], wildcards[4]

	var.gf_npc = npc
	var.gf_city = city
	var.gf_loc = loc

	print(city .. " " .. loc .. " " .. npc)
	var.gf_found = false
	var.gf_status = "start"
	var.gf_available_time = os.time() + 600 -- 官府失败，10分钟后重试

	config.powerup()

	--如果slowwalk走完还没有stop，说明没找到
	--msg.subscribe("msg_slowalk_stop", guanfu.notfound)
	EnableTriggerGroup("guanfu_ask", false)
	EnableTriggerGroup("guanfu", true)
	EnableTriggerGroup("guanfu_fight", true)
	walk.sl(var.gf_city, var.gf_loc, guanfu.notfound, guanfu.fail, guanfu.foundnpc)
end

function notfound()
	var.gf_found = false
	fight.stop()
	Execute("halt")
	--如果walkaround走完还没找到，就retry吧
	--msg.subscribe("msg_slowwalk_ok", guanfu.fail)
	EnableTriggerGroup("guanfu_fight", true)
	walk.walkaround(5, nil, guanfu.fail, guanfu.fail, guanfu.foundnpc)
end


function foundnpc()
	var.gf_found = true
	startFight()
end

function startFight()	
	fight.prepare(config.gf_busy_test, config.gf_attack_list)
	fight.startnobuff("kill " .. var.gf_id)
end


-------- task 跑了，在原地范围内进行深度为5的遍历-----------------------------------
function search(name, line, wildcards)
	print("guanfu 往【" .. wildcards[3] .. "】跑了")
	local dir = wildcards[3]
	dir = dir:gsub("边","")
	dir = dir:gsub("面", "")
	var.gf_escape_dir = dir

	--walk.stop()
	if(walk.stopped()) then searchTask() end
	--searchTask()
end

function searchTask()
	core.busytest(function()
		if(var.gf_status == "done") then return end
		EnableTriggerGroup("guanfu_fight", true)
		config.powerup()
		walk.walkaround(3, var.gf_escape_dir, guanfu.fail, guanfu.fail, guanfu.foundnpc)
	end)
end

----看到npc死了，把东西捡起来------------------------------------
function npcdie(name, line, wildcards)
	var.gf_status = "done"
	walk.stop()
	fight.stop()
	Execute("wancheng corpse")

	core.busytest(function()
		item.lookandget(done)
	end)

end

function yesno(name, line, wildcards)
	if(var.gf_money == "yes") then
		core.busytest(function()
			item.lookandget(fail)
		end)
	end
end

function flee(name, line, wildcards)
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

	core.safeback(function()
		Execute("er;et")
		timer.tickonce("action", 1, function()
			walk.sl(var.gf_city, var.gf_loc, notfound, fail, foundnpc)
		end)
	end, 1)
end

init()
