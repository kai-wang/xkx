require "wait"
require "tprint"
require "utils"
require "string"

module ("songxin", package.seeall)

local sx_list = {
	["老鱼头"] = {id ="foxer", loc = "67"},
	["老肥肥"] = {id ="fat", loc = "67"},
	["流云"] = {id ="sieg", loc = "67"},
	["佐少"] = {id = "zuosao", loc = "67"},
	["世外高人"] = {id ="robin", loc ="67"},
	["大熊掌"] = {id ="robin", loc = "67"},
	["洪七公"] = {id = "hong", loc = "96"},
	["郭靖"] = {id = "guo jing", loc = "9"},
	["张无忌"] = {id = "zhang wuji", loc = "1830"},
	["任盈盈"] = {id = "ren yingying", loc = "2940"},
	["黄药师"] = {id = "huang yaoshi", loc = "2386"},
	["陈近南"] = {id = "chen jinnan", loc = "1352"},
	["黄眉大师"] = {id = "", loc = ""},
	["林朝英"] = {id = "lin chaoying", loc = "1193"},
	["枯荣大师"] = {id = "kurong", loc = "1631"},
	["萧峰"] = {id = "xiao feng", loc = "907"},
	["杨过"] = {id = "yang guo", loc = "1178"},
	["莫大先生"] = {id = "mo da", loc = ""},
	["柯镇恶"] = {id = "ke zhene", loc = ""},
	["赵敏"] = {id = "zhao min", loc = ""},
	["虚竹"] = {id = "xu zhu", loc = "2052"},
	["上官剑南"] = {id = "shangguan jiannan", loc = "2284"},
	["张三丰"] = {id = "zhang sanfeng", loc = "1796"},
	["周伯通"] = {id = "zhou botong", loc = "2399"},
	["段誉"] = {id = "duan yu", loc = "907"},
	["定闲师太"] = {id = "dingxian shitai", loc = "1380"},
	["风清扬"] = {id = "feng qingyang", loc = "2665"}
}


test = function()
	wait.make(function()
		for i, v in pairs(sx_list) do
			if(v.id ~= "" and v.loc ~= "") then
				print(v.loc)
				walk.run(roomAll[tonumber(v.loc)].path, function() Execute("ask " .. v.id .. " about hello") end, function() print("fail") end)
				wait.time(10)
			end
		end
	end)
end

local context = {}

main = function(f_done, f_fail)
	EnableTriggerGroup("songxin", true)
	EnableTriggerGroup("songxin_kill", false)
	context.f_done = f_done
	context.f_fail = f_fail
	
	Execute("fly wm;u;s;ask chai about job")
end

fail = function()
	var.sx_available_time = os.time() + 60
	init()
end

done = function()
	var.sx_available_time = os.time() + 120
	init()
end

init = function()
	context = {}
	EnableTriggerGroup("songxin", false)
	EnableTriggerGroup("songxin_kill", false)
end

start = function(name, line, wildcards)
	local npc = wildcards[3]
	local list = sx_list[npc]
	
	print("npc")

	if(list == nil) then 
		goto_place1()
	else
		var.sx_npc_id = list.id
		var.sx_npc_loc = list.loc
		print("npc: " .. npc .. " room: " .. list.loc)
		walk.run(roomAll[tonumber(list.loc)].path, 
		goto_place1
		--function()
		--	Execute("songxin " .. var.sx_npc_id)
		--end
		, goto_place1)
	end
end


startFight = function()
	local busy_list = me.profile.busy_list
	local attack_list = me.profile.attack_list2
	fight.prepare(busy_list, attack_list)
	fight.start()
end

goto_place1 = function()
	busy_test(function()
		Execute(var.sx_killer_place1)
		EnableTriggerGroup("songxin_kill", true)
	end)
end


goto_place2 = function()
	Execute("halt;halt;" .. var.sx_killer_place2)
end


killer_die = function(name, line, wildcards)
	print(wildcards[2])
	local killer_name = wildcards[2]
	if(name == var.sx_killer2_name) then
		busy_test(function()
			Execute("get letter from corpse")
			goto_place1()
		end)
	end
end

init()
