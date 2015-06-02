require "wait"
require "tprint"

function call(f)
	if(f ~= nil) then f() end
end

function suck()
	busy_test(function()
		Execute("yun maxsuck")
		call(suck)
	end)
end

function qukuan(amount, f_ok, f_fail)
	wait.make(function()
		Execute("fly wm;e;s;w;qukuan " .. amount)
		local l, w = wait.regexp("^(> )*���������ȡ��.*$", 5)
		if(not l or l:match("�������") == nil) then print("ȡ��ʧ����") call(f_fail) return end
		busy_test(f_ok)
	end)
end

function get_xionghuang(f_ok)
	wait.make(function()
		Execute("set brief;fly wm;nw;give xionghuang to " .. var.me_id)
		local l, w = wait.regexp("^(> )*(������û����������)|(.*����һ���ۻ�).*$")
		if(l:match("������û����������") ~= nil) then
			Execute("se;e;s;s;e;e;n;buy xionghuang")
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
		Execute("set brief;fly wm;nw;give fire to " .. var.me_id)
		local l, w = wait.regexp("^(> )*(������û����������)|(.*����һ֧����).*$")
		if(l:match("������û����������") ~= nil) then
			Execute("se;e;s;s;e;s;buy fire")
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
		Execute("set brief;fly wm;nw;look yao pai")
		local l, w = wait.regexp("^(> )*(��Ҫ��ʲô)|(һ����������).*$")
		if(l:match("��Ҫ��ʲô") ~= nil) then
			Execute("fly lz;w;n;n;e;ask nu about ����")
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
		Execute("set brief;fly wm;nw;give shan pai to " .. var.me_id)
		local l, w = wait.regexp("^(> )*(������û����������)|(.*����һ������ͭ��).*$")
		if(l:match("������û����������") ~= nil) then
			Execute("set brief;fly hy;n;w;w;w;w;s;n;s;ask zhang about ����")
			--wait.time(5)
			Execute("fly wm;nw;give shan pai to " .. var.me_id)
			l, w = wait.regexp("^(> )*(��Ҫ��ʲô)|(����ͭ��).*$")
			if(l:match("��Ҫ��ʲô") ~= nil) then print("����ͭ��ʧ����") call(f_fail) return end
		end
		print("����ͭ��׼������")
		call(f_ok)
	end)
end

function get_sling(f_ok, f_fail)
	if(var.me_menpai == "����") then call(f_ok) return end
	
	wait.make(function()
		Execute("set brief;fly wm;nw;get yingxiong ling;look yingxiong ling")
		local l, w = wait.regexp("^(> )*(��Ҫ��ʲô)|(����Ӣ����).*")
		if(l:match("��Ҫ��ʲô") ~= nil) then
			Execute("se;e;s;s;s;s;give 1 gold to seng")
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
		Execute("set brief;fly wm;nw;get chongyang ling;look chongyang ling")
		local l, w = wait.regexp("^(> )*(��Ҫ��ʲô)|(������).*")
		if(l:match("��Ҫ��ʲô") ~= nil) then
			Execute("se;e;s;s;w;w;give 1 gold to daoren")
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
		Execute("set brief;fly wm;nw;get gaochang ditu;look gaochang ditu")
		local l, w = wait.regexp("^(> )*(��Ҫ��ʲô)|(�߲��Թ���ͼ).*$")
		if(l:match("��Ҫ��ʲô") ~= nil) then
			Execute("fly gw;n;n;n;e;e;ne;e;n")
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
		Execute("set brief;fly wm;nw;look xunzhang")
		local l, w = wait.regexp("^(> )*(����ѫ��)|(��Ҫ��ʲô).*$")
		if(l:match("��Ҫ��ʲô")) then call(f_fail) else call(f_done) end
	end)
end

function get_heimuling(f_ok, f_fail)
	wait.make(function()
		Execute("set brief;fly wm;nw;look heimu ling")
		local l, w = wait.regexp("^(> )*(��ľ��)|(��Ҫ��ʲô).*$")
		if(l:match("��Ҫ��ʲô") ~= nil) then 
			Execute("fly qz;w;n;n;e;s;ask ren about �Ƚ�")
			Execute("er;et;start")
			wait.time(3)
			Execute("fly wm;nw;er;look heimu ling")
			l, w = wait.regexp("^(> )*(��ľ��)|(��Ҫ��ʲô).*$")
			if(l:match("��Ҫ��ʲô") ~= nil) then print("��ľ��ʧ����") call(f_fail) return end
		end
		print("��ľ��׼������")
		call(f_ok)
	end)
end

function get_jiedao(f_ok, f_fail)
	get_sling(function()
		Execute("look jie dao");
		local l, w = wait.regexp("^(> )*(��Ҫ��ʲô)|(�䵶).*$")
		if(l:match("�䵶") ~= nil) then
			Execute("fly sl;knock gate;n;n;nu;n;w")
		else
			Execute("fly sl;knock gate;n;n;nu;n;w;unwield all;kill seng bing")
			l, w = wait.regexp("^(> )*(����û�������)|(����ɮ�����ڵ��������˼���).*$", 10)
			if((l == nil) or (l:match("����û�������") ~= nil)) then
				Execute("get jie dao");
				l, w = wait.regexp("^(> )*(�㸽��û����������)|(�����һ�ѽ䵶).*$", 2)
				if(l == nil or l:match("�㸽��û����������") ~= nil) then return call(f_fail) end
			else
				wait.time(2)
				Execute("get jie dao from corpse")
				l, w = wait.regexp("^(> )*(�㸽��û����������)|(�������ɮ����ʬ�������ѳ�һ�ѽ䵶).*$", 5)
				if(l == nil or l:match("�㸽��û����������")) then return call(f_fail) end
			end
		end
		
		print("�䵶׼������")
		call(f_ok)
	end,
	f_fail)
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
	print("��ʼ����")
	EnableTriggerGroup("dazuo", true)
	cxt.done_flag = false
	cxt.full_flag = false
	cxt.f_done = f_done
	cxt.value = "dazuo 3000"
	Execute("et;" .. cxt.value)
end

continue = function()
	if(cxt.full_flag ~= true or cxt.done_flag) then
		EnableTriggerGroup("dazuo", false)
		busy_test(function() call(cxt.f_done) end)
	elseif(not cxt.done_flag) then
		Execute("er;ef;" .. cxt.value)
	end
end

done = function()
	cxt.done_flag = true
end

full = function(f_done)
	print("��ʼ����")
	EnableTriggerGroup("dazuo", true)
	cxt.done_flag = false
	cxt.full_flag = true
	cxt.f_done = f_done
	cxt.value = "dazuo max"
	Execute("et;" .. cxt.value)
end

halt = function()
	Execute("halt;er")
	EnableTriggerGroup("dazuo", false)
	busy_test(function() call(cxt.f_done) end)
end


module ("tuna", package.seeall)

local cxt = {}

start = function(f_done)
	print("��ʼ����")
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

start = function(name, line, wildcards)
	local l = wildcards[2]
	var.event_start_time = os.time()
	if(l:match("����ɽ")) then 
		var.event_loc = "����ɽ" 
		var.event_room = 1602
	elseif(l:match("��ɽ")) then 
		var.event_loc = "��ɽ"
		var.event_room = 1312
	elseif(l:match("����")) then 
		var.event_loc = "����"
		var.event_room = 1714
	elseif(l:match("����ɽ")) then 
		var.event_loc = "����ɽ"
		var.event_room = 2680
	end
	
	msg.broadcast("msg_event_start")
end

go = function(f_done)
	local diff = os.time() - tonumber(var.event_start_time)
	--����3���ӾͲ�Ҫȥ����
	if(diff > 180) then 
		print("��ʼʱ�䳬��3������")
		call(f_done)
	else
		local f_fail = function() 
			Execute("halt")
			busy_test(function() call(f_done) end)
		end
		
		local f_ok = function()
			wait.make(function()
				--5���ӻ��������߰�
				wait.regexp("^(> )*(����Ȼ��ۡ�)|(��������̾)|(�㲻��̾Ϣ��)|(�����д��ʧ��).*$", 300)
				busy_test(function() call(f_done) end)
			end)
		end
		
		local room = tonumber(var.event_room)
		walk.run(roomAll[room].path, f_ok, f_fail, f_fail)
	end
end


module ("bank", package.seeall)
bank.cunqu = function(cmd, f_done, f_fail)
	wait.make(function()
		Execute("fly wm;e;s;w")
		Execute(cmd)
		busy_test(function() call(f_done) end)
	end)
end