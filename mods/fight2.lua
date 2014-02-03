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
	
	initBusyTimer()
	initRecoverTimer()
	initEatyaoTimer()
	initEscapeTimer()
	initHaltTimer()
end

start = function(cmd)
	if(context.infight) then return end
	
	EnableTriggerGroup("fight", true)
	busy(cmd)
end

startTimer = function(name)
	print("开启" .. name .. " timer")
	EnableTimer(name, true)
	ResetTimer(name)
end

stopTimer = function(name)
	print("关闭" .. name .. " timer")
	EnableTimer(name, false)
end

initBusyTimer = function()
	if(isTimer("busy") == nil) then
		AddTimer("busy", 0, 0, 2, "", timer_flag.Replace + timer_flag.Temporary, "fight.perform_busy")
		SetTimerOption("busy", "send_to", 12)
	end
end

initRecoverTimer = function()
	if(isTimer("recover") == nil) then
		AddTimer("recover", 0, 0, 1, 
		"SetTriggerOption(\"fight_recover\", \"enabled\", \"y\") Execute(\"yun recover\")", 
		timer_flag.Replace + timer_flag.Temporary, "")
		SetTimerOption("recover", "send_to", 12)
	end	
end
			
initEscapeTimer = function()
	if(isTimer("escape") == nil) then
		AddTimer("recover", 0, 0, 1, 
		"SetTriggerOption(\"fight_escape\", \"enabled\", \"y\") Execute(\"#2(halt);fly wm;nw\")", 
		timer_flag.Replace + timer_flag.Temporary, "")
		SetTimerOption("escape", "send_to", 12)
	end	
end

initHaltTimer = function()
	if(isTimer("halt") == nil) then
		AddTimer("halt", 0, 0, 1, 
		"SetTriggerOption(\"fight_halt\", \"enabled\", \"y\") Execute(\"#2(halt)\")", 
		timer_flag.Replace + timer_flag.Temporary, "")
		SetTimerOption("halt", "send_to", 12)
	end	
end

stop = function()
	stopTimer("busy")
	stopTimer("recover")
	stopTimer("eatyao")
	stopTimer("escape")
	stopTimer("halt")
	
	EnableTriggerGroup("fight", false)
	Execute("set fight end")
end

busy = function(cmd)
	startTimer("busy")
	perform_busy(cmd)
end

perform_busy = function(cmd)
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

	print("没有busy")
	attack(cmd)
end

attack = function(cmd)
	stopTimer("busy")
	perform_attack(cmd)
	DoAfterSpecial(3, "fight.startTimer(\"busy\")", 12)
end

perform_attack = function(cmd)
	for i, v in ipairs(context.attack_list) do
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

stopTimer = function(name)
	print("关闭" .. name .. " timer")
	context.timers[name] = false
end


startBusyTimer = function(delay)
	if(context.timers["eatyao"] or context.timers["escape"] or context.timers["halt"] or context.timers["recover"] or context.timers["busy"]) then return end
	context.timers["busy"] = true
	
	wait.make(function()
		print("开启busy timer")
		if(delay ~= nil) then wait.time(tonumber(delay)) end
		while(context.infight and context.timers["busy"]) do
			wait.time(1.5)
			perform_busy()
		end
	end)
end

startRecoverTimer = function(delay)
	context.timers["busy"] = false
	if(context.timers["eatyao"] or context.timers["escape"]) then return end
	context.timers["recover"] = true
	
	wait.make(function()
		print("开启recover timer")
		if(delay ~= nil) then wait.time(tonumber(delay)) end
		while(context.infight and context.timers["recover"]) do
			SetTriggerOption("fight_recover", "enabled", "y")
			Execute("yun recover")
			wait.time(1)
		end
	end)
end

startEatyaoTimer = function(delay)
	context.timers["busy"] = false
	context.timers["busy"] = false
	if(context.timers["escape"]) then return end
	context.timers["eatyao"] = true
	
	wait.make(function()
		print("开启eatyao timer")
		if(delay ~= nil) then wait.time(tonumber(delay)) end
		while(context.infight and context.timers["eatyao"]) do
			local l, w = wait.regexp("^(> )*(你.*九转银丹|你.*玄冰碧火酒|什么).*$", 0.5)
			if(l ~= nil and l:find("什么")  ~= nil) then 
				stopTimer("eatyao")
				busy()
			else
				startEscapeTimer()
			end
		end
	end)
end

startEscapeTimer = function(delay)
	context.timers["busy"] = false
	context.timers["recover"] = false
	context.timers["eatyao"] = false
	context.timers["halt"] = false
	context.timers["escape"] = true
	
	wait.make(function()
		print("开启escape timer")
		if(delay ~= nil) then wait.time(tonumber(delay)) end
		while(context.infight and context.timers["escape"]) do
			SetTriggerOption("fight_escape", "enabled", "y")
			Execute("#2(halt);fly wm;nw")
			wait.time(1)
		end
	end)
end

startHaltTimer = function(delay)
	context.timers["busy"] = false
	context.timers["recover"] = false
	if(context.timers["eatyao"] or context.timers["escape"]) then return end
	context.timers["halt"] = true
	
	wait.make(function()
		print("开启halt timer")
		if(delay ~= nil) then wait.time(tonumber(delay)) end
		while(context.infight and context.timers["halt"]) do
			SetTriggerOption("fight_halt", "enabled", "y")
			Execute("#2(halt)")
			wait.time(1)
		end
	end)
end

stopHaltTimer = function()
	SetTriggerOption("fight_halt", "enabled", "n")
	context.timers["halt"] = false
end

stopEscapeTimer = function()
	SetTriggerOption("fight_escape", "enabled", "n")
	context.timers["escape"] = false
	msg.broadcast("msg_fight_escape")
end

stopRecoverTimer = function()
	SetTriggerOption("fight_recover", "enabled", "n")
	context.timers["recover"]	= false
	busy()
end

stopEatyaoTimer = function()
	context.timers["eatyao"] = false
end

stopBusyTimer = function()
	context.timers["busy"] = false
end

on_busy_success = function()
	--stopTimer("busy")
	attack()
	--stopBusyTimer()
	--attack()
end

on_perform_cd_ok = function(name, line, wildcards)
	print("调息完毕 "..wildcards[2])
	me.profile.set_cd_status(wildcards[2], false)
end

on_perform = function(name, line, wildcards)
	print("调息 "..wildcards[2])
	me.profile.set_cd_status(wildcards[2], true)
end