require "wait"
require "tprint"
require "utils"
require "var"

module ("baobiao", package.seeall)

local bb_list = {
	["���Ź�"]		= "fly ca;e;e;se;e;e;e;",
	["��ˮ�ϰ�"] 	= "fly wm;e;#5 n;",
	["��ʯ��"]		= "fly bj;#7 w;sw;",
	["����"]		= "fly fz;#5 w;nw;",
	["��ɽ����"]	= "fly xx;su;s;ed;",
	["����ɽ����"]	= "fly zns;e;n;n;ne;e;e;eu;su;",
	["����ɽ��"]	= "fly zns;",
	["��ɽ����"]	= "fly ws1;",
	["ƽ����"]		= "fly bj;#6 w;",
	["test"]		= "fly gm;e;"
}

local cxt = {}

init = function()
	EnableTriggerGroup("baobiao", false)
	EnableTriggerGroup("baobiao1", false)
end

main = function(f_ok, f_fail)
	cxt.f_done = f_ok
	cxt.f_fail = f_fail
	
	EnableTriggerGroup("baobiao", true)
	walk.run("set brief;fly xi;e;e;n;e;ask guo about ����", nil, fail)
end

ask = function()
	EnableTriggerGroup("baobiao1", true)
end

songbiao = function(n, l, w)
	EnableTriggerGroup("baobiao1", false)
	var.baobiao_loc = w[2]

	Execute("halt;fly wm")	
end

songbiao2 = function()
	if(var.baobiao_loc ~= nil) then
		local path = bb_list[var.baobiao_loc]
		print("����·����" .. path)
		busy_test(function()
			walk.run("halt;" .. path .. "finish", nil, fail)
		end)
	else
		fail()
	end
end

done = function()
	busy_test(function()
		Execute("halt;fly wm")
		EnableTriggerGroup("baobiao", false)
		EnableTriggerGroup("baobiao1", false)
		var.bb_available_time = os.time() + 90
		wait.time(1)
		--call(cxt.f_done)
		clean(cxt.f_done)
	end)
end

fail = function()
	busy_test(function()
		Execute("halt;fly wm")
		EnableTriggerGroup("baobiao", false)
		EnableTriggerGroup("baobiao1", false)
		var.bb_available_time = os.time() + 30
		wait.time(1)
		call(cxt.f_fail)
	end)
end

clean = function(f)
	if(var.gf_money == "yes") then
		me.full(function()
			me.check_money(function()
				me.recover(f)
			end)
		end)
	else
		me.cleanup(f)
	end
end

init()