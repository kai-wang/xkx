require "wait"
require "tprint"
require "utils"
require "var"

module ("baobiao", package.seeall)

local bb_list = {}

bb_list["函古关"]		= "fly wm;e;s;s;#6 w;"
bb_list["汉水南岸"]		= "fly wm;e;#5 n;"
bb_list["乱石坡"]		= "fly bj;#7 w;sw;"
bb_list["闽江"]			= "fly fz;#5 w;nw;"
bb_list["天山脚下"]		= "fly xx;su;s;ed;"
bb_list["中条山密林"]	= "fly wm;e;s;s;#7 w;n;n;ne;e;e;eu;su;"
bb_list["终南山口"]		= "fly wm;e;s;s;#8 w;"
bb_list["华山脚下"]		= "fly wm;e;s;s;#7 w;n;n;nw;#6 n;#5 e;"
bb_list["平定州"]		= "fly bj;#6 w;"
bb_list["test"]			= "fly gm;e;"

init = function()
	EnableTriggerGroup("baobiao", false)
	EnableTriggerGroup("baobiao1", false)
end

main = function()
	EnableTriggerGroup("baobiao", true)
	Execute("set brief;fly xi;e;e;n;e;ask guo about 保镖")
end

ask = function()
	EnableTriggerGroup("baobiao1", true)
end

songbiao = function(n, l, w)
	EnableTriggerGroup("baobiao1", false)
	var.baobiao_loc = w[2]
	Execute("halt")
	Execute("fly wm")
end

songbiao2 = function()
	if(var.baobiao_loc ~= nil) then
		local path = bb_list[var.baobiao_loc]
		print("保镖路径：" .. path)
		Execute("halt")
		Execute(path)
		Execute("finish")
	else
		fail()
	end
end

finish = function()
	done("ok")
end

fail = function()
	done("fail")
end

done = function(code)
	EnableTriggerGroup("baobiao", false)
	EnableTriggerGroup("baobiao1", false)
	Execute("halt;fly wm;unset brief")
	wait.make(function()
		local l, w = wait.regexp("^(> )*Ok.$")
		msg.broadcast("msg_bb_end")
	end)
end

--[[
main = function()
	EnableTriggerGroup("baobiao", false)
	DeleteTemporaryTriggers()
	wait.make(function()
		start()
	end)
end

start = function()
	Execute("set brief 1;fly xi;e;e;n;e;ask guo about 保镖")
	local l, w = wait.regexp("^(> )*郭旭说道：现在有一趟镖运往(.+)，你要负责路上的安全，不可有差错。$|^(> )*郭旭说道：请稍等！$|^(> )*郭旭说道：嘿嘿，你身上不是有一趟镖了吗？$|^(> )*郭旭说道：现在没有镖可以让你保。$")
	print(l)

	if(string.match(l, "你要负责路上的安全") ~= nil) then
		var.baobiao_loc = w[2]
		songbiao(w[2])
	elseif(string.match(l, "你身上不是有一趟镖了吗")) then
		if(var.baobiao_loc ~= nil) then
			songbiao2(var.baobiao_loc)
		end
	else
		done("ok")
	end
end


songbiao = function(loc)
	local path = bb_list[loc]
	print("保镖路径：" .. path)
	Execute("fly wm")
	local l, w = wait.regexp("^(> )*郭旭把一个包裹塞在你怀里。$")
	wait.time(1)
	Execute("halt")
	Execute(path)
	Execute("finish")
	l, w = wait.regexp("^(> )*你见对方对上了暗号，便把手中的镖货交给了对方。$|^(> )*你还没有到目的地！$")
	if(string.match(l, "你还没有到目的地")) then
		done("fail")
	else
		done("ok")
	end
end


songbiao2 = function(loc)
	local path = bb_list[loc]
	print("保镖路径：" .. path)
	Execute("halt")
	Execute(path)
	Execute("finish")
	l, w = wait.regexp("^(> )*你见对方对上了暗号，便把手中的镖货交给了对方。$|^(> )*你还没有到目的地！$")
	if(string.match(l, "你还没有到目的地")) then
		done("fail")
	else
		done("ok")
	end
end


done = function(code)
	Execute("halt;fly wm;unset brief")
	local l, w = wait.regexp("^(> )*Ok.$")
	if code == "ok" then
		broadcast("baobiao_done")
	else
		broadcast("baobiao_fail")
	end
end
]]--
