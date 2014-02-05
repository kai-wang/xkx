require "tprint"

me = {}
me.package = {}
me.status = {}

--[[
me.init = function()
	wait.make(function()
		Execute("title")
		local l, w = wait.regexp("\\((\\w+)\\)")
		local id = string.lower(w[1])
		me.profile = dofile("worlds\\xkx\\" .. id .. ".lua")
		me.id = var.me_id
		me.name = var.me_name
		
		assert(me.id)
		print(me.id, me.name)
	end)
end
]]--

--[[
	����:		js
	�������ֵ: js_max
	����ٷֱ�:	jx%
	������		jl
	�������ֵ��jl_max
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
	��Ѫ:		qx
	��Ѫ���ֵ: qx_max
	��Ѫ�ٷֱ�:	qx%
	������		nl
	�������ֵ��nl_max
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
	����:		zq
	����: 		yl
]]--
on_hp3_update = function(name, line, wildcards)
	me["zq"] 		= tonumber(wildcards[1])
	me["yl"]		= tonumber(wildcards[2])
end


--[[
	ʳ�		food
	ʳ�����ֵ��food_max
	Ǳ�ܣ�		qn
	Ǳ�����ֵ��qn_max
]]--
on_hp4_update = function(name, line, wildcards)
	me["food"]		= tonumber(wildcards[1])
	me["food_max"]	= tonumber(wildcards[2])
	me["qn"]		= tonumber(wildcards[3])
	me["qn_max"]	= tonumber(wildcards[4])
end


--[[
	��ˮ��		water
	��ˮ���ֵ: water_max
	����ֵ��	exp
]]--
on_hp5_update = function(name, line, wildcards)
	me["water"]		= tonumber(wildcards[1])
	me["water_max"]	= tonumber(wildcards[2])
	me["exp"]		= tonumber(wildcards[3])
end


--[[
	����:		dt
	�������ֵ:	dt_max
	��Ϊ: 		xw
]]--
on_hp6_update = function(name, line, wildcards)
	me["dt"]			= tonumber(wildcards[1])
	me["dt_max"]		= tonumber(wildcards[2])
	me["xw"]			= tonumber(wildcards[3])
end
