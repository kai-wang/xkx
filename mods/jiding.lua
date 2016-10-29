require "wait"
require "tprint"
require "utils"
require("worlds\\xkx\\mods\\core")

module ("jiding", package.seeall)

local npc_list = dofile("worlds\\xkx\\mods\\npcs.lua")
local jd_rooms = {
    { id = 2285, name = "���޺�" },
    { id = 2286, name = "���޺�" },
    { id = 2288, name = "���޺�" },
    { id = 2296, name = "���޺�" },
    { id = 2297, name = "���޺�" },
    { id = 27, name = "�ݵ�" },
    { id = 28, name = "�ݵ�" },
    { id = 29, name = "����" },
    { id = 52, name = "�ݵ�" },
    { id = 53, name = "����" },
    { id = 54, name = "����" },
    { id = 55, name = "����" },
    { id = 56, name = "����" },
    { id = 57, name = "����" },
    { id = 60, name = "�ݵ�" },
    { id = 61, name = "����" },
    { id = 62, name = "����" },
    { id = 63, name = "����" },
    { id = 78, name = "�ݵ�" },
    { id = 79, name = "����" },
    { id = 80, name = "����" },
    { id = 368, name = "����" },
    { id = 390, name = "����" },
    { id = 570, name = "��ɭ��" },
    { id = 571, name = "��ɭ��" },
    { id = 588, name = "����" },
    { id = 716, name = "�ݵ�" },
    { id = 718, name = "�ݵ�" },
    { id = 719, name = "�ݵ�" },
    { id = 771, name = "�ݵ�" },
    { id = 772, name = "�ݵ�" },
    { id = 773, name = "�ݵ�" },
    { id = 1122, name = "����" },
    { id = 1124, name = "����" },
    { id = 1127, name = "����" },
    { id = 1152, name = "����" },
    { id = 1153, name = "����" },
    { id = 1154, name = "����" },
    { id = 1173, name = "�ݵ�" },
    { id = 1174, name = "�ݵ�" },
    { id = 1589, name = "����" },
    { id = 1590, name = "����" },
    { id = 1591, name = "����" },
    { id = 1642, name = "��ɭ��" },
    { id = 1646, name = "�ݵ�" },
    { id = 1661, name = "����" },
    { id = 1663, name = "����" },
    { id = 1911, name = "�ݵ�" },
    { id = 2031, name = "����" },
    { id = 2032, name = "����" },
    { id = 2178, name = "�ݵ�" },
    { id = 2203, name = "�ݵ�" },
    { id = 2412, name = "����" },
    { id = 2413, name = "����" },
    { id = 2414, name = "����" },
    { id = 2415, name = "����" },
    { id = 2416, name = "����" },
    { id = 2417, name = "����" },
    { id = 2618, name = "����" },
    { id = 2619, name = "����" },
    { id = 2620, name = "����" },
    { id = 2621, name = "����" },
    { id = 2624, name = "����" },
    { id = 2756, name = "����" },
    { id = 2757, name = "����" },
    { id = 2758, name = "����" },
    { id = 2780, name = "����" },
    { id = 2781, name = "����" },
    { id = 2782, name = "����" },
    { id = 2783, name = "����" },
    { id = 2784, name = "����" },
    { id = 2785, name = "����" },
    { id = 2786, name = "����" },
    { id = 2796, name = "�ݵ�" },
    { id = 2896, name = "����" },
    { id = 2897, name = "����" },
    { id = 2902, name = "����" },
    { id = 2903, name = "����" },
    { id = 2904, name = "����" },
    { id = 2905, name = "����" },
    { id = 2925, name = "�ݵ�" },
    { id = 2928, name = "�ݵ�" }
}
local context = {}

function init()
    context.index = 0
    EnableTriggerGroup("jd_ask", false)
    EnableTriggerGroup("jd_kill", false)
    EnableTriggerGroup("jd", false)
end

function main()
	context.f_done = f_done
	context.f_fail = f_fail
	check_ding(search, ask)
end

function ask()
	EnableTriggerGroup("jd_ask", true)
	walk.run("fly xx;n;n", function() Execute("ask ding about ��ľ����") end, fail, fail)

	timer.tickonce("action", 5, function()
        var.jd_available_time = os.time() + 60
        fail()
    end)
end

function ask_fail()
    var.jd_available_time = os.time() + 60
    fail()
end

function kill_jd_npc(name, line, wildcards)
    EnableTriggerGroup("jd_ask", false)
	timer.stop("action")
	var.jd_available_time = os.time() + 300
	var.jd_npc_name = wildcards[2]
	local t = npc_list[var.jd_npc_name]

	if(t == nil or (t.exp ~= nil and tonumber(var.hp_exp) < t.exp)) then 
        print("�Ҳ��� " .. var.jd_npc_name)
        return fail() 
    end

	var.jd_npc_id = t.name
	print(var.jd_npc_name .. " id��" .. var.jd_npc_id .. "��  room��" .. t.room .. "��")

	timer.tickonce("action", 1, function()
		core.busytest(function()
			walk.run(roomAll[t.room].path, kill_jd_npc_start, fail, fail)
		end, 1)
	end)
end

function kill_jd_npc_start()
	timer.tickonce("action", 1, function()
        local busy_list = config.busy_list
		local attack_list = config.attack_list5
		EnableTriggerGroup("jd_kill", true)
		fight.prepare(busy_list, attack_list)
		fight.start("kill " .. var.jd_npc_id)
	end)
end

function kill_jd_npc_end()
    core.busytest(function()
        var.kantou_flag = true
        kantou(function()
            clean(function() Execute("fly xx;n;n;give ding head") end)
        end)
	end)
end

function search()
    context.index = context.index + 1
    if(context.index > #jd_rooms) then return fail() end

    core.safehalt(function()
        walk.run(roomAll[roomId].path, function() Execute("ji ding") end, search, search)
    end)
end

function fail()
    if(context.index > #jd_rooms) then context.index = 0 end
    timer.stop("action")
    EnableTriggerGroup("jd_ask", false)
    EnableTriggerGroup("jd_kill", false)
    EnableTriggerGroup("jd", false)
    clean(context.f_fail)
end

function done()
    sleep(function()
        var.jd_available_time = os.time()
        clean(context.f_ok)
    end)
end

function clean(f)
	me.qfull(f)
end

function kill_dcq()
    timer.stop("action")
	timer.tickonce("action", 1, function()
        local busy_list = config.busy_list
		local attack_list = config.attack_list3
		EnableTriggerGroup("jd_kill_ding", true)
		fight.prepare(busy_list, attack_list)
		fight.start("kill ding chunqiu")
	end)
end

function kill_dcq_end()
    var.jd_available_time = os.time() + 60
    fail()
end

function auto()
	local f = nil
	f = function()			
		local t = tonumber(var.jd_available_time) - os.time()
		print("�����ȴ�ms: " .. t)
		wait.make(function()
			if(t > 0) then wait.time(t) else wait.time(1) end
			main(f, f)
		end)
	end

	main(f, f)
end

function dump()
	local file = io.open("worlds\\xkx\\mods\\jd_dump.txt", "w")
    local re = rex.new("(�ݵ�|����|����|ɭ��|�ݵ�|���޺�)") 
    for i, v in ipairs(roomAll) do 
        local r1,r2,r3 = re:match(v.name) 
        if(r3) then
            local val = "{ id = " .. v.id .. ", name = " .. v.name .. " },"
            if(v.danger ~= nil) then val = val .. ", " .. v.danger end
            file:write(val .. "\n")
        end 
    end
	file:close()
end


init()