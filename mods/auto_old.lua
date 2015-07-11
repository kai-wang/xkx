require "var"
require "tprint"
require "wait"

module ("auto", package.seeall)

local context = {}
local tasks = {
	---------------- task -----------------
	[1] = {
		name = "贝海石",	
		main = function(f_next)
			bei.main(f_next, f_next)
		end,
		wait = "task_available_time",
		idle = 300
	},

	[2] = {
		name = "guanfu",
		main = function(f_next)
			guanfu.main(f_next, f_next)
		end,
		wait = "gf_available_time",
		idle = 300
	},

	[3] = {
		name = "dig",
		main = function(f_next)
			dig.main(f_next, f_next)
		end,
		wait = "dig_available_time",
		idle = 180
	},

	[4] = {
		name = "baobiao",
		main = function(f_next)
			baobiao.main(f_next, f_next)
		end,
		wait = "bb_available_time",
		idle = 60
	},
}

function nexttask(tbl)
	return function()
		table.sort(tbl, function(k1, k2) return tonumber(GetVariable(tasks[k1].wait)) < tonumber(GetVariable(tasks[k2].wait)) end)
		--print(tasks[tbl[1]])
		local t = tasks[tbl[1]]
		local diff = tonumber(GetVariable(t.wait)) - os.time()
		
		if(diff > 0) then 
			wait.make(function()
				print("----------下个任务: 【" .. t.name .. "】在 【" .. diff .. "】 秒后开始----------")
				wait.time(diff)
				anti_idle(t.idle)
				t.main(nexttask(tbl))
			end)
		else
			anti_idle(t.idle)
			t.main(nexttask(tbl))
		end
	end
end

-- bei + guanfu ------
function start() 
	call(nexttask())
end

function diggf()
	local t = {2,3,4}
	context.action = auto.diggf
	ts.new("auto", "auto", 59, "auto.restart\(\)")
	ts.tick("auto")
	call(nexttask(t))
end

function digbb()
	local t = {3,4}
	--context.action = auto.diggf
	--ts.new("auto", "auto", 59, "auto.restart\(\)")
	--ts.tick("auto")
	call(nexttask(t))
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
	call(context.action)
end