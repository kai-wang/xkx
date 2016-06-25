require "var"
require "tprint"
require "wait"


local timers = {}
local timer = {}

function timer:new(name)
	if not self.emitter then
		self.name = name
		self.emitter = emitter:new()
	end

	return self
end

create = function(name, group, interval, handler)	
	if(timers[name] == nil and IsTimer(name) ~= 0) then
		local hour, minute, second = split(interval)
		AddTimer(name, hour, minute, second, "timer.fire\(\"" .. name .. "\"\)", timer_flag.Replace, "")
		SetTimerOption(name, "send_to", 12)
		SetTimerOption(name, "group", group)
		print("register timer " ..  name)
		timers[name] = handler
	end
end

split = function(interval)
	local hour = math.floor(interval / 3600)
	local minute = math.floor((interval - hour*3600) / 60)
	local second = (interval - hour*3600) % 60
	
	return hour, minute, second
end

tick = function(name, interval, callback)
	if(interval ~= nil) then reset(name, interval) end
	
	if(IsTimer(name) == 0 and callback ~= nil) then
		timers[name] = callback
		EnableTimer(name, true)
	end
end

tickonce = function(name, interval, callback)
	tick(name, interval, 
	function()
		timer.stop(name)
		call(callback)
	end
	)
end

reset = function(name, interval)
	if(IsTimer(name) == 0) then
		EnableTimer(name, true)
		local hour, minute, second = split(interval)
		SetTimerOption(name, "hour", hour)
		SetTimerOption(name, "minute", minute)
		SetTimerOption(name, "second", second)
		ResetTimer(name)
	end
end

stop = function(name)
	EnableTimer(name, false)
end

delete = function(name)
	EnableTimer(name, false)
	DeleteTimer(name)
end

stopall = function()
	for i, v in pairs(timers) do
		print(i)
		stop(i)
	end
end

fire = function(name)
	if(timers[name] ~= nil ) then 
		call(timers[name])
	end
end

init = function()
	delete("fight")
	delete("action")
	delete("idle")
	delete("reconnect")
	
	timer.create("fight", "fight", 0.5, nil)
	timer.create("reconnect", "reconnect", 90, function() reconnect() end)
	timer.create("idle", "idle", 300, nil)
	timer.create("action", "action", 1.5, nil)
end

reconnect = function(interval,f_done)
	Disconnect()
	wait.make(function()
		if(interval ~= nil) then
			wait.time(interval)
		end
		Connect()
		wait.time(5)
		Send(var.me_id)
		Send("Flying1")
		Send("y")
		DeleteTemporaryTimers()
		call(f_done)
	end)
end

init()