require "wait"
require "tprint"
require "var"

module ("walk", package.seeall)

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
directions["enter"] = "里"
directions["out"] = "外"
directions["d"] = "下"
directions["u"] = "上"

local mappings = {}

mappings["大理国"] = "大理"
mappings["峨嵋山"] = "峨眉山"
mappings["青城山"] = "青城"
mappings["紫禁城"] = "北京紫禁城"
mappings["光明顶"] = "明教"
mappings["重阳宫"] = "全真教"
mappings["黄河地区"] = "河套地区"
mappings["光明顶"] = "明教"


local blocker_npcs = {}

blocker_npcs["衙役"] = {id = "ya yi"}
blocker_npcs["宋兵"] = {id = "song bing"}
blocker_npcs["亲兵"] = {id = "qin bing"}
blocker_npcs["一品堂武士"] = {id = "wu shi"}
blocker_npcs["卫士"] = {id = "wei shi"}
blocker_npcs["崔员外"] = {id = "cui yuanwai"}
blocker_npcs["校尉"] = {id = "xiao wei"}
blocker_npcs["官兵"] = {id = "bing"}
blocker_npcs["江百胜"] = {id = "jiang baisheng"}
blocker_npcs["女管家"] = {id = "guan jia"}
blocker_npcs["门卫"] = {id = "men wei"}
blocker_npcs["流氓头"] = {id = "tou"}
blocker_npcs["丫鬟"] = {id = "ya huan"}
blocker_npcs["锦衣卫士"] = {id = "wei shi"}
blocker_npcs["黄衣卫士"] = {id = "wei shi"}
blocker_npcs["山贼头"] = {id = "tou"}
blocker_npcs["静心师太"] = {id = "jingxin shitai"}
blocker_npcs["摘星子"] = {id = "zhaixing zi"}
blocker_npcs["出尘子"] = {id = "chuchen zi"}
blocker_npcs["采花子"] = {id = "caihua zi"}
blocker_npcs["管家"] = {id = "guan jia"}
blocker_npcs["家丁"] = {id = "jia ding"}
blocker_npcs["高根明"] = {id = "gao genming"}
blocker_npcs["施戴子"] = {id = "shi daizi"}
blocker_npcs["皇宫卫士"] = {id = "wei shi"}
blocker_npcs["蟒蛇"] = {id = "mang she"}
blocker_npcs["阿碧"] = {id = "a bi"}
blocker_npcs["蒙面女郎"] = {id = "nv lang", pfm = true}
blocker_npcs["张松溪"] = {id = "zhang songxi", pfm = true}
blocker_npcs["莫声谷"] = {id = "mo shenggu", pfm = true}
blocker_npcs["赤冠巨蟒"] = {id = "ju man"}
blocker_npcs["无根道长"] = {id = "wugen daozhang", pfm = true}
blocker_npcs["麻衣长老"] = {id = "mayi zhanglao"}
blocker_npcs["萨木活佛"] = {id = "samu huofo", pfm = true}
blocker_npcs["嘉木活佛"] = {id = "jiamu huofo", pfm = true}
blocker_npcs["西华子"] = {id = "xi huazi"}
blocker_npcs["弟子"] = {id = "di zi"}
blocker_npcs["竹剑"] = {id = "zhu jian"}
blocker_npcs["菊剑"] = {id = "ju jian"}
blocker_npcs["谢烟客"] = {id = "xie yanke", pfm = true}
---------------------------------------------------------- 特殊命令-------------------------------------------------------------------

local run_cxt = {}

-----命令格式改为
----- path : e;s;|!aw:3:flatter 星宿老仙:nw|e;e;e;e;e;e
----- 记住最后一个|的前一条应当设为路径
function run(path, f_ok, f_fail, f_stop)
	
	print("执行路径: " .. path)
	
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
	
	-- path 为空-------------------------------
	if(p == nil) then print("path 为空") run_end(f_fail) return end	--run_fail() return end
	
	c.run_fail = function() run_end(f_fail) end
	c.run_stop = function() run_end(f_stop) end
	c.run_ok = function() run_end(f_ok) end
	
	c.run_next = function()
		if(c.fail) then print("run fail") run_fail() return end
		if(c.stop) then print("run stop") run_stop() return end
		
		local p = c.iter()
		--执行到最后设置"set run ok"----------
		if(p == nil) then
			Execute("set run ok")
			--从trigger里调用run_ok------------------
			--run_ok()
		else -- 继续下一条命令----------------
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
	
	-- 用 !来区别是特殊命令还是一般命令-------
	if(cmd == "") then 
		call(f_ok)
	else
		local c = cmd:sub(1,1)
		if(c == ";") then cmd = cmd:sub(2) end
		if(c ~= "!") then 
			Execute(cmd) 
			call(f_ok)
		else
			-- aw:3:flatter 星宿老仙
			print("special cmd: " .. cmd:sub(2))
			run_special(cmd:sub(2), f_ok, f_fail, f_stop)
		end
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
		handlers.cxt = {}
		local c = handlers.cxt
		
		c.f_ok = f_ok
		c.f_fail = f_fail
		c.f_stop = f_stop
		
		c.cmd = tbl
		--直接check run_cxt.stop了 --------------
		--c.stop = false
		c.block = false
	end,
	
	run = function()
		EnableTriggerGroup("walk_special", true)
		local c = handlers.cxt
		--直接check run_cxt.stop了 --------------
		--c.stop = false
		c.block = false
		--aw:3:flatter 星宿老仙:nw
		--第一个是特殊命令，最后一个是路径-------
		local func = handlers[c.cmd[1]]
		local cmd = c.cmd[#c.cmd]
		
		if(func == nil) then print("没有对应的handler：" .. c.cmd[1]) handlers.fail() else func(unpack(c.cmd, 2, #c.cmd-1)) end
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
		local c, r = handlers.cxt, run_cxt
		--EnableTriggerGroup("walk_special", false)
		if(r.fail) then handlers.fail() return end
		if(r.stop) then handlers.stop() return end
		
		wait.make(function()
			local cmd = c.cmd[#c.cmd]
			repeat
				wait.time(1)
				Execute("suicide")
				local l, w = wait.regexp("^(> )*(你正忙着呢，没空自杀！)|(请用 suicide -f 确定自杀。)$")
			until(l:match("确定自杀") ~= nil)
		
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
			local l, w = wait.regexp("^(> )*设定环境变数：run_special_handle = \"ok\"$")
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
		--tri里调用handlers.done()
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
			local l, w = wait.regexp("^(> )*设定环境变数：run_special_handle = \"ok\"$")
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
		--移到trigger里了
		--var.walk_blocker_name = wildcards[2]
		local bl = blocker_npcs[var.walk_blocker_name]
		if(bl == nil) then print("没有blocker id") handlers.fail() return end
		
		var.walk_blocker_id = blocker_npcs[var.walk_blocker_name].id
		print("blocker: " .. var.walk_blocker_name .. " " .. var.walk_blocker_id)
		
		if(bl.pfm == true) then handlers.startFight() else Execute("kill " .. var.walk_blocker_id) end
	end,
	
	k_blocker2 = function()
		local c = handlers.cxt
		c.k_blocker = true
		
		handlers.block()
		--移到trigger里了
		--var.walk_blocker_name = wildcards[2]
		var.walk_blocker_id = blocker_npcs[var.walk_blocker_name]
		
		print("blocker: " .. var.walk_blocker_name .. " " .. var.walk_blocker_id)
		
		if(var.walk_blocker_id == nil) then print("没有blocker id") handlers.fail() return end
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
		
		print(var.walk_blocker_name .. "死了")
		handlers.unblock()
		
		if(var.walk_blocker_name == "崔员外") then
			Execute("get yaoshi from corpse")
		end
		
		--busy_test(function() print("触发handlers.done") handlers.done() end)
		handlers.done()
	end,
	
	["gw"] = function()
		local c = handlers.cxt
		
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
	
	["punk"] = function()
		Execute("sw;se;se;s;s;w;nw;ask punk about 王小二;se;e;n;n;nw;nw;ne")
		handlers.done()
	end,
	
	["thmz"] = function(dir)
		wait.make(function()
			repeat
				Execute(dir)
				local l, w = wait.regexp("^(> )*(你走出了桃花迷阵。)|(突然一阵桃花瓣象雨点般疾射你！)$")
				wait.time(2)
			until(l:match("你走出了"))
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
			local l, w = wait.regexp("^(> )*(你拿出.*给店小二。)|(你没有那么多的白银。)$")
			if(l:match("你没有那么多")) then handlers.fail() else handlers.done() end
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
				Execute("wear xunzhang;ask su about 秘密地道")
				local l, w = wait.regexp("^(> )*(这里没有这个人)|(苏星河说道：想要知道密道就得加入逍遥派)|(苏星河把你送到石室的门口).*$")
				if(l:match("苏星河把你送到石室的门口") == nil) then handlers.fail() else handlers.done() end
			end)
		else
			handlers.fail()
		end
	end,
	
	["gcdt"] = function()
		wait.make(function()
			Execute("look gaochang ditu")
			local l, w = wait.regexp("^(> )*(这是一张高昌迷宫地图)|(你要看什么).*$")
			if(l:match("你要看什么")) then handlers.fail() else handlers.done() end
		end)
	end,
	
	["cao"] = function()
		wait.make(function()
			repeat
				Execute("take cao")
				local l, w = wait.regexp("^(> )*(你从悬崖上摔了下来)|(你在悬崖前站定).*$")
			until(l:match("你从悬崖上摔了下来"))
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
	
	--应该肯定不会为空了----------------------
	assert(p ~= nil)
	
	c.walk_fail = function() walk_end(f_fail) end
	c.walk_stop = function() walk_end(f_stop) end
	c.walk_ok = function() walk_end(f_ok) end
	
	c.walk_next = function()
		if(c.fail) then walk_fail() return end
		
		print("当前房间: " .. roomId)
		walk_cxt.currentId = roomId
		
		if(c.abort) then return end
		if(c.stop) then walk_stop() return end
		
		p = c.iter()
		--执行到最后设置"set run ok"----------
		if(p == nil) then
			--Execute("set slowwalk ok")
			--print("run ok")
			--在这里调用f_ok------------------
			walk_ok()
		else -- 继续下一条命令----------------
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

--暂时不需要resume吧----------------------------------------------------------------
--还需要在run和handle上面加一个，如果正在handle的时候stop了，需要把handle resume----
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
	
	--if(dir ~= nil) then dir = dir:gsub("边","") end 
	--if(var.walk_deepth ~= nil) then walk_deepth = tonumber(var.walk_deepth) end
	
	--声明一下两个函数-------------------------------------------------------------------
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
		--走到头了
		if(deepth == walk_deepth) then return end
		
		-------------------优先找符合dir的房间的路径------------------------------------------------------
		if(deepth == 1 and dir ~= nil) then
			for i, v in pairs(room.links) do
				if(not walked[v.to] and roomAll[v.to].attr ~= "danger" and v.block ~= "y" and directions[i] == dir) then
					enqueue(i, v, room, deepth)
				end
			end
		end
		------------------找剩下的还没做过的房间-----------------------------------------------------------
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