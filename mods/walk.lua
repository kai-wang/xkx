require "wait"
require "tprint"
require "var"

module ("walk", package.seeall)

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
handlers = {
	context=nil, f_ok=nil, f_fail=nil, stop_flag = false,

	init = function(cxt, h_ok, h_fail)
		handlers.context = cxt
		handlers.f_ok = h_ok
		handlers.f_fail = h_fail
	end,

	done = function()
		Execute(handlers.context)
		handlers.done2()
	end,
	
	done2 = function()
		EnableTriggerGroup("walk_handle", false)
		EnableTriggerGroup("walk_special", false)
		print("walk handle ok")
		if(handlers.f_ok ~= nil) then handlers.f_ok() end
	end,

	fail = function()
		EnableTriggerGroup("walk_handle", false)
		EnableTriggerGroup("walk_special", false)
		if(handlers.f_fail ~= nil) then handlers.f_fail() end
	end,

	stop = function()
		handlers.stop_flag = true
		EnableTriggerGroup("walk_special", false)
	end,

	k_blocker = function(name, line, wildcards)
		EnableTriggerGroup("walk_handle", false)
		local npc_id = blocker_npcs[wildcards[2]]
		if(npc_id == nil) then
			handlers.fail()
		else
			var.walk_blocker = wildcards[2]
			Execute("kill " .. npc_id)
			Execute("unwield all;hubo;")
		end
	end,

	blocker_dead = function(name, line, wildcards)
		EnableTriggerGroup("walk_handle", true)
		if(var.walk_blocker == "崔员外") then
			Execute("get yaoshi from corpse")
		end

		if(not handlers.stop_flag) then
			Execute(handlers.context)
		end

		Execute("set walk_handle")
	end,
	
	------ w:3---------------------------------------------------------
	["w"] = function(interval)
		DoAfterSpecial(tonumber(interval), "walk.handlers.done()", 12)
	end,

	------ a:yell boat-------------------------------------------------
	["a"] = function(action)
		Execute(action)
	end,

	------ aw:3:flatter 星宿老仙---------------------------------------
	["aw"] = function(interval, action)
		Execute(action)
		if(interval ~= nil and tonumber(interval) > 0) then
			handlers["w"](interval)
		else
			handlers.done()
		end
	end,
	------ c:yingxiong ling--------------------------------------------
	["c"] = function(item)
		Execute("look " .. item)
	end,

	------ k1:门卫------------------------------------------------------
	["k1"] = function(name)
		if(not handlers.stop_flag) then
			EnableTriggerGroup("walk_handle")
			Execute(handlers.context)
			Execute("set walk_handle")
		end
	end,

	["q"] = function(money)
		wait.make(function()
			Execute("fly wm;e;s;w;qukuan "..money)
			wait.time(2)
			handlers.done()
		end)
	end,

	["gw"] = function()
		wait.make(function()
			Execute("e")
			local l, w = wait.regexp("^(> )*(你见江面结冻，便壮起胆子踩冰而过。)|(船夫在旁边拿眼瞪着你看。冰面化冻，还是乘船吧！)$")
			if(l and string.match(l, "你见江面结冻，便壮起胆子踩冰而过。")) then
				Execute("e")
				handlers.done()
			else
				Execute("give 1 gold to chuan fu")
				l, w = wait.regexp("^(> )*(船很快停靠彼岸。你抬脚跨出船来。)|(你身上没有这样东西。)|(这里没有这个人。)$")
				if(l and string.match(l, "船很快停靠彼岸")) then
					handlers.done()
				else
					handlers.fail()
				end
			end
		end)
	end,
	
	["gw1"] = function()
		wait.make(function()
			Execute("w")
			local l, w = wait.regexp("^(> )*(你见江面结冻，便壮起胆子踩冰而过。)|(船夫在旁边拿眼瞪着你看。)$")
			if(l and string.match(l, "你见江面结冻，便壮起胆子踩冰而过。")) then
				handlers.done()
			else
				handlers.fail()
			end
		end)
	end,

	["press"] = function()
		Execute("press " .. var.fz_coin)
		handlers.done()
	end,

	["pushstone"] = function()
		Execute("push stone")
		--[[
		wait.make(function()
			Execute("push stone")
			local l, w = wait.regexp("^(> )*(你把巨石推到一边，露出一个洞口，里面幽幽的有些光亮。)|(水流一阵涌动，巨石轰隆一声滚回了原处，洞口又被封住了。)$")
			if(l and string.match(l, "被封住了")) then
				Execute("push stone")
			end
			handlers.done()
		end)
		]]--
	end,

	["test"] = function(p1, p2, p3)
		print(p1, p2, p3)
	end
}


run = function(path)
	if(path == nil) then fail() return end

	print("执行路径：" .. path)
	EnableTriggerGroup("walk", true)

	if(walk_cxt.walk_path == nil) then
		walk_cxt.walk_path = path
	end

	local pos1, pos2 = path:find("%["), path:find("%]")

	if(pos1 == nil) then
		if(path[1] == ";") then path = path:sub(2) end
		Execute(path)
		Execute("set walk ok")
	else
		if(pos2 == nil) then
			print("命令: "..path.."格式出错了")
			fail()
		else
			if(pos1 >= 1) then Execute(path:sub(1, pos1-1)) end
			local pos3 = path:find(";", pos2)
			local tt = utils.split(path:sub(pos1+1, pos2-1), ":")
			local handler_ok = function()
				Execute("halt")
				if(pos3 ~= nil) then
					walk.run(path:sub(pos3+1))
				else
					Execute("set walk ok")
				end
			end

			EnableTriggerGroup("walk_special", true)
			if(pos3 ~= nil) then
				handlers.init(path:sub(pos2+1, pos3-1), handler_ok, walk.fail)
			else
				handlers.init(path:sub(pos2+1), handler_ok, walk.fail)
			end

			handlers[tt[1]](unpack(tt,2))
		end
	end
end


function fail()
	print("walk fail")
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	walk_cxt.status = "fail"
	stop()
	msg.broadcast("msg_walk_fail")
end

function done()
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	walk_cxt.status = "done"
	msg.broadcast("msg_walk_ok")
end

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

function continue()
	if(walk_cxt.thread and coroutine.status(walk_cxt.thread) == "suspended") then
		coroutine.resume(walk_cxt.thread)
	end
end

function stop()
	walk_cxt.stop = true
	if(walk_cxt.thread and coroutine.status(walk_cxt.thread) == "suspended") then
		coroutine.resume(walk_cxt.thread)
	end
end

function sl(regionName, roomName, f_done, f_fail)
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
		fail()
	else
		walk_cxt.path = path
		walk_cxt.status = "step"
		walk_cxt.stop = false
		step_by_step(walk_cxt.path, f_done, f_fail)
	end
end


function step_by_step(path, f_done, f_fail)

	msg.subscribe("msg_walk_ok", continue)
	msg.subscribe("msg_walk_fail", f_fail)
	msg.subscribe("msg_slowwalk_ok", f_done)
	
	walk_cxt.stop = false
	local f = coroutine.wrap(function()
		walk_cxt.thread = coroutine.running()

		for i, v in ipairs(path) do
			run(v.path)
			coroutine.yield()
			walk_cxt.currentId = v.to
			print("当前房间: "..walk_cxt.currentId)
			if(walk_cxt.stop) then
				break
			--else
			--	print("step")
			end
		end
		
		if(not walk_cxt.status or walk_cxt.status ~= "fail") then 
			msg.broadcast("msg_slowwalk_ok")
		end
		
	end)
	-- call wrap
	f()
end

--[[
function todir(dir)
	if(walk_cxt.pos > #walk_cxt.path) then print("出错了, pos > path.length") fail() end

	local currentRoom = roomAll[walk_cxt.path[walk_cxt.pos].to]
	local match = {}
	local path = nil
	for i, v in pairs(currentRoom.links) do
		print("i "..directions[i])
		if(directions[i] == dir) then
			local temp = find_path(roomAll, currentRoom.id, v.to)
			if(temp == nil) then
				path = v.path
			else
				path = table.concat(temp, ";")
			end
			table.insert(match, {["from"]=currentRoom.id, ["to"]=v.to, ["path"]=path})
		end
	end

	tprint(match)
	step_by_step(match)
end

]]--

function setroom(id)
	walk_cxt.currentId = id
end


function walkaround(dp, dir)
	local room = roomAll[walk_cxt.currentId]
	local tbl, walked = {}, {}
	local walk_deepth = tonumber(dp)
	--if(var.walk_deepth ~= nil) then walk_deepth = tonumber(var.walk_deepth) end

	findexit = function(room, from, deepth)

		if(deepth == walk_deepth) then
			return
		else
			for i, v in pairs(room.links) do
				if(not walked[v.to] and v.attr ~= "danger" and (v.block == nil or v.block ~= "y")) then
					if(dir ~= nil and directions[i] == dir and deepth == 1) then
						local p = i
						if(v.con ~= nil and v.con ~= "") then print(v.con) p = "[" .. v.con .. "]" .. i end
						table.insert(tbl, 1, {["from"]=room.id, ["to"]=v.to, ["path"]=p})
					else
						local p = i
						if(v.con ~= nil and v.con ~= "") then print(v.con) p = "[" .. v.con .. "]" .. i end
						table.insert(tbl, {["from"]=room.id, ["to"]=v.to, ["path"]=p})
					end
					
					walked[v.to] = true
					--deepth = deepth + 1
					findexit(roomAll[v.to], room.id, deepth+1)
					local stepback = find_path(roomAll, v.to, room.id)
					if(stepback) then
						local path = table.concat(stepback, ";")
						table.insert(tbl, {["from"]=v.to, ["to"]=room.id, ["path"]=path})
					else
						table.insert(tbl, {["from"]=v.to, ["to"]=room.id, ["path"]=roomAll[room.id].path})
					end
				end
			end
		end
	end

	--tprint(walked)
	walked[room.id] = true
	findexit(room, room.id, 1)
	--tprint(tbl)

	step_by_step(tbl)
end

function info()
	tprint(walk_cxt)
end
