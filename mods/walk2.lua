require "wait"
require "tprint"
require "var"

module ("walk2", package.seeall)

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
directions["enter"] = "����"
directions["out"] = "����"

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
		if(c.stop) then print("run stop") run_stop() return end
		
		local p = c.iter()
		--ִ�е��������"set run ok"----------
		if(p == nil) then
			Execute("set run ok")
			--print("run ok")
			--���������f_ok------------------
			--run_ok()
		else -- ������һ������----------------
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
	
	-- �� !�����������������һ������-------
	if(cmd:sub(1,1) ~= "!") then
		if(cmd ~= "") then Execute(cmd) end
		call(f_ok)
	else
		-- aw:3:flatter ��������
		print("special cmd: " .. cmd:sub(2))
		run_special(cmd:sub(2), f_ok, f_fail, f_stop)
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
		c.stop = false
		c.block = false
	end,
	
	run = function()
		EnableTriggerGroup("walk_special", true)
		local c = handlers.cxt
		
		c.stop = false
		c.block = false
		--aw:3:flatter ��������:nw
		--��һ��������������һ����·��-------
		local func = handlers[c.cmd[1]]
		local cmd = c.cmd[#c.cmd]
		
		if(func == nil) then print("û�ж�Ӧ��handler��" .. c.cmd[1]) handlers.fail() else func(unpack(c.cmd, 2, #c.cmd-1)) end
	end,
	
	stop = function()
		local c = handlers.cxt
		c.stop = true
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
		local c = handlers.cxt
		--EnableTriggerGroup("walk_special", false)
		if(c.stop) then print("run special stop") call(c.f_stop)
		else
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
		
		if(var.walk_blocker_id == nil) then print("û��blocker id") handlers.fail() return end
		Execute("kill " .. var.walk_blocker_id)
	end,
	
	["gw"] = function()
		local c = handlers.cxt
		
		wait.make(function()
			Execute("e")
			local l, w = wait.regexp("^(> )*(�������ᶳ����׳���Ӳȱ�������)|(�������Ա����۵����㿴�����滯�������ǳ˴��ɣ�)$")
			if(l and string.match(l, "�������ᶳ����׳���Ӳȱ�������")) then
				Execute("e")
				call(c.f_ok)
			else
				Execute("give 1 gold to chuan fu")
				l, w = wait.regexp("^(> )*(���ܿ�ͣ���˰�����̧�ſ��������)|(������û������������)|(����û������ˡ�)$")
				if(l and string.match(l, "���ܿ�ͣ���˰�")) then
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
		print(var.walk_blocker_name .. "����")
		handlers.unblock()
		
		if(var.walk_blocker_name == "��Ա��") then
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
	
	-- path �϶�����Ϊ����-------------------------------
	assert(p ~= nil)
	
	c.walk_next = function()
		if(c.stop) then walk_stop() return end
		
		local p = c.iter()
		--ִ�е��������"set run ok"----------
		if(p == nil) then
			--Execute("set slowwalk ok")
			--print("run ok")
			--���������f_ok------------------
			walk_ok()
		else -- ������һ������----------------
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