require "wait"
require "tprint"
--module ("misc", package.seeall)
------------------------------------------------------------------------------
--                 variable
------------------------------------------------------------------------------
act_flag = false
event_status = false


------------------------------------------------------------------------------
--                 event
------------------------------------------------------------------------------
function event_end(n,l,w)
	wait.make(function ()  --- coroutine below here
		wait.time(5)
		Execute("fly wm;")
		event_status = false
	end)  -- end of coroutine
end --function

function event(n,l,w)
	print("奇观来了")
	if act_flag then
		act_stop()
	end --if
	Execute("#2 (halt)")
	if string.match(w[1],"长白山天池流星") ~= nil then           --changbaishan
		AddTriggerEx("event_cbs","^>?\\s*船很快停靠彼岸。你抬脚跨出船来。","(se)e(se)2e(eu)(su)(eu)e(eu)(se)(sw)(sd)(exert heal)",49193, -1, 0, "", "", 11, 100)
		Queue(EvaluateSpeedwalk("(chuansong gw)3n2e(ne)en(give 1 gold to chuan fu)"),false)
	end --if
	if string.match(w[1],"峨嵋金顶日出") ~= nil then           --emei
		Queue(EvaluateSpeedwalk("(chuansong em)3(wu)3(su)(sw)(su)(se)(wu)(su)"),false)
	end --if
	if string.match(w[1],"衡山水帘洞瀑布") ~= nil then           --hengshan
		Queue(EvaluateSpeedwalk("(chuansong hy)10n(nu)(nw)(nu)(ed)e(eu)"),false)
	end --if
	if string.match(w[1],"无量山玉壁剑舞") ~= nil then           --wuliang
		Queue(EvaluateSpeedwalk("(fly ws)(wd)2(nd)2(wu)w"),false)
	end --if
	AddTrigger("event_end1","^>?\\s*【自然奇观】","",49193, -1, 0, "", "event_end")
	AddTrigger("event_end2", "^(> )*你心中连叹：“太可惜了！”$", "", 49193, -1, 0, "", "event_end")
	event_status = true
end --function

------------------------------------------------------------------------------
--                 dazuo
------------------------------------------------------------------------------

dazuo = {}

dazuo.start = function(f_done)
	print("开始打坐")
	EnableTriggerGroup("dazuo", true)
	dazuo.done_flag = false
	Execute("et;dazuo max")
	if(f_done ~= nil) then
		msg.subscribe("msg_dazuo_end", f_done)
	else
		msg.unsubscribe("msg_dazuo_end")
	end
end

dazuo.continue = function()
	if(not dazuo.done_flag) then
		Execute("er;ef;dazuo max")
	else
		dazuo.done()
	end
end

dazuo.done = function()
	EnableTriggerGroup("dazuo", false)
	msg.broadcast("msg_dazuo_end")
end

dazuo.halt = function()
	Execute("halt;er")
	dazuo.done()
end

------------------------------------------------------------------------------
--                 jump_tower
------------------------------------------------------------------------------
function jump_tower()
	act_flag = true
	wait.make(function()  --- coroutine below here
		while act_flag do
			Execute("out")
			local ll, ww = wait.regexp("^>?\\s*你已稳稳地站在地上。")
			if ll ~= nil then
				wait.time(2)
				Execute("halt;enter;#6 u;")
				Execute("dazuo 100")
				wait.time(2.5)
				Execute("yun powerup;yun recover;yun regenerate")
			end --if
		end --while
	end)  -- end of coroutine
end --function


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
		Execute("get shan pai;look shan pai")
		local l, w = wait.regexp("^(> )*(你要看什么)|(赏善铜牌).*$")
		if(l:match("你要看什么") ~= nil) then
			Execute("set brief;fly hy;n;w;w;w;w;s;n;s;ask zhang about 赏善")
			--wait.time(5)
			Execute("fly wm;nw;get shan pai;look shan pai")
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
	wait.make(function()
		repeat
			if(interval == nil) then wait.time(1) else wait.time(interval) end
			Execute("suicide")
			local l, w = wait.regexp("^(> )*(你正忙着呢，没空自杀！)|(请用 suicide -f 确定自杀。)$")
		until(l:match("确定自杀") ~= nil)
		call(f_done)
	end)
end


local timer_list = {}
ts = {}

ts.new = function(name, group, interval, handler)
	if(IsTimer(name) ~= 0) then
		AddTimer(name, 0, 0, interval, handler, timer_flag.Replace + timer_flag.Temporary, "")
		SetTimerOption(name, "send_to", 12)
		SetTimerOption(name, "group", group)
	end
end

ts.tick = function(name)
	EnableTimer(name, true)
end

ts.reset = function(name, interval)
	if(IsTimer(name) == 0) then
		print(name)
		EnableTimer(name, true)
		local second = interval%60
		local minute = (interval - second)/60
		SetTimerOption(name, "minute", minute)
		SetTimerOption(name, "second", second)
		ResetTimer(name)
	end
end

ts.stop = function(name)
	if(IsTimer(name) == 0) then
		print("timer : " .. name .. " stopped")
		EnableTimer(name, false)
	end	
end
