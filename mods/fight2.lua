require "wait"
require "tprint"
require "utils"
require "var"

module ("fight", package.seeall)

local context = {}

function init()
	EnableTriggerGroup("fight", false)
	EnableTriggerGroup("fight_busy", false)
	timer.delete("fight")
end

function prepare(busy_list, attack_list, f_escape, menpai)
	context.busy_list = busy_list
	context.attack_list = attack_list
	context.f_escape = f_escape
	--config.powerup()
	context.infight = false
	context.escape = false
	context.halt = false
	context.menpai = menpai
	timer.create("fight", "fight", 0.5, function() perform_busy() end)
end

function start(cmd)
	if(context.infight) then print("已经在战斗中") return end
	
	EnableTriggerGroup("fight", true)
	context.infight = true
	context.escape = false
	context.halt = false
	--config.powerup()
	Execute(cmd)
	if(config.buff ~= nil) then config.buff(context.menpai) end
	busy()
end

function startnobuff(cmd)
	if(context.infight) then print("已经在战斗中") return end
	
	EnableTriggerGroup("fight", true)
	context.infight = true
	context.escape = false
	context.halt = false
	--config.powerup()
	--if(config.buff ~= nil) then config.buff() end
	Execute(cmd)
	busy()
end

function stop()
	context.infight = false
	context.escape = false
	context.halt = false
	timer.stop("fight")
	print("fight stopped............")
	EnableTriggerGroup("fight", false)
end

function perform_busy()
	if(context.busy_list == nil) then attack() return end

	for i, v in ipairs(context.busy_list) do
		local busy = config.busy_list[v]
		local pfm = config.pfm[busy.i]
		if(pfm.cd_time ~= nil and (os.time() - tonumber(pfm.cd_time) > 30)) then pfm.cd = false end
		
		if(not pfm.cd) then
			busy.action()
			pfm.inuse = true
			return
		end
	end

	--print("没有busy")
	attack()
end

function perform_attack()

	for i, v in ipairs(context.attack_list) do
		local attack = config.attack_list[v]
		local pfm = config.pfm[attack.i]
		if(pfm.cd_time ~= nil and (os.time() - tonumber(pfm.cd_time) > 30)) then pfm.cd = false end
		
		if(not pfm.cd) then 
			attack.action()
			pfm.inuse = true
			return
		end
	end
end

function busy()
	perform_busy()
	timer.tick("fight", 1, function() perform_busy() end)
end

function recover()
	timer.tick("fight", 0.6, function() Execute("er;et;ef") end)
end

function escape()
	context.escape = true
	core.safeback(context.f_escape)
--[[
	timer.tick("fight", 0.1, function()
		if(context.escape == true) then return end
		context.escape = true 
		safeback("halt;fly wm", context.f_escape)
	end)
]]--
end

function halt(f_done)
	context.halt = true
	core.safehalt(f_done)

--[[
	--if(not context.halt) then context.halt = true end
	timer.tick("fight", 0.1, function()
		if(context.halt == true) then return end
		context.halt = true
		safehalt(f_done)
	end)
]]--
end

function faint()
	fight.stop()
	config.reset_cd_status()
	msg.broadcast("msg_fight_faint")
end

function eatyao()

end

function attack()
	perform_attack()
	timer.tick("fight", 1, function() perform_busy() end)
end

function on_busy_success()
	timer.tick("fight", 0.3, attack)
end

function on_busy_success_long()
	timer.tick("fight", 0.3, attack)
	EnableTriggerGroup("fight_busy", true)
end

function on_escape_success()
	if(context.escape == true) then
		call(context.f_escape)
	end
	
	fight.stop()
end

function on_perform_cd_ok(name, line, wildcards)
	--print("调息完毕 "..wildcards[2])
	config.set_cd_status(wildcards[2], false)
end

function on_perform(name, line, wildcards)
	--print("调息 "..wildcards[2])
	config.set_cd_status(wildcards[2], true)
end

function infight()
	return context.infight ~= nil and context.infight == true
end

init()