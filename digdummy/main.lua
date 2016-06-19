require "var"

--导入所有模块

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
loadmod("timer.lua")
loadmod("fight2.lua")
loadmod("dig.lua")
loadmod("guanfu.lua")
loadmod("bei.lua")
loadmod("baobiao.lua")
loadmod("wei.lua")
loadmod("shan.lua")
loadmod("item.lua")
loadmod("study.lua")
loadmod("auto.lua")

map.loadall()

-- 可能需要第一次手动设置一下me_id，然后重新导入脚本
me.profile = dofile(modPath .. "\\" .. folder .. "\\" .. myId .. ".lua")