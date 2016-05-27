require "wait"
require "tprint"
require "utils"

module ("guo", package.seeall)


local guo_list = {
	["�α�"] = {id = "song bing", loc = "fly xi;w;w;#3 n;#2 e;n;w"},
	["ľ��"] = {id = "mu jiang", loc = "fly xi;e;e;e;s"},
	["����"] = {id = "tiejiang", loc = "fly xi;#3 s;e"},
	["��С��"] = {id = "xiao er", loc = "fly xi;#2 s;e"},
	["��å"] = {id = "liu mang", loc = "fly xi;s;s"},
	["������"] = {id = "zhu ziliu", loc = "fly xi;w;w;s"},
	["��ܽ"] = {id = "guo fu", loc = "fly xi;w;w;#3 s"},
	["����ͨ"] = {id = "wu santong", loc = "fly xi;w;w"},
	["����ϰ�"] = {id = "shudian laoban", loc = "fly xi;w;w;#2 n;w"},
	["С��"] = {id = "seller", loc = "fly xi;w;w;#3 n"},
	["Ů��"] = {id = "girl", loc = "fly xi;w;w;#4 n"},
	["�к�"] = {id = "boy", loc = "fly xi;w;w;#3 n;w"},
	["С��"] = {id = "kid", loc = "fly xi;w;w;#3 n;w"},
	["ƫ��"] = {id = "pian jiang", loc = "fly xi;w;w;#3 n;#2 e;n;w"},
	["�Խ�"] = {id = "pi jiang", loc = "fly xi;#4 w"},
	["����"] = {id = "ya jiang", loc = "fly xi;#4 w;#4 (su)"},
	["������"] = {id = "wu xiuwen", loc = "fly xi;w;w;#3 s;se"},
	["������"] = {id = "lao xiansheng", loc = "fly xi;s;e"},
	["����"] = {id = "zuo jiang", loc = "fly xi;w;w;#3 n;#2 e;n;w"},
	["�շ�ʦ��"] = {id = "shaofan shifu", loc = "fly xi;w;w;#4 s"},
	["Ү����"] = {id = "yelv qi", loc = "fly xi;w;n"},
	["������"] = {id = "gaoli shang", loc = "fly xi;w;w;#3 n;e;n"},
	["�"] = {id = "poor man", loc = "fly xi;w"}
}

test = function()
	wait.make(function()
		for i,v in pairs(guo_list) do
			walk.run(v.loc, function() print(i) Execute("ask " .. v.id .. " about ������") end)
			wait.time(5)
		end
	end)
end

local context = {}

main = function(f_done, f_fail)
	EnableTriggerGroup("guo", true)
	EnableTriggerGroup("guo_kill", false)
	
	context.f_done = f_done
	context.f_fail = f_fail
	Execute("fly xi;w;n;n;n;ask guo about job")
end

init = function()
	EnableTriggerGroup("guo", false)
	EnableTriggerGroup("guo_kill", false)
end

done = function()
	init()
	me.cleanup(context.f_done)
end

fail = function()
	init()
	var.guo_available_time = os.time() + 60
	me.cleanup(context.f_fail)
end

fangqi = function()
	busy_test(function()
		safeback("halt;fly xi", function()
			init()
			Execute("w;n;n;n;ask guo about fangqi")
			fail()
		end)
	end)
end

start = function(name, line, wildcards)
	var.guo_npc_name = wildcards[2]
	go()
end

go = function()
	local target = guo_list[var.guo_npc_name]
	
	if(target == nil) then return fail() end
	var.guo_available_time = os.time() + 240
	walk.run(target.loc, 
			function() 
				Execute("ask " .. target.id .. " about ������")
				me.profile.powerup()
			end, 
	fangqi)
end

waitnpc = function()
	local busy_list = me.profile.busy_list
	local attack_list = me.profile.attack_list2
	EnableTriggerGroup("guo_kill", true)
	fight.prepare(busy_list, attack_list)
	fight.start()
end

killnpc = function()
	busy_test(function()
		Execute("get heiyi ren")
		Execute(var.guo_kill_place)
		Execute("drop heiyi ren;kill heiyi ren")
	end)
end

finish = function()
	fight.stop()
	busy_test(function()
		Execute("get corpse")
		Execute("fly xi;w;n;n;n;give corpse to guo;drop corpse")
		--done()
	end)
end

init()