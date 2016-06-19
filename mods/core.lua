core = {}
core.emitter = require "worlds\\xkx\\mods\\emitter":new()

function core.init()
	print("core init")
	core.disablegroup("core_busy")
	core.disablegroup("core_safehalt")
	core.disablegroup("core_safeback")
end

function core.enablegroup(name)
	EnableTriggerGroup(name, true)
end

function core.disablegroup(name)
	EnableTriggerGroup(name, false)
end

---
--- test busy status
---

function core.busytest(f_done, interval)
	local i = interval or 1

	core.emitter:once("core_busy_end", function()
		core.disablegroup("core_busy")
		timer.stop("action")
		call(f_done)
	end)

	local f = function() Execute("suicide") end

	core.enablegroup("core_busy")
	timer.tick("action", i, f)
	f()
end

---
--- safehalt
---

function core.safehalt(f_done, interval)
	local i = interval or 0.1

	core.emitter:once("core_safehalt_end", function()
		core.disablegroup("core_safehalt")
		timer.stop("action")
		call(f_done)
		print("safe halt")
	end)

	local f = function() Execute("halt") end

	core.enablegroup("core_safehalt")
	timer.tick("action", i, f)
	f()
end

---
--- safeback
---

function core.safeback(f_done, interval)
	local i = interval or 0.1

	core.emitter:once("core_safeback_end", function()
		core.disablegroup("core_safeback")
		timer.stop("action")
		call(f_done)
		print("safe back")
	end)

	local f = function() Execute("halt;fly wm") end

	core.enablegroup("core_safeback")
	timer.tick("action", i, f)
	f()
end


core.init()

return core
