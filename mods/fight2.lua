require "wait"
require "tprint"
require "utils"
require "var"

module ("fight", package.seeall)

local context = {}

prepare = function(busy_list, attack_list, f_escape)
	context.busy_list = busy_list
	context.attack_list = attack_list
	context.f_escape = f_escape
	me.profile.powerup()
	context.infight = false
	context.escape = false
	context.action = fight.busy
	ts.new("fight", "fight", 1.5, "fight.action\(\)")
end

action = function()
	--print("tick")
	call(context.action)
end


start = function(cmd)
	if(context.infight) then print("已经在战斗中") return end
	
	EnableTriggerGroup("fight", true)
	context.infight = true
	context.escape = false
	ts.tick("fight")
	busy(cmd)
end

stop = function()
	context.infight = false
	context.escape = false
	ts.stop("fight")
	print("fight stopped............")
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
	reset_flag()
	for i, v in ipairs(context.attack_list) do
		local pfm = profile.pfm[v.i]
		if(pfm.cd_time ~= nil and (os.time() - tonumber(pfm.cd_time) > 30)) then pfm.cd = false end
		
		if(not pfm.cd) then 
			if(cmd ~= nil) then
				Execute(cmd .. ";" .. v.action)
			else
				Execute(v.action)
			end
			pfm.inuse = true
		end
	end
end

reset_flag = function()
	for i, v in ipairs(context.attack_list) do
		profile.pfm[v.i].inuse = false
	end
end

busy = function(cmd)
	context.action = fight.perform_busy
	ts.reset("fight", 1.5)
	perform_busy(cmd)
end

attack = function(cmd)
	wait.make(function()
		wait.time(0.5)
		perform_attack(cmd)
			
		context.action = fight.perform_busy
		ts.reset("fight", 1)
	end)
end

attack2 = function()
	fight.perform_attack()
	context.action = fight.perform_busy
	ts.reset("fight", 1)
end

recover = function()
	context.action = function() Execute("yun recover;yun regenerate") end
	ts.reset("fight", 0.6)
end

escape = function()
	context.action = function()
		if(context.escape == true) then return end
		context.escape = true 
		safeback("halt;fly wm", context.f_escape)
	end
	ts.reset("fight", 0.5)
end

faint = function()
	fight.stop()
	me.profile.reset_cd_status()
	msg.broadcast("msg_fight_faint")
end

eatyao = function()

end

on_busy_success = function()
	attack()
end

on_escape_success = function()
	if(context.escape == true) then
		call(context.f_escape)
	end
	
	fight.stop()
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