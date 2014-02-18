require "wait"
require "tprint"
require "var"

module ("walk", package.seeall)

local walk_cxt = {}

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
directions["enter"] = "��"
directions["out"] = "��"
directions["d"] = "��"
directions["u"] = "��"

local mappings = {}

mappings["�����"] = "����"
mappings["����ɽ"] = "��üɽ"
mappings["���ɽ"] = "���"
mappings["�Ͻ���"] = "�����Ͻ���"


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
blocker_npcs["����"] = "ya huan"
blocker_npcs["������ʿ"] = "wei shi"
blocker_npcs["������ʿ"] = "wei shi"
blocker_npcs["ɽ��ͷ"] = "shanzei tou"
blocker_npcs["����ʦ̫"] = "jingxin shitai"
blocker_npcs["ժ����"] = "zhaixing zi"
blocker_npcs["������"] = "chuchen zi"
blocker_npcs["�ɻ���"] = "caihua zi"
blocker_npcs["�ܼ�"] = "guan jia"
blocker_npcs["�Ҷ�"] = "jia ding"
blocker_npcs["�߸���"] = "gao genming"

---------------------------------------------------------- ��������-------------------------------------------------------------------

local run_cxt = {}

-----�����ʽ��Ϊ
----- path : e;s;|!aw:3:flatter ��������:nw|e;e;e;e;e;e
----- ��ס���һ��|��ǰһ��Ӧ����Ϊ·��
function run(path)

	print("ִ��·��: " .. path)
	
	EnableTriggerGroup("walk", true)
	
	local tbl = utils.split(path, "|")
	local c = run_cxt
	
	c.stop = false
	c.fail = false
	
	--iterator---------------------------------
	local iterator = function(tbl)
		local i, n = 0, #tbl
		return function() i = i + 1 if(i <= n) then return tbl[i] end end
	end
	
	c.iter = iterator(tbl)
	local p = c.iter()
	
	-- path Ϊ��-------------------------------
	if(p == nil) then print("path Ϊ��") run_fail() return end
	
	c.run_next = function()
		if(c.fail) then print("run fail") run_fail() return end
		if(c.stop) then print("run stop") run_stop() return end
		
		local p = c.iter()
		--ִ�е��������"set run ok"----------
		if(p == nil) then
			Execute("set run ok")
			--��trigger�����run_ok------------------
			--run_ok()
		else -- ������һ������----------------
			run_cmd(p, c.run_next, run_fail, run_stop)
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
	msg.broadcast("msg_run_stop")
end


function run_cmd(cmd, f_ok, f_fail, f_stop)
	--if(walk_cxt.run_stop) then return end
	
	-- �� !�����������������һ������-------
	if(cmd == "") then 
		call(f_ok)
	else
		local c = cmd:sub(1,1)
		if(c == ";") then cmd = cmd:sub(2) end
		if(c ~= "!") then 
			Execute(cmd) 
			call(f_ok)
		else
			-- aw:3:flatter ��������
			print("special cmd: " .. cmd:sub(2))
			run_special(cmd:sub(2), f_ok, f_fail, f_stop)
		end
	end
end

--ִ������������� aw:3:flatter ��������:nw--
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
		--ֱ��check run_cxt.stop�� --------------
		--c.stop = false
		c.block = false
	end,
	
	run = function()
		EnableTriggerGroup("walk_special", true)
		local c = handlers.cxt
		--ֱ��check run_cxt.stop�� --------------
		--c.stop = false
		c.block = false
		--aw:3:flatter ��������:nw
		--��һ��������������һ����·��-------
		local func = handlers[c.cmd[1]]
		local cmd = c.cmd[#c.cmd]
		
		if(func == nil) then print("û�ж�Ӧ��handler��" .. c.cmd[1]) handlers.fail() else func(unpack(c.cmd, 2, #c.cmd-1)) end
	end,
		
	----������·��npcʱ���� ---------------------
	block = function()
		local c = handlers.cxt
		c.block = true
	end,
	
	unblock = function()
		local c = handlers.cxt
		c.block = false
	end,
	
	done = function()
		local c, r = handlers.cxt, run_cxt
		--EnableTriggerGroup("walk_special", false)
		if(r.fail) then handlers.fail() return end
		if(r.stop) then handlers.stop() return end
		
		wait.make(function()
			local cmd = c.cmd[#c.cmd]
			Execute(cmd .. ";set run_special_handle ok")
			local l, w = wait.regexp("^(> )*�趨����������run_special_handle = \"ok\"$")
			if(not c.block) then 
				print("no blocker") 
				EnableTriggerGroup("walk_special", false)
				call(c.f_ok)
			else 
				handlers.run() 
			end
		end)
	end,
	
	stop = function()
		print("special handle stop")
		EnableTriggerGroup("walk_special", false)
		local c = handlers.cxt
		call(c.f_stop)
	end,
	
	fail = function()
		print("special handle fail")
		EnableTriggerGroup("walk_special", false)
		local c = handlers.cxt
		call(c.f_fail)
	end,
	
	["aw"] = function(interval, action)
		wait.make(function()
			Execute(action)
			if(interval ~= nil and tonumber(interval) > 0) then wait.time(tonumber(interval)) end
			handlers.done()
		end)
	end,
	
	------ a:yell boat-------------------------------------------------
	["a"] = function(action)
		Execute(action)
		--tri�����handlers.done()
		--handlers.done()
	end,
	
	["k1"] = function()
		local c = handlers.cxt
		local cmd = c.cmd[#c.cmd]
		Execute(cmd .. ";set walk_special_handle ok")
	end,
	
	k_blocker = function(line, name, wildcards)
		handlers.block()
		var.walk_blocker_name = wildcards[2]
		var.walk_blocker_id = blocker_npcs[var.walk_blocker_name]
		
		print("blocker: " .. var.walk_blocker_name .. " " .. var.walk_blocker_id)
		
		if(var.walk_blocker_id == nil) then print("û��blocker id") handlers.fail() return end
		Execute("kill " .. var.walk_blocker_id)
	end,
	
	blocker_dead = function(line, name, wildcards)
		print(var.walk_blocker_name .. "����")
		handlers.unblock()
		
		if(var.walk_blocker_name == "��Ա��") then
			Execute("get yaoshi from corpse")
		end
		
		handlers.done()
	end,
	
	["gw"] = function()
		local c = handlers.cxt
		
		wait.make(function()
			Execute("e")
			local l, w = wait.regexp("^(> )*(�������ᶳ����׳���Ӳȱ�������)|(�������Ա����۵����㿴�����滯�������ǳ˴��ɣ�)$")
			if(l and string.match(l, "�������ᶳ����׳���Ӳȱ�������")) then
				Execute("e")
				handlers.done()
			else
				Execute("give 1 gold to chuan fu")
				l, w = wait.regexp("^(> )*(���ܿ�ͣ���˰�����̧�ſ��������)|(������û������������)|(����û������ˡ�)$")
				if(l and string.match(l, "���ܿ�ͣ���˰�")) then
					handlers.done()
				else
					handlers.fail()
				end
			end
		end)
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
	
	step_by_step(path)
end

function step_by_step(path)
	local c = walk_cxt
	c.stop = false
	c.fail = false
	
	if(path == nil or #path == 0) then walk_fail() return end
	
	--iterator---------------------------------
	local iterator = function(tbl)
		local i, n = 0, #tbl
		return function() i = i + 1 if(i <= n) then return tbl[i] end end
	end
	
	c.iter = iterator(path)
	local p = c.iter()
	local roomId = p.to
	
	--Ӧ�ÿ϶�����Ϊ����----------------------
	assert(p ~= nil)
	
	c.walk_next = function()
		if(c.fail) then walk_fail() return end
		
		print("��ǰ����: " .. roomId)
		walk_cxt.currentId = roomId
		
		if(c.stop) then walk_stop() return end
		
		p = c.iter()
		--ִ�е��������"set run ok"----------
		if(p == nil) then
			--Execute("set slowwalk ok")
			--print("run ok")
			--���������f_ok------------------
			walk_ok()
		else -- ������һ������----------------
			roomId = p.to
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

function fail()
	local w, r = walk_cxt, run_cxt
	w.fail = true
	r.fail = true
end

--��ʱ����Ҫresume��----------------------------------------------------------------
--����Ҫ��run��handle�����һ�����������handle��ʱ��stop�ˣ���Ҫ��handle resume----
function resume()
	local w, r = walk_cxt, run_cxt
	w.stop = false
	w.fail = false
	r.stop = false
	r.fail = false
	
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




function walkaround(dp, dir)
	
	local room = roomAll[walk_cxt.currentId]
	local tbl, walked = {}, {}
	local walk_deepth = tonumber(dp)
	
	--if(dir ~= nil) then dir = dir:gsub("��","") end 
	--if(var.walk_deepth ~= nil) then walk_deepth = tonumber(var.walk_deepth) end
	
	--����һ����������-------------------------------------------------------------------
	local enqueue, findexit
	
	enqueue = function(d, v, room, deepth)
		local p = d
		if(v.con ~= nil and v.con ~= "") then p = "|!" .. v.con .. ":" .. d .. "|" end
		print("1", v.to, room.id, p)
		table.insert(tbl, {["from"]=room.id, ["to"]=v.to, ["path"]=p})
		
		walked[v.to] = true
		--deepth = deepth + 1
		findexit(roomAll[v.to], room.id, deepth+1)
		local stepback = find_path(roomAll, v.to, room.id)
		if(stepback) then
			local path = table.concat(stepback, ";")
			print("2", v.to, room.id, path)
			table.insert(tbl, {["from"]=v.to, ["to"]=room.id, ["path"]=path})
		else
			table.insert(tbl, {["from"]=v.to, ["to"]=room.id, ["path"]=roomAll[room.id].path})
		end
	end
	
	findexit = function(room, from, deepth)
		--�ߵ�ͷ��
		if(deepth == walk_deepth) then return end
		
		-------------------�����ҷ���dir�ķ����·��------------------------------------------------------
		if(deepth == 1 and dir ~= nil) then
			for i, v in pairs(room.links) do
				if(not walked[v.to] and v.attr ~= "danger" and v.block ~= "y" and directions[i] == dir) then
					enqueue(i, v, room, deepth)
				end
			end
		end
		------------------��ʣ�µĻ�û�����ķ���-----------------------------------------------------------
		for i, v in pairs(room.links) do
			if(not walked[v.to] and v.attr ~= "danger" and v.block ~= "y") then
				enqueue(i, v, room, deepth)
			end
		end
	end

	--tprint(walked)
	walked[room.id] = true
	findexit(room, room.id, 1)
	tprint(tbl)

	step_by_step(tbl)
end