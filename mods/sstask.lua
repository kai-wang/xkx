require "wait"
require "tprint"
require "utils"
require "var"

module ("ss", package.seeall)


local ss_list = {}
local ss_map = {}
local context = {}
local mappings = {
	["��ѩɽ"] = "Ѫ����",
	["������"] = "����",
	["���ݳ�"] = "����",
	["���ݳ�"] = "����",
	["���ݳ�"] = "����",
	["������"] = "����",
	["Ȫ�ݳ�"] = "Ȫ��",
	["���ݳ�"] = "����",
	["��ɽ��"] = "��ɽ",
	["�书��"] = "�书",
	["������"] = "����",
	["���˳�"] = "����",
	["������"] = "����",
	["��ң��"] = "��ң��",
	["�ʹ�����"] = "�Ͻ���"
}

local npc_loc = {
	["����"] = { loc="fly wm;e", id="guo jing" },
	["��ӹ"] = { loc="fly wm;u", id="jin yong" },
	["���"] = { loc="fly gm", id="yang guo" },
	["ʯ����"] = { loc="fly wm;e;n;e;e;e;e", id="shi potian" },
	["���޼�"] = { loc="fly mj", id="zhang wuji" },
	["����"] = { loc="fly lz;s;w", id="duan yu" },
	["����"] = { loc="fly lz;s;w", id="xiao feng" },
	["����"] = { loc="fly lj", id="xu zhu" },
	["ΤС��"] = { loc="fly wm;e;s;s;s;e;u", id="wei xiaobao" },
	["������"] = { loc="fly xx;su;s;ed", id="li wenxiu" },
	["�����"] = { loc="fly ws;sd;su;su;enter", id="linghu chong"}
}

local shenshu_list = {
	["�ɺ��⴫"] = { name = "fhwz", num = 3 },
	["ѩɽ�ɺ�"] = { name = "xsfh", num = 2 },
	["���Ǿ�"] = { name = "lcjue", num = 2 },
	["�����˲�"] = { name = "tlbb", num = 5 },
	["���Ӣ�۴�"] = { name = "sdyxz", num = 4 },
	["����Х����"] = { name = "bmxxfeng", num = 1 },
	["¹����"] = { name = "ldji", num = 5 },
	["Ц������"] = { name = "xajh", num = 4 },
	["�齣����¼"] = { name = "sjec", num = 3 },
	["�������"] = { name = "sdxl", num = 4 },
	["������"] = { name = "xkx", num = 3 },
	["����������"] = { name = "yttlj", num = 4 },
	["��Ѫ��"] = { name = "bxsword", num = 3 },
	["ԧ�쵶"] = { name = "yyblade", num = 1 }
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
		if(var.ss_city == "Ѫ����") then 
			context.search_failed_times = 0
			var.ss_city_1 = "ѩɽ��"
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

	if(var.ss_loc == "����" or var.ss_loc == "�����ڵ�") then 
		search() 
		return 
	end
	
	if(mappings[var.ss_city] ~= nil) then var.ss_city = mappings[var.ss_city] end
	if(var.ss_city == "Ѫ����" and var.ss_city_1 == "ѩɽ��") then var.ss_city = "ѩɽ��" end

	print(var.ss_city .. " ... " .. var.ss_loc)	
	core.busytest(function() 
		EnableTriggerGroup("ss_task", true)
		walk.sl(var.ss_city, var.ss_loc, notfound, searchbook, foundnpc) 
	end, 1)
end

-- ���궼û�ҵ�
function notfound()
	fight.stop()
	--���walkaround���껹û�ҵ�����retry��
	print("���껹û�ҵ�")
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
				local l, w = wait.regexp("^(> )*���.*��.*ʬ�������ѳ�һ��(.*)��$", 2)
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

-------- sstask ���ˣ���ԭ�ط�Χ�ڽ������Ϊ5�ı���-----------------------------------
function followTask(name, line, wildcards)
	print("sstask ����" .. wildcards[3] .. "������")
	local dir = wildcards[3]
	dir = dir:gsub("��",""):gsub("��", ""):gsub("����", ""):gsub("��", "")
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
		print("�� " .. var.ss_escape_dir .. " ��ʼwalkaround" )
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
			local l, w = wait.regexp("^(> )*.*����һ��(.*)��$", 2)
			if(l ~= nil) then Execute("chayue " .. shenshu_list[w[2]].name) end
		until(l == nil)
		
		call(f)
	end)
end

function auto()
	local f = nil
	f = function()			
		local t = tonumber(var.ss_available_time) - os.time()
		print("�����ȴ�ms: " .. t)
		wait.make(function()
			if(t > 0) then wait.time(t) else wait.time(2) end
			main(f, f)
		end)
	end

	main(f, f)
end

init()