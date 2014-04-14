require "wait"
require "var"

--[[
导入所有模块
]]--

local modPath = string.match(GetInfo(35),"^.*\\")

include=function(fileName)
	dofile(modPath..fileName)
end

loadmod=function(fileName)
	include("mods\\"..fileName)
end

print("导入模块")

loadmod("me.lua")
loadmod("misc.lua")
loadmod("msg.lua")
loadmod("system.lua")

loadmod("roominfo.lua")
loadmod("maps.lua")
loadmod("walk2.lua")

map.loadall()


function action(id, cmd)
	if(cmd == "xunzhang") then action_xz(id) end
end


function action_xz(id)
	wait.make(function()
		Execute("tuo xunzhang;give xunzhang to " .. id);
		local l, w = wait.regexp("^(> )(这里没有这个人|你身上没有这样东西|你给.*一枚荣誉勋章).*$")
		if(l:match("荣誉勋章")) then call(f_ok) else call(f_fail) end
	end)
end


