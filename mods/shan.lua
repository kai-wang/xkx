require "wait"
require "tprint"
require "utils"

local stateMachine = dofile("worlds\\xkx\\mods\\statemachine.lua")
local shan_list = dofile("worlds\\xkx\\mods\\info_shan.lua")


shan = {
	data = { delay = 2, blocker = "江百胜" },

	cmd = {
		["go"] 		= "set brief 1;fly es;nu;quest;",
		["go2"]		= "nu;quest;",
		["kjiang"]	= "kill jiang baisheng;",
		["back"] 	= "fly wm;",
		["end"]		= "halt;fly wm;unset brief"
	}
}


--[[
	保镖所有状态响应
]]--

shan.main = function()
	EnableTriggerGroup("shan", true)
	hook("busy", shan.busy)
	local fsm = shan.fsm
	fsm:changeState("quest")
end


shan.quest = function()
	Execute(shan.cmd["go"])
end


shan.killjiang = function()
	Execute(shan.cmd["kjiang"])
end

shan.quest2 = function()
	wait.make(function()
		wait.time(1)
		Execute(shan.cmd["go2"])
	end)
end

shan.doquest = function()
	local fsm = shan.fsm
	local npc = shan_list[shan.data["npc"]]
	if(npc == nil) then fsm:changeState("fail") return end

	if(npc.exp == nil) then
		local cmd = npc.path .. "kill ".. npc.id
		print("命令："..cmd)
		Execute(cmd)
	end
end


shan.done = function()
	Execute(shan.cmd["end"])
end
------------------------------------------------------------------------------

on_shan_block = function()
	local fsm = shan.fsm
	fsm:changeState("killjiang")
end


on_shan_quest2 = function()
	local fsm = shan.fsm
	fsm:changeState("quest2")
end


on_shan_quest = function(name, line, wildcards)
	local npc = wildcards[1]
	print("npc【"..npc.."】")
	shan.data["npc"] = npc
	SetVariable("shan_npc", npc)
	local fsm = shan.fsm
	fsm:changeState("doquest")
end

on_shan_done = function(name, line, wildcards)
	local exp, qn, yl = wildcards[1], wildcards[2], wildcards[3]

	baobiao.data["exp"] = chs2num(exp)
	baobiao.data["qn"]  = chs2num(qn)
	baobiao.data["yl"]	= chs2num(yl)

	SetVariable("shan_exp", baobiao.data["exp"])
	SetVariable("shan_qn", baobiao.data["qn"])
	SetVariable("shan_yl", baobiao.data["yl"])

	local fsm = shan.fsm
	fsm:changeState("done")
end


on_shan_npc_dead = function(name, line, wildcards)
	local npc = wildcards[1]
	local fsm = shan.fsm
	if(npc == shan.data["blocker"]) then
		fsm:changeState("quest2")
		return
	end

	if(npc == GetVariable("shan_npc")) then
		fsm:changeState("done")
		return
	end
end
--[[
	单正状态机:
]]--

shan.fsm = stateMachine:new({
	{"main"},
	{"quest", 		shan.quest	},
	{"killjiang",	shan.killjiang	},
	{"quest2",		shan.quest2	},
	{"jiequest", 	shan.jiequest	},
	{"doquest",		shan.doquest	},
	{"busy", 		shan.busy	},
	{"done", 		shan.done	},
	{"fail", 		shan.fail	}
}
)


shan.test = function()
	EnableTriggerGroup("shan")
end
