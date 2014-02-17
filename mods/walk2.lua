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

local run_cxt = {}

-----命令格式改为
----- path : e;s;|!aw:3:flatter 星宿老仙:nw|e;e;e;e;e;e
----- 记住最后一个|的前一条应当设为路径
function run(path)

	print("执行路径: " .. path)
	
	EnableTriggerGroup("walk", true)
	
	local tbl = utils.split(path, "|")
	local c = run_cxt
	
	--iterator---------------------------------
	local iterator = function(tbl)
		local i, n = 0, #tbl
		return function() i = i + 1 if(i <= n) then return tbl[i] end end
	end
	
	c.iter = iterator(tbl)
	local p = c.iter()
	
	-- path 为空-------------------------------
	if(p == nil) then print("path 为空") run_fail() return end
	
	c.run_next = function()
		if(c.stop) then print("run stop") run_stop() return end
		
		local p = c.iter()
		--执行到最后设置"set run ok"----------
		if(p == nil) then
			Execute("set run ok")
			--print("run ok")
			--在这里调用f_ok------------------
			--run_ok()
		else -- 继续下一条命令----------------
			run_cmd(p, c.run_next, f_fail)
		end
	end
	
	run_cmd(p, c.run_next, run_fail, run_stop)
end

function run_ok()
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	msg.broadcast("msg_run_ok")
end

function run_fail()
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	msg.broadcast("msg_run_fail")
end

function run_stop()
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	msg.broadcast("msg_run_fail")
end


function run_cmd(cmd, f_ok, f_fail, f_stop)
	--if(walk_cxt.run_stop) then return end
	
	-- 用 !来区别是特殊命令还是一般命令-------
	if(cmd:sub(1,1) ~= "!") then
		if(cmd ~= "") then Execute(cmd) end
		call(f_ok)
	else
		-- aw:3:flatter 星宿老仙
		print("special cmd: " .. cmd:sub(2))
		run_special(cmd:sub(2), f_ok, f_fail, f_stop)
	end
end

--执行特殊命令：例如 aw:3:flatter 星宿老仙:nw--
function run_special(cmd, f_ok, f_fail, f_stop)
	local tbl = utils.split(cmd, ":")
	
	handlers.new(tbl, f_ok, f_fail, f_stop)
	handlers.run()
end

handlers = {
	cxt = {},
	
	new = function(tbl, f_ok, f_fail, f_stop)
		local c = handlers.cxt
		
		c.f_ok = f_ok
		c.f_fail = f_fail
		c.f_stop = f_stop
		
		c.cmd = tbl
		c.stop = false
		c.block = false
	end,
	
	run = function()
		EnableTriggerGroup("walk_special", true)
		local c = handlers.cxt
		
		c.stop = false
		c.block = false
		--aw:3:flatter 星宿老仙:nw
		--第一个是特殊命令，最后一个是路径-------
		local func = handlers[c.cmd[1]]
		local cmd = c.cmd[#c.cmd]
		
		if(func == nil) then print("没有对应的handler：" .. c.cmd[1]) handlers.fail() else func(unpack(c.cmd, 2, #c.cmd-1)) end
	end,
	
	stop = function()
		local c = handlers.cxt
		c.stop = true
	end,
	
	----遇到挡路的npc时调用 ---------------------
	block = function()
		local c = handlers.cxt
		c.block = true
	end,
	
	unblock = function()
		local c = handlers.cxt
		c.block = false
	end,
	
	done = function()
		local c = handlers.cxt
		--EnableTriggerGroup("walk_special", false)
		if(c.stop) then print("run special stop") call(c.f_stop)
		else
			wait.make(function()
				local cmd = c.cmd[#c.cmd]
				Execute(cmd .. ";set run_special_handle ok")
				local l, w = wait.regexp("^(> )*设定环境变数：run_special_handle = \"ok\"$")
				if(not c.block) then 
					print("no blocker") 
					EnableTriggerGroup("walk_special", false)
					call(c.f_ok)
				else 
					handlers.run() 
				end
			end)
		end
	end,
	
	fail = function()
		print("handle fail")
		EnableTriggerGroup("walk_special", false)
		local c = handlers.cxt
		call(c.f_fail)
	end,
	
	["aw"] = function(interval, action)
		local c = handlers.cxt
		if(c.stop) then call(c.f_stop) return end
		
		wait.make(function()
			print(interval, action)
			Execute(action)
			if(interval ~= nil and tonumber(interval) > 0) then wait.time(tonumber(interval)) end
			handlers.done()
		end)
	end,
	
	------ a:yell boat-------------------------------------------------
	["a"] = function(action)
		local c = handlers.cxt
		if(c.stop) then call(c.f_stop) else Execute(action) end
	end,
	
	["k1"] = function(name)
		local c = handlers.cxt
		local cmd = c.cmd[#c.cmd]
		Execute(cmd .. ";set walk_special_handle ok")
	end,
	
	k_blocker = function(line, name, wildcards)
		handlers.block()
		var.walk_blocker_name = wildcards[2]
		var.walk_blocker_id = blocker_npcs[var.walk_blocker_name]
		
		if(var.walk_blocker_id == nil) then print("没有blocker id") handlers.fail() return end
		Execute("kill " .. var.walk_blocker_id)
	end,
	
	["gw"] = function()
		local c = handlers.cxt
		
		wait.make(function()
			Execute("e")
			local l, w = wait.regexp("^(> )*(你见江面结冻，便壮起胆子踩冰而过。)|(船夫在旁边拿眼瞪着你看。冰面化冻，还是乘船吧！)$")
			if(l and string.match(l, "你见江面结冻，便壮起胆子踩冰而过。")) then
				Execute("e")
				call(c.f_ok)
			else
				Execute("give 1 gold to chuan fu")
				l, w = wait.regexp("^(> )*(船很快停靠彼岸。你抬脚跨出船来。)|(你身上没有这样东西。)|(这里没有这个人。)$")
				if(l and string.match(l, "船很快停靠彼岸")) then
					call(c.f_ok)
				else
					call(c.f_fail)
				end
			end
		end)
	end,
	
	["w"] = function()
		
	end,
	
	blocker_dead = function(line, name, wildcards)
		print(var.walk_blocker_name .. "死了")
		handlers.unblock()
		
		if(var.walk_blocker_name == "崔员外") then
			Execute("get yaoshi from corpse")
		end
		
		handlers.done()
	end	
}

-------------------------------------------------------------------------------------------------------------------------------
----------------------slow walk------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
local walk_cxt = {}


function getRegion(name)
	local region = regions[name]
	if(region == nil) then
		return regions[mappings[name]]
	else
		return region
	end
end

function findpath(regionName, roomName)
	local match = {}
	local region = getRegion(regionName)
	local prevRoom = nil
	local path = nil

	if(region == nil) then return end
	
	for i, v in ipairs(region.rooms) do
		if(v.name == roomName and v.attr ~= "danger") then
			if(prevRoom ==  nil) then
				path = "set brief;" .. v.path .. ";unset brief;look"
			else
				local temp = find_path(roomAll, prevRoom, v.id)
				if(temp == nil) then
					path = "set brief;" .. v.path .. ";unset brief"
				else
					if #temp == 1 then
						path = temp[1]
					else
						path = "set brief;"
						for i=1, (#temp-1) do
							path = path .. temp[i] .. ";"
						end
					path = path .. "unset brief;" .. temp[#temp]
				end
					--path = table.concat(temp, ";")
				end
			end
			table.insert(match, {["from"]=prevRoom, ["to"]=v.id, ["path"]=path})
			prevRoom = v.id
		end
	end

	return match
end


function sl(regionName, roomName)
	local path = findpath(regionName, roomName)
	
	for x = 1, 2 do
		if(getRegion(regionName .. x)) then
			local path1 = findpath(regionName .. x, roomName)
			if(path ~= nil and path ~= {}) then
				if(path1 ~= nil) then
					for i, v in ipairs(path1) do
						table.insert(path, v)
					end
				end
			else
				path = path1
			end
		end
	end
	
	
	if(path == nil or path == {}) then
		walk_fail()
	else
		local w, r = walk_cxt, run_cxt
		w.stop = false
		r.stop = false
		
		step_by_step(path)
	end
end

function step_by_step(path)
	
	local c = walk_cxt
	
	--iterator---------------------------------
	local iterator = function(tbl)
		local i, n = 0, #tbl
		return function() i = i + 1 if(i <= n) then return tbl[i] end end
	end
	
	c.iter = iterator(path)
	local p = c.iter()
	
	-- path 肯定不会为空了-------------------------------
	assert(p ~= nil)
	
	c.walk_next = function()
		if(c.stop) then walk_stop() return end
		
		local p = c.iter()
		--执行到最后设置"set run ok"----------
		if(p == nil) then
			--Execute("set slowwalk ok")
			--print("run ok")
			--在这里调用f_ok------------------
			walk_ok()
		else -- 继续下一条命令----------------
			step(p.path, c.walk_next, walk_fail, walk_stop)
		end
	end
	
	step(p.path, c.walk_next, walk_fail, walk_stop)
end

function step(cmd, f_ok, f_fail, f_stop)
	msg.subscribe("msg_run_ok", f_ok)
	msg.subscribe("msg_run_stop", f_stop)
	msg.subscribe("msg_run_fail", f_fail)
	
	run(cmd)
end


function stop()
	local w, r = walk_cxt, run_cxt
	w.stop = true
	r.stop = true
end

function resume()
	local w, r = walk_cxt, run_cxt
	w.stop = false
	r.stop = false
	
	local p = w.iter()
	if(p ~= nil) then
		step(p.path, w.walk_next, walk_fail, walk_stop)
	else
		walk_ok()
	end
end

function walk_fail()
	stop()
	print("slow walk fail")
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	msg.broadcast("msg_slowwalk_fail")
end

function walk_stop()
	print("slow walk stop")
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	msg.broadcast("msg_slowwalk_stop")
end

function walk_ok()
	print("slow walk end")
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	msg.broadcast("msg_slowwalk_ok")
end