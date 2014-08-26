require "wait"
require "tprint"

module ("busytest", package.seeall)

local f = nil

start = function(handler, interval)
	f = handler
	ts.new("busytest", "busytest", 0.5, "Send(\"suicide\")")
	ts.tick()
end

fire = function()
	call(f)
end

stop = function()
	ts.stop("busytest")
	f = nil
end