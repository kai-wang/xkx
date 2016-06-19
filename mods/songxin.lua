require "wait"
require "tprint"
require "utils"
require "string"

module ("songxin", package.seeall)

local sx_list = {
	["����ͷ"] = {id ="foxer", loc = "67"},
	["�Ϸʷ�"] = {id ="fat", loc = "67"},
	["����"] = {id ="sieg", loc = "67"},
	["����"] = {id = "zuosao", loc = "67"},
	["�������"] = {id ="robin", loc ="67"},
	["������"] = {id ="robin", loc = "67"},
	["���߹�"] = {id = "hong", loc = "96"},
	["����"] = {id = "guo jing", loc = "9"},
	["���޼�"] = {id = "zhang wuji", loc = "1830"},
	["��ӯӯ"] = {id = "ren yingying", loc = "2940"},
	["��ҩʦ"] = {id = "huang yaoshi", loc = "2386"},
	["�½���"] = {id = "chen jinnan", loc = "1352"},
	["��ü��ʦ"] = {id = "", loc = ""},
	["�ֳ�Ӣ"] = {id = "lin chaoying", loc = "1193"},
	["���ٴ�ʦ"] = {id = "kurong", loc = "1631"},
	["����"] = {id = "xiao feng", loc = "907"},
	["���"] = {id = "yang guo", loc = "1178"},
	["Ī������"] = {id = "mo da", loc = ""},
	["�����"] = {id = "ke zhene", loc = ""},
	["����"] = {id = "zhao min", loc = ""},
	["����"] = {id = "xu zhu", loc = "2052"},
	["�Ϲٽ���"] = {id = "shangguan jiannan", loc = "2284"},
	["������"] = {id = "zhang sanfeng", loc = "1796"},
	["�ܲ�ͨ"] = {id = "zhou botong", loc = "2399"},
	["����"] = {id = "duan yu", loc = "907"},
	["����ʦ̫"] = {id = "dingxian shitai", loc = "1380"},
	["������"] = {id = "feng qingyang", loc = "2665"}
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
