require "wait"
require "tprint"
require "var"

module ("auto", package.seeall)

local tasks = {}

tasks[1] = {
	name = "bei",
	available = true,
	start = function()
		msg.subscribe("msg_bei_exit", auto.do_next)
		msg.subscribe("msg_bei_available", function() push("bei") end)
		bei.main()
	end,
	stop = function()
		msg.unsubscribe("msg_bei_exit")
		msg.unsubscribe("msg_bei_available")
	end
}

-----------------------开始挂机-----------------------------------------
function start()
	for i, v in ipairs(tasks) do
		v.available = true
	end
	
	do_next()
end

-----------------------停止挂机------------------------------------------
function stop()
	for i, v in ipairs(tasks) do
		v.stop()
	end
end

function do_next()
	local t = pop()
	
	if(t ~= nil) then 
		var.auto_currentTask = t.name
		t.available = false
		print("开始做任务：" .. t.name)
		t.start()
	else
		--当前没有能做的task，就先等着吧
		var.auto_currentTask = "unknown"
	end
end

function pop()
	for i, v in ipairs(tasks) do
		--可以在variable里设置是否需要挂机，比如auto_bei--------
		local auto_flag = GetVariable("auto_" .. v.name)
		if(v.available and auto_flag == "true") then return v end
	end
end

function push(name)
	print(name .. "可以做了")
	for i, v in ipairs(tasks) do
		if(v.name == name) then 
			v.available = true 
			break 
		end
	end
	
	--任务队列如果已经空了，需要触发一下do_next----------
	if(var.auto_currentTask == "unknown") then
		print("当前任务队列空了")
		do_next()
	end
end