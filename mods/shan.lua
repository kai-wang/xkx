require "wait"
require "tprint"
require "utils"
require("worlds\\xkx\\mods\\core")
module ("shan", package.seeall)

local shan_list = dofile("worlds\\xkx\\mods\\npcs.lua")
local context = {}

function main(f_done, f_fail)
	EnableTriggerGroup("shan", true)

	context.f_done = f_done
	context.f_fail = f_fail
	walk.run("set brief;fly es;|!k1:Ω≠∞Ÿ §:nu|", function() Execute("quest") end, fail, fail)

	timer.tickonce("action", 15, fail)
end


function init()
	EnableTriggerGroup("shan", false)
end

function done()
	var.shan_fail_times = 0
	fight.stop()
	var.shan_available_time = os.time() + 60
	EnableTriggerGroup("shan", false)
	core.safeback(function()
		me.cleanup(context.f_done)
	end, 1)
end

function fail()
	--	var.shan_available_time = os.time() + 240
	EnableTriggerGroup("shan", false)
	core.safeback(function()
		me.cleanup(context.f_fail)
	end, 1)
end

function start(name, line, wildcards)
	timer.stop("action")
	var.shan_available_time = os.time() + getseconds(wildcards[2])
	print("time: " .. getseconds(wildcards[2]))
	var.shan_npc_name = wildcards[3]
	local t = shan_list[var.shan_npc_name]
	if(t == nil or (t.exp ~= nil and tonumber(var.hp_exp) < t.exp)) then return fail() end
	context.hubo_flag = t.hubo

	var.shan_npc_id = t.name
	print(var.shan_npc_name .. " id°æ" .. var.shan_npc_id .. "°ø  room°æ" .. t.room .. "°ø")

	timer.tickonce("action", 1, function()
		core.busytest(function()
			walk.run(roomAll[t.room].path, killnpc, fail, fail)
		end, 1)
	end)
end

function killnpc()
	timer.tickonce("action", 1, function()
		if(context.hubo_flag ~= true) then
			local busy_list = config.busy_list
			local attack_list = config.attack_list1
			EnableTriggerGroup("shan_kill", true)
			fight.prepare(busy_list, attack_list)
			fight.start("kill " .. var.shan_npc_id)
		else
			local attack_list = config.attack_list4
			EnableTriggerGroup("shan_kill", true)
			fight.prepare(nil, attack_list)
			fight.start("kill " .. var.shan_npc_id)
		end
	end)
end

init()
