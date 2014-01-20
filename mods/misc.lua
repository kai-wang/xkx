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
--                 study
------------------------------------------------------------------------------
function study(act)
	act_flag = true;
	wait.make (function ()  --- coroutine below here
		while act_flag do
			repeat
				wait.time(0.1)
				Execute(act)
				Execute("yun regenerate")
				if act_flag == false then
					break;
				end --if
				local line, wildcards = wait.regexp("^>?\\s*(���������˼����������������ö��ˡ�|\\( ����һ��������û����ɣ�����ʩ���ڹ���\\)|�����ھ�������|�������������)")
				if line and string.match(line,"����һ��������û����ɣ�����ʩ���ڹ�") then
					wait.time(0.6)
					Execute("exert regenerate")
				end --if
			until (line and string.match(line,"�������������"))
			if act_flag == true then
				Execute("dazuo max")
				local ll, ww = wait.regexp(me.profile["dazuo_end_desc"])
				if ll ~= nil then
					Execute("exert recover")
				end --if
			end -- if
		end --while
	end)  -- end of coroutine
end --function

function act_stop()
	print("����")
	act_flag = false
	DeleteTemporaryTriggers()
end --function

------------------------------------------------------------------------------
--                 practice
------------------------------------------------------------------------------

function practice_end()
	msg.broadcast("msg_practice_end")
end


function practice(act)
	act_flag = true
	wait.make(function()  --- coroutine below here
		while act_flag do
			repeat
				--wait.time(0.1)
				Execute(act .. ";yun recover")
				if act_flag == false then
					break
				end --if
				local line, wildcards = wait.regexp("^>?\\s*(���������˼���������ɫ�������ö��ˡ�|\\( ����һ��������û����ɣ�����ʩ���ڹ���\\)|�������������档|�������������|��Ļ��������δ���������ȴ�û������ܼ�����ߡ�)")
				if line and string.match(line,"����һ��������û����ɣ�����ʩ���ڹ�") then
					wait.time(0.6)
					Execute("exert recover")
				end --if
			until (line and string.match(line,"�������������"))
			if act_flag == true then
				Execute("dazuo max")
				local ll, ww = wait.regexp(me.profile["dazuo_end_desc"])
				if ll ~= nil then
					Execute("exert recover")
				end --if
			end -- if
		end --while
	end)  -- end of coroutine
end --function

------------------------------------------------------------------------------
--                 dazuo
------------------------------------------------------------------------------

dazuo = {}

dazuo.start = function(callback)
	EnableTriggerGroup("dazuo", true)
	dazuo.done_flag = false
	Execute("et;dazuo max")
	if(callback ~= nil) then
		msg.subscribe("msg_dazuo_end", callback)
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

--[[
function dazuo_end()
	msg.broadcast("msg_dazuo_end")
end



function dazuo()
	wait.make(function()  --- coroutine below here
		--Execute("fly wm;u")
		dazuo_start()
		--Execute("d")
	end)  -- end of coroutine
end --function


function dazuo_start()
	done_flag = false
	local end_desc, full_desc, halt_desc = me.profile["dazuo_end_desc"], me.profile["dazuo_full_desc"], me.profile["dazuo_halt_desc"]
	Execute("dazuo max")
	while true do
		--Execute("dazuo max")
		local ll, ww = wait.regexp(end_desc .. "|" .. full_desc .. "|" .. halt_desc)
		if string.match(full_desc, ll) then
			done_flag = true
			--Execute("halt")
			--break
		elseif string.match(halt_desc, ll) then
			done_flag = true
			print("halt")
			break
		else
			if not done_flag then
				Execute("exert recover")
				Execute("dazuo max")
			else
				break
			end
		end --if
	end
	msg.broadcast("msg_dazuo_end")
end
]]--

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

------------------------------------------------------------------------------
--                 run
------------------------------------------------------------------------------

--[[
handlers = {
	["w"] = function(interval)
		wait.time(tonumber(interval))
	end,

	["y"] = function()
		while true do
			Execute("yell boat")
			local l, w = wait.regexp("^(> )*һҶ���ۻ�����ʻ�˹�����������һ��̤�Ű���ϵ̰�.*$|ֻ����.*����������������æ���š�����")
			if(l and string.match(l, "��������æ����")) then
				wait.time(1)
			else
				break
			end
		end
	end,

	["k"] = function(name)
		while true do
			Execute("kill "..name)
			local l, w = wait.regexp("^(> )*\\S+���ڵ��������˼��£��������������Ѫ�����ˣ�|^(> )*����û������ˡ�$")
			if( l and string.match(l, "����û������ˡ�")) then
				break
			else
				wait.time(1)
			end
		end
	end,

	["ph"] = function()
		Execute("enter chuan")
		local l, w = wait.regexp("^(> )*�����ڵִ��˴���һ�����졣�����´�����$|^(> )*�����ڵִ�����ԭ��һ���������С������´�����$")
	end,

	["tw"] = function()
		Execute("enter zhou")
		local l, w = wait.regexp("^(> )*�������ڵִ��˺�Ͽ��һ���󵺡������´�����$|^(> )*ս�����ڵִ���̨��һ������ë���������Ϯ���ưܳ��С������´�����$")
	end,

	["q"] = function(money)
		Execute("fly wm;e;s;w;qukuan "..money)
		wait.time(2)
	end,

	["g"] = function()
		Execute("e")
		local l, w = wait.regexp("^(> )*�������ᶳ����׳���Ӳȱ�������$")
		if(l and string.match(l, "�������ᶳ����׳���Ӳȱ�������")) then
			Execute("e")
		else
			Execute("give 1 gold to chuan fu")
			l, w = wait.regexp("^(> )*���ܿ�ͣ���˰�����̧�ſ��������$")
		end
	end
}



function run(path)
	local pos1 = string.find(path, "%[")

	if(pos1 == nil) then
		Execute(path)
	else
		local pos2 = string.find(path, "%]")
		if(pos2 == nil) then print("����: "..path.."��ʽ������") return
		else
			if(pos1 > 1) then
				Execute(path:sub(0,pos1-1))
			end
			runcmd(path:sub(pos1+1, pos2-1), path:sub(pos2+1))
		end
	end
end
]]--

--function runcmd(cmd, rest)
--	wait.make(function()
--		local tt = utils.split(cmd, ":")
--		if(tt == nil or tt =="") then print("����������ʽ: "..cmd) return
--		else
--			handlers[tt[1]](tt[2])

			--run(rest)
		--end
	--end)
--end
