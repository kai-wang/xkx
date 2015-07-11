require "var"
require "tprint"
require "wait"

module ("auto", package.seeall)

local context = {}
local tasks = {
	---------------- task -----------------
	["task"] = {
		name = "����ʯ",	
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
				return 19
			end
		end
	},

	["guanfu"] = {
		name = "guanfu",
		main = function(f_next)
			anti_idle(300)
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
				print("�ٸ�����������")
				if(var.hp_star_guanfu ~= "1") then return 10 else return -1 end
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
				print("���ڳ���������")
				if(var.hp_star_bb ~= "1") then return 10 else return 4 end
			else
				if(var.hp_star_bb ~= "1") then return 10 else return 6 end
			end
		end
	},
	
	["wei"] = {
		name = "wei",
		main = function(f_next)
			anti_idle(120)
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
				print("ΤС�����񳬹�������")
				if(var.hp_star_wei ~= "1") then return 10 else return -1 end
			else
				if(var.hp_star_wei ~= "1") then return 10 else return 5 end
			end
		end
	},
	
	["shan"] = {
		name = "shan",
		main = function(f_next)
			anti_idle(120)
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
				print("�������񳬹�������")
				if(var.hp_star_shan ~= "1") then return 10 else return -1 end
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
				print("�������񳬹�������")
				if(var.hp_star_guo ~= "1") then return 10 else return -1 end
			else
				if(var.hp_star_guo ~= "1") then return 10 else return 5 end
			end
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
			if(tonumber(var.hp_qn) > tonumber(var.hp_qn_max)) then return 0 else return os.time() + 1800 end
		end,
		
		priority = function()
			if(tonumber(var.hp_qn) > tonumber(var.hp_qn_max)) then return 20 else return 1 end
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
				print("priority " .. priority)
			end
		end
	end
	
	return t, diff
end

function nexttask(tbl)
	return function()
		local t, w = getnexttask(tbl)
		
		if(t == nil) then
			print("----------�¸������� >>>>>>" .. w .. "<<<<<< ���ʼ----------")
			anti_idle(w)
			--[[wait.make(function()
				--local fn = nexttask(tbl)
				print("----------�¸������� >>>>>>" .. w .. "<<<<<< ���ʼ----------")
				wait.time(w)
				call(nexttask(tbl))
			end)]]--
		else
			wait.make(function()
				wait.time(1)
				print("----------start to do " .. t.name .. "----------")
				t.main(nexttask(tbl))
			end)
		end
	end
end

-- bei + guanfu ------
function start()
	local auto_list = me.profile.auto_list
	ts.new("auto", "auto", 59, "auto.restart\(\)")
	ts.reset("auto", 59)
	ts.tick("auto")
	call(nexttask(auto_list))
end

function stop()
	ts.stop("auto")
end

function anti_idle(tick)
	print("wait .. " .. tick)
	ts.reset("auto", tick)
	ts.tick("auto")
end

function restart()
	stop()
	for i = 1, #tasks do
		tasks[i].clear()
	end
	
	call(start)
end

stop()