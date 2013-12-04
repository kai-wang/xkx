require "wait"
require "tprint"
require "utils"

local stateMachine = dofile("worlds\\xkx\\mods\\statemachine.lua")
local bb_list = dofile("worlds\\xkx\\mods\\info_baobiao.lua")

baobiao = {
	data = { delay = 2 },

	cmd = {
		["go"] 		= "set brief 1;fly xi;e;e;n;e;ask guo about 保镖;",
		["back"] 	= "fly wm;",
		["end"]		= "halt;fly wm;unset brief"
	}
}



--[[
	保镖所有状态响应
]]--

baobiao.main = function()
	EnableTriggerGroup("baobiao", true)
	hook("busy", baobiao.busy)
	local fsm = baobiao.fsm
	fsm:changeState("askbiao")
end

--[[
	从武庙出发去郭旭接镖
]]--
baobiao.askbiao = function()
	Execute(baobiao.cmd["go"])
end

--[[
	接到任务返回武庙等待
]]--
baobiao.jiebiao = function()
	local fsm = baobiao.fsm
	print("当前状态: ", fsm:state())
	Execute(baobiao.cmd["back"])
end

--[[
	从武庙出发送镖
]]--
baobiao.songbiao = function()
	local fsm = baobiao.fsm
	--print(baobiao.data["loc"])
	local loc = bb_list[baobiao.data["loc"]]
	if(loc == nil) then fsm:changeState("fail") return end

	print("保镖路径: ".. loc.go)
	Execute(loc.go .. "finish");
end

--[[
	保镖成功获得奖励
]]--
baobiao.done = function()
	print("保镖完成")
	Execute(baobiao.cmd["end"])
	EnableTriggerGroup("baobiao", false)
	unhook("busy")
end

--[[
	接镖失败，或送镖失败
]]--
baobiao.fail = function()
	print("保镖失败");
	Execute(baobiao.cmd["end"])
	EnableTriggerGroup("baobiao", false)
	unhook("busy")
end

--[[
	busy导致上一个动作没有完成，等待一定时间后重新执行上一个状态
]]--
baobiao.busy = function()
	local fsm = baobiao.fsm
	local state = fsm:fromState()
	print("busy 前的状态：【 " .. state .. "】")
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
	以下从trigger中触发
]]--

on_baobiao_ask = function(name, line, wildcards)
	local loc = wildcards[1]
	print("保镖地点【" .. loc .."】")
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
	保镖状态机:
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
