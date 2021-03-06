require "wait"
require "tprint"
require "utils"
require "var"
require("worlds\\xkx\\mods\\core")

module ("baobiao", package.seeall)

local bb_list = {
	["函古关"]		= "fly ca;e;e;se;e;e;e;",
	["汉水南岸"] 	= "fly wm;e;#5 n;",
	["乱石坡"]		= "fly bj;#7 w;sw;",
	["闽江"]		= "fly fz;#5 w;nw;",
	["天山脚下"]	= "fly xx;su;s;ed;",
	["中条山密林"]	= "fly zns;e;n;n;ne;e;e;eu;su;",
	["终南山口"]	= "fly zns;",
	["华山脚下"]	= "fly ws1;",
	["平定州"]		= "fly bj;#6 w;",
	["test"]		= "fly gm;e;"
}

local cxt = {}

function init()
	EnableTriggerGroup("baobiao", false)
	EnableTriggerGroup("baobiao1", false)
end

function main(f_ok, f_fail)
	cxt.f_done = f_ok
	cxt.f_fail = f_fail

	EnableTriggerGroup("baobiao", true)
	walk.run("set brief;fly xi;e;e;n;e;ask guo about 保镖", nil, fail)
end

function ask()
	EnableTriggerGroup("baobiao1", true)
end

function songbiao(n, l, w)
	EnableTriggerGroup("baobiao1", false)
	var.baobiao_loc = w[2]

	core.safeback(nil, 1)
end

function songbiao2()
	if(var.baobiao_loc ~= nil) then
		local path = bb_list[var.baobiao_loc]
		print("保镖路径：" .. path)
		core.busytest(function()
			walk.run("halt;" .. path .. "finish", nil, fail)
		end)
	else
		fail()
	end
end

function done()
	core.safeback(function()
		EnableTriggerGroup("baobiao", false)
		EnableTriggerGroup("baobiao1", false)
		var.bb_available_time = os.time() + 90
		me.updateHP(cxt.f_done)
	end, 1)
end

function fail()
	core.safeback(function()
		EnableTriggerGroup("baobiao", false)
		EnableTriggerGroup("baobiao1", false)
		var.bb_available_time = os.time() + 30
		call(cxt.f_fail)
	end, 1)
end

function clean(f)
	me.cleanup(f)
end

init()
