require "wait"
require "tprint"
require "utils"
require "var"

module ("ss", package.seeall)


local ss_list = {}
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

function init() 
	EnableTriggerGroup("ss_update", false)
	EnableTriggerGroup("ss_search", false)
	EnableTriggerGroup("ss_task", false)
end

function start()
	EnableTriggerGroup("ss_update", true)
	context.index = 0
	var.walk_danger_level = 4
	var.ss_city_1 = nil
	ss_list = {}
	busy_test(function() Execute("sstask") end)
end

function update(name, line, wildcards)
	local npc, name, id, finished = wildcards[1], wildcards[2], wildcards[3], wildcards[4]
	if(finished == nil or finished == "") then
		table.insert(ss_list, {id=id, name=name, npc=npc, finished=false})
	else
		table.insert(ss_list, {id=id, name=name, npc=npc, finished=true})
	end

end

function display()
	tprint(ss_list)
end

function search()
	--context.index = context.index + 1
	search_next()
end

function search_next()
	context.index = context.index + 1
	if(context.index > #ss_list) then return fail() end

	if(not ss_list[context.index].finished) then 
		context.search_failed_times = 0
		searchbook() 
	else 
		search_next()
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
			search_next()
		end
	else
		busy_test(function()
			EnableTriggerGroup("ss_search", true) 
			Execute("er;et;ef;findbook " .. ss_list[context.index].id) 
		end)
	end
end

function location(name, line, wildcards)
	var.ss_city = wildcards[2]
	var.ss_loc = wildcards[3]
	
	if(mappings[var.ss_city] ~= nil) then var.ss_city = mappings[var.ss_city] end
	if(var.ss_city == "血刀门" and var.ss_city_1 == "雪山寺") then var.ss_city = "雪山寺" end

	print(var.ss_city .. " ... " .. var.ss_loc)
	EnableTrigger("ss_search", false)
	
	busy_test(function() 
		EnableTriggerGroup("ss_task", true)
		walk.sl(var.ss_city, var.ss_loc, notfound, searchbook, foundnpc) 
	end)
end

-- 走完都没找到
notfound = function()
	fight.stop()
	Execute("halt")
	--如果walkaround走完还没找到，就retry吧
	print("走完还没找到")
	busy_test(function()
		walk.walkaround(3, nil, searchbook, searchbook, foundnpc)
	end)
end

foundnpc = function()
	Execute("maoli")
	if(var.ss_kill == "1") then
		timer.tickonce("action", 1.5, function()
			if(var.ss_task_status == "done" or fight.infight()) then return end
			Execute("halt;er;et;ef")
			walk.walkaround(2, nil, searchbook, searchbook, foundnpc)
		end)
	else
		Execute("touxi " .. var.ss_id)
		startFight()
	end
end

getbook = function()
	var.ss_kill = 0
	var.ss_task_status = "done"
	busy_test(function() 
		Execute("get all from corpse")
		me.qfull(function() search_next() end)
	end)
end


-------- sstask 跑了，在原地范围内进行深度为5的遍历-----------------------------------
followTask = function(name, line, wildcards)
	print("sstask 往【" .. wildcards[3] .. "】跑了")
	local dir = wildcards[3]
	dir = dir:gsub("边",""):gsub("面", ""):gsub("方向", ""):gsub("方", "")
	var.ss_escape_dir = dir
	timer.stop("action")
	if(walk.stopped()) then searchTask() end
end

searchTask = function()
	busy_test(function()
		print("从 " .. var.ss_escape_dir .. " 开始walkaround" )
		if(var.ss_task_status == "done") then return end
		Execute("er;et;ef")
		walk.walkaround(3, var.ss_escape_dir, searchbook, searchbook, foundnpc)
	end)
end

startFight = function()
	abort_busytest()
	timer.stop("action")
	local busy_list = config.busy_list
	local attack_list = config.attack_list5
	fight.prepare(busy_list, attack_list, nil, var.ss_menpai)
	fight.start()
end

quickfull = function(f_done)
	me.updateHP(function()
		local jsP = tonumber(var.hp_jsP)
		local qxP = tonumber(var.hp_qxP)
		local nl = tonumber(var.hp_nl)
		local nl_max = tonumber(var.hp_nl_max)

		if(jsP < 90 or qxP < 90 or nl < nl_max * 0.8) then
			busy_test(function()
				Execute("set brief;fly wm;e;s;s;s;e;u;quhui 九转银丹;eat yin dan;unset brief")
				busy_test(f_done)
			end)
		end
	end)
end



fail = function()
	print("fail ..... search next")
end

init()