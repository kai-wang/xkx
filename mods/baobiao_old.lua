require "wait"
require "tprint"
require "utils"

local stateMachine = dofile("worlds\\xkx\\mods\\statemachine.lua")
local bb_list = dofile("worlds\\xkx\\mods\\info_baobiao.lua")

baobiao = {
	data = { delay = 2 },

	cmd = {
		["go"] 		= "set brief 1;fly xi;e;e;n;e;ask guo about ����;",
		["back"] 	= "fly wm;",
		["end"]		= "halt;fly wm;unset brief"
	}
}



--[[
	��������״̬��Ӧ
]]--

baobiao.main = function()
	EnableTriggerGroup("baobiao", true)
	hook("busy", baobiao.busy)
	local fsm = baobiao.fsm
	fsm:changeState("askbiao")
end

--[[
	���������ȥ�������
]]--
baobiao.askbiao = function()
	Execute(baobiao.cmd["go"])
end

--[[
	�ӵ����񷵻�����ȴ�
]]--
baobiao.jiebiao = function()
	local fsm = baobiao.fsm
	print("��ǰ״̬: ", fsm:state())
	Execute(baobiao.cmd["back"])
end

--[[
	�������������
]]--
baobiao.songbiao = function()
	local fsm = baobiao.fsm
	--print(baobiao.data["loc"])
	local loc = bb_list[baobiao.data["loc"]]
	if(loc == nil) then fsm:changeState("fail") return end

	print("����·��: ".. loc.go)
	Execute(loc.go .. "finish");
end

--[[
	���ڳɹ���ý���
]]--
baobiao.done = function()
	print("�������")
	Execute(baobiao.cmd["end"])
	EnableTriggerGroup("baobiao", false)
	unhook("busy")
end

--[[
	����ʧ�ܣ�������ʧ��
]]--
baobiao.fail = function()
	print("����ʧ��");
	Execute(baobiao.cmd["end"])
	EnableTriggerGroup("baobiao", false)
	unhook("busy")
end

--[[
	busy������һ������û����ɣ��ȴ�һ��ʱ�������ִ����һ��״̬
]]--
baobiao.busy = function()
	local fsm = baobiao.fsm
	local state = fsm:fromState()
	print("busy ǰ��״̬���� " .. state .. "��")
	wait.make(function()
		local delay = baobiao.data["delay"]
		wait.time(delay)
		fsm:changeState(state)
	end)
	--fsm:changeState("songbiao")
	--DoAfterSpecial(1, "baobiao.fsm:changeState("..state..")", 12)
end

------------------------------------------------------------------------------

--[[
	���´�trigger�д���
]]--

on_baobiao_ask = function(name, line, wildcards)
	local loc = wildcards[1]
	print("���ڵص㡾" .. loc .."��")
	baobiao.data["loc"] = loc
	SetVariable("baobiao_loc", loc)
	local fsm = baobiao.fsm
	fsm:changeState("jiebiao")
end

on_baobiao_go = function()
	local fsm = baobiao.fsm
	fsm:changeState("songbiao")
end

on_baobiao_fail = function()
	local fsm = baobiao.fsm
	fsm:changeState("fail")
end


on_baobiao_done = function(name, line, wildcards)
	local exp, qn, yl = wildcards[1], wildcards[2], wildcards[3]

	baobiao.data["exp"] = chs2num(exp)
	baobiao.data["qn"]  = chs2num(qn)
	baobiao.data["yl"]	= chs2num(yl)

	SetVariable("baobiao_exp", baobiao.data["exp"])
	SetVariable("baobiao_qn", baobiao.data["qn"])
	SetVariable("baobiao_yl", baobiao.data["yl"])

	local fsm = baobiao.fsm
	fsm:changeState("done")
end

on_baobiao_busy = function()
	local fsm = baobiao.fsm
	print("fsm2: ")
	print(fsm)
	fsm:changeState("busy")
end


--------------------------------------------------------------------------------
--[[
	����״̬��:
]]--

baobiao.fsm = stateMachine:new({
	{"main"},
	{"askbiao", 	baobiao.askbiao	},	--
	{"jiebiao", 	baobiao.jiebiao	},
	{"songbiao",	baobiao.songbiao},
	{"busy", 		baobiao.busy	},
	{"done", 		baobiao.done	},
	{"fail", 		baobiao.fail	}
}
)


baobiao.test = function()
	EnableTriggerGroup("baobiao", true)
	hook("busy", on_baobiao_busy)
	baobiao.data["loc"] = "test"
	print("fsm1: ")
	print(baobiao.fsm)
	baobiao.fsm:changeState("songbiao")
end

baobiao.test2 = function()
	EnableTriggerGroup("baobiao", true)
end
