require "wait"
require "tprint"
require "utils"
require "var"

module ("fight", package.seeall)

local context = {}

prepare = function(busy_list, attack_list)
	context.busy_list = busy_list--me.profile.busy_list
	context.attack_list = attack_list--me.profile.attack_list1
	me.profile.powerup()
	context.infight = false
	context.action = fight.busy
	ts.new("fight", "fight", 2, "fight.action\(\)")
end

action = function()
	--print("tick")
	call(context.action)
end


start = function(cmd)
	if(context.infight) then print("已经在战斗中") return end
	
	EnableTriggerGroup("fight", true)
	context.infight = true
	ts.tick("fight")
	busy(cmd)
end

stop = function()
	context.infight = false
	ts.stop("fight")
	
	EnableTriggerGroup("fight", false)
	--Execute("set fight end")
end

perform_busy = function(cmd)
	if(context.busy_list == nil) then attack(cmd) return end
	
	for i, v in ipairs(context.busy_list) do
		if(not profile.pfm[v.i].cd) then
			if(cmd ~= nil) then
				--print(cmd .. ";" .. v.action)
				Execute(cmd .. ";" .. v.action)
			else
				Execute(v.action)
			end
			return
		end
	end

	--print("没有busy")
	attack(cmd)
end

perform_attack = function(cmd)
	for i, v in ipairs(context.attack_list) do
		--print(#context.attack_list, v.action, profile.pfm[v.i].cd)
		if(not profile.pfm[v.i].cd) then 
			if(cmd ~= nil) then
				--print(cmd .. ";" .. v.action)
				Execute(cmd .. ";" .. v.action)
			else
				Execute(v.action)
			end
			return
		end
	end
end

busy = function(cmd)
	--startTimer("busy")
	context.action = fight.perform_busy
	ts.reset("fight", 1.5)
	perform_busy(cmd)
end

attack = function(cmd)
	--ts.disable("fight")
	wait.make(function()
		wait.time(1)
		perform_attack(cmd)
		context.action = fight.perform_busy
		ts.reset("fight", 1.5)
	end)
	--[[
	busy_test(function()
		perform_attack(cmd)
		context.action = fight.perform_busy
		ts.reset("fight", 1.5)
	end, 0.8)
	]]--
end

attack2 = function()
	fight.perform_attack()
	context.action = fight.perform_busy
	ts.reset("fight", 1.5)
end

recover = function()
	context.action = function() Execute("yun recover") end
	ts.reset("fight", 0.6)
end

escape = function()
	context.action = function() Execute("halt;fly wm") end
	ts.reset("fight", 0.5)
end

eatyao = function()
end

faint = function()
	fight.stop()
	me.profile.reset_cd_status()
	msg.broadcast("msg_fight_faint")
end


on_busy_success = function()
	--stopTimer("busy")
	attack()
	--[[
	wait.make(function()
		wait.time(1)
		attack()
	end)
	]]--
	--stopBusyTimer()
	--attack()
end

on_perform_cd_ok = function(name, line, wildcards)
	--print("调息完毕 "..wildcards[2])
	me.profile.set_cd_status(wildcards[2], false)
end

on_perform = function(name, line, wildcards)
	--print("调息 "..wildcards[2])
	me.profile.set_cd_status(wildcards[2], true)
end

infight = function()
	return context.infight ~= nil and context.infight == true
end