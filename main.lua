require "var"

--导入所有模块

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
loadmod("baobiao.lua")
loadmod("wei.lua")
loadmod("shan.lua")
loadmod("roominfo.lua")
loadmod("maps.lua")
loadmod("walk2.lua")
loadmod("quqing.lua")
loadmod("guanfu.lua")
loadmod("fight2.lua")
loadmod("bei.lua")
loadmod("item.lua")
loadmod("study.lua")

map.loadall()

-- 可能需要第一次手动设置一下me_id，然后重新导入脚本
me.profile = dofile(modPath .. var.me_id .. ".lua")

