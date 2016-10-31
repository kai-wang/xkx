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
blocker_npcs["�佫"] = {id = "jiang"}
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
blocker_npcs["������"] = {id = "chuchen zi", pfm = true}
blocker_npcs["�ɻ���"] = {id = "caihua zi"}
blocker_npcs["�ܼ�"] = {id = "guan jia"}
blocker_npcs["�Ҷ�"] = {id = "jia ding"}
blocker_npcs["�߸���"] = {id = "gao genming"}
blocker_npcs["ʩ����"] = {id = "shi daizi"}
blocker_npcs["�ʹ���ʿ"] = {id = "wei shi"}
blocker_npcs["����"] = {id = "mang she"}
blocker_npcs["����"] = {id = "a bi"}
blocker_npcs["����Ů��"] = {id = "nv lang", pfm = true}
blocker_npcs["����Ϫ"] = {id = "zhang songxi", pfm = true, exp=3000000}
blocker_npcs["Ī����"] = {id = "mo shenggu", pfm = true, exp=3000000}
blocker_npcs["��ھ���"] = {id = "ju man"}
blocker_npcs["�޸�����"] = {id = "wugen daozhang", pfm = true}
blocker_npcs["���³���"] = {id = "mayi zhanglao"}
blocker_npcs["��ľ���"] = {id = "samu huofo", pfm = true}
blocker_npcs["��ľ���"] = {id = "jiamu huofo", pfm = true}
blocker_npcs["������"] = {id = "xi huazi"}
blocker_npcs["½����"] = {id = "lu dayou"}
blocker_npcs["����"] = {id = "di zi"}
blocker_npcs["��"] = {id = "zhu jian"}
blocker_npcs["�ս�"] = {id = "ju jian"}
blocker_npcs["л�̿�"] = {id = "xie yanke", pfm = true}
blocker_npcs["����"] = {id = "bayi"}
blocker_npcs["����ʦ̫"] = {id = "dingyi shitai", pfm = true, exp=5000000}
blocker_npcs["�𴦻�"] = {id = "qiu chuji", pfm = true, exp=5000000}
blocker_npcs["������"] = {id = "liu chuxuan", pfm = true, exp=3000000}
blocker_npcs["ʯɩ"] = {id = "shi sao"}
blocker_npcs["��ʿ"] = {id = "jushi", pfm = true, exp=10000000, dadizi=true}
blocker_npcs["��ү"] = {id = "houye", pfm = true, exp=10000000, dadizi=true}

-- lht npcs -------------------------------------------------
blocker_npcs["������"] = {id = "an jiangang", pfm = false}
blocker_npcs["�Ͻ���"] = {id = "meng jianxiong", pfm = false}
blocker_npcs["���"] = {id = "zhou yi", pfm = false}
blocker_npcs["����"] = {id = "xin yan", pfm = false}
blocker_npcs["���ĸ�"] = {id = "jiang sigen", pfm = false}
blocker_npcs["ʯ˫Ӣ"] = {id = "shi shuangying", pfm = false}
blocker_npcs["������"] = {id = "wei chunhua", pfm = false}
blocker_npcs["���Э"] = {id = "yang chengxie", pfm = false}
blocker_npcs["�����"] = {id = "xu tianhong", pfm = false}
blocker_npcs["����־"] = {id = "chang bozhi", pfm = true}
blocker_npcs["����־"] = {id = "chang hezhi", pfm = true}
blocker_npcs["�԰�ɽ"] = {id = "zhao banshan", pfm = true}
blocker_npcs["����Ӣ"] = {id = "zhou zhongying", pfm = true}
blocker_npcs["½����"] = {id = "lu feiqing", pfm = true}
blocker_npcs["�޳�����"] = {id = "wuchen daozhang", pfm = true}

---------------------------------------------------------- ��������-------------------------------------------------------------------

local run_cxt = {}

-----�����ʽ��Ϊ
----- path : e;s;|!aw:3:flatter ��������:nw|e;e;e;e;e;e
----- ��ס���һ��|��ǰһ��Ӧ����Ϊ·��
function run(path, f_ok, f_fail, f_stop)
	
	print("ִ��·��: " .. path)
	
	EnableTriggerGroup("walk", true)
	
	run_cxt.stop = false
	run_cxt.fail = false
	run_cxt.abort = false
	
	run_cxt.run_ok = f_ok
	run_cxt.run_fail = f_fail
	run_cxt.run_stop = f_stop
	
	local tbl, i, run_next, iterator = utils.split(path, "|"), 0, nil, nil
	
	run_next = function(cmd, f_ok, f_fail, f_stop)		
		-- �� !�����������������һ������-------
		if(cmd == "") then 
			call(f_ok)
		else
			local c = cmd:sub(1,1)
			if(c == ";") then cmd = cmd:sub(2) end
			if(c ~= "!") then 
				--print("cmd " .. cmd)
				local t = utils.split(cmd, ";")
				if(#t > 10 and var.fast_mode == "1") then
					wait.make(function()
						for i = 1, #t do
							if(run_cxt.abort) then return end
							Execute(t[i])
							wait.time(0.1)
						end
						call(f_ok)
					end)
				else
					Execute(cmd)
					call(f_ok)
				end
			else
				-- aw:3:flatter ��������
				print("special cmd: " .. cmd:sub(2))
				run_special(cmd:sub(2), f_ok, f_fail, f_stop)
			end
		end
	end
	
	iterator = function()
		return function()
			-- run next command
			if(run_cxt.fail) then print("run fail") end--call(run_cxt.run_fail) end
			if(run_cxt.stop) then print("run stop") end--call(run_cxt.run_stop) end
			
			i = i + 1
			if(i <= #tbl) then 
				run_next(tbl[i], iterator(), run_cxt.run_fail, run_cxt.run_stop)
			else
				Execute("set run ok")
			end
		end
	end
	
	call(iterator())
end

function run_ok()
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	call(run_cxt.run_ok)
end

function run_fail()
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	run_cxt.fail = true
	call(run_cxt.run_fail)
end

function run_stop()
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	run_cxt.stop = true
	call(run_cxt.run_stop)
end

function run_abort()
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	run_cxt.abort = true
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
		
		local cmd = c.cmd[#c.cmd]
		core.safehalt(function()
			Execute(cmd .. ";set run special")
			wait.make(function()
				local l, w = wait.regexp("^(> )*�趨����������run = \"special\"$")
				if(not c.block) then 
					print("no blocker") 
					EnableTriggerGroup("walk_special", false)
					EnableTriggerGroup("walk_special_boat", true)
					EnableTriggerGroup("walk_special_lht", false)
					EnableTriggerGroup("walk_special_dead", false)
					DeleteTemporaryTriggers()
					call(c.f_ok)
				else 
					handlers.run()
				end
			end)
		end, 
		1)
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
			Execute(cmd .. ";set run special")
			local l, w = wait.regexp("^(> )*�趨����������run = \"special\"$")
			if(not c.block) then 
				print("k1 no blocker") 
				EnableTriggerGroup("walk_special", false)
				EnableTriggerGroup("walk_special_boat", false)
				EnableTriggerGroup("walk_special_lht", false)
				EnableTriggerGroup("walk_special_dead", false)
				DeleteTemporaryTriggers()
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
	
	["yellboat"] = function()
		wait.make(function()
			EnableTriggerGroup("walk_special", false)
			wait.time(2)
			Execute("yell boat")
			EnableTriggerGroup("walk_special", true)
		end)
	end,
	
	["k1"] = function(name)
		EnableTriggerGroup("walk_special_dead", true)
		EnableTriggerGroup("walk_special", true)
		EnableTriggerGroup("walk_special_lht", false)
		handlers.done2()
	end,
	
	["lht"] = function(name)
		if(tonumber(var.hp_exp) < 5000000) then 
			handlers.fail()
		else
			EnableTriggerGroup("walk_special_lht", true)
			EnableTriggerGroup("walk_special_dead", true)
			EnableTriggerGroup("walk_special", false)
			handlers.done2()
		end
	end,
	
	["ylj"] = function()
		if(var.room_lz_ylj == "true") then
			config.powerup()
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
		if(bl == nil or (bl.exp ~= nil and tonumber(var.hp_exp) < bl.exp)) then 
			print("û��blocker id���߾��鲻��") 
			handlers.fail() 
			return 
		end
		
		var.walk_blocker_id = blocker_npcs[var.walk_blocker_name].id
		print("blocker: " .. var.walk_blocker_name .. " " .. var.walk_blocker_id)
		if(bl.dadizi == true) then var.walk_blocker_name = var.walk_dadizi_name end
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
		local busy_list = config.busy_list
		local attack_list = config.attack_list1
		fight.prepare(busy_list, attack_list)
		
		Execute("kill " .. var.walk_blocker_id)
		fight.start()
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
		wait.make(function()
			Execute("sw;se;se;s;s;w;nw;ask punk about ��С��")
			wait.time(2)
			Execute("se;e;n;n;nw;nw;ne")
			handlers.done()
		end)
	end,
	
	["thmz"] = function(dir)
		wait.make(function()
			local l, w
			repeat
				Execute(dir)
				l, w = wait.regexp("^(> )*(�����˰��죬�����߳����һ�����)|(ͻȻһ���һ��������㼲����).*$", 2)
				wait.time(2)
			until(l and l:match("�����߳����һ�����"))

			if(l:match("�����߳����һ�����")) then
				handlers.done()
			else
				handlers.fail()
			end
		end)
	end,
	
	["hotelu"] = function()
		handlers.done2()
	end,
	
	["hoteld"] = function(mode)
		print("mode: " .. mode)
		local c = handlers.cxt
		c.leave_mode = mode
		
		handlers.done2()
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
		local c = handlers.cxt
		print("mode---" .. c.leave_mode)
		handlers.block()
		wait.make(function()
			if(c.leave_mode == "2") then Execute("u;d;set run hotel_leave") else Execute("u;enter;out;d;set run hotel_leave") end
			local l, w = wait.regexp("^(> )*�趨����������run = \"hotel_leave\"")
			handlers.unblock()
			handlers.done()
		end)
	end,
	
	["hsbreak"] = function()
		if(var.me_xunzhang == "true") then
			Execute("wear xunzhang;unwield all;wield " .. var.weapon .. ";break wall;tuo xunzhang")
			handlers.done()
		else
			handlers.fail()
		end
	end,
	
	["mmdd"] = function()
		if(var.me_xunzhang == "true") then
			wait.make(function()
				Execute("wear xunzhang;ask su about ���ܵص�;tuo xunzhang")
				local l, w = wait.regexp("^(> )*(����û�������)|(���Ǻ�˵������Ҫ֪���ܵ��͵ü�����ң��)|(���ǺӰ����͵�ʯ�ҵ��ſ�).*$", 5)
				if(l and l:match("���ǺӰ����͵�ʯ�ҵ��ſ�") ~= nil) then handlers.done() else handlers.fail() end
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
				wait.time(0.2)
				Execute("take cao")
				local l, w = wait.regexp("^(> )*(���������ˤ������)|(��������ǰվ��).*$", 1)
			until(not l or l:match("���������ˤ������"))
			handlers.done()
		end)
	end,
	
	["press"] = function()
		Execute("press " .. var.fz_coin)
		handlers.done()
	end,
	
	["circle"] = function()
		wait.make(function()
			Execute("circle wan")
			local l, w = wait.regexp("^.*(�㽫������)|(�ܿ����ְ����ԭλ).*$")
			print(l)
			if(l:match("�����ԭλ") ~= nil) then Execute("circle wan") end
			handlers.done()
		end)
	end,
	
	["c"] = function(item)
		if(item == "sling") then
			if(var.me_family == "����") then handlers.done() return end
			get_sling(handlers.done, handlers.fail)
		elseif(item == "qling") then
			if(var.me_family == "ȫ��") then handlers.done() return end
			get_qling(handlers.done, handlers.fail)
		elseif(item == "shanpai") then
			get_shanpai(handlers.done, handlers.fail)
		elseif(item == "fire") then
			get_fire(handlers.done, handlers.fail)
		elseif(item == "hmling") then
			get_heimuling(handlers.done, handlers.fail)
		elseif(item == "ditu") then
			get_ditu(handlers.done, handlers.fail)
		elseif(item == "jiedao") then
			get_jiedao(handlers.done, handlers.fail)
		end
	end,
	
	["pushstone"] = function()
		wait.make(function()
			Execute("push stone")
			local l, w = wait.regexp("^(> )*(ˮ��һ��ӿ��)|(��Ѿ�ʯ�Ƶ�һ��).*$", 5)
			if(l == nil) then handlers.fail() return end
			if(l:match("ˮ��һ��ӿ��") ~= nil) then Execute("push stone") end
			handlers.done2()
		end)
	end,

	["mzdl"] = function()
		wait.make(function()
			Execute("fly mz;n;n;n;e;s;s;w;sw;e")
			local count, l, w = 0, nil, nil
			repeat
				Execute("halt;n")
				count = count + 1
				l, w = wait.regexp("^(> )*��ֻ����������ת������Ҳ��ʼ��������.*$", 2)
			until(l and l:match("��ֻ����������ת") or (count > 5))

			if(not l) then 
				handlers.fail()
			else
				l, w = wait.regexp("^(> )*�Ҷ��ǰ���һ��ץס�����˸���ʵ���ӽ��˼���.*$", 15)
				if(l) then handlers.done() else handlers.fail() end
			end
		end)
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
end

function findpath(regionName, roomName)
	local match = {}
	local regions = getRegion(regionName)
	--�ŵ�����ȥ��
	--local prevRoom = nil
	local path = nil

	if(regions == {}) then return end
	
	for j = 1, #regions do
		local region = regions[j]
		local prevRoom = nil
		for i, v in ipairs(region.rooms) do
			--if(v.name == roomName and v.attr ~= "danger") then
			if(v.name == roomName and (v.danger == nil or (var.walk_danger_level ~= nil and tonumber(var.walk_danger_level) >= v.danger))) then
				if(prevRoom == nil) then
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
	step_by_step(path, f_ok, f_fail, f_stop)
end

function step_by_step(tbl, f_ok, f_fail, f_stop)
	
	if(tbl == nil or #tbl == 0) then return call(f_fail) end
	
	walk_cxt.stop = false
	walk_cxt.fail = false
	walk_cxt.abort = false
	
	walk_cxt.walk_ok = f_ok
	walk_cxt.walk_fail = f_fail
	walk_cxt.walk_stop = f_stop
	
	local i, step, iterator = 0, nil, nil
	
	step = function(cmd, f_ok, f_fail, f_stop)
		--wait.make(function()
		--wait.time(0.3)
		if(var.fast_mode == "1") then
			timer.tickonce("action", 0.3, function() run(cmd, f_ok, f_fail, f_stop) end)
		else
			run(cmd, f_ok, f_fail, f_stop)
		end
		--end)
	end

	iterator = function()
		return function()
			if(walk_cxt.fail or walk_cxt.stop or walk_cxt.abort) then return end
			i = i + 1
			
			if(i <= #tbl) then
				walk_cxt.currentId = tbl[i].to
				print("��ǰ����: ".. walk_cxt.currentId)
				if(tbl[i].from ~= nil and roomAll[tbl[i].from].danger ~= nil) then tbl[i].path = "halt;" .. tbl[i].path end
				step(tbl[i].path, iterator(), walk_cxt.walk_fail, walk_cxt.walk_stop)
			else
				walk_ok()
			end
		end
	end

	call(iterator())
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
	print("slow walk fail")
	walk_cxt.fail = true
	run_fail()
end

function walk_stop()
	print("slow walk stop")
	walk_cxt.stop = true
	run_stop()
end

function stop()
	walk_stop()
end

function fail()
	walk_fail()
end

function abort()
	local w = walk_cxt
	walk_cxt.abort = true
	run_abort()
end

function stopped()
	local w = walk_cxt
	--tprint(w)
	if(w.stop == true) then return true else return false end
end

function walk_ok()
	print("slow walk end")
	-- add stop flag here --------
	walk_cxt.stop = true
	call(walk_cxt.walk_ok)
end

function walkaround(dp, dir, f_ok, f_fail, f_stop)

	local room = roomAll[walk_cxt.currentId]
	local tbl, walked = {}, {}
	local walk_deepth = tonumber(dp)
	
	if(room ==  nil) then print("�Ҳ�����ǰ���� : ", walk_cxt.currentId) call(f_fail) return end
	
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
			local path = stepback[1]
			if(#stepback > 1) then path = "set brief;" .. table.concat(stepback, ";", 1, #stepback - 1) .. ";unset brief;" .. stepback[#stepback] end
			--local path = table.concat(stepback, ";")
			table.insert(tbl, {["from"]=v.to, ["to"]=room.id, ["path"]=path})
		--else
			-- û��ֱ���Ļ�ȥ�ķ���
		--	table.insert(tbl, {["from"]=v.to, ["to"]=room.id, ["path"]="set brief;" .. roomAll[room.id].path .. ";unset brief;look"})
		end
	end
	
	findexit = function(room, from, deepth)
		--�ߵ�ͷ��
		if(deepth == walk_deepth) then return end
		
		-------------------�����ҷ���dir�ķ����·��------------------------------------------------------
		if(deepth == 1 and dir ~= nil) then
			for i, v in pairs(room.links) do
				--if(not walked[v.to] and roomAll[v.to].attr ~= "danger" and v.block ~= "y" and directions[i] == dir) then
				if(not walked[v.to] and v.block ~= "y" and directions[i] == dir and (roomAll[v.to].danger == nil or (var.walk_danger_level ~= nil and tonumber(var.walk_danger_level) >= roomAll[v.to].danger))) then
					enqueue(i, v, room, deepth)
				end
			end
		end
		------------------��ʣ�µĻ�û�����ķ���-----------------------------------------------------------
		for i, v in pairs(room.links) do
			--tprint(room.links)
			--if(v.attr ~= "" and v.attr ~= nil) then print("attr: " .. v.attr) else print("attr null") end
			--if(not walked[v.to] and roomAll[v.to].attr ~= "danger" and v.block ~= "y") then
			if(not walked[v.to] and v.block ~= "y" and (roomAll[v.to].danger == nil or (var.walk_danger_level ~= nil and tonumber(var.walk_danger_level) >= roomAll[v.to].danger))) then
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

to = function(room, f_done, f_fail, f_stop)
	if(tonumber(room) > #roomAll) then call(f_fail) end
	walk_cxt.currentId = tonumber(room)
	walk.run(roomAll[walk_cxt.currentId].path, f_done, f_fail, f_stop)
end

tonpc = function(name, f_done, f_fail, f_stop)
	local npc_list = dofile("worlds\\xkx\\mods\\npcs.lua")
	if(npc_list[name] == nil) then call(f_fail) end
	walk.run(roomAll[npc_list[name].room].path, f_done, f_fail, f_stop)
end