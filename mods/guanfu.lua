require "wait"
require "tprint"
require "utils"
require "var"

module ("guanfu", package.seeall)

local items = {
	["何首乌"] = "heshouwu"
}

local gf = {
	eat_list = {},
	sell_list = {},
	drop_list = {}
}

main = function()
	EnableTriggerGroup("guanfu", true)
	Execute("fly wm;e;s;s;w;s;s;e;jie wenshu;fly wm;kan wenshu;")
end


done = function()
	EnableTriggerGroup("guanfu", false)
	msg.broadcast("msg_gf_end")
end

fail = function()
	EnableTriggerGroup("guanfu", false)
	msg.broadcast("msg_gf_end")
end


start = function(name, line, wildcards)
	local npc, city, loc = wildcards[2], wildcards[3], wildcards[4]
	SetVariable("gf_npc", npc)
	SetVariable("gf_city", city)
	SetVariable("gf_loc", loc)

	print(city .. " " .. loc .. " " .. npc)
	gf.found = false
	gf.search = 0
	--msg.subscribe("msg_slowwalk_ok", walkdone)
	--msg.subscribe("msg_slowwalk_fail", walkfail)
	walk.sl(city, loc)
end

walkdone = function()
	if(not gf.found) then
		if(gf.search == 0) then
			search()
			gf.search = gf.search + 1
		else
			tprint(gf)
			Execute("halt;fly wm")
			fail()
		end
	end
end

walkfail = function()
	print("找不到路径")
	Execute("halt;fly wm")
	fail()
end


foundnpc = function(name, line, wildcards)
	local npc_id = string.lower(wildcards[3])
	SetVariable("gf_id", npc_id)

	local busy_list = me.profile.gf_busy_list()
	local attack_list = me.profile.gf_attack_list()

	gf.found = true
	gf.search = 0
	walk.stop()

	fight.init("kill " .. npc_id, busy_list, attack_list)
	fight.start()
end


npcdie = function(name, line, wildcards)
	wait.make(function()
		fight.stop()
		Execute("wancheng corpse;look corpse")
		wait.time(2)
		Execute("get all from corpse")
		wait.time(1)
		Execute("halt;fly wm;u")
		dazuo_start()
		Execute("d;yun recover;yun regenerate")
		done()
	end)
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
	fight.stop()
	walk.stop()

	local city, loc
	if(string.match(line, "目标好像往")) then
		city, loc = wildcards[2], wildcards[4]
	else
		city, loc = wildcards[3], wildcards[5]
	end

	SetVariable("gf_city", city)
	SetVariable("gf_loc", loc)

	print(city .. " " .. loc)
	gf.found = false
	gf.search = 0

	wait.make(function()
		wait.time(2)
		Execute("yun recover")
		wait.time(1)
		Execute("halt")
		walk.sl(city, loc)
	end)
end


search = function(name, line, wildcards)
    AddTrigger("quqing_1", "^(> )*    " .. var.gf_npc .. "正坐在地下运功疗伤。$", "", 49193, -1, 0, "", "guanfu.foundnpc2")
	fight.stop()
	gf.found = false
	gf.search = 1
	Execute("halt")
	walk.walkaround(3)
end


foundnpc2 = function()
	local busy_list = me.profile.gf_busy_list()
	local attack_list = me.profile.gf_attack_list()

	walk.stop()
	gf.found = true
	gf.search = 0
	fight.init("kill " .. var.gf_id, busy_list, attack_list)
	fight.start()
end
