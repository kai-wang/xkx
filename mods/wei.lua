require "wait"
require "tprint"
require "utils"

--local wei_list = require 'worlds\\xkx\\mods\\info_baobiao'

wei = {}
wei.delay = 2
wei.cmd = {}
wei.cmd["go"] = "set brief 1; e;#3 s;e;u;quest;"
wei.cmd["back"] = "fly wm;e;#3 s;e;u;"
--wei.cmd["end_fail"] = "fly wm;e;#3 s;e;u;give 50 silver to wei;unset brief"


wei.start = function()
	EnableTriggerGroup("wei", true)
	--Execute(wei.cmd["go"])
end


wei.run = function()
	local l = wei_list[wei.quest]
	if(l == nil) then wei.fail() return end

	local action = l.action
	if(l.action ~= nil) then
		print(l.action)
		if(l.action(l) == false) then
			wei.fail()
		else
			wei.done()
		end
	end
end


wei.done = function()
	Execute(wei.cmd["back"].."give ".. wei_list[wei.quest].itemId .. "to wei")
	DoAfterSpecial(wei.delay, "fly wm")
end


wei.fail = function()
	Execute(wei.cmd["back"].."give 50 silver to wei;")
	DoAfterSpecial(2, 'Execute(\"fly wm;\")')
end

buyitem = function(t)
	tprint(t)
	Execute(t.path.."buy "..t.itemId)
	wait.make(function()
		local l, w = wait.regexp("^[> ]*Äã´Ó*ÂòÏÂ*"..wei.quest.."¡£", 10)
		return (l ~= nil)
	end)
	--Execute("buy "..l.itemId)
	--AddTrigger("monster", "@!"..l.item, "", trigger_flag.Enabled , custom_colour.Custom16, 0, "", "")
end



on_wei_ask = function(name, line, wildcards)
	local t = wildcards[1]
	print(t)
	wei.quest = t
	SetVariable("wei_item", t)
	wei.run()
end

return wei
