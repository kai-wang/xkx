--[[
��������ģ��
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


print("����ģ��")

loadmod("me.lua")
loadmod("misc.lua")
loadmod("msg.lua")
loadmod("system.lua")
loadmod("baobiao.lua")
loadmod("wei.lua")
loadmod("shan.lua")
loadmod("roominfo.lua")
loadmod("maps.lua")
loadmod("walk2.lua")
loadmod("quqing.lua")
loadmod("guanfu.lua")
loadmod("fight.lua")
loadmod("bei.lua")
loadmod("item.lua")
loadmod("study.lua")

--include(myid .. ".lua")

map.loadall()
me.profile = dofile(modPath .. myid .. ".lua")
--me.init()

if configcmd~=nil then
	print("????")
	configcmd()
end

