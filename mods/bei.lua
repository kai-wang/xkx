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
	
	msg.subscribe("msg_slowwalk_ok", bei.notfound)
	msg.subscribe("msg_slowwalk_fail", bei.fail)
	
	Execute("fly wm;e;n;e;e;e;task")
end

exit = function()
	EnableTriggerGroup("bei", false)
	EnableTriggerGroup("bei_task1", false)
	
	msg.unsubscribe("msg_slowwalk_ok")
	msg.unsubscribe("msg_slowwalk_fail")
	msg.unsubscribe("msg_slowwalk_stop")
	
	msg.broadcast("msg_bei_exit")
end

available = function(t)
	if(t == nil or t == 0) then msg.broadcast("msg_bei_available")
	else
		wait.make(function()
			wait.time(t)
			msg.broadcast("msg_bei_available")
		end)
	end
end


done = function()
	var.task_status = "done"
	exit()
	
	if(var.double_bonus ~= "true") then
		local elapse = os.time() - tonumber(var.bei_start_time)
		local remaining = 240 - elapse
		if(remaining <= 0) then available() else available(remaining) end
	else
		available()
	end
end

fail = function()
	var.task_status = "fail"
	exit()
	--����ʱ���5���ӣ�Ӧ��Ҫ���������
	available(300)
	Execute("halt;fly wm")
end

retry = function()
	var.task_status = "retry"
	if(tonumber(var.task_retry_times) >= tonumber(var.task_retry_max)) then fail() return end
	
	exit()
	--15���������
	available(15)
	var.task_retry_times = tonumber(var.task_retry_times) + 1
	Execute("halt;fly wm")
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
	--ֱ�ӷŵ�id.lua�ļ���ȥ��
	--var.task_id = me.id .. "'s task"
	var.task_fullname = (var.task_id):gsub("^%l", string.upper)
	var.task_found = false
	var.task_retry_times = 0
	var.task_status = "start"
	var.task_start_time = os.time()
	var.task_escape_dir = ""
	
	parseAndLoc()
end

resume = function()
	var.task_found = false
	var.task_retry_times = 0
	var.task_status = "start"
	var.task_escape_dir = ""
	
	parseAndLoc()
end

parseAndLoc = function()
	wait.make(function()
		EnableTriggerGroup("bei_task1", true)
		Execute("fly wm;u;task1;set task1")
		local l, w = wait.regexp("^(> )*(������û���κ�ʹ����)|(�趨����������task1 = \"YES\")$")
		EnableTriggerGroup("bei_task1", false)
		if(l and string.match(l, "������û���κ�ʹ��")) then
			done()
		else
			local city = parse()
			if(city == nil) then
				print("�Ҳ���ƥ��ĳ���")
				fail()
			else
				var.task_city = city
				Execute("loc " .. var.task_id)
				--Execute("fly wm;u;loc " .. me.id .. "'s task")
			end
		end
	end)
end

location = function(name, line, wildcards)
	var.task_loc = wildcards[3]
	print(var.task_city .. " " .. var.task_loc .. " " .. var.task_npc)
	--go()
	
	local busy_list = me.profile.busy_list
	local attack_list = me.profile.attack_list2
	fight.prepare(busy_list, attack_list)
	
	--���slowwalk���껹û��stop��˵��û�ҵ�
	msg.subscribe("msg_slowalk_stop", bei.notfound)
	walk.sl(var.task_city, var.task_loc)
end

go = function()
	fight.prepare(busy_list, attack_list)
	--walk.sl(var.task_city, var.task_loc, bei.notfound, bei.fail)
	walk.sl(var.task_city, var.task_loc)
end

faint = function()
	fight.stop()
	walk.stop()
	
	me.profile.reset_cd_status()
end

-- ���궼û�ҵ�
notfound = function()
	var.task_found = false
	fight.stop()
	Execute("halt")
	--���walkaround���껹û�ҵ�����retry��
	msg.subscribe("msg_slowwalk_ok", bei.retry)
	walk.walkaround(5)
end

foundnpc = function(name, line, wildcards)
	msg.subscribe("msg_slowwalk_stop", function()
		var.task_found = true
		if(var.task_auto_kill == "true") then
			startFight()
		else
			Execute("tuna 10")
		end
	end)
	
	walk.stop()
end

startFight = function()
	local busy_list = me.profile.busy_list
	local attack_list = me.profile.attack_list2
	fight.prepare(busy_list, attack_list)
	
	fight.start("kill " .. var.task_id)
end

-------- task ���ˣ���ԭ�ط�Χ�ڽ������Ϊ5�ı���-----------------------------------
search = function(name, line, wildcards)
	print("task ����" .. wildcards[3] .. "������")
	local dir = wildcards[3]
	dir = dir:gsub("��","")
	dir = dir:gsub("��", "")
	var.task_escape_dir = dir
	
	walk.stop()
	searchTask()
end

searchTask = function()
	wait.make(function()
		repeat
			wait.time(1)
			Execute("suicide")
			local l, w = wait.regexp("^(> )*(����æ���أ�û����ɱ��)|(���� suicide -f ȷ����ɱ��)$")
		until(l:match("ȷ����ɱ") ~= nil)
		walk.walkaround(3, var.task_escape_dir)
	end)
end

----����npc���ˣ��Ѷ���������------------------------------------
npcdie = function(name, line, wildcards)
	wait.make(function()
		walk.stop()
		fight.stop()
		local l, w  = wait.regexp("^(> )*" .. var.task_npc .. "���ڵ��������˼��£��������������Ѫ�����ˣ�$", 5)
		if(l == nil) then
			cleanup()
		else
			wait.time(3)
			item.lookandget(bei.cleanup)
		end
	end)
end


----task��������ƺ���������ѧϰ����----------------------------
cleanup = function()
	Execute("fly wm;u;jiali 0;er;et")
	me.updateHP(function()
		me.full(function()
			msg.subscribe("msg_study_done", function()
				wait.make(function()
					if(tonumber(me["nl"]) > tonumber(me["nl_max"]) * 1.2) then bei.done() 
					else
						wait.time(1)
						Execute("halt;fly wm;u")
						dazuo.start(function()
							Execute("er;et;d")
							bei.done()
						end)
					end
				end)
			end)
			me.useqn()
		end)
	end)
end

-----------------------------------------------------------------------------------------------------------------------------
--------------------------------------�����ǽ���task1���--------------------------------------------------------------------
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
	print("��ƥ����֣� "..name)
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
	print("��ƥ����֣� "..name)
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

	-------------ת�������ֺ�λ�����������һλ����17λ------------------------
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

---------�ֶ�����һ��task1������--------------------------
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

---------����ģת��������-----------------------------------
function parse_array()
	for i, v in ipairs(task1) do
		local tbl = {}
		tbl.city = v.city
		tbl.array = stringToArray(v.desc)
		table.insert(task1_array, tbl)
	end
end


parse_array()


