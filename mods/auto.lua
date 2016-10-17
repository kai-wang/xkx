require "var"
require "tprint"
require "wait"

module ("auto", package.seeall)

local context = {}
local tasks = {
	---------------- task -----------------
	["task"] = {
		name = "贝海石",	
		main = function(f_next)	
			anti_idle(300)
			bei.main(f_next, f_next)
		end,
		
		wait = function()
			if(var.task_available_time == nil) then return os.time() else return tonumber(var.task_available_time) end
		end,
		
		clear = function()
			task.init()
		end,
		
		priority = function()
			if(var.task_available_time ~= nil and tonumber(var.task_available_time) - os.time() > 30) then
				return 9
			else
				return 17
			end
		end
	},

	["wait_10"] = {
		name = "task 10秒内开始",	
		main = function(f_next)	
			anti_idle(30)
			local diff = tonumber(var.task_available_time) - os.time()
			if(diff > 0) then wait.time(diff) end
			call(f_next)
		end,
		
		wait = function()
			return os.time()
		end,
		
		clear = function()
		end,
		
		priority = function()
			local diff = tonumber(var.task_available_time) - os.time()
			if(var.double_bonus ~= "true" and and diff > 0 and diff < 10) then
				return 16
			else
				return -1
			end
		end
	},

	["guanfu"] = {
		name = "guanfu",
		main = function(f_next)
			anti_idle(180)
			guanfu.main(f_next, f_next)
		end,
		
		clear = function()
			guanfu.init()
		end,
		
		wait = function()
			if(var.gf_available_time == nil) then return os.time() else return tonumber(var.gf_available_time) end
		end,
		
		priority = function()
			-- exceed the limit
			if(var.gf_amount ~= nil and var.gf_amount_limit ~= nil and tonumber(var.gf_amount) > tonumber(var.gf_amount_limit)) then
				print("官府超过上限了")
				--if(var.hp_star_guanfu ~= "1") then return 10 else return -1 end
				if(var.hp_star_guanfu ~= "1") then return 10 else return 1 end
			else
				if(var.hp_star_guanfu ~= "1") then return 10 else return 6 end
			end
			--if(var.hp_star_gf ~= nil and var.hp_star_gf ~= "") then return 5 else return 7 end
		end
	},

	["dig"] = {
		name = "dig",
		main = function(f_next)
			anti_idle(120)
			dig.main(f_next, f_next)
		end,
		
		clear = function()
			dig.init()
		end,
		
		wait = function()
			if(var.dig_available_time == nil) then return os.time() else return tonumber(var.dig_available_time) end
		end,
		
		priority = function()
			if(tonumber(var.hp_exp) > 1000000) then return -1 else return 9 end
		end
	},

	["baobiao"] = {
		name = "baobiao",
		main = function(f_next)
			anti_idle(90)
			baobiao.main(f_next, f_next)
		end,
		
		clear = function()
			baobiao.init()
		end,
		
		wait = function()
			if(var.bb_available_time == nil) then return os.time() else return tonumber(var.bb_available_time) end
		end,
		
		priority = function()
			if(var.bb_amount ~= nil and var.bb_amount_limit ~= nil and tonumber(var.bb_amount) > tonumber(var.bb_amount_limit)) then
				print("保镖超过上限了")
				if(var.hp_star_bb ~= "1") then return 10 else return 4 end
			else
				if(var.hp_star_bb ~= "1") then return 10 else return 6 end
			end
		end
	},
	
	["wei"] = {
		name = "wei",
		main = function(f_next)
			anti_idle(60)
			wei.main(f_next, f_next)
		end,
		
		clear = function()
			wei.init()
		end,
		
		wait = function()
			if(var.wei_available_time == nil) then return os.time() else return tonumber(var.wei_available_time) end
		end,
		
		priority = function()
			if(var.wei_amount ~= nil and var.wei_amount_limit ~= nil and tonumber(var.wei_amount) > tonumber(var.wei_amount_limit)) then
				print("韦小宝任务超过上限了")
				if(var.hp_star_wei ~= "1") then return 10 else return -1 end
			else
				if(var.hp_star_wei ~= "1") then return 10 else return 5 end
			end
		end
	},
	
	["shan"] = {
		name = "shan",
		main = function(f_next)
			anti_idle(60)
			shan.main(f_next, f_next)
		end,
		
		clear = function()
			shan.init()
		end,
		
		wait = function()
			if(var.shan_available_time == nil) then return os.time() else return tonumber(var.shan_available_time) end
		end,
		
		priority = function()
			if(var.shan_amount ~= nil and var.shan_amount_limit ~= nil and tonumber(var.shan_amount) > tonumber(var.shan_amount_limit)) then
				print("单正任务超过上限了")
				if(var.hp_star_shan ~= "1") then return 10 else return 2 end
			else
				if(var.hp_star_shan ~= "1") then return 10 else return 5 end
			end
		end
	},
	
	["guo"] = {
		name = "guo",
		main = function(f_next)
			anti_idle(360)
			guo.main(f_next, f_next)
		end,
		
		clear = function()
			guo.init()
		end,
		
		wait = function()
			if(var.guo_available_time == nil) then return os.time() else return tonumber(var.guo_available_time) end
		end,
		
		priority = function()
			if(var.guo_amount ~= nil and var.guo_amount_limit ~= nil and tonumber(var.guo_amount) > tonumber(var.guo_amount_limit)) then
				print("郭靖任务超过上限了")
				if(var.hp_star_guo ~= "1") then return 10 else return -1 end
			else
				if(var.hp_star_guo ~= "1") then return 10 else return 5 end
			end
		end
	},

	["xiao"] = {
		name = "xiao",
		main = function(f_next)
			anti_idle(180)
			xiao.main(f_next, f_next)
		end,
		
		clear = function()
			xiao.init()
		end,
		
		wait = function()
			if(var.xiao_full == "1") then return os.time() + 1800 end
			if(var.xiao_available_time == nil) then return os.time() else return tonumber(var.xiao_available_time) end
		end,
		
		priority = function()
			-- exceed the limit
			return 19
		end
	},

	["sstask"] = {
		name = "sstask",
		main = function(f_next)
			anti_idle(180)
			double(function() ss.main(f_next, f_next) end)
		end,
		
		clear = function()
			ss.init()
		end,
		
		wait = function()
			if(var.ss_available_time == nil) then return os.time() else return tonumber(var.ss_available_time) end
		end,
		
		priority = function()
			-- exceed the limit
			if(var.double_bonus == "true") then return 13 else return 15 end
			--return 15
		end
	},

	["wine"] = {
		name = "wine",
		main = function(f_next)
			anti_idle(15)
			drink_wine(f_next)
		end,
		
		clear = function()
		end,
		
		wait = function()
			if(var.drink_wine == "1") then return os.time() else return os.time() + 1800 end
		end,
		
		priority = function()
			-- exceed the limit
			if(var.drink_wine == "1") then return 29 else return -1 end
		end
	},
	
	["event"] = {
		name = "event",
		main = function(f_next)
			anti_idle(600)
			event.main(f_next, f_next)
		end,
		
		clear = function()
			event.init()
		end,
		
		wait = function()
			if(var.event_flag == "true") then return 0 else return os.time() + 1800 end
		end,
		
		priority = function()
			if(var.event_flag == "true") then return 30 else return -1 end
		end
	},
	
	["study"] = {
		name = "study",
		main = function(f_next)
			anti_idle(600)
			study.main(f_next, f_next)
		end,
		
		clear = function()
			study.init()
		end,
		
		wait = function()
			if(tonumber(var.hp_qn) >= tonumber(var.hp_qn_max)) then return 0 else return os.time() + 1800 end
		end,
		
		priority = function()
			if(tonumber(var.hp_qn) >= tonumber(var.hp_qn_max)) then return 25 else return 1 end
		end
	},

	["gamble_study"] = {
		name = "gamble_study",
		main = function(f_next)
			anti_idle(600)
			study.main(f_next, f_next)
		end,
		
		clear = function()
			study.init()
		end,
		
		wait = function()
			if(tonumber(var.hp_qn) >= tonumber(var.study_threshold)) then return 0 else return os.time() + 1800 end
		end,
		
		priority = function()
			if(tonumber(var.hp_qn) >= tonumber(var.study_threshold)) then return 25 else return 1 end
		end
	},
	
	["double"] = {
		name = "double",
		main = function(f_next)
			anti_idle(10)
			double(f_next)
		end,
		
		clear = function()
			---var.double_bonus = false
		end,
		
		wait = function()			
			if(var.double_available_time == nil) then return os.time() else return tonumber(var.double_available_time) end
		end,
		
		priority = function()
			return 20
		end
	},
	
	["reconnect"] = {
		name = "reconnect",
		main = function(f_next)
			anti_idle(30)
			reconn(f_next)
		end,
		
		clear = function()
			---var.double_bonus = false
		end,
		
		wait = function()	
			if(var.reconnect_required == "1") then
				return os.time() 
			else
				return os.time() + 900
			end
		end,
		
		priority = function()
			return 22
		end
	}
}

-- task policy implemented here ---------------------------
function getnexttask(tbl)
	--table.sort(tbl, function(k1, k2) return tonumber(tasks[k1].wait()) < tonumber(tasks[k2].wait()) end)
	
	local t, now, priority, diff = nil, os.time(), 0, 1800
	for i = 1, #tbl do
		local f = tasks[tbl[i]]
		local d = f.wait() - now
		--print("------task : " .. f.name .. " will start in " .. d .. " seconds from now------")
		if(d > 0) then
			if(d < diff) then diff = d end
		else
			if(tasks[tbl[i]].priority() > priority) then
				t = tasks[tbl[i]]
				priority = t.priority()
				print("【任务】" .. t.name .. " 【优先级】 " .. priority)
			end
		end
	end
	
	return t, diff
end

function nexttask(tbl)
	if(var.auto_stop ~= "1") then
	return function()
		local t, w = getnexttask(tbl)
		
		if(t == nil) then
			print("----------下个任务【" .. t.name .. "】>>>>>>" .. w .. "<<<<<< 秒后开始----------")
			anti_idle(w)
		else
			wait.make(function()
				wait.time(2)
				print("----------start to do " .. t.name .. "----------")
				t.main(nexttask(tbl))
			end)
		end
	end
	end
end

-- bei + guanfu ------
function start()
	local auto_list = config.auto_list
	var.auto_stop = 0
	timer.create("auto", "auto", 59, function() auto.restart() end)
	timer.tick("auto", 59, function() auto.restart() end)
	call(nexttask(auto_list))
end

function stop()
	var.auto_stop = 1
	timer.stop("auto")
end

function anti_idle(tick)
	print("wait .. " .. tick)
	timer.tick("auto", tick, 
				function() 
					core.safeback(function() auto.restart() end, 1) 
				end)
end

function restart()
	print("restart")
	stop()
	for i = 1, #tasks do
		tasks[i].clear()
	end
	
	call(start)
end

function init()
	stop()
	timer.delete("auto")
end

init()