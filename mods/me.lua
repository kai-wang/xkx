require "tprint"

me = {}


function whoami(n, l, w)
	wait.make(function()
		Execute("score")
		local l, w = wait.regexp("┃姓    名：(\\S+)\\s+┃")
		me.name = w[1]
		Execute("title")
		l, w = wait.regexp(me.name.."\\((\\w+)\\)")
		me.id = string.lower(w[1])
		assert(me.id and me.name)
		me.profile = dofile("worlds\\xkx\\" .. me.id .. ".lua")

	--[[
		AddTrigger("score_myname","┃姓    名：(\\S+)\\s+┃", "", 49193, -1, 0, "", "on_score_name")
		AddTrigger("score_family","┃门    派：(\\S+)\\s+┃", "", 49193, -1, 0, "", "on_score_family")
		AddTrigger("score_master","授业恩师：(\\S+)\\s+┃", "", 49193, -1, 0, "", "on_score_master")
		Execute("score")
		wait.time(1)
		Execute("hp")
	]]--
	end)
end

--[[
function on_score_id(n, l, w)
	print(w[1])
	me.id = string.lower(w[1])
end

function on_score_name(n, l, w)
	me.name = w[1]
	if (0 == IsTrigger("get_ename")) then
		DeleteTrigger("get_ename")
	end
	AddTrigger("score_id", me.name.."\\((\\w+)\\)", "", 49193, -1, 0, "", "on_score_id");
	Execute("title");
end

function on_score_family(n, l, w)
	me.profile = dofile("worlds\\xkx\\" .. me.id .. ".lua")
end

function on_score_master(n, l, w)
	me.master = w[1]
end
]]--
--[[
	精神:		js
	精神最大值: js_max
	精神百分比:	jx%
	精力：		jl
	精力最大值：jl_max
]]--
on_hp1_update = function(name, line, wildcards)
	me["js"] 		= tonumber(wildcards[1])
	me["js_max"] 	= tonumber(wildcards[2])
	me["js%"]		= tonumber(wildcards[3])
	me["jl"] 		= tonumber(wildcards[4])
	me["jl_max"] 	= tonumber(wildcards[5])
	--tprint(me)
end

--[[
	气血:		qx
	气血最大值: qx_max
	气血百分比:	qx%
	内力：		nl
	内力最大值：nl_max
]]--
on_hp2_update = function(name, line, wildcards)
	me["qx"]			= tonumber(wildcards[1])
	me["qx_max"]		= tonumber(wildcards[2])
	me["qx%"]		= tonumber(wildcards[3])
	me["nl"]			= tonumber(wildcards[4])
	me["nl_max"]		= tonumber(wildcards[5])
	--tprint(me)
end


--[[
	正气:		zq
	阅历: 		yl
]]--
on_hp3_update = function(name, line, wildcards)
	me["zq"] 		= tonumber(wildcards[1])
	me["yl"]		= tonumber(wildcards[2])
end


--[[
	食物：		food
	食物最大值：food_max
	潜能：		qn
	潜能最大值：qn_max
]]--
on_hp4_update = function(name, line, wildcards)
	me["food"]		= tonumber(wildcards[1])
	me["food_max"]	= tonumber(wildcards[2])
	me["qn"]		= tonumber(wildcards[3])
	me["qn_max"]	= tonumber(wildcards[4])
end


--[[
	饮水：		water
	饮水最大值: water_max
	经验值：	exp
]]--
on_hp5_update = function(name, line, wildcards)
	me["water"]		= tonumber(wildcards[1])
	me["water_max"]	= tonumber(wildcards[2])
	me["exp"]		= tonumber(wildcards[3])
end


--[[
	丹田:		dt
	丹田最大值:	dt_max
	修为: 		xw
]]--
on_hp6_update = function(name, line, wildcards)
	me["dt"]			= tonumber(wildcards[1])
	me["dt_max"]		= tonumber(wildcards[2])
	me["xw"]			= tonumber(wildcards[3])
end
