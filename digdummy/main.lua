require "var"

--��������ģ��

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

-- ������Ҫ��һ���ֶ�����һ��me_id��Ȼ�����µ���ű�
me.profile = dofile(modPath .. "\\" .. folder .. "\\" .. myId .. ".lua")