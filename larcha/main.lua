require "var"

--��������ģ��

local modPath, folder, myId = string.match(GetInfo(54),"^(.*)\\(.*)\\([^\.]*).*")

loadmod=function(fileName)
	require("worlds\\xkx\\mods\\" .. fileName)
end


print("����ģ��")

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

-- ������Ҫ��һ���ֶ�����һ��me_id��Ȼ�����µ���ű�
me.profile = dofile(modPath .. "\\" .. folder .. "\\" .. myId .. ".lua")