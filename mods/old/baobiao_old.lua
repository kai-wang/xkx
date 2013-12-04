require "wait"
require "tprint"
require "utils"

local bb_list = require "worlds\\xkx\\mods\\info_baobiao"

baobiao = {}

baobiao.cmd = {}

baobiao.cmd["go"] = "set brief 1;fly xi;e;e;n;e;ask guo about ����;"
baobiao.cmd["end_ok"] = "unset brief;halt;fly wm;"
baobiao.cmd["end_fail"] = "unset brief;halt;fly wm;"

-- ���ڿ�ʼ---------------------------------
baobiao.start = function()
	EnableTriggerGroup("baobiao", true)
	local cmd = baobiao.cmd["go"]
	hook.addListener("busy", baobiao.start)
	Execute(cmd)
end

baobiao.run = function()
	if(baobiao["loc"] == nil) then baobiao.fail() return end

	local path = bb_list[baobiao["loc"]].go
	print("����·��: ".. path)
	hook.addListener("busy", baobiao.run)
	Execute(path .. "finish");
end

baobiao.done = function()
	print("�������")
	Execute(baobiao.cmd["end_ok"])
	hook.addListener("busy", baobiao.done)
	EnableTriggerGroup("baobiao", false)
end


baobiao.fail = function()
	print("����ʧ��");
	Execute(baobiao.cmd["end_fail"])
	hook.addListener("busy", baobiao.fail)
	EnableTriggerGroup("baobiao", false)
end

function baobiao.setLoc(str)
	if(str ~= nil) then baobiao["loc"] = str end
end


function baobiao:test(str)
	print(str)
end



on_baobiao_ask = function(name, line, wildcards)
	local loc = wildcards[1]
	print("���ڵص㣺" .. loc)
	baobiao["loc"] = loc
end

on_baobiao_go = function()
	baobiao.run()
end

on_baobiao_fail = function()
	baobiao.fail()
end


on_baobiao_done = function()
	baobiao.done()
end
