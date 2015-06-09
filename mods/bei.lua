require "wait"
require "tprint"
require "var"
require "bit"
require "socket"

module ("bei", package.seeall)

local cxt = {}
local task1 = dofile("worlds\\xkx\\mods\\task1.lua")
local task1_array = {}
retry_list = {10, 10, 10, 15, 15, 15, 20, 20, 20, 30}

main = function(f_ok, f_fail)
	cxt = {}
	cxt.f_ok = f_ok
	cxt.f_fail = f_fail
	
	EnableTriggerGroup("bei", true)
	Execute("set brief;fly wm;e;n;e;e;e;task;fly wm")
end

exit = function()
	walk.abort()
	fight.stop()
	EnableTriggerGroup("bei", false)
	EnableTriggerGroup("bei_task1", false)
	
	Execute("halt;fly wm");
end


done = function()
	print("bei done")
	var.task_status = "done"
	var.task_end_time = os.time()
	if(var.double_bonus == "true") then var.task_available_time = os.time() end
	exit()
	call(cxt.f_ok)
end

fail = function()
	print("bei done")
	var.task_status = "fail"
	retry()
	exit()
	call(cxt.f_fail)
end

retry = function()
	local t = tonumber(var.task_retry_times)
	if(t > #retry_list) then 
		var.task_available_time = var.task_end_time 
	else
		var.task_available_time = os.time() + retry_list[t]
		var.task_retry_times = t + 1
	end
end

available = function()
	return (var.task_available_time == "") 
	or (os.time() >= tonumber(var.task_available_time))
end

reloc = function()
	wait.make(function()
		Execute("fly wm")
		wait.time(10)
		Execute("u;loc " .. var.task_id)
	end)
end

start = function(name, line, wildcards)
	var.task_npc = wildcards[2]
	--直接放到id.lua文件里去了
	--var.task_id = me.id .. "'s task"
	var.task_fullname = (var.task_id):gsub("^%l", string.upper)
	var.task_found = false
	var.task_retry_times = 1
	var.task_status = "start"
	var.task_escape_dir = ""
	
	parseAndLoc()
end

logtime = function(name, line, wildcards)
	local st = os.time()
	var.task_start_time = st
	var.task_available_time = st + 120	-- 非双倍情况下，2分钟一个task
	var.task_end_time = st + getseconds(wildcards[2])
end

resume = function()
	var.task_found = false
	var.task_status = "start"
	var.task_escape_dir = ""
	
	parseAndLoc()
end

parseAndLoc = function()
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
				Execute("loc " .. var.task_id)
			end
		end
	end)
end

location = function(name, line, wildcards)
	var.task_loc = wildcards[3]
	print(var.task_city .. " " .. var.task_loc .. " " .. var.task_npc)
	
	local busy_list = me.profile.busy_list
	local attack_list = me.profile.attack_list2
	fight.prepare(busy_list, attack_list)
	
	--如果slowwalk走完还没有stop，说明没找到
	walk.sl(var.task_city, var.task_loc, bei.notfound, bei.fail, bei.foundnpc)
end

faint = function()
	me.profile.reset_cd_status()
	cleanup()
end

-- 走完都没找到
notfound = function()
	var.task_found = false
	fight.stop()
	Execute("halt")
	--如果walkaround走完还没找到，就retry吧
	print("走完还没找到")
	busy_test(function()
		walk.walkaround(5, nil, bei.fail, bei.fail, bei.foundnpc)
	end)
end

foundnpc = function()
	var.task_found = true
	startFight()
end

startFight = function()
	abort_busytest()
	local busy_list = me.profile.busy_list
	local attack_list = me.profile.attack_list2
	fight.prepare(busy_list, attack_list)
	fight.start("kill " .. var.task_id)
end

-------- task 跑了，在原地范围内进行深度为5的遍历-----------------------------------
search = function(name, line, wildcards)
	print("task 往【" .. wildcards[3] .. "】跑了")
	local dir = wildcards[3]
	dir = dir:gsub("边",""):gsub("面", ""):gsub("方向", ""):gsub("方", "")
	var.task_escape_dir = dir
	
	if(walk.stopped()) then searchTask() end
end

searchTask = function()
	busy_test(function()
		print("从 " .. var.task_escape_dir .. " 开始walkaround" )
		if(var.task_status == "done") then return end
		Execute("er;et;ef")
		walk.walkaround(3, var.task_escape_dir, bei.notfound, bei.fail, bei.foundnpc)
	end)
end

----看到npc死了，把东西捡起来------------------------------------
npcdie = function(name, line, wildcards)
	wait.make(function()
		walk.abort()
		fight.stop()
		var.task_status = "done"
		local l, w  = wait.regexp("^(> )*" .. var.task_npc .. "扑在地上挣扎了几下，口中喷出几口鲜血，死了！$", 5)
		if(l == nil) then
			cleanup()
		else
			busy_test(function()
				item.lookandget(bei.cleanup)
			end)
		end
	end)
end


----task结束后的善后工作，疗伤学习打坐----------------------------
cleanup = function()
	busy_test(function()
		Execute("halt;fly wm;nw;er;et;ef")
		me.cleanup(done)
	end)
	--[[
	Execute("set brief;halt;fly wm;nw;er;et;ef")
	me.cleanup(
		function() 
			local diff = os.time() - tonumber(var.task_start_time)
			if(diff < 10) then
				wait.make(function()
					print("休息一会: " .. diff)
					wait.time(diff)
					bei.main()
				end)
			else
				bei.main() 
			end
		end)
	]]--
end

guaji = function()
	--wait.make(function()
		local f = nil
		f = function()
			local t = tonumber(var.task_available_time) - os.time()
			print("重启等待ms: " .. t)
			wait.make(function()
				if(t > 0) then wait.time(t) end
				main(f, f)
			end)
		end
		
		main(f, f)
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


