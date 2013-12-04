require "wait"
require "tprint"
require "var"

module ("walk", package.seeall)

local walk_info = {}


local directions = {}
directions["e"] = "��"
directions["eu"] = "��"
directions["ed"] = "��"
directions["w"] = "��"
directions["wu"] = "��"
directions["wd"] = "��"
directions["s"] = "��"
directions["su"] = "��"
directions["sd"] = "��"
directions["n"] = "��"
directions["nu"] = "��"
directions["nd"] = "��"
directions["se"] = "����"
directions["ne"] = "����"
directions["sw"] = "����"
directions["nw"] = "����"

local blocker_npcs = {}

blocker_npcs["����"] = "ya yi"
blocker_npcs["�α�"] = "song bing"
blocker_npcs["�ױ�"] = "qin bing"
blocker_npcs["һƷ����ʿ"] = "wu shi"
blocker_npcs["��ʿ"] = "wei shi"
blocker_npcs["��Ա��"] = "cui yuanwai"
blocker_npcs["Уξ"] = "xiao wei"
blocker_npcs["�ٱ�"] = "guan bing"
blocker_npcs["����ʤ"] = "jiang baisheng"
blocker_npcs["Ů�ܼ�"] = "guan jia"
blocker_npcs["����"] = "men wei"
blocker_npcs["��åͷ"] = "liumang tou"
blocker_npcs["Ѿ��"] = "ya huan"
blocker_npcs["������ʿ"] = "wei shi"
blocker_npcs["������ʿ"] = "wei shi"
blocker_npcs["ɽ��ͷ"] = "shanzei tou"
blocker_npcs["����ʦ̫"] = "jingxin shitai"
blocker_npcs["ժ����"] = "zhaixing zi"
blocker_npcs["������"] = "chuchen zi"
blocker_npcs["�ɻ���"] = "caihua zi"

---------------------------------------------------------- ��������-------------------------------------------------------------------
handlers = {
	done = function()
		EnableTriggerGroup("walk_special", false)
		msg.broadcast("msg_handler_ok")
	end,

	fail = function()
		EnableTriggerGroup("walk_special", false)
		msg.broadcast("msg_handler_fail")
	end,

	------ w:3---------------------------------------------------------
	["w"] = function(interval)
		DoAfterSpecial(tonumber(interval), "walk.handlers.done()", 12)
	end,

	------ a:yell boat-------------------------------------------------
	["a"] = function(action)
		Execute(action)
	end,

	------ aw:3:flatter ��������---------------------------------------
	["aw"] = function(interval, action)
		Execute(action)
		if(interval ~= nil) then
			handlers["w"](interval)
		else
			handlers.done()
		end
	end,

	------ c:yingxiong ling--------------------------------------------
	["c"] = function(item)
		Execute("look " .. item)
	end,

	------ k1:����------------------------------------------------------
	["k1"] = function(name)
		wait.make(function()
			if(blocker_npcs[name] == nil) then handlers.fail() return end
			while true do
				Execute("kill ".. blocker_npcs[name])
				local l, w = wait.regexp("^(> )*(" .. name ..".*����)|(����û�������).*$")
				if( l and string.match(l, "����û������ˡ�")) then
					break
				else
					if(name == "��Ա��") then
						Execute("get yaoshi from corpse")
					end
					wait.time(1)
				end
			end

			handlers.done()
		end)
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
			local l, w = wait.regexp("^(> )*(�������ᶳ����׳���Ӳȱ�������)|(�������Ա����۵����㿴�����滯�������ǳ˴��ɣ�)$")
			if(l and string.match(l, "�������ᶳ����׳���Ӳȱ�������")) then
				Execute("e")
			else
				Execute("give 1 gold to chuan fu")
				l, w = wait.regexp("^(> )*���ܿ�ͣ���˰�����̧�ſ��������$")
			end
			handlers.done()
		end)
	end,

	["press"] = function()
		Execute("press " .. var.fz_coin)
		handlers.done()
	end,

	["pushstone"] = function()
		wait.make(function()
			Execute("push stone")
			local l, w = wait.regexp("^(> )*(��Ѿ�ʯ�Ƶ�һ�ߣ�¶��һ�����ڣ��������ĵ���Щ������)|(ˮ��һ��ӿ������ʯ��¡һ��������ԭ���������ֱ���ס�ˡ�)$")
			if(l and string.match(l, "����ס��")) then
				Execute("push stone")
			end
			handlers.done()
		end)
	end
}


run = function(path)

	print("ִ��·����" .. path)
	EnableTriggerGroup("walk", true)

	if(walk_info.walk_path == nil) then
		walk_info.walk_path = path
	end

	local pos1 = string.find(path, "%[")

	if(pos1 == nil) then
		if(path[1] == ";") then path = path:sub(2) end
		Execute(path)
		Execute("set walk ok")
	else
		local pos2 = string.find(path, "%]")
		if(pos2 == nil) then
			print("����: "..path.."��ʽ������")
			fail()
		else
			if(pos1 > 1) then
				Execute(path:sub(0,pos1-1))
			end

			local tt = utils.split(path:sub(pos1+1, pos2-1), ":")
			msg.subscribe("msg_handler_ok",
			function()
				Execute("halt")
				walk.run(path:sub(pos2+1))
			end)
			msg.subscribe("msg_hanlder_fail", fail)
			EnableTriggerGroup("walk_special", true)
			handlers[tt[1]](unpack(tt,2))
		end
	end
end


function fail()
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	msg.broadcast("msg_walk_fail")
end

function done()
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	msg.broadcast("msg_walk_ok")
end


function findpath(regionName, roomName)
	local match = {}
	local region = regions[regionName]
	local prevRoom = nil
	local path = nil

	for i, v in ipairs(region.rooms) do
		if(v.name == roomName and v.attr ~= "danger") then
			if(prevRoom ==  nil) then
				path = v.path
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
	coroutine.resume(walk_info.thread)
end

function stop()
	walk_info.stop = true
	coroutine.resume(walk_info.thread)
end

function sl(regionName, roomName)
	local path = findpath(regionName, roomName)
	walk_info.path = path
	walk_info.pos = 1
	walk_info.stop = false

	step_by_step(walk_info.path)
end


function step_by_step(path)

	msg.subscribe("msg_walk_ok", continue)
	walk_info.stop = false
	local f = coroutine.wrap(function()
		walk_info.thread = coroutine.running()

		for i, v in ipairs(path) do
			run(v.path)
			coroutine.yield()
			walk_info.currentId = v.to
			print("��ǰ����: "..walk_info.currentId)
			if(walk_info.stop) then
				break
			--else
			--	print("step")
			end
		end

		msg.broadcast("msg_slowwalk_ok")
	end)
	-- call wrap
	f()
end

--[[
function todir(dir)
	if(walk_info.pos > #walk_info.path) then print("������, pos > path.length") fail() end

	local currentRoom = roomAll[walk_info.path[walk_info.pos].to]
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
	walk_info.currentId = id
end


function walkaround(dp)
	local room = roomAll[walk_info.currentId]
	local tbl, walked = {}, {}
	local walk_deepth = tonumber(dp)
	--if(var.walk_deepth ~= nil) then walk_deepth = tonumber(var.walk_deepth) end

	findexit = function(room, from, deepth)

		if(deepth == walk_deepth) then
			return
		else
			for i, v in pairs(room.links) do
				if(not walked[v.to] and v.attr ~= "danger") then
					table.insert(tbl, {["from"]=room.id, ["to"]=v.to, ["path"]=i})
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
	tprint(walk_info)
end
