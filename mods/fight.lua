require "wait"
require "tprint"
require "utils"
require "var"

module ("fight", package.seeall)

local context = {}
local fight_info = {
	busy_list = {},
	attack_list={},
	cmd = nil
}


prepare = function(busy_list, attack_list)
	context.busy_list = busy_list
	context.attack_list = attack_list
	context.stop = false
	context.recover = false
	
	local flag = bit.bor(trigger_flag.Enabled, trigger_flag.KeepEvaluating, trigger_flag.RegularExpression, trigger_flag.Replace, trigger_flag.Temporary)
	AddTrigger("fight_busy_success" ,"^(> )*" .. me.profile.busy_success_desc .. "$","", flag, -1, 0, "", "fight.on_busy_success")
	AddTrigger("fight_perform_cd", me.profile.perform_desc .. "$","", flag, -1, 0, "", "fight.on_perform")
	
	me.profile.powerup()
end

start = function(action)
	EnableTriggerGroup("fight", true)
	if(action == "attack") then context.action = perform_attack else context.action = perform_busy end
	loop()
end

loop = function()
	wait.make(function()
		while(not context.stop) do
			if(context.recover) then
				Execute("yun recover")
			end
			context.action()
			wait.time(1)
		end
	end)
end

stop = function()
	context.stop = true
	context.recover = false
	EnableTriggerGroup("fight", false)
	DeleteTrigger("fight_busy_success")
	DeleteTrigger("fight_perform_cd")
	Execute("set fight end")
end

perform_busy = function()
	for i, v in pairs(context.busy_list) do
		if(not v.cd) then
			print(">>busy【" .. i .. "】触发了: <<" )
			v.action()
			return
		end
	end

	print("没有可用的busy，直接攻击了")
	perform_attack()
end


perform_attack = function()
	for i, v in pairs(context.attack_list) do
		if(not v.cd) then
			v.action()
			print(">>attack【" .. i .. "】触发了: <<" )
			wait.time(2)
			return
		end
	end
end

recover = function()
	context.recover = true
end

recover = function()
	context.recover = false
end


on_target_faint = function()
	msg.broadcast("msg_target_faint")
end

on_target_dead = function()
	stop()
	msg.broadcast("msg_target_dead")
end

on_target_flee = function()
	stop()
	msg.broadcast("msg_target_flee")
end

on_busy_success = function(n, l, w)
	context.action = perform_attack
end

on_perform_cd_ok = function(name, line, wildcards)
	print("调息完毕 "..wildcards[2])
	me.profile.unset_perform_cd(wildcards[2])
end

on_perform = function(name, line, wildcards)
	if(context.action == perform_attack) then context.action = perform_busy end
	
	print("调息 "..wildcards[2])
	me.profile.set_perform_cd(wildcards[2])
end