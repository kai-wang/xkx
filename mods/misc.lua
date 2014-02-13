require "wait"
require "tprint"
--module ("misc", package.seeall)
------------------------------------------------------------------------------
--                 variable
------------------------------------------------------------------------------
act_flag = false
event_status = false
------------------------------------------------------------------------------
--                 supply water and food
------------------------------------------------------------------------------
function chihe()
	wait.make(function()
		Execute("set brief;fly jx;buy zongzi;")
		wait.time(2)
		Execute("fly xx;su;s;ed;nw;w;buy shuinang;")
		wait.time(2)
		Execute("eat zongzi;#8 (drink shuinang);drop zongzi;drop zong ye;")
		wait.time(2)
		Execute("#8 (drink shuinang);drop shuinang;unset brief;fly wm;")
	end)
end --function

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
