require "wait"
require "tprint"
require "utils"
require "var"

module ("baobiao", package.seeall)

local bb_list = {}

bb_list["���Ź�"]		= "fly wm;e;s;s;#6 w;"
bb_list["��ˮ�ϰ�"]		= "fly wm;e;#5 n;"
bb_list["��ʯ��"]		= "fly bj;#7 w;sw;"
bb_list["����"]			= "fly fz;#5 w;nw;"
bb_list["��ɽ����"]		= "fly xx;su;s;ed;"
bb_list["����ɽ����"]	= "fly wm;e;s;s;#7 w;n;n;ne;e;e;eu;su;"
bb_list["����ɽ��"]		= "fly wm;e;s;s;#8 w;"
bb_list["��ɽ����"]		= "fly wm;e;s;s;#7 w;n;n;nw;#6 n;#5 e;"
bb_list["ƽ����"]		= "fly bj;#6 w;"
bb_list["test"]			= "fly gm;e;"

init = function()
	EnableTriggerGroup("baobiao", false)
	EnableTriggerGroup("baobiao1", false)
end

main = function()
	EnableTriggerGroup("baobiao", true)
	Execute("set brief;fly xi;e;e;n;e;ask guo about ����")
end

ask = function()
	EnableTriggerGroup("baobiao1", true)
end

songbiao = function(n, l, w)
	EnableTriggerGroup("baobiao1", false)
	var.baobiao_loc = w[2]
	Execute("halt")
	Execute("fly wm")
end

songbiao2 = function()
	if(var.baobiao_loc ~= nil) then
		local path = bb_list[var.baobiao_loc]
		print("����·����" .. path)
		Execute("halt")
		Execute(path)
		Execute("finish")
	else
		fail()
	end
end

finish = function()
	done("ok")
end

fail = function()
	done("fail")
end

done = function(code)
	EnableTriggerGroup("baobiao", false)
	EnableTriggerGroup("baobiao1", false)
	Execute("halt;fly wm;unset brief")
	wait.make(function()
		local l, w = wait.regexp("^(> )*Ok.$")
		msg.broadcast("msg_bb_end")
	end)
end

--[[
main = function()
	EnableTriggerGroup("baobiao", false)
	DeleteTemporaryTriggers()
	wait.make(function()
		start()
	end)
end

start = function()
	Execute("set brief 1;fly xi;e;e;n;e;ask guo about ����")
	local l, w = wait.regexp("^(> )*����˵����������һ��������(.+)����Ҫ����·�ϵİ�ȫ�������в��$|^(> )*����˵�������Եȣ�$|^(> )*����˵�����ٺ٣������ϲ�����һ��������$|^(> )*����˵��������û���ڿ������㱣��$")
	print(l)

	if(string.match(l, "��Ҫ����·�ϵİ�ȫ") ~= nil) then
		var.baobiao_loc = w[2]
		songbiao(w[2])
	elseif(string.match(l, "�����ϲ�����һ��������")) then
		if(var.baobiao_loc ~= nil) then
			songbiao2(var.baobiao_loc)
		end
	else
		done("ok")
	end
end


songbiao = function(loc)
	local path = bb_list[loc]
	print("����·����" .. path)
	Execute("fly wm")
	local l, w = wait.regexp("^(> )*�����һ�����������㻳�$")
	wait.time(1)
	Execute("halt")
	Execute(path)
	Execute("finish")
	l, w = wait.regexp("^(> )*����Է������˰��ţ�������е��ڻ������˶Է���$|^(> )*�㻹û�е�Ŀ�ĵأ�$")
	if(string.match(l, "�㻹û�е�Ŀ�ĵ�")) then
		done("fail")
	else
		done("ok")
	end
end


songbiao2 = function(loc)
	local path = bb_list[loc]
	print("����·����" .. path)
	Execute("halt")
	Execute(path)
	Execute("finish")
	l, w = wait.regexp("^(> )*����Է������˰��ţ�������е��ڻ������˶Է���$|^(> )*�㻹û�е�Ŀ�ĵأ�$")
	if(string.match(l, "�㻹û�е�Ŀ�ĵ�")) then
		done("fail")
	else
		done("ok")
	end
end


done = function(code)
	Execute("halt;fly wm;unset brief")
	local l, w = wait.regexp("^(> )*Ok.$")
	if code == "ok" then
		broadcast("baobiao_done")
	else
		broadcast("baobiao_fail")
	end
end
]]--
