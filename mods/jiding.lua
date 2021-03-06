require "wait"
require "tprint"
require "utils"
require("worlds\\xkx\\mods\\core")

module ("jiding", package.seeall)

local npc_list = dofile("worlds\\xkx\\mods\\npcs.lua")
local jd_rooms = {
    { id = 2285, name = "星宿海" },
    { id = 2286, name = "星宿海" },
    { id = 2288, name = "星宿海" },
    { id = 2296, name = "星宿海" },
    { id = 2297, name = "星宿海" },
    { id = 27, name = "草地" },
    { id = 28, name = "草地" },
    { id = 29, name = "树林" },
    { id = 52, name = "草地" },
    { id = 53, name = "密林" },
    { id = 54, name = "密林" },
    { id = 55, name = "密林" },
    { id = 56, name = "密林" },
    { id = 57, name = "密林" },
    { id = 60, name = "草地" },
    { id = 61, name = "树林" },
    { id = 62, name = "密林" },
 --   { id = 63, name = "密林" },
    { id = 78, name = "草地" },
    { id = 79, name = "树林" },
    { id = 80, name = "树林" },
    { id = 368, name = "树林" },
    { id = 390, name = "树林" },
    { id = 570, name = "大森林" },
    { id = 588, name = "密林" },
    { id = 716, name = "草地" },
    { id = 718, name = "草地" },
    { id = 719, name = "草地" },
    { id = 771, name = "草地" },
    { id = 772, name = "草地" },
    { id = 773, name = "草地" },
    { id = 1122, name = "树林" },
    { id = 1124, name = "树林" },
    { id = 1127, name = "树林" },
    { id = 1152, name = "树林" },
    { id = 1153, name = "树林" },
    { id = 1154, name = "树林" },
    { id = 1173, name = "草地" },
    { id = 1174, name = "草地" },
    { id = 1589, name = "密林" },
  --  { id = 1590, name = "密林" },
    { id = 1591, name = "密林" },
    { id = 1642, name = "大森林" },
    { id = 1646, name = "草地" },
    { id = 1661, name = "密林" },
    { id = 1663, name = "密林" },
    { id = 1911, name = "草地" },
    { id = 2031, name = "树林" },
    { id = 2032, name = "树林" },
    { id = 2178, name = "草地" },
    { id = 2203, name = "草地" },
    { id = 2412, name = "树林" },
    { id = 2413, name = "树林" },
    { id = 2414, name = "树林" },
    { id = 2415, name = "树林" },
    { id = 2416, name = "树林" },
    { id = 2417, name = "树林" },
    { id = 2618, name = "树林" },
    { id = 2619, name = "树林" },
    { id = 2620, name = "树林" },
    { id = 2621, name = "树林" },
    { id = 2624, name = "树林" },
    { id = 2756, name = "树林" },
    { id = 2757, name = "树林" },
    { id = 2758, name = "树林" },
  --  { id = 2780, name = "树林" },
  --  { id = 2781, name = "树林" },
  --  { id = 2782, name = "树林" },
  --  { id = 2783, name = "树林" },
  --  { id = 2784, name = "树林" },
  --  { id = 2785, name = "树林" },
  --  { id = 2786, name = "树林" },
 --   { id = 2796, name = "草地" },
    { id = 2896, name = "树林" },
    { id = 2897, name = "树林" },
    { id = 2902, name = "树林" },
    { id = 2903, name = "树林" },
    { id = 2904, name = "树林" },
    { id = 2905, name = "树林" },
    { id = 2925, name = "草地" },
    { id = 2928, name = "草地" }
}
local context = {}

function init()
    context.index = 0
    EnableTriggerGroup("jd_ask", false)
    EnableTriggerGroup("jd_kill_ding", false)
    EnableTriggerGroup("jd", false)
    EnableTriggerGroup("jd_kill_npc", false)
end

function main(f_done, f_fail)
	context.f_done = f_done
	context.f_fail = f_fail
	check_ding(search, ask)
end

function ask()
	EnableTriggerGroup("jd_ask", true)
	walk.run("fly xx;n;n", function() Execute("ask ding about 神木王鼎") end, fail, fail)

	timer.tickonce("action", 5, function()
        var.jd_available_time = os.time() + 30
        fail()
    end)
end

function ask_fail()
    var.jd_available_time = os.time() + 30
    fail()
end

function kill_jd_npc(name, line, wildcards)
    EnableTriggerGroup("jd_ask", false)
    EnableTriggerGroup("jd_kill_npc", true)

	timer.stop("action")
	var.jd_available_time = os.time() + 300
	var.jd_npc_name = wildcards[2]
	local t = npc_list[var.jd_npc_name]

	if(t == nil or (t.exp ~= nil and tonumber(var.hp_exp) < t.exp)) then 
        print("找不到 " .. var.jd_npc_name)
       -- return fail() 
       return kill_dcq2()
    end

	var.jd_npc_id = t.name
    if(t.touxi == true) then
        var.jd_npc_kill_cmd = "touxi " .. var.jd_npc_id 
    else
        var.jd_npc_kill_cmd = "kill " .. var.jd_npc_id 
    end

	print(var.jd_npc_name .. " id【" .. var.jd_npc_id .. "】  room【" .. t.room .. "】")

	timer.tickonce("action", 1, function()
		core.busytest(function()
			-- 改成找不到就回去杀丁
            -- walk.run(roomAll[t.room].path, kill_jd_npc_start, fail, fail)
            walk.run(roomAll[t.room].path, kill_jd_npc_start, kill_dcq2, fail)
		end, 1)
	end)
end

function kill_jd_npc_start()
	timer.tickonce("action", 1, function()
        local busy_list = config.busy_list
		local attack_list = config.attack_list2
		EnableTriggerGroup("jd_kill", true)
		fight.prepare(busy_list, attack_list)
		--fight.start("kill " .. var.jd_npc_id)
        fight.start(var.jd_npc_kill_cmd)
	end)
end

function kill_jd_npc_end()
    EnableTriggerGroup("jd_kill_npc", false)
    EnableTriggerGroup("jd_ask", true)
    core.busytest(function()
        Execute("unwield all;wield " .. var.kantou_wp .. ";kantou corpse")
        clean(function() Execute("fly xx;n;n;give ding head") end)
	end)
end

function search()
    context.index = context.index + 1
    if(context.index > #jd_rooms) then return fail() end
    local roomId = jd_rooms[context.index].id
    print("go to room: " .. roomId)
    core.safehalt(function()
        walk.run(roomAll[roomId].path, 
            function()
                EnableTriggerGroup("jd", true)
                --EnableTriggerGroup("jd_kill", true)
                config.powerup()
                Execute("ji ding") 
            end, 
            search, search)
    end, 0.3)
end

function jd_kill()
    timer.stop("action")
	timer.tickonce("action", 1, function()
        local busy_list = config.busy_list
		local attack_list = config.attack_list2
		fight.prepare(busy_list, attack_list, nil, nil, nil, true)
		fight.start()
	end)
end

function jd_kill_done()
    core.safehalt(function()
        done()
    end, 0.3)
end

function fail()
    if(context.index > #jd_rooms) then context.index = 0 end
    timer.stop("action")    
    EnableTriggerGroup("jd_ask", false)
    EnableTriggerGroup("jd_kill_ding", false)
    EnableTriggerGroup("jd", false)
    EnableTriggerGroup("jd_kill_npc", false)
    clean(context.f_fail)
end

function done()
    sleep(function()
        var.jd_available_time = os.time()
        EnableTriggerGroup("jd_ask", false)
        EnableTriggerGroup("jd_kill_ding", false)
        EnableTriggerGroup("jd", false)
        EnableTriggerGroup("jd_kill_npc", false)
        me.full(function() 
            Execute("fly wm;nw")
            call(context.f_done)
        end)
    end)
end

function clean(f)
	me.qfull(function() 
        Execute("fly wm;nw")
        call(f)
    end)
end

function kill_dcq()
    EnableTriggerGroup("jd_kill_ding", true)
    timer.stop("action")
	timer.tickonce("action", 1, function()
        local busy_list = config.busy_list
		local attack_list = config.attack_list2
		EnableTriggerGroup("jd_kill_ding", true)
		fight.prepare(busy_list, attack_list)
		fight.start("kill ding chunqiu")
	end)
end

function kill_dcq2()
    core.safehalt(function()
        Execute("fly xx;n;n")
        kill_dcq()
    end)
end

function kill_dcq_end()
    var.jd_available_time = os.time() + 30
    core.busytest(function()
        fail()
    end)
end

function retry()
    core.busytest(function()
        done()
    end, 0.3)
end

function auto()
	local f = nil
	f = function()			
		local t = tonumber(var.jd_available_time) - os.time()
		print("重启等待ms: " .. t)
		wait.make(function()
			if(t > 0) then wait.time(t) else wait.time(1) end
			main(f, f)
		end)
	end

	main(f, f)
end

function dump()
	local file = io.open("worlds\\xkx\\mods\\jd_dump.txt", "w")
    local re = rex.new("(草地|密林|树林|森林|草地|星宿海)") 
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