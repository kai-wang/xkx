require "wait"
require "tprint"
require "var"
require "bit"

module ("bei", package.seeall)

local bei_info = {}
local task1 = dofile("worlds\\xkx\\mods\\task1.lua")
local task1_array = {}

main = function()
	EnableTriggerGroup("bei", true)
	Execute("fly wm;e;n;e;e;e;task")
end

done = function()
	EnableTriggerGroup("bei", false)
end

fail = function()
	EnableTriggerGroup("bei", false)
	Execute("fly wm")
end

pause = function()
	EnableTriggerGroup("bei", false)
	Execute("fly wm")
end

start = function(name, line, wildcards)
	var.task_npc = wildcards[2]
	var.task_id = me.id .. "'s task"
	var.task_fullname = (var.task_id):gsub("^%l", string.upper)
	var.task_found = false
	
	Execute("fly wm")
	parseTask1()
	--[[
	Execute("task1;set task1")
	Execute("fly wm;u;loc " .. me.id .. "'s task")
	]]--
end

parseTask1 = function()
	wait.make(function()
		EnableTriggerGroup("bei_task1", true)
		Execute("task1;set task1")
		local l, w = wait.regexp("^(> )*(你现在没有任何使命！)|(设定环境变数：task1 = \"YES\")$")
		EnableTriggerGroup("bei_task1", false)
		if(l and string.match(l, "你现在没有任何使命")) then
			fail()
		else
			local city = parse()
			if(city == nil) then
				print("找不到匹配的城市")
				fail()
			else
				var.task_city = city
				locateTask()				
			end
		end
	end)
end

locateTask = function()
	Execute("fly wm;u;loc " .. me.id .. "'s task")
end


go = function(name, line, wildcards)
	var.task_loc = wildcards[3]
	print(var.task_city .. " " .. var.task_loc .. " " .. var.task_npc)
	walk.sl(var.task_city, var.task_loc, bei.notfound, bei.fail)
end

faint = function()
	var.faint = 1
end

awake = function()
	var.faint = 0
	fail()
end

--[[
location = function(name, line, wildcards)
	local city = parse()
	var.task_loc = wildcards[3]
	if(city == nil) then
		print("找不到匹配的城市")
		fail()
	else
		print(city .. " " .. var.task_loc .. " " .. var.task_npc)
		walk.sl(var.task_city, var.task_loc, notfound, fail)
	end
end
]]--

-- 走完都没找到
notfound = function()
	if(var.task_found) then return end
	if(var.task_retry == nil) then var.task_retry = 0 end
	if(tonumber(var.task_retry) < 3) then
		var.task_retry = tonumber(var.task_retry) + 1
		-- 暂停，飞回去，过段时间再来
		pause()
	else
		fail()
	end
end

foundnpc = function(name, line, wildcards)
	local busy_list = me.profile.task_busy_list()
	local attack_list = me.profile.task_attack_list()

	walk.stop()
	var.task_found = true

	fight.prepare(busy_list, attack_list)
	Execute("jiali max;kill " .. var.task_id)
	fight.start()
end


npcdie = function(name, line, wildcards)
	wait.make(function()
		fight.stop()
		wait.time(2)
		item.lookandget()
		--Execute("look corpse;get all from corpse")
		wait.time(1)
		Execute("halt;fly wm;u;jiali 0;yun regenerate;yun recover")
		dazuo.start(function()
			if(me.package.sell_list ~= nil) then
				for i, v in ipairs(me.package.sell_list) do
					print("give " .. v.id .. " to ouye zi")
					Execute("give " .. v.id .. " to ouye zi")
				end
			end
			Execute("d;er;et")
			bei.done()
		end)
		--[[
		dazuo_start()
		Execute("d;yun recover;yun regenerate")
		done()
		]]--
	end)
end

-------- task 跑了，在原地范围内进行深度为5的遍历-----------------------------------
search = function(name, line, wildcards)
	var.task_found = false
	fight.stop()
	Execute("halt")
	walk.walkaround(5, wildcards[2])
end

-----------------------------------------------------------------------------------------------------------------------------
--------------------------------------以下是解析task1相关--------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
function task1_init(name, line, wildcards)
	var.bei_npc = wildcards[2]
	print(var.bei_npc)
	bei_info.start = true
	bei_info.matrix = {}
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

	table.insert(bei_info.matrix, str)
end

--[[
function task1_end()
	EnableTriggerGroup("bei_task1",false)
	if(bei_info.matrix == {}) then
		fail()
	end
end
]]--

function parse()
	if(bei_info.matrix == {}) then return end
	local str = table.concat(bei_info.matrix, "\n")
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
	--[[
		local city, maxMatchNum = nil, 0
		for j = 1, #words do
			for i, v in ipairs(task1) do
				if(#v.city == #name) then
					local m = 0
					if(string.find(v.city, words[j]) ~= nil) then m = m + 1 end
					if(m > maxMatchNum) then
						city = v.city
						maxMatchNum = m
					end
				end
			end
		end

		return city
	end]]--
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
	elseif(len == 65) then
		array[1], array[2], array[3], array[4] = {}, {}, {}, {}
		for i = 1, #tbl do
			table.insert(array[1], bit.tonumber(tbl[i]:sub(1,17), 2))
			table.insert(array[2], bit.shl(bit.tonumber(tbl[i]:sub(18,33), 2),1))
			table.insert(array[3], bit.shl(bit.tonumber(tbl[i]:sub(34,49), 2),1))
			table.insert(array[4], bit.shl(bit.tonumber(tbl[i]:sub(50,65), 2),1))
		end
	end

	return array
end

---------手动保存一下task1的内容--------------------------
function save(name)
	var.task_city = name
	table.insert(task1, {["city"]=name, ["desc"]=table.concat(bei_info.matrix, "\n")})
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


