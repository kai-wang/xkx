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

-----------------------��ʼ�һ�-----------------------------------------
function start()
	for i, v in ipairs(tasks) do
		v.available = true
	end
	
	do_next()
end

-----------------------ֹͣ�һ�------------------------------------------
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
		print("��ʼ������" .. t.name)
		t.start()
	else
		--��ǰû��������task�����ȵ��Ű�
		var.auto_currentTask = "unknown"
	end
end

function pop()
	for i, v in ipairs(tasks) do
		--������variable�������Ƿ���Ҫ�һ�������auto_bei--------
		local auto_flag = GetVariable("auto_" .. v.name)
		if(v.available and auto_flag == "true") then return v end
	end
end

function push(name)
	print(name .. "��������")
	for i, v in ipairs(tasks) do
		if(v.name == name) then 
			v.available = true 
			break 
		end
	end
	
	--�����������Ѿ����ˣ���Ҫ����һ��do_next----------
	if(var.auto_currentTask == "unknown") then
		print("��ǰ������п���")
		do_next()
	end
end