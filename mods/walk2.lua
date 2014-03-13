require "wait"
require "tprint"
require "var"

module ("walk", package.seeall)

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
mappings["������"] = "����"
mappings["������"] = "ȫ���"
mappings["�ƺӵ���"] = "���׵���"
mappings["������"] = "����"


local blocker_npcs = {}

blocker_npcs["����"] = {id = "ya yi"}
blocker_npcs["�α�"] = {id = "song bing"}
blocker_npcs["�ױ�"] = {id = "qin bing"}
blocker_npcs["һƷ����ʿ"] = {id = "wu shi"}
blocker_npcs["��ʿ"] = {id = "wei shi"}
blocker_npcs["��Ա��"] = {id = "cui yuanwai"}
blocker_npcs["Уξ"] = {id = "xiao wei"}
blocker_npcs["�ٱ�"] = {id = "bing"}
blocker_npcs["����ʤ"] = {id = "jiang baisheng"}
blocker_npcs["Ů�ܼ�"] = {id = "guan jia"}
blocker_npcs["����"] = {id = "men wei"}
blocker_npcs["��åͷ"] = {id = "tou"}
blocker_npcs["Ѿ��"] = {id = "ya huan"}
blocker_npcs["������ʿ"] = {id = "wei shi"}
blocker_npcs["������ʿ"] = {id = "wei shi"}
blocker_npcs["ɽ��ͷ"] = {id = "tou"}
blocker_npcs["����ʦ̫"] = {id = "jingxin shitai"}
blocker_npcs["ժ����"] = {id = "zhaixing zi"}
blocker_npcs["������"] = {id = "chuchen zi"}
blocker_npcs["�ɻ���"] = {id = "caihua zi"}
blocker_npcs["�ܼ�"] = {id = "guan jia"}
blocker_npcs["�Ҷ�"] = {id = "jia ding"}
blocker_npcs["�߸���"] = {id = "gao genming"}
blocker_npcs["ʩ����"] = {id = "shi daizi"}
blocker_npcs["�ʹ���ʿ"] = {id = "wei shi"}
blocker_npcs["����"] = {id = "mang she"}
blocker_npcs["����"] = {id = "a bi"}
blocker_npcs["����Ů��"] = {id = "nv lang", pfm = true}
blocker_npcs["����Ϫ"] = {id = "zhang songxi", pfm = true}
blocker_npcs["Ī����"] = {id = "mo shenggu", pfm = true}
blocker_npcs["��ھ���"] = {id = "ju man"}
blocker_npcs["�޸�����"] = {id = "wugen daozhang", pfm = true}
blocker_npcs["���³���"] = {id = "mayi zhanglao"}
blocker_npcs["��ľ���"] = {id = "samu huofo", pfm = true}
blocker_npcs["��ľ���"] = {id = "jiamu huofo", pfm = true}
blocker_npcs["������"] = {id = "xi huazi"}
blocker_npcs["����"] = {id = "di zi"}
blocker_npcs["��"] = {id = "zhu jian"}
blocker_npcs["�ս�"] = {id = "ju jian"}
blocker_npcs["л�̿�"] = {id = "xie yanke", pfm = true}
---------------------------------------------------------- ��������-------------------------------------------------------------------

local run_cxt = {}

-----�����ʽ��Ϊ
----- path : e;s;|!aw:3:flatter ��������:nw|e;e;e;e;e;e
----- ��ס���һ��|��ǰһ��Ӧ����Ϊ·��
function run(path, f_ok, f_fail, f_stop)
	
	print("ִ��·��: " .. path)
	
	EnableTriggerGroup("walk", true)
	
	run_cxt = {}
	
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
	if(p == nil) then print("path Ϊ��") run_end(f_fail) return end	--run_fail() return end
	
	c.run_fail = function() run_end(f_fail) end
	c.run_stop = function() run_end(f_stop) end
	c.run_ok = function() run_end(f_ok) end
	
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

function run_end(f)
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	call(f)
end


function run_ok()
	local c = run_cxt
	call(c.run_ok)
end

function run_fail()
	local c = run_cxt
	call(c.run_fail)
end

function run_stop()
	local c = run_cxt
	call(c.run_stop)
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
		handlers.cxt = {}
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
			repeat
				wait.time(1)
				Execute("suicide")
				local l, w = wait.regexp("^(> )*(����æ���أ�û����ɱ��)|(���� suicide -f ȷ����ɱ��)$")
			until(l:match("ȷ����ɱ") ~= nil)
		
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
	
	done2 = function()
		local c = handlers.cxt
		if(c.k_blocker == true) then return end
		
		wait.make(function()
			local cmd = c.cmd[#c.cmd]
			Execute(cmd .. ";set run_special_handle ok")
			local l, w = wait.regexp("^(> )*�趨����������run_special_handle = \"ok\"$")
			if(not c.block) then 
				print("k1 no blocker") 
				EnableTriggerGroup("walk_special", false)
				call(c.f_ok)
			end
		end)
	end,
	
	["aw"] = function(interval, action)
		wait.make(function()
			print(action)
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
	
	["k1"] = function(name)
		handlers.done2()
	--[[
		local c = handlers.cxt
		if(c.k_blocker == true) then return end
		
		wait.make(function()
			local cmd = c.cmd[#c.cmd]
			Execute(cmd .. ";set run_special_handle ok")
			local l, w = wait.regexp("^(> )*�趨����������run_special_handle = \"ok\"$")
			if(not c.block) then 
				print("k1 no blocker") 
				EnableTriggerGroup("walk_special", false)
				call(c.f_ok)
			end
		end)]]--
		--[[
		local c = handlers.cxt
		local cmd = c.cmd[#c.cmd]
		Execute(cmd .. ";set walk_special_handle ok")
		]]--
	end,
	
	["ylj"] = function()
		if(var.room_lz_ylj == "true") then
			me.profile.powerup()
			handlers.done()
		else
			handlers.fail()
		end
	end,
	
	k_blocker = function()--line, name, wildcards)
		local c = handlers.cxt
		c.k_blocker = true
		
		handlers.block()
		--�Ƶ�trigger����
		--var.walk_blocker_name = wildcards[2]
		local bl = blocker_npcs[var.walk_blocker_name]
		if(bl == nil) then print("û��blocker id") handlers.fail() return end
		
		var.walk_blocker_id = blocker_npcs[var.walk_blocker_name].id
		print("blocker: " .. var.walk_blocker_name .. " " .. var.walk_blocker_id)
		
		if(bl.pfm == true) then handlers.startFight() else Execute("kill " .. var.walk_blocker_id) end
	end,
	
	k_blocker2 = function()
		local c = handlers.cxt
		c.k_blocker = true
		
		handlers.block()
		--�Ƶ�trigger����
		--var.walk_blocker_name = wildcards[2]
		var.walk_blocker_id = blocker_npcs[var.walk_blocker_name]
		
		print("blocker: " .. var.walk_blocker_name .. " " .. var.walk_blocker_id)
		
		if(var.walk_blocker_id == nil) then print("û��blocker id") handlers.fail() return end
		handlers.startFight()
	end,
	
	startFight = function()
		local busy_list = me.profile.busy_list
		local attack_list = me.profile.attack_list1
		fight.prepare(busy_list, attack_list)
		
		fight.start("kill " .. var.walk_blocker_id)
	end,
	
	blocker_dead = function(line, name, wildcards)
		local c = handlers.cxt
		c.k_blocker = false
		
		print(var.walk_blocker_name .. "����")
		handlers.unblock()
		
		if(var.walk_blocker_name == "��Ա��") then
			Execute("get yaoshi from corpse")
		end
		
		--busy_test(function() print("����handlers.done") handlers.done() end)
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
	end,
	
	["punk"] = function()
		Execute("sw;se;se;s;s;w;nw;ask punk about ��С��;se;e;n;n;nw;nw;ne")
		handlers.done()
	end,
	
	["thmz"] = function(dir)
		wait.make(function()
			repeat
				Execute(dir)
				local l, w = wait.regexp("^(> )*(���߳����һ�����)|(ͻȻһ���һ��������㼲���㣡)$")
				wait.time(2)
			until(l:match("���߳���"))
			handlers.done()
		end)
	end,
	
	["hotelu"] = function()
		handlers.done2()
	end,
	
	["hoteld"] = function()
		handlers.done()
	end,
	
	enter_hotel = function()
		handlers.block()
		wait.make(function()
			Execute("give 50 silver to xiao er")
			local l, w = wait.regexp("^(> )*(���ó�.*����С����)|(��û����ô��İ�����)$")
			if(l:match("��û����ô��")) then handlers.fail() else handlers.done() end
			handlers.unblock()
		end)
	end,
	
	leave_hotel = function()
		Execute("u;enter;out;d")
		handlers.done()
	end,
	
	["hsbreak"] = function()
		if(var.me_xunzhang == "true") then
			Execute("wear xunzhang;unwield all;wield jian;break wall")
			handlers.done()
		else
			handlers.fail()
		end
	end,
	
	["mmdd"] = function()
		if(var.me_xunzhang == "true") then
			wait.make(function()
				Execute("wear xunzhang;ask su about ���ܵص�")
				local l, w = wait.regexp("^(> )*(����û�������)|(���Ǻ�˵������Ҫ֪���ܵ��͵ü�����ң��)|(���ǺӰ����͵�ʯ�ҵ��ſ�).*$")
				if(l:match("���ǺӰ����͵�ʯ�ҵ��ſ�") == nil) then handlers.fail() else handlers.done() end
			end)
		else
			handlers.fail()
		end
	end,
	
	["gcdt"] = function()
		wait.make(function()
			Execute("look gaochang ditu")
			local l, w = wait.regexp("^(> )*(����һ�Ÿ߲��Թ���ͼ)|(��Ҫ��ʲô).*$")
			if(l:match("��Ҫ��ʲô")) then handlers.fail() else handlers.done() end
		end)
	end,
	
	["cao"] = function()
		wait.make(function()
			repeat
				Execute("take cao")
				local l, w = wait.regexp("^(> )*(���������ˤ������)|(��������ǰվ��).*$")
			until(l:match("���������ˤ������"))
			handlers.done()
		end)
	end,
	
	["press"] = function()
		Execute("press " .. var.fz_coin)
		handlers.done()
	end
}

-------------------------------------------------------------------------------------------------------------------------------
----------------------slow walk------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
local walk_cxt = {}


function getRegion(name)
	local matched = {}
	local re = rex.new("^" .. name .. "[0-9]{0,1}$")
	local re2
	
	if(mappings[name] ~= nil) then re2 = rex.new("^" .. mappings[name] .. "[0-9]{0,1}$") end
	
	for i, v in pairs(regions) do
		local a, b, t = re:match(i)
		if(t ~= nil) then table.insert(matched, v) 
		elseif(re2 ~= nil) then
			a, b, t = re2:match(i)
			if(t ~= nil) then table.insert(matched, v) end
		end			
	end
	
	return matched
	
	--local region = regions[name]
	--if(region == nil) then
	--	return regions[mappings[name]]
	--else
	--	return region
	--end
end

function findpath(regionName, roomName)
	local match = {}
	local regions = getRegion(regionName)
	local prevRoom = nil
	local path = nil

	if(regions == {}) then return end
	
	for j = 1, #regions do
		local region = regions[j]
		
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
	end

	return match
end


function sl(regionName, roomName, f_ok, f_fail, f_stop)
	local path = findpath(regionName, roomName)
	--[[
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
	]]--
	step_by_step(path, f_ok, f_fail, f_stop)
end

function step_by_step(path, f_ok, f_fail, f_stop)
	
	walk_cxt = {}
	local c = walk_cxt
	c.stop = false
	c.fail = false
	c.abort = false
	
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
	
	c.walk_fail = function() walk_end(f_fail) end
	c.walk_stop = function() walk_end(f_stop) end
	c.walk_ok = function() walk_end(f_ok) end
	
	c.walk_next = function()
		if(c.fail) then walk_fail() return end
		
		print("��ǰ����: " .. roomId)
		walk_cxt.currentId = roomId
		
		if(c.abort) then return end
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
--[[
	msg.subscribe("msg_run_ok", f_ok)
	msg.subscribe("msg_run_stop", f_stop)
	msg.subscribe("msg_run_fail", f_fail)
]]--
	run(cmd, f_ok, f_fail, f_stop)
end


function stop()
	local w, r = walk_cxt, run_cxt
	w.stop = true
	r.stop = true
	
	--msg.subscribe("msg_slowwalk_stop", function() call(f_stop) end)
end

function fail()
	local w, r = walk_cxt, run_cxt
	w.fail = true
	r.fail = true
end

function abort()
	local w = walk_cxt
	w.abort = true
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

function walk_end(f)
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	call(f)
end

function walk_fail()
	print("slow walk fail")
	local c = walk_cxt
	call(c.walk_fail)
--[[
	stop()
	print("slow walk fail")
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	msg.broadcast("msg_slowwalk_fail")
]]--
end

function walk_stop()
	print("slow walk stop")
	local c = walk_cxt
	call(c.walk_stop)
	--[[
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	msg.broadcast("msg_slowwalk_stop")
	]]--
end

function walk_ok()
	print("slow walk end")
	local c = walk_cxt
	call(c.walk_ok)
	--[[
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	msg.broadcast("msg_slowwalk_ok")
	]]--
end

function walkaround(dp, dir, f_ok, f_fail, f_stop)

	local room = roomAll[walk_cxt.currentId]
	local tbl, walked = {}, {}
	local walk_deepth = tonumber(dp)
	
	if(room ==  nil) then return end
	
	--if(dir ~= nil) then dir = dir:gsub("��","") end 
	--if(var.walk_deepth ~= nil) then walk_deepth = tonumber(var.walk_deepth) end
	
	--����һ����������-------------------------------------------------------------------
	local enqueue, findexit
	
	enqueue = function(d, v, room, deepth)
		local p = d
		if(v.con ~= nil and v.con ~= "") then p = "|!" .. v.con .. ":" .. d .. "|" end
		table.insert(tbl, {["from"]=room.id, ["to"]=v.to, ["path"]=p})
		
		walked[v.to] = true
		--deepth = deepth + 1
		findexit(roomAll[v.to], room.id, deepth+1)
		local stepback = find_path(roomAll, v.to, room.id)
		if(stepback) then
			local path = table.concat(stepback, ";")
			table.insert(tbl, {["from"]=v.to, ["to"]=room.id, ["path"]=path})
		else
			table.insert(tbl, {["from"]=v.to, ["to"]=room.id, ["path"]="set brief;" .. roomAll[room.id].path})
		end
	end
	
	findexit = function(room, from, deepth)
		--�ߵ�ͷ��
		if(deepth == walk_deepth) then return end
		
		-------------------�����ҷ���dir�ķ����·��------------------------------------------------------
		if(deepth == 1 and dir ~= nil) then
			for i, v in pairs(room.links) do
				if(not walked[v.to] and roomAll[v.to].attr ~= "danger" and v.block ~= "y" and directions[i] == dir) then
					enqueue(i, v, room, deepth)
				end
			end
		end
		------------------��ʣ�µĻ�û�����ķ���-----------------------------------------------------------
		for i, v in pairs(room.links) do
			--tprint(room.links)
			--if(v.attr ~= "" and v.attr ~= nil) then print("attr: " .. v.attr) else print("attr null") end
			if(not walked[v.to] and roomAll[v.to].attr ~= "danger" and v.block ~= "y") then
				enqueue(i, v, room, deepth)
			end
		end
	end

	--tprint(walked)
	walked[room.id] = true
	findexit(room, room.id, 1)
	--tprint(tbl)

	step_by_step(tbl, f_ok, f_fail, f_stop)
end