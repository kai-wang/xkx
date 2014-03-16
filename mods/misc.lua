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
	print("�������")
	if act_flag then
		act_stop()
	end --if
	Execute("#2 (halt)")
	if string.match(w[1],"����ɽ�������") ~= nil then           --changbaishan
		AddTriggerEx("event_cbs","^>?\\s*���ܿ�ͣ���˰�����̧�ſ��������","(se)e(se)2e(eu)(su)(eu)e(eu)(se)(sw)(sd)(exert heal)",49193, -1, 0, "", "", 11, 100)
		Queue(EvaluateSpeedwalk("(chuansong gw)3n2e(ne)en(give 1 gold to chuan fu)"),false)
	end --if
	if string.match(w[1],"���ҽ��ճ�") ~= nil then           --emei
		Queue(EvaluateSpeedwalk("(chuansong em)3(wu)3(su)(sw)(su)(se)(wu)(su)"),false)
	end --if
	if string.match(w[1],"��ɽˮ�����ٲ�") ~= nil then           --hengshan
		Queue(EvaluateSpeedwalk("(chuansong hy)10n(nu)(nw)(nu)(ed)e(eu)"),false)
	end --if
	if string.match(w[1],"����ɽ��ڽ���") ~= nil then           --wuliang
		Queue(EvaluateSpeedwalk("(fly ws)(wd)2(nd)2(wu)w"),false)
	end --if
	AddTrigger("event_end1","^>?\\s*����Ȼ��ۡ�","",49193, -1, 0, "", "event_end")
	AddTrigger("event_end2", "^(> )*��������̾����̫��ϧ�ˣ���$", "", 49193, -1, 0, "", "event_end")
	event_status = true
end --function

------------------------------------------------------------------------------
--                 dazuo
------------------------------------------------------------------------------

dazuo = {}

dazuo.start = function(f_done)
	print("��ʼ����")
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
			local ll, ww = wait.regexp("^>?\\s*�������ȵ�վ�ڵ��ϡ�")
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
		local l, w = wait.regexp("^(> )*(������û����������)|(.*����һ���ۻ�).*$")
		if(l:match("������û����������") ~= nil) then
			Execute("set brief;fly wm;e;s;s;e;e;n;buy xionghuang")
			wait.time(5)
			Execute("fly wm;nw;give xionghuang to " .. var.me_id)
			l, w = wait.regexp("^(> )*(������û����������)|(.*����һ���ۻ�).*$")
			if(l:match("������û����������") ~= nil) then print("�ۻ�ʧ����") call(f_fail) return end
		end
		print("�ۻ�׼������")
		call(f_ok)
	end)
end

function get_fire(f_ok, f_fail)
	wait.make(function()
		Execute("give fire to " .. var.me_id)
		local l, w = wait.regexp("^(> )*(������û����������)|(.*����һ֧����).*$")
		if(l:match("������û����������") ~= nil) then
			Execute("set brief;fly wm;e;s;s;e;s;buy fire")
			wait.time(5)
			Execute("fly wm;nw;give fire to " .. var.me_id)
			l, w = wait.regexp("^(> )*(������û����������)|(.*����һ֧����).*$")
			if(l:match("������û����������") ~= nil) then print("����ʧ����") call(f_fail) return end
		end
		print("����׼������")
		call(f_ok)
	end)
end

function get_yaopai(f_ok, f_fail)
	wait.make(function()
		Execute("look yao pai")
		local l, w = wait.regexp("^(> )*(��Ҫ��ʲô)|(һ����������).*$")
		if(l:match("��Ҫ��ʲô") ~= nil) then
			Execute("set brief;fly lz;w;n;n;e;ask nu about ����")
			--wait.time(5)
			Execute("fly wm;nw;look yao pai")
			l, w = wait.regexp("^(> )*(��Ҫ��ʲô)|(һ����������).*$")
			if(l:match("��Ҫ��ʲô") ~= nil) then print("����ʧ����") call(f_fail) return end
		end
		print("����׼������")
		call(f_ok)
	end)
end

function get_shanpai(f_ok, f_fail)
	wait.make(function()
		Execute("get shan pai;look shan pai")
		local l, w = wait.regexp("^(> )*(��Ҫ��ʲô)|(����ͭ��).*$")
		if(l:match("��Ҫ��ʲô") ~= nil) then
			Execute("set brief;fly hy;n;w;w;w;w;s;n;s;ask zhang about ����")
			--wait.time(5)
			Execute("fly wm;nw;get shan pai;look shan pai")
			l, w = wait.regexp("^(> )*(��Ҫ��ʲô)|(����ͭ��).*$")
			if(l:match("��Ҫ��ʲô") ~= nil) then print("����ͭ��ʧ����") call(f_fail) return end
		end
		print("����ͭ��׼������")
		call(f_ok)
	end)
end

function get_sling(f_ok, f_fail)
	wait.make(function()
		Execute("get yingxiong ling;look yingxiong ling")
		local l, w = wait.regexp("^(> )*(��Ҫ��ʲô)|(����Ӣ����).*")
		if(l:match("��Ҫ��ʲô") ~= nil) then
			Execute("set brief;fly wm;e;s;s;s;s;give 1 gold to seng")
			--wait.time(5)
			Execute("fly wm;nw;get yingxiong ling;look yingxiong ling")
			l, w = wait.regexp("^(> )*(��Ҫ��ʲô)|(����Ӣ����).*")
			if(l:match("��Ҫ��ʲô") ~= nil) then print("����Ӣ����ʧ����") call(f_fail) return end
		end
		print("����Ӣ����׼������ ")
		call(f_ok)
	end)
end

function get_qling(f_ok, f_fail)
	if(var.me_menpai == "ȫ��") then call(f_ok) return end
	
	wait.make(function()
		Execute("get chongyang ling;look chongyang ling")
		local l, w = wait.regexp("^(> )*(��Ҫ��ʲô)|(������).*")
		if(l:match("��Ҫ��ʲô") ~= nil) then
			Execute("set brief;fly wm;e;s;s;w;w;give 1 gold to daoren")
			--wait.time(5)
			Execute("fly wm;nw;get chongyang ling;look chongyang ling")
			local l, w = wait.regexp("^(> )*(��Ҫ��ʲô)|(������).*")
			if(l:match("��Ҫ��ʲô") ~= nil) then print("������ʧ����") call(f_fail) return end
		end
		print("������׼������ ")
		call(f_ok)
	end)
end

function get_ditu(f_ok, f_fail)
	wait.make(function()
		Execute("get gaochang ditu;look gaochang ditu")
		local l, w = wait.regexp("^(> )*(��Ҫ��ʲô)|(�߲��Թ���ͼ).*$")
		if(l:match("��Ҫ��ʲô") ~= nil) then
			Execute("set brief;fly gw;n;n;n;e;e;ne;e;n")
			wait.time(3)
			Execute("fly xx;su;s;ed;ask li about ����;ask li about ��ĸ;look shou juan")
			l, w = wait.regexp("^(> )*(����һ��ѩ�׵��־�)|(��Ҫ��ʲô)|(����û�������).*$")
			if(l:match("��Ҫ��ʲô") ~= nil or l:match("����û�������")) then
				call(f_fail)
				return
			else
				Execute("fly wm;nw;bandage;tuo shou juan;bandage;tuo shou juan")
				repeat
					wait.time(2)
					Execute("look shou juan")
					local l, w = wait.regexp("^(> )*(����һ��ѩ�׵��־�)|(.*�˵�仯)|(����ϸ�о���һ�£��ŷ��������ŵ�ͼ).*$")
				until(l:match("�����ŵ�ͼ") ~= nil)
				Execute("get gaochang ditu;look gaochang ditu")
				l, w = wait.regexp("^(> )*(�߲��Թ���ͼ)|(��Ҫ��ʲô).*$")
				if(l:match("������û����������") ~= nil) then
					call(f_fail)
					return
				end
			end
		end
		print("�߲��Թ���ͼ׼������")
		call(f_ok)
	end)
end

function get_xunzhang(f_done, f_fail)
	wait.make(function()
		Execute("look xunzhang")
		local l, w = wait.regexp("^(> )*(����ѫ��)|(��Ҫ��ʲô).*$")
		if(l:match("��Ҫ��ʲô")) then call(f_fail) else call(f_done) end
	end)
end

function busy_test(f_done, interval)
	wait.make(function()
		repeat
			if(interval == nil) then wait.time(1) else wait.time(interval) end
			Execute("suicide")
			local l, w = wait.regexp("^(> )*(����æ���أ�û����ɱ��)|(���� suicide -f ȷ����ɱ��)$")
		until(l:match("ȷ����ɱ") ~= nil)
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
