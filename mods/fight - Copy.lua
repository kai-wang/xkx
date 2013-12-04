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
--[[
	local flag = bit.bor(trigger_flag.Enabled,
				trigger_flag.KeepEvaluating,
				trigger_flag.RegularExpression,
				trigger_flag.Replace,
				trigger_flag.Temporary)

	local busy_success_desc, busy_fail_desc, attack_desc = me.profile.busy_success_desc, me.profile.busy_fail_desc, me.profile.attack_desc

	AddTrigger("fight_busy_success" ,"^(> )*" .. busy_success_desc .. "$","", flag, -1, 0, "", "fight.on_busy_success")
	AddTrigger("fight_busy_fail","^(> )*" .. busy_fail_desc .. "$","", flag, -1, 0, "", "fight.on_busy_fail")
	AddTrigger("fight_attack","^(> )*" .. attack_desc .. "$","", flag, -1, 0, "", "fight.on_attack")
]]--
	fight_info.busy_list = busy_list
	fight_info.attack_list 	= attack_list
	fight_info.cmd = cmd

	Execute(me.profile["powerup"])
	EnableTriggerGroup("fight", true)

	--Execute("kill yu canghai")
	--perform_busy()
end


function attack_begin(n,l,w)

	if  0 ~= IsTimer("pfm") then
		local ninterval = tonumber(var.fight_interval)
		perform_busy()
		AddTimer("pfm", 0, 0, ninterval, "", timer_flag.Enabled + timer_flag.Temporary , "fight.perform_busy")
	end --if

	if 0 ~= IsTrigger("busy_success") then
		local flag = bit.bor(trigger_flag.Enabled,
						trigger_flag.KeepEvaluating,
						trigger_flag.RegularExpression,
						trigger_flag.Replace,
						trigger_flag.Temporary)
		local rVal = AddTriggerEx("busy_success",busy_success_desc,"",flag,custom_colour.NoChange,0, "", "fight.on_busy_success", 0, 100)
		if rVal ~= 0 then
			Note(rVal);
			Note("Error raise when AddTrigger busy_success");
		end -- if
	 end -- if
 end --function

function attack_end(n,l,w)
	 if 0 == IsTimer("pfm") then
		DeleteTimer("pfm")
	 end -- if
	 if 0 == IsTrigger("busy_success") then
		DeleteTrigger("busy_success")
	 end -- if
 end --function

function busy_success(n,l,w)
	wait.make (function ()  --- coroutine below here
		attack_end()
		wait.time(1)
		perform_attack()
		wait.time(2)
		attack_begin()
	end)  -- end of coroutine
 end --function


start = function()
	Execute(fight_info.cmd)
	perform_busy()
end

stop = function()
	DeleteTrigger("fight_busy_success")
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
	fight_info.status = "busy"

	local flag = bit.bor(trigger_flag.Enabled,
		trigger_flag.KeepEvaluating,
		trigger_flag.RegularExpression,
		trigger_flag.Replace,
		trigger_flag.Temporary,
		trigger_flag.OneShot)

	--AddTrigger("fight_me_busy","^(> )*\( 你上一个动作还没有完成，不能施用外功。\)$","", flag, -1, 0, "", "fight.on_busy")

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
	fight_info.status = "attack"

	local flag = bit.bor(trigger_flag.Enabled,
		trigger_flag.KeepEvaluating,
		trigger_flag.RegularExpression,
		trigger_flag.Replace,
		trigger_flag.Temporary,
		trigger_flag.OneShot)

	--AddTrigger("fight_me_busy","^(> )*\\( 你上一个动作还没有完成，不能施用外功。\\)$","", flag, -1, 0, "", "fight.on_busy")

	for i, v in pairs(fight_info.attack_list) do
		if(not v.cd) then
			v.action()
			print(">>attack触发了: " .. i .."<<")
			return
		end
	end

	--busytest(fight.perform_busy)
	--DoAfterSpecial(3, "fight.perform_busy", 12)
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
	--tprint(me.profile.busy)
	busytest(fight.perform_attack)
end

on_busy_fail = function(n, l, w)
	me.profile.set_cd(l)
	--tprint(me.profile.busy)
	busytest(fight.perform_busy)
	--DoAfterSpecial(1, "fight.perform_busy()", 12)
end

on_attack = function(n, l, w)
	me.profile.set_cd(l)
	busytest(fight.perform_attack)
end


on_cd_ok = function(name, line, wildcards)
	print("调息完毕 "..wildcards[2])
	me.profile.unset_cd(wildcards[2])
end

on_cd = function(name, line, wildcards)
	print("调息 "..wildcards[2])
	me.profile.set_cd(wildcards[2])
end
