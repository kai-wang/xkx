require "wait"
require "var"

--[[
��������ģ��
]]--

local modPath = string.match(GetInfo(35),"^.*\\")

include=function(fileName)
	dofile(modPath..fileName)
end

loadmod=function(fileName)
	include("mods\\"..fileName)
end

print("����ģ��")

loadmod("me.lua")
loadmod("misc.lua")
loadmod("msg.lua")
loadmod("system.lua")

loadmod("roominfo.lua")
loadmod("maps.lua")
loadmod("walk2.lua")
loadmod("dummy_get.lua")

map.loadall()