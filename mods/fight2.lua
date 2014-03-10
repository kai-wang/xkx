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
	initBusyTimer()
	initRecoverTimer()
	--initEatyaoTimer()
	initEscapeTimer()
	initHaltTimer()
end

start = function(cmd)
	
	if(context.infight) then print("已经在战斗中") return end
	
	EnableTriggerGroup("fight", true)
	context.infight = true
	busy(cmd)
end

stop = function()
	context.infight = false
	stopTimer("busy")
	stopTimer("recover")
	stopTimer("eatyao")
	stopTimer("escape")
	stopTimer("halt")
	
	EnableTriggerGroup("fight", false)
	Execute("set fight end")
end

startTimer = function(name)
	if(context.infight) then
		--print("开启" .. name .. " timer")
		EnableTimer(name, true)
		ResetTimer(name)
	else
		--print("??????????????????")
	end
end

stopTimer = function(name)
	--print("关闭" .. name .. " timer")
	EnableTimer(name, false)
end

startTimerAfter = function(name, interval)
	if(interval ~= nil and tonumber(interval) > 0) then
		wait.make(function()
			wait.time(tonumber(interval))
			startTimer(name)
		end)
	end
end

initBusyTimer = function()
	if(IsTimer("busy") ~= eOK) then
		AddTimer("busy", 0, 0, 2, "fight.perform_busy\(\)", timer_flag.Replace + timer_flag.Temporary, "")
		SetTimerOption("busy", "send_to", 12)
	end
end

initRecoverTimer = function()
	if(IsTimer("recover") ~= eOK) then
		AddTimer("recover", 0, 0, 1, 
		"SetTriggerOption(\"fight_recover\", \"enabled\", \"y\") Execute(\"yun recover\")", 
		timer_flag.Replace + timer_flag.Temporary, "")
		SetTimerOption("recover", "send_to", 12)
	end	
end
			
initEscapeTimer = function()
	if(IsTimer("escape") ~= eOK) then
		AddTimer("escape", 0, 0, 1, 
		"SetTriggerOption(\"fight_escape\", \"enabled\", \"y\") Execute(\"#2(halt);fly wm;nw\")", 
		timer_flag.Replace + timer_flag.Temporary, "")
		SetTimerOption("escape", "send_to", 12)
	end	
end

initHaltTimer = function()
	if(IsTimer("halt") ~= eOK) then
		AddTimer("halt", 0, 0, 1, 
		"SetTriggerOption(\"fight_halt\", \"enabled\", \"y\") Execute(\"#2(halt)\")", 
		timer_flag.Replace + timer_flag.Temporary, "")
		SetTimerOption("halt", "send_to", 12)
	end	
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
	startTimer("busy")
	perform_busy(cmd)
end

attack = function(cmd)
	stopTimer("busy")
	perform_attack(cmd)
	startTimerAfter("busy", 1.5)
end

isTimerNotOpen = function(name)
	return (GetTimerOption(name, "enabled") ~= "y")
end

recover = function()
	stopTimer("busy")
	startTimer("recover")
end

escape = function()
	stopTimer("busy")
	stopTimer("recover")
	stopTimer("eatyao")
	stopTimer("halt")
	startTimer("escape")
end

eatyao = function()
	stopTimer("busy")
	stopTimer("recover")
	startTimer("eatyao")
end

faint = function()
	fight.stop()
	me.profile.reset_cd_status()
	msg.broadcast("msg_fight_faint")
end


on_busy_success = function()
	--stopTimer("busy")
	wait.make(function()
		wait.time(1)
		attack()
	end)
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