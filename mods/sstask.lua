require "wait"
require "tprint"
require "utils"
require "var"

module ("ss", package.seeall)


local ss_list = {}
local ss_map = {}
local context = {}
local mappings = {
	["大雪山"] = "血刀门",
	["北京城"] = "北京",
	["扬州城"] = "扬州",
	["福州城"] = "福州",
	["杭州城"] = "杭州",
	["长安城"] = "长安",
	["泉州城"] = "泉州",
	["苏州城"] = "苏州",
	["佛山镇"] = "佛山",
	["武功镇"] = "武功",
	["衡阳城"] = "衡阳",
	["嘉兴城"] = "嘉兴",
	["襄阳城"] = "襄阳",
	["逍遥派"] = "逍遥林",
	["皇宫大内"] = "紫禁城"
}

local npc_loc = {
	["郭靖"] = { loc="fly wm;e", id="guo jing" },
	["金庸"] = { loc="fly wm;u", id="jin yong" },
	["杨过"] = { loc="fly gm", id="yang guo" },
	["石破天"] = { loc="fly wm;e;n;e;e;e;e", id="shi potian" },
	["张无忌"] = { loc="fly mj", id="zhang wuji" },
	["段誉"] = { loc="fly lz;s;w", id="duan yu" },
	["萧峰"] = { loc="fly lz;s;w", id="xiao feng" },
	["虚竹"] = { loc="fly lj", id="xu zhu" },
	["韦小宝"] = { loc="fly wm;e;s;s;s;e;u", id="wei xiaobao" },
	["李文秀"] = { loc="fly xx;su;s;ed", id="li wenxiu" },
	["令狐冲"] = { loc="fly ws;sd;su;su;enter", id="linghu chong"}
}

local shenshu_list = {
	["飞狐外传"] = { name = "fhwz", num = 3 },
	["雪山飞狐"] = { name = "xsfh", num = 2 },
	["连城诀"] = { name = "lcjue", num = 2 },
	["天龙八部"] = { name = "tlbb", num = 5 },
	["射雕英雄传"] = { name = "sdyxz", num = 4 },
	["白马啸西风"] = { name = "bmxxfeng", num = 1 },
	["鹿鼎记"] = { name = "ldji", num = 5 },
	["笑傲江湖"] = { name = "xajh", num = 4 },
	["书剑恩仇录"] = { name = "sjec", num = 3 },
	["神雕侠侣"] = { name = "sdxl", num = 4 },
	["侠客行"] = { name = "xkx", num = 3 },
	["倚天屠龙记"] = { name = "yttlj", num = 4 },
	["碧血剑"] = { name = "bxsword", num = 3 },
	["鸳鸯刀"] = { name = "yyblade", num = 1 }
}

function init() 
	EnableTriggerGroup("ss_update", false)
	EnableTriggerGroup("ss_search", false)
	EnableTriggerGroup("ss_task", false)
	var.ss_city_1 = nil
end

function main(f_ok, f_fail)
	context.f_done = f_ok
	context.f_fail = f_fail

	if(#ss_list == 0 or context.index > #ss_list) then
		start()
	else
		search()
	end
end

function start()
	EnableTriggerGroup("ss_update", true)
	context.index = 0
	var.walk_danger_level = var.ss_walk_danger_level
	var.ss_city_1 = nil
	ss_list = {}
	core.safeback(function() 
		Execute("nw;sstask")
	end, 1)
end

function update(name, line, wildcards)
	local npc, name, id, finished = wildcards[1], wildcards[2], wildcards[3], wildcards[4]

	if(finished == nil or finished == "") then
		table.insert(ss_list, {id=id, name=name, npc=npc, finished=false})
	else
		table.insert(ss_list, {id=id, name=name, npc=npc, finished=true})
	end

	ss_map[name] = {id=id, npc=npc}
end

function update_done()
	EnableTriggerGroup("ss_update", false)
	if(var.ss_shuffle == "1") then
		shuffle(ss_list)
	end

	core.busytest(function() search() end, 1)
end

function shuffle(t)
	math.randomseed(os.time())
	local rand = math.random
	local iterations = #t
	local j

	for i = iterations, 2, -1 do
		j = rand(i)
		t[i], t[j] = t[j], t[i]
	end
end

function display()
	tprint(ss_list)
end

function search()
	context.index = context.index + 1
	if(context.index > #ss_list) then return fail() end

	if(not ss_list[context.index].finished) then 
		context.search_failed_times = 0
		searchbook() 
	else
		search()
	end
end

function searchbook()
	var.ss_task_status = "search"
	context.search_failed_times = context.search_failed_times + 1
	timer.stop("action")
	if(context.search_failed_times > 3) then 
		if(var.ss_city == "血刀门") then 
			context.search_failed_times = 0
			var.ss_city_1 = "雪山寺"
			searchbook()
		else
			var.ss_city_1 = nil
			search()
		end
	else
		core.safeback(function()
			EnableTriggerGroup("ss_search", true) 
			Execute("er;et;ef;nw;findbook " .. ss_list[context.index].id) 
		end, 1)
	end
end

function location(name, line, wildcards)
	print(wildcards[2])
	var.ss_city = wildcards[2]
	var.ss_loc = wildcards[3]

	if(var.ss_loc == "武庙" or var.ss_loc == "武庙内殿") then 
		search() 
		return 
	end
	
	if(mappings[var.ss_city] ~= nil) then var.ss_city = mappings[var.ss_city] end
	if(var.ss_city == "血刀门" and var.ss_city_1 == "雪山寺") then var.ss_city = "雪山寺" end

	print(var.ss_city .. " ... " .. var.ss_loc)	
	core.busytest(function() 
		EnableTriggerGroup("ss_task", true)
		walk.sl(var.ss_city, var.ss_loc, notfound, searchbook, foundnpc) 
	end, 1)
end

-- 走完都没找到
function notfound()
	fight.stop()
	--如果walkaround走完还没找到，就retry吧
	print("走完还没找到")
	core.safehalt(function()
		walk.walkaround(3, nil, searchbook, searchbook, foundnpc)
	end, 1)
end

function foundnpc()
	EnableTriggerGroup("ss_search", false)
	--Execute("maoli")
	config.set_menpai(var.ss_menpai)
	if(var.ss_kill == "1") then
		timer.tickonce("action", 1.5, function()
			if(var.ss_task_status == "done" or fight.infight()) then return end
			core.safehalt(function()
				var.ss_kill = 0
				EnableTriggerGroup("ss_search", true)
				walk.walkaround(2, nil, searchbook, searchbook, foundnpc)
			end, 1)
		end)
	else
		Execute("touxi " .. var.ss_id)
		startFight()
	end
end

function getbook()
	var.ss_kill = 0
	var.ss_task_status = "done"
	core.safehalt(function()
		kantou(function()
			--Execute("get all from corpse;drop gold;get 19 gold")
			Execute("get all from corpse")
			wait.make(function()
				local l, w = wait.regexp("^(> )*你从.*的.*尸体身上搜出一本(.*)。$", 2)
				if(l) then combine(w[2]) else done() end
			end)
			--done()
		end)
	end, 1)
end

function combine(book)
	local t = ss_map[book]

	local fullname = string.match(t.id, '(%a+)%d')
	if fullname then
		Execute("combine " .. fullname .. ";chayue " .. fullname)
		done()
	else
		if(t and t.npc and npc_loc[t.npc]) then
			walk.run(npc_loc[t.npc].loc, 
					function() 
						Execute("give " .. t.id .. " to " .. npc_loc[t.npc].id)
						done()
					end, done, done)
		else
			done()
		end
	end
end

-------- sstask 跑了，在原地范围内进行深度为5的遍历-----------------------------------
function followTask(name, line, wildcards)
	print("sstask 往【" .. wildcards[3] .. "】跑了")
	local dir = wildcards[3]
	dir = dir:gsub("边",""):gsub("面", ""):gsub("方向", ""):gsub("方", "")
	var.ss_escape_dir = dir
	--timer.stop("action")
	--if(walk.stopped()) then 
		timer.tickonce("action", 1, function() searchTask() end)
		--searchTask() 
	--end
end

function searchTask()
	EnableTriggerGroup("ss_search", true)
	core.safehalt(function()
		print("从 " .. var.ss_escape_dir .. " 开始walkaround" )
		if(var.ss_task_status == "done") then return end
		Execute("er;et;ef")
		walk.walkaround(3, var.ss_escape_dir, searchbook, searchbook, foundnpc)
		wait.make(function()
			wait.time(2)
			--print("fight")
			fight.start()
		end)
	end, 1)
end

function startFight()
	walk.abort()
	timer.stop("action")
	local busy_list = config.busy_list2
	local attack_list = config.attack_list5
	fight.prepare(busy_list, attack_list, nil, var.ss_menpai)
	fight.start()
end


function available()
	return tonumber(var.ss_available_time) < os.time()
end

function done()
	init()
	core.safeback(function()
		Execute("er;et;ef")
		if(var.ss_stop ~= "1") then
			var.ss_available_time = os.time()
		end
		clean(context.f_done)
	end, 1)
end

function fail()
	init()
	core.safeback(function()
		Execute("er;et;ef")
		var.ss_available_time = os.time() + 1200
		--var.reconnect_required = 1
		clean(function() jicun(function() reconn2(context.f_fail) end) end)
	end, 1)
end

function clean(f)
	if(var.ss_give_dummy == "1") then
		give_dummy(function() me.qfull(f) end)
	else
		me.qfull(f)
	end
end

function give_dummy(f)
	wait.make(function()
		for k, v in pairs(shenshu_list) do
			if(v.num == 1) then 
				Execute("give " .. v.name .. " to " .. var.ss_dummy) 
			else
				for i = 1, v.num do
					Execute("give " .. v.name .. i .. " to " .. var.ss_dummy)
					wait.time(0.15)
				end
			end
		end

		repeat
			Execute("tell " .. var.ss_dummy .. " shenshu")
			local l, w = wait.regexp("^(> )*.*给你一本(.*)。$", 2)
			if(l ~= nil) then Execute("chayue " .. shenshu_list[w[2]].name) end
		until(l == nil)
		
		call(f)
	end)
end

function auto()
	local f = nil
	f = function()			
		local t = tonumber(var.ss_available_time) - os.time()
		print("重启等待ms: " .. t)
		wait.make(function()
			if(t > 0) then wait.time(t) else wait.time(2) end
			main(f, f)
		end)
	end

	main(f, f)
end

init()