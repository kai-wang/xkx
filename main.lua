--[[
导入所有模块
]]--

local modPath = string.match(GetInfo(35),"^.*\\")
--local myid = string.match(GetInfo(54),"^.*\\(.*)\.MCL$")
local myid = "byj"

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
loadmod("baobiao.lua")
loadmod("wei.lua")
loadmod("info_wei.lua")

loadmod("shan.lua")
loadmod("info_shan.lua")

loadmod("roominfo.lua")
loadmod("maps.lua")
loadmod("walk.lua")

loadmod("quqing.lua")
loadmod("guanfu.lua")
loadmod("fight2.lua")
loadmod("bei.lua")
loadmod("item.lua")
loadmod("heal.lua")

--include(myid .. ".lua")

map.loadall()
me.profile = dofile(modPath .. myid .. ".lua")
--me.init()

if configcmd~=nil then
	print("????")
	configcmd()
end

