--[[
导入所有模块
]]--

modPath=string.match(GetInfo(35),"^.*\\")

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
loadmod("fight.lua")
loadmod("bei.lua")
loadmod("item.lua")
loadmod("heal.lua")

map.loadall()
me.init()

if configcmd~=nil then
	configcmd()
end

