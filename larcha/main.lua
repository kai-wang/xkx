require "var"

--导入所有模块

local modPath, folder, myId = string.match(GetInfo(54),"^(.*)\\(.*)\\([^\.]*).*")

loadmod=function(fileName)
	require("worlds\\xkx\\mods\\" .. fileName)
end


print("导入模块")

loadmod("me")
loadmod("misc")
loadmod("msg")
loadmod("system")
loadmod("roominfo")
loadmod("maps")
loadmod("timer")
loadmod("walk2")
loadmod("fight2")
loadmod("dig")
loadmod("guanfu")
loadmod("bei")
loadmod("baobiao")
loadmod("wei")
loadmod("shan")
loadmod("item")
loadmod("study")
loadmod("guo")
loadmod("auto")
loadmod("songxin")
loadmod("xiao")
loadmod("sstask")
loadmod("maze")
loadmod("chatter")
loadmod("jiding")

map.loadall()

-- 可能需要第一次手动设置一下me_id，然后重新导入脚本
me.profile = dofile(modPath .. "\\" .. folder .. "\\" .. myId .. ".lua")