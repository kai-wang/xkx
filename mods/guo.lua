require "wait"
require "tprint"
require "utils"
require("worlds\\xkx\\mods\\core")

module ("guo", package.seeall)

local guo_list = {
	["宋兵"] = {id = "song bing", loc = "fly xi;w;w;#3 n;#2 e;n;w"},
	["木匠"] = {id = "mu jiang", loc = "fly xi;e;e;e;s"},
	["铁匠"] = {id = "tiejiang", loc = "fly xi;#3 s;e"},
	["店小二"] = {id = "xiao er", loc = "fly xi;#2 s;e"},
	["流氓"] = {id = "liu mang", loc = "fly xi;s;s"},
	["朱子柳"] = {id = "zhu ziliu", loc = "fly xi;w;w;s"},
	["郭芙"] = {id = "guo fu", loc = "fly xi;w;w;#3 s"},
	["武三通"] = {id = "wu santong", loc = "fly xi;w;w"},
	["书店老板"] = {id = "shudian laoban", loc = "fly xi;w;w;#2 n;w"},
	["小贩"] = {id = "seller", loc = "fly xi;w;w;#3 n"},
	["女孩"] = {id = "girl", loc = "fly xi;w;w;#4 n"},
	["男孩"] = {id = "boy", loc = "fly xi;w;w;#3 n;w"},
	["小孩"] = {id = "kid", loc = "fly xi;w;w;#3 n;w"},
	["偏将"] = {id = "pian jiang", loc = "fly xi;w;w;#3 n;#2 e;n;w"},
	["裨将"] = {id = "pi jiang", loc = "fly xi;#4 w"},
	["牙将"] = {id = "ya jiang", loc = "fly xi;#4 w;#4 (su)"},
	["武修文"] = {id = "wu xiuwen", loc = "fly xi;w;w;#3 s;se"},
	["老先生"] = {id = "lao xiansheng", loc = "fly xi;s;e"},
	["佐将"] = {id = "zuo jiang", loc = "fly xi;w;w;#3 n;#2 e;n;w"},
	["烧饭师傅"] = {id = "shaofan shifu", loc = "fly xi;w;w;#4 s"},
	["耶律齐"] = {id = "yelv qi", loc = "fly xi;w;n"},
	["高丽商"] = {id = "gaoli shang", loc = "fly xi;w;w;#3 n;e;n"}--,
	--["穷汉"] = {id = "poor man", loc = "fly xi;w"}
}

test = function()
	wait.make(function()
		for i,v in pairs(guo_list) do
			walk.run(v.loc, 
					function() 
						print(i) Execute("ask " .. v.id .. " about 保护费") 
					end)
			wait.time(5)
		end
	end)
end

local context = {}

function main(f_done, f_fail)
	EnableTriggerGroup("guo", true)
	EnableTriggerGroup("guo_kill", false)

	context.f_done = f_done
	context.f_fail = f_fail
	Execute("fly xi;w;n;n;n;ask guo about job")
end

function init()
	EnableTriggerGroup("guo", false)
	EnableTriggerGroup("guo_kill", false)
end

function done()
	init()
	timer.tickonce("action", 1, function()
		me.cleanup(context.f_done)
	end)
end

function fail()
	init()
	var.guo_available_time = os.time() + 60
	timer.tickonce("action", 1, function()
		me.cleanup(context.f_fail)
	end)
end

function fangqi()
	core.safehalt(function()
		init()
		Execute("fly xi;w;n;n;n;ask guo about fangqi")
		fail()
	end, 1)
end

function start(name, line, wildcards)
	var.guo_npc_name = wildcards[2]
	go()
end

function go()
	local target = guo_list[var.guo_npc_name]

	if(target == nil) then return fail() end
	var.guo_available_time = os.time() + 240
	walk.run(target.loc,
			function()
				Execute("ask " .. target.id .. " about 保护费")
				config.powerup()
			end,
			fangqi)
end

function waitnpc()
	EnableTriggerGroup("guo_kill", true)
	var.pfm_target = ""
	fight.prepare(config.busy_list, config.attack_list2)
	fight.start()
end

function killnpc()
	core.busytest(function()
		Execute("get heiyi ren")
		Execute(var.guo_kill_place)
		Execute("drop heiyi ren;kill heiyi ren")
	end)
end

function finish()
	fight.stop()
	core.busytest(function()
		kantou(function()
			Execute("get corpse")
			Execute("fly xi;w;n;n;n;give corpse to guo jing;drop corpse")
		end)
	end)
end

init()
