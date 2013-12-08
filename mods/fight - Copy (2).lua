require "wait"
require "tprint"
require "utils"
require "var"

module ("fight", package.seeall)


local fight_info = {
	busy_list = {},
	attack_list={},
	cmd = nil
}

init = function(cmd, busy_list, attack_list)

	local flag = bit.bor(trigger_flag.Enabled,
				trigger_flag.KeepEvaluating,
				trigger_flag.RegularExpression,
				trigger_flag.Replace,
				trigger_flag.Temporary)

	local busy_success_desc, busy_fail_desc, attack_desc = me.profile.busy_success_desc, me.profile.busy_fail_desc, me.profile.attack_desc

	--AddTrigger("fight_busy_success" ,"^(> )*" .. busy_success_desc .. "$","", flag, -1, 0, "", "fight.on_busy_success")
	AddTrigger("fight_busy_fail","^(> )*" .. busy_fail_desc .. "$","", flag, -1, 0, "", "fight.on_busy_fail")
	AddTrigger("fight_attack","^(> )*" .. attack_desc .. "$","", flag, -1, 0, "", "fight.on_attack")

	fight_info.busy_list = busy_list
	fight_info.attack_list 	= attack_list
	fight_info.cmd = cmd

	Execute(me.profile["powerup"])
	EnableTriggerGroup("fight", true)
end


function attack_begin()

	if  0 ~= IsTimer("fight_timer") then
		local ninterval = tonumber(var.fight_interval)
		AddTimer("fight_timer", 0, 0, ninterval, "", timer_flag.Enabled + timer_flag.Temporary + timer_flag.Replace, "fight.perform_busy")
		print("创建定时器")
	else
		EnableTimer("fight_timer", true)
	end --if

	if 0 ~= IsTrigger("fight_busy_success") then
		local flag = bit.bor(trigger_flag.Enabled,
						trigger_flag.KeepEvaluating,
						trigger_flag.RegularExpression,
						trigger_flag.Replace,
						trigger_flag.Temporary)

		local busy_success_desc, busy_fail_desc, attack_desc = me.profile.busy_success_desc, me.profile.busy_fail_desc, me.profile.attack_desc
		local rVal = AddTriggerEx("fight_busy_success",busy_success_desc,"",flag,custom_colour.NoChange,0, "", "fight.on_busy_success", 0, 100)
		if rVal ~= 0 then
			Note(rVal);
			Note("Error raise when AddTrigger busy_success");
		end -- if
	 end -- if

	 perform_busy()
 end --function

function attack_end()
	print("disable timer")
	ResetTimer("fight_timer")
	EnableTimer("fight_timer", false)
	DeleteTimer("fight_timer")
	DeleteTrigger("fight_busy_success")
 end --function


start = function()
	Execute(fight_info.cmd)
	attack_begin()
end

stop = function()
	attack_end()
	DeleteTrigger("fight_busy_fail")
	DeleteTrigger("fight_attack")
	EnableTriggerGroup("fight", false)
	Execute("set fight end")
	fight_info.busy_list = {}
	fight_info.attack_list = {}
	fight_info.cmd = nil
	--Simulate("\r\nfight status = end\r\n")
end


perform_busy = function()
	for i, v in pairs(fight_info.busy_list) do
		if(not v.cd) then
			print(">>busy触发了: " .. i .. "<<")
			v.action()
			return
		end
	end

	print("没有可用的busy，直接攻击了")
	perform_attack()
end

perform_attack = function()
	for i, v in pairs(fight_info.attack_list) do
		if(not v.cd) then
			v.action()
			print(">>attack触发了: " .. i .."<<")
			return
		end
	end
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
	me.profile.set_cd(l)
	wait.make (function ()  --- coroutine below here
		attack_end()
		wait.time(1)
		perform_attack()
		wait.time(2)
		attack_begin()
	end)  -- end of coroutine
end

on_busy_fail = function(n, l, w)
	me.profile.set_cd(l)
end

on_attack = function(n, l, w)
	me.profile.set_cd(l)
end


on_cd_ok = function(name, line, wildcards)
	print("调息完毕 "..wildcards[2])
	me.profile.unset_cd(wildcards[2])
end

on_cd = function(name, line, wildcards)
	print("调息 "..wildcards[2])
	me.profile.set_cd(wildcards[2])
end
