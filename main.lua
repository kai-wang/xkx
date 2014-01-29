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

map.loadall()
me.init()

if configcmd~=nil then
	configcmd()
end
--[[
function test1(name, line, wildcards, styles)
	local line_num = GetLinesInBufferCount()
	print(line_num)
	local styles_num = GetLineInfo(line_num,11)
	print(styles_num)
	for i = 1,styles_num do
		if GetStyleInfo(line_num,i,1) == "★" then
			jiefei_color = GetStyleInfo(line_num,i,14)
			jiefei_color_ch = RGBColourToName (jiefei_color)
			print("★的颜色是:"..jiefei_color_ch.."，代码是:"..jiefei_color)
		end
	end
end
]]--

