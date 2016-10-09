require "wait"
require "tprint"
require("worlds\\xkx\\mods\\core")

function call(f, ...)
	if(f ~= nil) then f(...) end
end

function suck()
	wait.make(function()
		while true do
			Execute("yun maxsuck")
			wait.time(2)
		end
	end)
end

function kantou(f)
	wait.make(function()
		local blade = config.choose_xuedao(0)
		Execute("unwield all;wield " .. blade .. "enable blade xue-dao;kantou corpse;drop head")
		call(f)
	end)
end

function double(f)
	if(var.double_available_time ~= "" and var.double_available_time ~= nil and tonumber(var.double_available_time) > os.time()) then
		call(f)
	else
		wait.make(function()
			Execute("fly wm;u;ask jin about 双倍奖励;d")
			local l, w = wait.regexp("^(> )*(你领取了半小时双倍时间)|(你的双倍时间次数已用完).*$", 3)
			if(l ~= nil and l:match("你领取了半小时双倍时间")) then
				var.double_bonus = true
				var.double_available_time = os.time() + 1800
			elseif(l ~= nil and l:match("已用完")) then
				var.double_bonus = false
				var.double_available_time = os.time() + 7200
			end
			call(f)
		end)
	end
end

function qukuan(amount, f_ok, f_fail)
	wait.make(function()
		Execute("fly wm;e;s;w;qukuan " .. amount)
		local l, w = wait.regexp("^(> )*你从银号里取出.*$", 5)
		if(not l or l:match("你从银号") == nil) then
			print("取款失败了") 
			call(f_fail) 
			return 
		end
		core.busytest(f_ok)
	end)
end

function get_xionghuang(f_ok, f_fail)
	wait.make(function()
		Execute("set brief;fly wm;nw;give xionghuang to " .. var.me_id)
		local l, w = wait.regexp("^(> )*(你身上没有这样东西)|(.*给你一包雄黄).*$")
		if(l:match("你身上没有这样东西") ~= nil) then
			Execute("se;e;s;s;e;e;n;buy xionghuang")
			wait.time(5)
			Execute("fly wm;nw;give xionghuang to " .. var.me_id)
			l, w = wait.regexp("^(> )*(你身上没有这样东西)|(.*给你一包雄黄).*$")
			if(var.fast_mode == "1") then wait.time(1) end
			if(l:match("你身上没有这样东西") ~= nil) then print("雄黄失败了") call(f_fail) return end
		end
		print("雄黄准备好了")
		call(f_ok)
	end)
end

function get_fire(f_ok, f_fail)
	wait.make(function()
		Execute("set brief;fly wm;nw;give fire to " .. var.me_id)
		local l, w = wait.regexp("^(> )*(你身上没有这样东西)|(.*给你一支火折).*$")
		if(l:match("你身上没有这样东西") ~= nil) then
			Execute("se;e;s;s;e;s;buy fire")
			wait.time(5)
			Execute("fly wm;nw;give fire to " .. var.me_id)
			l, w = wait.regexp("^(> )*(你身上没有这样东西)|(.*给你一支火折).*$")
			--if(var.fast_mode == "1") then wait.time(1) end
			if(l:match("你身上没有这样东西") ~= nil) then 
				if(var.fast_mode == "1") then wait.time(1) end
				print("火折失败了") 
				call(f_fail) 
				return 
			end
		end
		if(var.fast_mode == "1") then wait.time(1) end
		print("火折准备好了")
		call(f_ok)
	end)
end

function get_yaopai(f_ok, f_fail)
	wait.make(function()
		Execute("set brief;fly wm;nw;look yao pai")
		local l, w = wait.regexp("^(> )*(你要看什么)|(一块银质腰牌).*$")
		if(l:match("你要看什么") ~= nil) then
			Execute("fly lz;w;n;n;e;ask nu about 腰牌")
			--wait.time(5)
			Execute("fly wm;nw;look yao pai")
			l, w = wait.regexp("^(> )*(你要看什么)|(一块银质腰牌).*$")
			--if(var.fast_mode == "1") then wait.time(1) end
			if(l:match("你要看什么") ~= nil) then 
				if(var.fast_mode == "1") then wait.time(1) end
				print("腰牌失败了") 
				call(f_fail) 
				return 
			end
		end
		if(var.fast_mode == "1") then wait.time(1) end
		print("腰牌准备好了")
		call(f_ok)
	end)
end

function get_shanpai(f_ok, f_fail)
	wait.make(function()
		Execute("set brief;fly wm;nw;give shan pai to " .. var.me_id)
		local l, w = wait.regexp("^(> )*(你身上没有这样东西)|(.*给你一块赏善铜牌).*$")
		if(l:match("你身上没有这样东西") ~= nil) then
			Execute("set brief;fly hy;n;w;w;w;w;s;n;s;ask zhang about 赏善")
			--wait.time(5)
			Execute("fly wm;nw;give shan pai to " .. var.me_id)
			l, w = wait.regexp("^(> )*(你要看什么)|(赏善铜牌).*$")
			--if(var.fast_mode == "1") then wait.time(1) end
			if(l:match("你要看什么") ~= nil) then 
				if(var.fast_mode == "1") then wait.time(1) end
				print("赏善铜牌失败了") 
				call(f_fail) 
				return 
			end
		end
		if(var.fast_mode == "1") then wait.time(1) end
		print("赏善铜牌准备好了")
		call(f_ok)
	end)
end

function get_sling(f_ok, f_fail)
	if(var.me_menpai == "少林") then call(f_ok) return end

	wait.make(function()
		Execute("set brief;fly wm;nw;get yingxiong ling;look yingxiong ling")
		local l, w = wait.regexp("^(> )*(你要看什么)|(少林英雄令).*")
		if(l:match("你要看什么") ~= nil) then
			Execute("se;e;s;s;s;s;give 1 gold to seng")
			--wait.time(5)
			Execute("fly wm;nw;get yingxiong ling;look yingxiong ling")
			l, w = wait.regexp("^(> )*(你要看什么)|(少林英雄令).*")
			--if(var.fast_mode == "1") then wait.time(1) end
			if(l:match("你要看什么") ~= nil) then
				if(var.fast_mode == "1") then wait.time(1) end
				print("少林英雄令失败了") 
				call(f_fail) 
				return 
			end
		end
		if(var.fast_mode == "1") then wait.time(1) end
		print("少林英雄令准备好了 ")
		call(f_ok)
	end)
end

function get_qling(f_ok, f_fail)
	if(var.me_menpai == "全真") then call(f_ok) return end

	wait.make(function()
		Execute("set brief;fly wm;nw;get chongyang ling;look chongyang ling")
		local l, w = wait.regexp("^(> )*(你要看什么)|(重阳令).*")
		if(l:match("你要看什么") ~= nil) then
			Execute("se;e;s;s;w;w;give 1 gold to daoren")
			--wait.time(5)
			Execute("fly wm;nw;get chongyang ling;look chongyang ling")
			local l, w = wait.regexp("^(> )*(你要看什么)|(重阳令).*")
			--if(var.fast_mode == "1") then wait.time(1) end
			if(l:match("你要看什么") ~= nil) then 
				if(var.fast_mode == "1") then wait.time(1) end
				print("重阳令失败了") 
				call(f_fail) 
				return 
			end
		end
		if(var.fast_mode == "1") then wait.time(1) end
		print("重阳令准备好了 ")
		call(f_ok)
	end)
end

function get_ditu(f_ok, f_fail)
	wait.make(function()
		Execute("set brief;fly wm;nw;get gaochang ditu;look gaochang ditu")
		local l, w = wait.regexp("^(> )*(你要看什么)|(高昌迷宫地图).*$")
		if(l:match("你要看什么") ~= nil) then
			Execute("fly gw;n;n;n;e;e;ne;e;n")
			wait.time(3)
			Execute("fly xx;su;s;ed;ask li about 苏普;ask li about 父母;look shou juan")
			l, w = wait.regexp("^(> )*(这是一方雪白的手绢)|(你要看什么)|(这里没有这个人).*$")
			if(l:match("你要看什么") ~= nil or l:match("这里没有这个人")) then
				call(f_fail)
				return
			else
				Execute("fly wm;nw;bandage;tuo shou juan;bandage;tuo shou juan")
				repeat
					wait.time(2)
					Execute("look shou juan")
					local l, w = wait.regexp("^(> )*(这是一方雪白的手绢)|(.*了点变化)|(你仔细研究了一下，才发现这是张地图).*$")
				until(l:match("这是张地图") ~= nil)
				Execute("get gaochang ditu;look gaochang ditu")
				l, w = wait.regexp("^(> )*(高昌迷宫地图)|(你要看什么).*$")
				if(l:match("你身上没有这样东西") ~= nil) then
					call(f_fail)
					return
				end
			end
		end
		print("高昌迷宫地图准备好了")
		call(f_ok)
	end)
end

function get_xunzhang(f_done, f_fail)
	wait.make(function()
		Execute("set brief;fly wm;nw;look xunzhang")
		local l, w = wait.regexp("^(> )*(荣誉勋章)|(你要看什么).*$")
		if(l:match("你要看什么")) then call(f_fail) else call(f_done) end
	end)
end

function get_heimuling(f_ok, f_fail)
	wait.make(function()
		Execute("set brief;fly wm;nw;look heimu ling")
		local l, w = wait.regexp("^(> )*(黑木令)|(你要看什么).*$")
		if(l:match("你要看什么") ~= nil) then
			Execute("fly qz;w;n;n;e;s;ask ren about 比剑")
			Execute("er;et;start")
			wait.time(3)
			Execute("fly wm;nw;er;look heimu ling")
			l, w = wait.regexp("^(> )*(黑木令)|(你要看什么).*$")
			if(var.fast_mode == "1") then wait.time(1) end
			if(l:match("你要看什么") ~= nil) then print("黑木令失败了") call(f_fail) return end
		end
		print("黑木令准备好了")
		call(f_ok)
	end)
end

function get_jiedao(f_ok, f_fail)
	get_sling(function()
		Execute("look jie dao");
		local l, w = wait.regexp("^(> )*(你要看什么)|(戒刀).*$")
		if(l:match("戒刀") ~= nil) then
			Execute("fly sl;knock gate;n;n;nu;n;w")
		else
			if(var.fast_mode == "1") then wait.time(1) end
			Execute("fly sl;knock gate;n;n;nu;n;w;unwield all;kill seng bing")
			l, w = wait.regexp("^(> )*(这里没有这个人)|(守寺僧兵扑在地上挣扎了几下).*$", 10)
			if((l == nil) or (l:match("这里没有这个人") ~= nil)) then
				Execute("get jie dao");
				l, w = wait.regexp("^(> )*(你附近没有这样东西)|(你捡起一把戒刀).*$", 2)
				if(l == nil or l:match("你附近没有这样东西") ~= nil) then return call(f_fail) end
			else
				wait.time(2)
				Execute("get jie dao from corpse")
				l, w = wait.regexp("^(> )*(你附近没有这样东西)|(你从守寺僧兵的尸体身上搜出一把戒刀).*$", 5)
				if(l == nil or l:match("你附近没有这样东西")) then return call(f_fail) end
			end
		end

		print("戒刀准备好了")
		call(f_ok)
	end,
	f_fail)
end

function reconn(f_ok, f_fail)
	wait.make(function()
		Execute("equip callback weapon")
		Execute("fly wm;e;s;s;s;s;tuo xunzhang;give seng xunzhang")
		for i = 1, #config.weapon_list do
			Execute("give seng " .. config.weapon_list[i])
		end
		
		core.safeback(function()
			Execute("nw")
			capture("kickbye", function()
				timer.reconnect(1, function()
					var.reconnect_required = 0
					config.fight_wear(f_ok)
				end)
		end)
		end, 1)
	end)
end

function reconn2(f_ok)
	core.safeback(function()
		Execute("nw")
		capture("kickbye", function()
			timer.reconnect(1, function()
				var.reconnect_required = 0
				config.fight_wear(f_ok)
			end)
		end)
	end, 1)
end

function jicun(f_done)
	wait.make(function()
		Execute("fly wm;e;s;s;s;e;u")
		wait.time(1)
		repeat
			Execute("jicun yin dan")
			local l, w = wait.regexp("^(> )*(你要寄存什么)|(你将一颗九转银丹存了起来).*$", 1)
			wait.time(0.2)
		until(l == nil or l:match("你要寄存什么"))
		repeat
			Execute("jicun jin dan")
			local l, w = wait.regexp("^(> )*(你要寄存什么)|(你将一颗九转金丹存了起来).*$", 1)
			wait.time(0.2)
		until(l == nil or l:match("你要寄存什么"))
		call(f_done)
	end)
end

function drink_wine(f_done)
	me.updateHP(function()
		wait.make(function()
			if(tonumber(var.hp_water) > tonumber(var.hp_water_max) * 3) then
				Execute("fly xx;su;s;ed;se;w;w;fly bj")
				wait.time(1)
				Execute("n;n;n;e;get jiu tan")
			else
				Execute("fly bj;n;n;n;e;get jiu tan")
			end
			wait.time(0.5)
			Execute("fly bj;s;w;sell jiu tan")
			wait.time(1.5)
			Execute("buy jiu tan")
			wait.time(1.5)
			Execute("#5 (drink jiu tan);sell jiu tan")
			var.drink_wine = 0
			core.safeback(function()
				call(f_done)
			end, 1)
		end)
	end)
end

------------------------------------------------------------------------------
--                 dazuo
------------------------------------------------------------------------------
module ("dazuo", package.seeall)

local cxt = {}
local emitter = require("worlds\\xkx\\mods\\emitter"):new()

function start(f_done)
	print("开始打坐")

	emitter:once("dazuo_end", function(err)
		EnableTriggerGroup("dazuo", false)

		core.safehalt(function()
			Execute("er;et")
			call(f_done)
		end, 1)

	end)

	EnableTriggerGroup("dazuo", true)
	Execute("et;" .. var.me_dazuo)
end

function emit(event, ...)
	emitter:emit(event, ...)
end

function full(f_done)
	print("开始打坐")
	emitter:once("dazuo_end", function(err)
		EnableTriggerGroup("dazuo", false)

		if err == "continue" then
			dazuo.full(f_done)
		else
			core.safehalt(function()
				Execute("er;et;ef")
				call(f_done)
			end, 1)
		end
	end)

	EnableTriggerGroup("dazuo", true)
	Execute("er;et;dazuo max")
end

function halt()
	emitter:emit("dazuo_end", "halt")
end

function abort(f_done)
	EnableTriggerGroup("dazuo", false)
	core.safehalt(f_done, 1)
end


module ("tuna", package.seeall)

local cxt = {}

start = function(f_done)
	print("开始吐纳")
	EnableTriggerGroup("tuna", true)
	cxt.done_flag = false
	cxt.f_done = f_done
	Execute("et;tuna 1000")
end

continue = function()
	if(not cxt.done_flag) then
		Execute("et;tuna 1000")
	else
		EnableTriggerGroup("tuna", false)
		busy_test(function() dazuo.start(function() tuna.start() end) end)
	end
end

done = function()
	--dazuo.start(function() tuna.start() end)
	cxt.done_flag = true
	wait.make(function()
		wait.time(10)
		Execute("et")
		continue()
	end)
end

halt = function()
	Execute("halt;er")
	EnableTriggerGroup("tuna", false)
	busy_test(function() call(cxt.f_done) end)
end
------------------------------------------------------------------------------
--                 dazuo
------------------------------------------------------------------------------
module ("event", package.seeall)

local event_cxt = {}

main = function(f_done)
	event_cxt.f_done = f_done
	go()
end

start = function(name, line, wildcards)
	local l = wildcards[2]
	var.event_start_time = os.time()
	if(l:match("长白山")) then
		var.event_loc = "长白山"
		var.event_room = 1602
	elseif(l:match("衡山")) then
		var.event_loc = "衡山"
		var.event_room = 1312
	elseif(l:match("峨嵋")) then
		var.event_loc = "峨嵋"
		var.event_room = 1714
	elseif(l:match("无量山")) then
		var.event_loc = "无量山"
		var.event_room = 2680
	end

	var.event_flag = true
end

function go()
	if(var.event_flag ~= "true") then print("没有奇观") return done() end

	local diff = os.time() - tonumber(var.event_start_time)
	--超过3分半钟就不要去做了
	if(diff > 210) then
		print("开始时间超过3.5分钟了")
		done()
	else
		local f_fail = function()
			var.event_flag = false
			Execute("halt")
			busy_test(function() done() end)
		end

		local f_ok = function()
			wait.make(function()
				--5分钟还不来就走吧
				wait.regexp("^(> )*(【自然奇观】)|(你心中连叹)|(你不禁叹息道)|(你心中大感失望).*$", 300)
				busy_test(function() done() end)
			end)
		end

		local room = tonumber(var.event_room)
		walk.run(roomAll[room].path, f_ok, f_fail, f_fail)
	end
end

done = function()
	var.event_flag = false
	call(event_cxt.f_done)
end


module ("bank", package.seeall)
bank.cunqu = function(cmd, f_done, f_fail)
	wait.make(function()
		Execute("fly wm;e;s;w")
		Execute(cmd)
		busy_test(function() call(f_done) end)
	end)
end
