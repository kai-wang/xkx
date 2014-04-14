require "wait"
require "var"

--[[
��������ģ��
]]--

local modPath = string.match(GetInfo(35),"^.*\\")

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

loadmod("roominfo.lua")
loadmod("maps.lua")
loadmod("walk2.lua")

map.loadall()


function action(id, cmd)
	if(cmd == "xunzhang") then action_xz(id) end
end


function action_xz(id)
	wait.make(function()
		Execute("tuo xunzhang;give xunzhang to " .. id);
		local l, w = wait.regexp("^(> )(����û�������|������û����������|���.*һö����ѫ��).*$")
		if(l:match("����ѫ��")) then call(f_ok) else call(f_fail) end
	end)
end


