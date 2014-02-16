require "wait"
require "tprint"
require "var"

module ("walk2", package.seeall)

local walk_cxt = {}

local directions = {}

directions["e"] = "东"
directions["eu"] = "东"
directions["ed"] = "东"
directions["w"] = "西"
directions["wu"] = "西"
directions["wd"] = "西"
directions["s"] = "南"
directions["su"] = "南"
directions["sd"] = "南"
directions["n"] = "北"
directions["nu"] = "北"
directions["nd"] = "北"
directions["se"] = "东南"
directions["ne"] = "东北"
directions["sw"] = "西南"
directions["nw"] = "西北"
directions["enter"] = "里面"
directions["out"] = "外面"

local mappings = {}

mappings["大理国"] = "大理"
mappings["峨嵋山"] = "峨眉山"
mappings["青城山"] = "青城"
mappings["紫禁城"] = "北京紫禁城"


local blocker_npcs = {}

blocker_npcs["衙役"] = "ya yi"
blocker_npcs["宋兵"] = "song bing"
blocker_npcs["亲兵"] = "qin bing"
blocker_npcs["一品堂武士"] = "wu shi"
blocker_npcs["卫士"] = "wei shi"
blocker_npcs["崔员外"] = "cui yuanwai"
blocker_npcs["校尉"] = "xiao wei"
blocker_npcs["官兵"] = "guan bing"
blocker_npcs["江百胜"] = "jiang baisheng"
blocker_npcs["女管家"] = "guan jia"
blocker_npcs["门卫"] = "men wei"
blocker_npcs["流氓头"] = "liumang tou"
blocker_npcs["夫人"] = "ya huan"
blocker_npcs["锦衣卫士"] = "wei shi"
blocker_npcs["黄衣卫士"] = "wei shi"
blocker_npcs["山贼头"] = "shanzei tou"
blocker_npcs["静心师太"] = "jingxin shitai"
blocker_npcs["摘星子"] = "zhaixing zi"
blocker_npcs["出尘子"] = "chuchen zi"
blocker_npcs["采花子"] = "caihua zi"
blocker_npcs["管家"] = "guan jia"
blocker_npcs["家丁"] = "jia ding"
blocker_npcs["高根明"] = "gao genming"

---------------------------------------------------------- 特殊命令-------------------------------------------------------------------


function run1(path, f_ok, f_fail)
	
	--命令格式改为
	-- path : e;s;|!aw:3:flatter 星宿老仙:nw|e;e;e;e;e;e
	-- 记住最后一个|的前一条应当设为路径
	
	local tbl = utils.split(path, "|")
	
	--iterator---------------------------------
	local run_iter = function(tbl)
		local i, n = 0, #tbl
		return function() i = i + 1 if(i <= n) then return tbl[i] end end
	end
	
	local iter = run_iter(tbl)
	local p = inter()
	
	if(p == nil) then call(h_fail) return end
	
	--前置声明一下，不然会调用不到------------
	local continue 
	continue = function()
		local p = iter()
		--执行到最后设置"set run ok"----------
		if(p == nil) then
			Execute("set run ok")
			--在这里调用f_ok------------------
			call(f_ok)
		else -- 继续下一条命令----------------
			run_cmd(p, continue, f_fail)
		end
	end
	
	run_cmd(p, continue, f_fail)
end

function run_cmd(cmd, f_ok, f_fail)
	-- 用 !来区别是特殊命令还是一般命令-------
	if(cmd[1] ~= "!") then
		Execute(cmd)
		call(f_ok)
	else
		-- aw:3:flatter 星宿老仙
		run_special(cmd:sub(2), f_ok, f_fail)
	end
end

function run_special(cmd, f_ok, f_fail)
	local tbl = utils.split(cmd, ":")
	
	handlers.new(tbl, f_ok, f_fail)
	handlers.run()
	
end

handlers = {
	context = {},
	
	["new"] = function(tbl, f_ok, f_fail)
		context.f_ok = f_ok
		context.f_fail = f_fail
		--context.cmd = tbl[#tbl]
		--context.func = tbl[1]
		context.cmd = tbl
		context.stop = false
		context.block = false
	end,
	
	["run"] = function()
		context.stop = false
		context.block = false
		local f = handlers(context.cmd[1])
		local cmd = context.cmd[#context.cmd]
		f(unpack(context.cmd, 2, #context.cmd-1))
	end,
	
	["stop"] = function()
		context.stop = true
	end,
	
	["block"] = function()
		context.block = true
	end,
	
	["h_ok"] = function()
		if(context.stop) then return 
		else
			Execute(cmd .. ";set handler ok")
			local l, w = wait.regexp("dfadf")
			if(not context.block) then call(context.f_ok) else run() end
		end
	end,
	
	["aw"] = function(interval, action)
		wait.make(function()
			Execute(action)
			wait.time(tonumber(interval))
			h_ok()
		end)
	end,
	
	["k1"] = function(name)
		EnableTriggerGroup("fight", true)
		var.blocker_id = block_npcs[name]
		if(blocker_id ~= nil) then
			fight.start("kill " .. blocker_id)
		else
			h_fail()
		end
	end,
	
	["gw"] = function()
		wait.make(function()
			Execute("e")
			local l, w = wait.regexp("^(> )*(你见江面结冻，便壮起胆子踩冰而过。)|(船夫在旁边拿眼瞪着你看。冰面化冻，还是乘船吧！)$")
			if(l and string.match(l, "你见江面结冻，便壮起胆子踩冰而过。")) then
				Execute("e")
				h_ok()
			else
				Execute("give 1 gold to chuan fu")
				l, w = wait.regexp("^(> )*(船很快停靠彼岸。你抬脚跨出船来。)|(你身上没有这样东西。)|(这里没有这个人。)$")
				if(l and string.match(l, "船很快停靠彼岸")) then
					h_ok()
				else
					h_fail()
				end
			end
		end)
	end,
	
	["w"] = function()
		
	end,
	
	blocker_dead = function()
		h_ok()
	end
	
	
}
