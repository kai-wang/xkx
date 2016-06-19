require "wait"
require "var"

--[[
��������ģ��
]]--

local modPath, folder, myId = string.match(GetInfo(54),"^(.*)\\(.*)\\([^\.]*).*")

loadmod=function(fileName)
	dofile(modPath .. "\\mods\\" .. fileName)
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