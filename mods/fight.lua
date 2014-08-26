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
end


start = function(cmd)
	if(context.infight) then print("已经在战斗中") return end
	
	EnableTriggerGroup("fight", true)
	context.infight = true
	busy_test(function() perform_busy(cmd) end, 1)
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


attack = function(cmd)
	busy_test(function()
		perform_attack(cmd)
		busy_test(function()
			perform_busy()
		end,1)
	end, 0.5)
end

attack2 = function()
	attack()
end

recover = function()
	busy_test(function() Execute("er;et;ef") end, 0.5)
end

escape = function()
	busy_test(function() Execute("halt;fly wm") end, 0.5)
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