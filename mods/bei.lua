require "wait"
require "tprint"
require "var"
require "bit"
require "socket"
require("worlds\\xkx\\mods\\core")

module ("bei", package.seeall)

local cxt = {}
local task1 = dofile("worlds\\xkx\\mods\\task1.lua")
local emitter = require("worlds\\xkx\\mods\\emitter"):new()

local task1_array = {}
retry_list = {10, 10, 15, 15, 20, 20, 30, 30}

function ask()
	-- bei_ask_end
	-- error code: new / notask / resume
	emitter:once("bei_ask_end", function(err, taskname)
		EnableTriggerGroup("bei_ask", false)
		timer.stop("action")
		if err == "new" then
			EnableTriggerGroup("bei_ask", true)
			var.task_npc = taskname
			--直接放到id.lua文件里去了
			--var.task_id = me.id .. "'s task"
			var.task_fullname = (var.task_id):gsub("^%l", string.upper)
			var.task_found = false
			var.task_retry_times = 1
			var.task_status = "start"
			var.task_escape_dir = ""
			parseAndLoc()
		elseif err == "resume" then
			var.task_found = false
			var.task_status = "start"
			var.task_escape_dir = ""
			--if((tonumber(var.task_retry_times) % 2) > 0) then
				-- 省点钱，偶数次直接按照上次loc的去找
				parseAndLoc()
			--[[
			else
				gofortask()
			end
			]]--
		elseif err == "notask" then
			done()
		else
			fail()
		end
	end)

	-- timeout
	timer.tickonce("action", 5, function()
		fail()
	end)

	EnableTriggerGroup("bei_ask", true)
	Execute("set brief;fly wm;e;n;e;e;e;task;fly wm")
end

function parseAndLoc()
	wait.make(function()
		EnableTriggerGroup("bei_task1", true)
		Execute("u;task1;set task1")
		local l, w = wait.regexp("^(> )*(你现在没有任何使命！)|(设定环境变数：task1 = \"YES\")$")
		EnableTriggerGroup("bei_task1", false)
		if(l and string.match(l, "你现在没有任何使命")) then
			done()
		else
			local t1 = socket.gettime() * 1000
			local city = parse()
			local t2 = socket.gettime() * 1000
			print("解析时间 .. " .. math.floor(t2-t1) .. " ms")
			if(city == nil) then
				print("找不到匹配的城市")
				fail()
			else
				var.task_city = city
				loc()
			end
		end
	end)
end

function loc()
	-- loc end
	-- error code: success / done / retry
	emitter:once("bei_loc_end", function(err, location)

		EnableTriggerGroup("bei_loc", false)
		timer.stop("action")

		if err == 'success' then
			var.task_loc = location
			print(var.task_city .. " " .. var.task_loc .. " " .. var.task_npc)
			gofortask()
		elseif err == "retry" then
			timer.tickonce("action", 10, function()
				loc()
			end)
		else
			fail()
		end
	end)

	-- timeout 10s
	timer.tickonce("action", 10, function()
		fail()
	end)

	EnableTriggerGroup("bei_loc")
	Execute("fly wm;u;loc " .. var.task_id)
end

function fail()
	print("bei fail")
	var.task_status = "fail"
	retry()
	exit()
	core.safeback(function()
		call(cxt.f_fail)
	end, 1)
	--emitter:emit("bei_end", "fail")
end

function fail2()
	print("bei fail")
	var.task_status = "fail"
	exit()
	core.safeback(function()
		call(cxt.f_fail)
	end, 1)
end

function done()
	print("bei done")
	var.task_status = "done"
	var.task_end_time = os.time()
	if(var.double_bonus == "true") then var.task_available_time = os.time() end
	exit()
	core.safeback(function()
		call(cxt.f_ok)
	end, 1)
	--emitter:emit("bei_end", "success")
end

function exit()
	walk.abort()
	fight.stop()
	EnableTriggerGroup("bei", false)
	EnableTriggerGroup("bei_search", false)
	EnableTriggerGroup("bei_ask", false)
	EnableTriggerGroup("bei_loc", false)
	EnableTriggerGroup("bei_task1", false)
	--Execute("halt;fly wm");
end

function retry()
	local t = tonumber(var.task_retry_times)
	if(t > #retry_list) then
		var.task_available_time = var.task_end_time
	else
		var.task_available_time = os.time() + retry_list[t]
		var.task_retry_times = t + 1
	end
end

function main(f_ok, f_fail)
	cxt = {}
	cxt.f_ok = f_ok
	cxt.f_fail = f_fail

	var.walk_danger_level = var.task_walk_danger_level
	EnableTriggerGroup("bei", true)
	EnableTriggerGroup("bei_search", true)
	ask()
	--Execute("set brief;fly wm;e;n;e;e;e;task;fly wm")
end

function emit(event, ...)
	emitter:emit(event, ...)
end

function available()
	return (var.task_available_time == "")
	or (os.time() >= tonumber(var.task_available_time))
end

function logtime(name, line, wildcards)
	EnableTriggerGroup("bei_ask", false)
	local st = os.time()
	var.task_start_time = st
	var.task_available_time = st + 120	-- 非双倍情况下，2分钟一个task
	var.task_end_time = st + getseconds(wildcards[2])
end


function gofortask()
	local busy_list = config.task_busy_list
	local attack_list = config.task_attack_list

	if(config.customize_task_pfm ~= nil) then
		busy_list, attack_list = customize_task_pfm(var.task_menpai)
	end

	fight.prepare(busy_list, attack_list, escape, var.task_menpai, var.task_id)
	config.powerup()
	--如果slowwalk走完还没有stop，说明没找到
	walk.sl(var.task_city, var.task_loc, bei.notfound, bei.fail, bei.foundnpc)
end

function faint()
	var.faint_flag = true
	config.reset_cd_status()
	if(var.me_status_ssf == "true" or var.me_status_poison == "true") then
		timer.reconnect(90, function() cleanup() end)
	end
end

-- 走完都没找到
function notfound()
	var.task_found = false
	fight.stop()
	--如果walkaround走完还没找到，就retry吧
	print("走完还没找到")
	core.safehalt(function()
		walk.walkaround(5, nil, bei.fail, bei.fail, bei.foundnpc)
	end)
end

function foundnpc()
	var.task_found = true
	config.set_menpai(var.task_menpai)
	if(var.task_auto_kill == "0") then
		walktask()
	else
		startFight()
	end
end

function walktask()
	Execute("ask " .. var.task_id .. " about rumors")

	timer.tickonce("action", 1.5, function()
		if(var.task_status == "done" or fight.infight()) then return end

		EnableTriggerGroup("bei_search", false)
		core.safehalt(function()
			Execute("er;et;ef")
			walk.walkaround(2, nil, 
				function() EnableTriggerGroup("bei_search", true) bei.notfound() end, 
				function() EnableTriggerGroup("bei_search", true) bei.fail() end, 
				function() EnableTriggerGroup("bei_search", true) bei.foundnpc() end
				)
		end, 0.5)
	end)
end

function startFight()
	timer.stop("action")
	local busy_list = config.task_busy_list
	local attack_list = config.task_attack_list

	if(config.customize_task_pfm ~= nil) then
		busy_list, attack_list = customize_task_pfm(var.task_menpai)
	end

	fight.prepare(busy_list, attack_list, escape, var.task_menpai, var.task_id)
	if(var.task_kill_flag == "1") then
		fight.start("kill " .. var.task_id)
	else
		fight.start("touxi " .. var.task_id)
	end
end

function escape()
	timer.tickonce("action", 2, function()
		retry()
		me.cleanup(fail2)
	end)
end

-------- task 跑了，在原地范围内进行深度为5的遍历-----------------------------------
function search(name, line, wildcards)
	print("task 往【" .. wildcards[3] .. "】跑了")
	local dir = wildcards[3]
	dir = dir:gsub("边",""):gsub("面", ""):gsub("方向", ""):gsub("方", "")
	var.task_escape_dir = dir

	timer.stop("action")
	if(walk.stopped()) then searchTask() end
end

function searchTask()
	core.busytest(function()
		print("从 " .. var.task_escape_dir .. " 开始walkaround" )
		if(var.task_status == "done") then return end
		Execute("er;et;ef")
		walk.walkaround(3, var.task_escape_dir, bei.notfound, bei.fail, bei.foundnpc)
	end)
end

----看到npc死了，把东西捡起来------------------------------------
function npcdie(name, line, wildcards)
	wait.make(function()
		walk.abort()
		fight.stop()
		var.task_status = "done"
		local l, w  = wait.regexp("^(> )*" .. var.task_npc .. "扑在地上挣扎了几下，口中喷出几口鲜血，死了！$", 5)
		if(l == nil) then
			cleanup()
		else
			core.busytest(function()
				kantou(function() item.lookandget(bei.cleanup) end)
			end)
		end
	end)
end


----task结束后的善后工作，疗伤学习打坐----------------------------
function cleanup()
	core.safeback(function()
		Execute("er;et;ef")
		me.cleanup(done)
	end, 1)

end

function auto()
	--wait.make(function()
		local f = nil
		f = function()
			local t = tonumber(var.task_available_time) - os.time()
			print("重启等待ms: " .. t)
			me.useqn(function()
				wait.make(function()
					if(t > 0) then wait.time(t) end
					main(f, f)
				end)
			end)
			--[[
			wait.make(function()
				if(t > 0) then wait.time(t) end
				me.useqn(function()
				 main(f, f) end)
			end)
			]]--
		end
		me.useqn(function() main(f, f) end)
	--end)
end

-----------------------------------------------------------------------------------------------------------------------------
--------------------------------------以下是解析task1相关--------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
function task1_init(name, line, wildcards)
	var.task_npc = wildcards[2]
	print(var.task_npc)
	cxt.start = true
	cxt.matrix = {}
end

function log_task1(name, line, wildcards, style)
	local str = ""
	for i, v in ipairs(style) do
		if(RGBColourToName(v.textcolour) == "yellow") then
			str = str .. (v.text):gsub("#","1")
		else
			str = str .. (v.text):gsub("#","0")
		end
	end

	table.insert(cxt.matrix, str)
end

function parse()
	if(cxt.matrix == {}) then return end
	local str = table.concat(cxt.matrix, "\n")
	local array = stringToArray(str)

	if(array ~= nil) then
		return checkSimilarity(array)
	end
end

function checkSimilarity(v1)

	local words, score, maxscore  = {}, {}, 0
	for i, v in ipairs(task1_array) do
		--local v2 = stringToArray(v.desc)
		local v2 = v.array
		if(#v1 == #v2) then
			for j = 1, #v1 do
				if(score[j] == nil) then score[j] = 1000000000 end
				local dist0 = calculateDist(v1[j], v2[j], 0)
				local dist1 = calculateDist(v1[j], v2[j], 1)
				--local dist2 = calculateDist(v1[j], v2[j], 2)
				local dist3 = calculateDist(v2[j], v1[j], 1)
				--local dist4 = calculateDist(v2[j], v1[j], 2)
				local dist5 = calculateDist2(v1[j], v2[j], 1)
				--local dist6 = calculateDist2(v1[j], v2[j], 2)
				local dist7 = calculateDist2(v2[j], v1[j], 1)
				--local dist8 = calculateDist2(v2[j], v1[j], 2)
				local dist = math.min(dist0,dist1,dist3,dist5,dist7)
				--local dist = math.min(dist0,dist1,dist2,dist3,dist4,dist5,dist6,dist7,dist8)
				--local dist = dist0
				--print(v.city .. " dist :" .. dist)
				if(dist < score[j]) then
					score[j] = dist
					words[j] = v.city:sub(j*2-1, 2*j)
				end
			end
		end
	end

	local name = table.concat(words, "")
	print("最匹配的字： "..name)
	if(task1[name] ~= nil) then
		return name
	else
		local city, score = nil, 0
		for i, v in ipairs(task1) do
			if(#v.city == #name) then
				local lastmatch, m = 0, 0
				for j = 1, #words do
					if(v.city:sub(j*2-1, j*2) == words[j]) then
						if(lastmatch == 1) then m = m + 1.5 else m = m + 1 end
						lastmatch = 1
						if(m > score) then score = m city = v.city end
					end
					lastmatch = 0
				end
			end
		end
		print(city)
		return city
	end
end


function test(name)
	local words = {}
	for i = 1, #name do
		table.insert(words, name:sub(i*2-1, i*2))
	end

	local name = table.concat(words, "")
	print("最匹配的字： "..name)
	if(task1[name] ~= nil) then
		return name
	else
		local city, score = nil, 0
		for i, v in ipairs(task1) do
			if(#v.city == #name) then
				local lastmatch, m = 0, 0
				for j = 1, #words do
					if(v.city:sub(j*2-1, j*2) == words[j]) then
						if(j == 1) then
							m = m + 1.2
						elseif(lastmatch == 1) then
							m = m + 1.5
						else
							m = m + 1
						end
						lastmatch = 1
						if(m > score) then score = m city = v.city end
					end
					lastmatch = 0
				end
			end
		end
		print(city)
		return city
	end
end


function calculateDist(v1, v2, pos)
	local score = 0
	for i = 1, #v1 do
		if(v2[i] == nil) then v2[i] = 0 end
		--tprint(v1)
		local xor = bit.xor(bit.shl(v1[i], pos), v2[i])
		local dist = 0
		while(xor ~= 0) do
			dist = dist + 1
			xor = bit.band(xor, xor-1)
		end

		score = score + dist
	end
	return score
end

function calculateDist2(v1, v2, x)
	local v0 = {}
	for i = 1, x do
		v0[i] = 0
	end
	for i = x, #v1 do
		v0[i] = v1[i]
	end

	return calculateDist(v0, v2, 0)
end


function stringToArray(text)
	--if(task1[test] == nil) then return end

	local array = {}
	local tbl = utils.split(text, "\n")
	local len = #tbl[1]
	if(tbl[#tbl] == "") then tbl[#tbl] = nil end

	-------------转换成数字后位数不足的左移一位凑齐17位------------------------
	if(len == 32) then
		array[1], array[2] = {}, {}
		for i = 1, #tbl do
			table.insert(array[1], bit.shl(bit.tonumber(tbl[i]:sub(1,16), 2),1))
			table.insert(array[2], bit.shl(bit.tonumber(tbl[i]:sub(17,32), 2),1))
		end
	elseif(len == 33) then
		array[1], array[2] = {}, {}
		for i = 1, #tbl do
			table.insert(array[1], bit.tonumber(tbl[i]:sub(1,17), 2))
			table.insert(array[2], bit.shl(bit.tonumber(tbl[i]:sub(18,33), 2),1))
		end
	elseif(len == 34) then
		array[1], array[2] = {}, {}
		for i = 1, #tbl do
			table.insert(array[1], bit.tonumber(tbl[i]:sub(1,17), 2))
			table.insert(array[2], bit.tonumber(tbl[i]:sub(18,34), 2))
		end
	elseif(len == 48) then
		array[1], array[2], array[3] = {}, {}, {}
		for i = 1, #tbl do
			table.insert(array[1], bit.shl(bit.tonumber(tbl[i]:sub(1,16), 2),1))
			table.insert(array[2], bit.shl(bit.tonumber(tbl[i]:sub(17,32), 2),1))
			table.insert(array[3], bit.shl(bit.tonumber(tbl[i]:sub(33,48), 2),1))
		end
	elseif(len == 49) then
		array[1], array[2], array[3] = {}, {}, {}
		for i = 1, #tbl do
			table.insert(array[1], bit.tonumber(tbl[i]:sub(1,17), 2))
			table.insert(array[2], bit.shl(bit.tonumber(tbl[i]:sub(18,33), 2),1))
			table.insert(array[3], bit.shl(bit.tonumber(tbl[i]:sub(34,49), 2),1))
		end
	elseif(len == 50) then
		array[1], array[2], array[3] = {}, {}, {}
		for i = 1, #tbl do
			table.insert(array[1], bit.tonumber(tbl[i]:sub(1,17), 2))
			table.insert(array[2], bit.tonumber(tbl[i]:sub(18,34), 2))
			table.insert(array[3], bit.shl(bit.tonumber(tbl[i]:sub(35,50), 2),1))
		end
	elseif(len == 51) then
		array[1], array[2], array[3] = {}, {}, {}
		for i = 1, #tbl do
			table.insert(array[1], bit.tonumber(tbl[i]:sub(1,17), 2))
			table.insert(array[2], bit.tonumber(tbl[i]:sub(18,34), 2))
			table.insert(array[3], bit.tonumber(tbl[i]:sub(35,51), 2))
		end
	elseif(len == 64) then
		array[1], array[2], array[3], array[4] = {}, {}, {}, {}
		for i = 1, #tbl do
			table.insert(array[1], bit.tonumber(tbl[i]:sub(1,17), 2))
			table.insert(array[2], bit.shl(bit.tonumber(tbl[i]:sub(18,33), 2),1))
			table.insert(array[3], bit.shl(bit.tonumber(tbl[i]:sub(34,49), 2),1))
			table.insert(array[4], bit.shl(bit.tonumber(tbl[i]:sub(50,64), 2),1))
		end
	elseif(len == 65 or len == 66) then
		array[1], array[2], array[3], array[4] = {}, {}, {}, {}
		for i = 1, #tbl do
			table.insert(array[1], bit.tonumber(tbl[i]:sub(1,17), 2))
			table.insert(array[2], bit.shl(bit.tonumber(tbl[i]:sub(18,33), 2),1))
			table.insert(array[3], bit.shl(bit.tonumber(tbl[i]:sub(34,49), 2),1))
			table.insert(array[4], bit.shl(bit.tonumber(tbl[i]:sub(50,65), 2),1))
		end
	elseif(len == 67 or len == 68) then
		array[1], array[2], array[3], array[4] = {}, {}, {}, {}
		for i = 1, #tbl do
			table.insert(array[1], bit.tonumber(tbl[i]:sub(1,17), 2))
			table.insert(array[2], bit.shl(bit.tonumber(tbl[i]:sub(18,33), 2),1))
			table.insert(array[3], bit.shl(bit.tonumber(tbl[i]:sub(34,49), 2),1))
			table.insert(array[4], bit.shl(bit.tonumber(tbl[i]:sub(50,67), 2),1))
		end
	end

	return array
end

---------手动保存一下task1的内容--------------------------
function save(name)
	var.task_city = name
	table.insert(task1, {["city"]=name, ["desc"]=table.concat(cxt.matrix, "\n")})
	local content = serialize.save("task1", task1)
	local file = io.open("worlds\\xkx\\mods\\task1.lua", "w")
	file:write("local " .. content)
	file:write("\r\nreturn task1")
	file:close()

	parse_array()
end

---------把字模转换成数字-----------------------------------
function parse_array()
	for i, v in ipairs(task1) do
		local tbl = {}
		tbl.city = v.city
		tbl.array = stringToArray(v.desc)
		table.insert(task1_array, tbl)
	end
end


parse_array()
