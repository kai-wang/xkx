require "wait"
require "var"

--[[
导入所有模块
]]--

local modPath, folder, myId = string.match(GetInfo(54),"^(.*)\\(.*)\\([^\.]*).*")

loadmod=function(fileName)
	dofile(modPath .. "\\mods\\" .. fileName)
end

print("导入模块")

loadmod("me.lua")
loadmod("misc.lua")
loadmod("msg.lua")
loadmod("system.lua")

loadmod("roominfo.lua")
loadmod("maps.lua")
loadmod("walk2.lua")
loadmod("dummy_get.lua")

map.loadall()