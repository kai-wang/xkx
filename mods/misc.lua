require "wait"
require "tprint"

function test()
	print("fadfadfa")
end

function get_xionghuang(f_ok)
	wait.make(function()
		Execute("give xionghuang to " .. var.me_id)
		local l, w = wait.regexp("^(> )*(你身上没有这样东西)|(.*给你一包雄黄).*$")
		if(l:match("你身上没有这样东西") ~= nil) then
			Execute("set brief;fly wm;e;s;s;e;e;n;buy xionghuang")
			wait.time(5)
			Execute("fly wm;nw;give xionghuang to " .. var.me_id)
			l, w = wait.regexp("^(> )*(你身上没有这样东西)|(.*给你一包雄黄).*$")
			if(l:match("你身上没有这样东西") ~= nil) then print("雄黄失败了") call(f_fail) return end
		end
		print("雄黄准备好了")
		call(f_ok)
	end)
end

function get_fire(f_ok, f_fail)
	wait.make(function()
		Execute("give fire to " .. var.me_id)
		local l, w = wait.regexp("^(> )*(你身上没有这样东西)|(.*给你一支火折).*$")
		if(l:match("你身上没有这样东西") ~= nil) then
			Execute("set brief;fly wm;e;s;s;e;s;buy fire")
			wait.time(5)
			Execute("fly wm;nw;give fire to " .. var.me_id)
			l, w = wait.regexp("^(> )*(你身上没有这样东西)|(.*给你一支火折).*$")
			if(l:match("你身上没有这样东西") ~= nil) then print("火折失败了") call(f_fail) return end
		end
		print("火折准备好了")
		call(f_ok)
	end)
end

function get_yaopai(f_ok, f_fail)
	wait.make(function()
		Execute("look yao pai")
		local l, w = wait.regexp("^(> )*(你要看什么)|(一块银质腰牌).*$")
		if(l:match("你要看什么") ~= nil) then
			Execute("set brief;fly lz;w;n;n;e;ask nu about 腰牌")
			--wait.time(5)
			Execute("fly wm;nw;look yao pai")
			l, w = wait.regexp("^(> )*(你要看什么)|(一块银质腰牌).*$")
			if(l:match("你要看什么") ~= nil) then print("腰牌失败了") call(f_fail) return end
		end
		print("腰牌准备好了")
		call(f_ok)
	end)
end

function get_shanpai(f_ok, f_fail)
	wait.make(function()
		Execute("give shan pai to " .. var.me_id)
		local l, w = wait.regexp("^(> )*(你身上没有这样东西)|(.*给你一块赏善铜牌).*$")
		if(l:match("你身上没有这样东西") ~= nil) then
			Execute("set brief;fly hy;n;w;w;w;w;s;n;s;ask zhang about 赏善")
			--wait.time(5)
			Execute("fly wm;nw;give shan pai to " .. var.me_id)
			l, w = wait.regexp("^(> )*(你要看什么)|(赏善铜牌).*$")
			if(l:match("你要看什么") ~= nil) then print("赏善铜牌失败了") call(f_fail) return end
		end
		print("赏善铜牌准备好了")
		call(f_ok)
	end)
end

function get_sling(f_ok, f_fail)
	wait.make(function()
		Execute("get yingxiong ling;look yingxiong ling")
		local l, w = wait.regexp("^(> )*(你要看什么)|(少林英雄令).*")
		if(l:match("你要看什么") ~= nil) then
			Execute("set brief;fly wm;e;s;s;s;s;give 1 gold to seng")
			--wait.time(5)
			Execute("fly wm;nw;get yingxiong ling;look yingxiong ling")
			l, w = wait.regexp("^(> )*(你要看什么)|(少林英雄令).*")
			if(l:match("你要看什么") ~= nil) then print("少林英雄令失败了") call(f_fail) return end
		end
		print("少林英雄令准备好了 ")
		call(f_ok)
	end)
end

function get_qling(f_ok, f_fail)
	if(var.me_menpai == "全真") then call(f_ok) return end
	
	wait.make(function()
		Execute("get chongyang ling;look chongyang ling")
		local l, w = wait.regexp("^(> )*(你要看什么)|(重阳令).*")
		if(l:match("你要看什么") ~= nil) then
			Execute("set brief;fly wm;e;s;s;w;w;give 1 gold to daoren")
			--wait.time(5)
			Execute("fly wm;nw;get chongyang ling;look chongyang ling")
			local l, w = wait.regexp("^(> )*(你要看什么)|(重阳令).*")
			if(l:match("你要看什么") ~= nil) then print("重阳令失败了") call(f_fail) return end
		end
		print("重阳令准备好了 ")
		call(f_ok)
	end)
end

function get_ditu(f_ok, f_fail)
	wait.make(function()
		Execute("get gaochang ditu;look gaochang ditu")
		local l, w = wait.regexp("^(> )*(你要看什么)|(高昌迷宫地图).*$")
		if(l:match("你要看什么") ~= nil) then
			Execute("set brief;fly gw;n;n;n;e;e;ne;e;n")
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
		Execute("look xunzhang")
		local l, w = wait.regexp("^(> )*(荣誉勋章)|(你要看什么).*$")
		if(l:match("你要看什么")) then call(f_fail) else call(f_done) end
	end)
end

function busy_test(f_done, interval)
	DeleteTemporaryTriggers()
	local i = 1
	wait.make(function()
		repeat
			if(interval == nil) then i = 1 else i = interval end
			Execute("suicide")
			local l, w = wait.regexp("^(> )*(你正忙着呢，没空自杀！)|(请用 suicide -f 确定自杀。)$")
			if(l:match("你正忙着呢，没空自杀") ~= nil) then wait.time(i) end
		until(l:match("确定自杀") ~= nil)
		call(f_done)
	end)
end


module ("ts", package.seeall)

new = function(name, group, interval, handler)
	if(IsTimer(name) ~= 0) then
		AddTimer(name, 0, 0, interval, handler, timer_flag.Replace + timer_flag.Temporary, "")
		SetTimerOption(name, "send_to", 12)
		SetTimerOption(name, "group", group)
	end
end

tick = function(name)
	EnableTimer(name, true)
end

reset = function(name, interval)
	if(IsTimer(name) == 0) then
		EnableTimer(name, true)
		local second = interval%60
		local minute = (interval - second)/60
		SetTimerOption(name, "minute", minute)
		SetTimerOption(name, "second", second)
		ResetTimer(name)
	end
end

stop = function(name)
	EnableTimer(name, false)
end


------------------------------------------------------------------------------
--                 dazuo
------------------------------------------------------------------------------
module ("dazuo", package.seeall)

local cxt = {}

start = function(f_done)
	print("开始打坐")
	EnableTriggerGroup("dazuo", true)
	cxt.done_flag = false
	cxt.f_done = f_done
	Execute("et;dazuo max")
end

continue = function()
	if(not cxt.done_flag) then
		Execute("er;ef;dazuo max")
	else
		EnableTriggerGroup("dazuo", false)
		busy_test(function() call(cxt.f_done) end)
	end
end

done = function()
	cxt.done_flag = true
end

halt = function()
	Execute("halt;er")
	EnableTriggerGroup("dazuo", false)
	busy_test(function() call(cxt.f_done) end)
end

------------------------------------------------------------------------------
--                 dazuo
------------------------------------------------------------------------------
module ("event", package.seeall)

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
	
	msg.broadcast("msg_event_start")
end

go = function(f_done)
	local diff = os.time() - tonumber(var.event_start_time)
	--超过3分钟就不要去做了
	if(diff > 180) then 
		print("开始时间超过3分钟了")
		call(f_done)
	else
		local f_fail = function() 
			Execute("halt")
			busy_test(function() call(f_done) end)
		end
		
		local f_ok = function()
			wait.make(function()
				--5分钟还不来就走吧
				wait.regexp("^(> )*(【自然奇观】)|(你心中连叹)|(你不禁叹息道)|(你心中大感失望).*$", 300)
				busy_test(function() call(f_done) end)
			end)
		end
		
		local room = tonumber(var.event_room)
		walk.run(roomAll[room].path, f_ok, f_fail, f_fail)
	end
end
