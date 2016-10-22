require "wait"
require "tprint"
require "var"
require "bit"
require "socket"
require("worlds\\xkx\\mods\\core")

module ("xiao", package.seeall)

local cxt = {}
local emitter = require("worlds\\xkx\\mods\\emitter"):new()

function init()
	EnableTriggerGroup("xiao_ask", false)
	EnableTriggerGroup("xiao", false)
	EnableTriggerGroup("xiao_fight", false)
	EnableTriggerGroup("xiao_halt", false)
end

function main(f_ok, f_fail)
	cxt = {}
	cxt.f_ok = f_ok
	cxt.f_fail = f_fail
	var.xiao_start = 0
	var.xiao_retry_times = 0
	var.xiao_action = ""
	var.xiao_level = 1
	var.xiao_rewalk_times = 0
	var.walk_danger_level = var.xiao_walk_danger_level

	EnableTriggerGroup("xiao_ask", true)
	EnableTriggerGroup("xiao", false)
	EnableTriggerGroup("xiao_fight", false)
	EnableTriggerGroup("xiao_halt", false)

	capture("set brief;fly lz;s;w;ask xiao about job", start, fail)
end

function start()
	if var.xiao_start ~= "1" then return fail() end
	EnableTriggerGroup("xiao_ask", false)
	EnableTriggerGroup("xiao", true)
	EnableTriggerGroup("xiao_fight", false)

	timer.stop("action")
	walk.sl(var.xiao_city, var.xiao_loc, notfound, rewalk, foundnpc)
end

function fail()
	core.busytest(function()
		if(var.xiao_full ~= "1") then 
			Execute("fly lz;s;w;ask xiao about fail;fly wm")
			var.xiao_available_time = os.time() + 125
		end
		
		exit()
		me.cleanup(function() call(cxt.f_fail) end)
	end)
end

function done()
	var.xiao_available_time = os.time()
	exit()
	me.cleanup(function() call(cxt.f_ok) end)
end

function rewalk()
	var.xiao_rewalk_times = tonumber(var.xiao_rewalk_times) + 1
	if(tonumber(var.xiao_rewalk_times) > 3) then
		fail()
	else
		core.safeback(function()
			timer.tick("action", 5, function() start() end)
		end, 1)
	end
end

function exit()
	EnableTriggerGroup("xiao_ask", false)
	EnableTriggerGroup("xiao", false)
	EnableTriggerGroup("xiao_fight", false)
	timer.stop("action")
end

function foundnpc()
	var.xiao_found = true
	if(var.xiao_action == "�ܻ�" or var.xiao_action == "����") then
		if(var.xiao_killer_heal == "false") then
			startKill()
		else
			startTouxi()
		end
	else
		startFight()
	end
end

-- ���궼û�ҵ�
function notfound()
	var.xiao_found = false
	fight.stop()
	timer.stop("action")
	--���walkaround���껹û�ҵ�����retry��
	print("���껹û�ҵ�")
	core.safehalt(function()
		walk.walkaround(5, nil, rewalk, rewalk, foundnpc)
	end, 1)
end

function startFight()
	timer.stop("action")
	listen()
	local busy_list = config.busy_list
	local attack_list = config.attack_list3
	fight.prepare(busy_list, attack_list, escape)
	fight.start("fight shashou")
	EnableTriggerGroup("xiao_fight", true)
	EnableTriggerGroup("xiao_halt", true)
end

function startKill()
	timer.stop("action")
	listen()
	local busy_list = config.busy_list
	local attack_list = config.attack_list2
	fight.prepare(busy_list, attack_list, escape)
	fight.start("touxi shashou")
	EnableTriggerGroup("xiao_fight", true)
end

function startTouxi()
	timer.stop("action")
	listen()
	local busy_list = config.busy_list
	local attack_list = config.attack_list2
	fight.prepare(busy_list, attack_list, escape)
	fight.start("touxi shashou")
	EnableTriggerGroup("xiao_fight", true)
end

function listen()
	emitter:once("xiao_fight_end", function()
		print("xiao_fight_end : " .. emitter:listenerCount("xiao_fight_end"))
		if(var.xiao_action == "�ܻ�" or var.xiao_action == "����") then
			core.safehalt(function()
				startTouxi()
			end, 1)
		else
			if(var.xiao_action == "����") then
				Execute("ask shashou about ����")
			else
				core.safehalt(function()
					Execute("quan shashou")
				end, 1)
			end
		end
	end)
end

function fightend()
	emitter:emit("xiao_fight_end")
end

function fighthalt()
	if(var.xiao_action == "����") then
		fight.halt(function() Execute("ask shashou about ����") end)
	elseif(var.xiao_action == "Ȱ") then
		fight.halt(function() Execute("quan shashou") end)
	end
end

function retry()
	print("retry")
	EnableTriggerGroup("xiao_fight", false)
	EnableTriggerGroup("xiao", false)
	me.updateHP(function()
		heal(function()
			var.xiao_retry_times = tonumber(var.xiao_retry_times) + 1
			print("retry times: " .. var.xiao_retry_times)
			local threshold = var.xiao_retry_threshold or 6
			if(tonumber(var.xiao_retry_times) > tonumber(threshold)) then
				return fail()
			end
			core.busytest(function()
				EnableTriggerGroup("xiao", true)
				walk.walkaround(2, var.xiao_escape_dir, notfound, rewalk, foundnpc)
			end)
		end)
	end)
end


function heal(f_done)
	core.busytest(function()
		local startTime = os.time()
		dazuo.start(function()
		--	Execute("halt;er;ef;et")
			local endTime = os.time()
			cxt.heal = false
			if(endTime - startTime < 2) then
				timer.tickonce("action", 5, function()
					call(f_done)
				end)
			else
				call(f_done)
			end
		end)
	end)
end

function kill()
	timer.stop("action")
	local busy_list = config.busy_list
	local attack_list = config.attack_list2
	fight.prepare(busy_list, attack_list, escape)
	fight.start("kill shashou")
	EnableTriggerGroup("xiao_fight", true)
end

function escape()
	core.safeback(function()
		Execute("er;et;ef")
		me.cleanup(start)
	end, 1)
end

-------- task ���ˣ���ԭ�ط�Χ�ڽ������Ϊ5�ı���-----------------------------------
function search(name, line, wildcards)
	if(var.xiao_found == "true") then
		print("task ����" .. wildcards[2] .. "������")
		local dir = wildcards[2]
		dir = dir:gsub("��",""):gsub("��", ""):gsub("����", ""):gsub("��", "")
		var.xiao_escape_dir = dir
		var.xiao_found = false
		timer.stop("action")
		if(walk.stopped()) then searchKiller() end
	end
end

function searchKiller()
	--DeleteTemporaryTriggers()
	timer.stop("action")
	--Execute("halt")
	core.safehalt(function()
		print("�� " .. var.xiao_escape_dir .. " ��ʼwalkaround" )
		Execute("er;et;ef")
		walk.walkaround(3, var.xiao_escape_dir, notfound, rewalk, foundnpc)
	end, 1)
end

function finish()
	if(var.xiao_action == "�ܻ�") then
		Execute("look")
		fight.halt(function()
			Execute("get " .. var.xiao_npc_id)
			Execute("fly lz;s;w;give xiao " .. var.xiao_npc_id)
			done()
		end)
	elseif(var.xiao_action == "����") then
		core.safehalt(function()
			Execute("wield dao;enable blade xue-dao;kantou corpse;unwield all;fly lz;s;w;give xiao head")
			done()
		end, 1)
	else
		core.safehalt(function()
			Execute("fly lz;s;w;ask xiao about finish")
			done()
		end, 1)
	end
end


function auto()
	--wait.make(function()
		local f = nil
		f = function()
			local t = tonumber(var.xiao_available_time) - os.time()
			print("�����ȴ�ms: " .. t)
			wait.make(function()
				if(t > 0) then wait.time(t) else wait.time(2) end
				me.useqn(function() double(function() main(f, f) end) end)
			end)
		end

		me.useqn(function() double(function() main(f, f) end) end)
	--end)
end

init()
