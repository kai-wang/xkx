require "wait"
require "tprint"
require "var"

module ("walk", package.seeall)

local directions = {}

directions["e"] = "东"
directions["eu"] = "东"
directions["ed"] = "东"
directions["w"] = "西"
directions["wu"] = "西"
directions["wd"] = "西"
directions["s"] = "南"
directions["su"] = "南"
directions["sd"] = "南"
directions["n"] = "北"
directions["nu"] = "北"
directions["nd"] = "北"
directions["se"] = "东南"
directions["ne"] = "东北"
directions["sw"] = "西南"
directions["nw"] = "西北"
directions["enter"] = "里"
directions["out"] = "外"
directions["d"] = "下"
directions["u"] = "上"

local mappings = {}

mappings["大理国"] = "大理"
mappings["峨嵋山"] = "峨眉山"
mappings["青城山"] = "青城"
mappings["紫禁城"] = "北京紫禁城"
mappings["光明顶"] = "明教"
mappings["重阳宫"] = "全真教"
mappings["黄河地区"] = "河套地区"
mappings["光明顶"] = "明教"


local blocker_npcs = {}

blocker_npcs["衙役"] = {id = "ya yi"}
blocker_npcs["宋兵"] = {id = "song bing"}
blocker_npcs["亲兵"] = {id = "qin bing"}
blocker_npcs["一品堂武士"] = {id = "wu shi"}
blocker_npcs["卫士"] = {id = "wei shi"}
blocker_npcs["崔员外"] = {id = "cui yuanwai"}
blocker_npcs["校尉"] = {id = "xiao wei"}
blocker_npcs["武将"] = {id = "jiang"}
blocker_npcs["官兵"] = {id = "bing"}
blocker_npcs["江百胜"] = {id = "jiang baisheng"}
blocker_npcs["女管家"] = {id = "guan jia"}
blocker_npcs["门卫"] = {id = "men wei"}
blocker_npcs["流氓头"] = {id = "tou"}
blocker_npcs["丫鬟"] = {id = "ya huan"}
blocker_npcs["锦衣卫士"] = {id = "wei shi"}
blocker_npcs["黄衣卫士"] = {id = "wei shi"}
blocker_npcs["山贼头"] = {id = "tou"}
blocker_npcs["静心师太"] = {id = "jingxin shitai"}
blocker_npcs["摘星子"] = {id = "zhaixing zi"}
blocker_npcs["出尘子"] = {id = "chuchen zi", pfm = true}
blocker_npcs["采花子"] = {id = "caihua zi"}
blocker_npcs["管家"] = {id = "guan jia"}
blocker_npcs["家丁"] = {id = "jia ding"}
blocker_npcs["高根明"] = {id = "gao genming"}
blocker_npcs["施戴子"] = {id = "shi daizi"}
blocker_npcs["皇宫卫士"] = {id = "wei shi"}
blocker_npcs["蟒蛇"] = {id = "mang she"}
blocker_npcs["阿碧"] = {id = "a bi"}
blocker_npcs["蒙面女郎"] = {id = "nv lang", pfm = true}
blocker_npcs["张松溪"] = {id = "zhang songxi", pfm = true, exp=3000000}
blocker_npcs["莫声谷"] = {id = "mo shenggu", pfm = true, exp=3000000}
blocker_npcs["赤冠巨蟒"] = {id = "ju man"}
blocker_npcs["无根道长"] = {id = "wugen daozhang", pfm = true}
blocker_npcs["麻衣长老"] = {id = "mayi zhanglao"}
blocker_npcs["萨木活佛"] = {id = "samu huofo", pfm = true}
blocker_npcs["嘉木活佛"] = {id = "jiamu huofo", pfm = true}
blocker_npcs["西华子"] = {id = "xi huazi"}
blocker_npcs["陆大有"] = {id = "lu dayou"}
blocker_npcs["弟子"] = {id = "di zi"}
blocker_npcs["竹剑"] = {id = "zhu jian"}
blocker_npcs["菊剑"] = {id = "ju jian"}
blocker_npcs["谢烟客"] = {id = "xie yanke", pfm = true}
blocker_npcs["巴依"] = {id = "bayi"}
blocker_npcs["定逸师太"] = {id = "dingyi shitai", pfm = true, exp=5000000}
blocker_npcs["丘处机"] = {id = "qiu chuji", pfm = true, exp=5000000}
blocker_npcs["刘处玄"] = {id = "liu chuxuan", pfm = true, exp=3000000}
blocker_npcs["石嫂"] = {id = "shi sao"}
blocker_npcs["居士"] = {id = "jushi", pfm = true, exp=10000000, dadizi=true}
blocker_npcs["侯爷"] = {id = "houye", pfm = true, exp=10000000, dadizi=true}

-- lht npcs -------------------------------------------------
blocker_npcs["安健刚"] = {id = "an jiangang", pfm = false}
blocker_npcs["孟健雄"] = {id = "meng jianxiong", pfm = false}
blocker_npcs["周绮"] = {id = "zhou yi", pfm = false}
blocker_npcs["心砚"] = {id = "xin yan", pfm = false}
blocker_npcs["蒋四根"] = {id = "jiang sigen", pfm = false}
blocker_npcs["石双英"] = {id = "shi shuangying", pfm = false}
blocker_npcs["卫春华"] = {id = "wei chunhua", pfm = false}
blocker_npcs["杨成协"] = {id = "yang chengxie", pfm = false}
blocker_npcs["徐天宏"] = {id = "xu tianhong", pfm = false}
blocker_npcs["常伯志"] = {id = "chang bozhi", pfm = true}
blocker_npcs["常赫志"] = {id = "chang hezhi", pfm = true}
blocker_npcs["赵半山"] = {id = "zhao banshan", pfm = true}
blocker_npcs["周仲英"] = {id = "zhou zhongying", pfm = true}
blocker_npcs["陆菲青"] = {id = "lu feiqing", pfm = true}
blocker_npcs["无尘道长"] = {id = "wuchen daozhang", pfm = true}

---------------------------------------------------------- 特殊命令-------------------------------------------------------------------

local run_cxt = {}

-----命令格式改为
----- path : e;s;|!aw:3:flatter 星宿老仙:nw|e;e;e;e;e;e
----- 记住最后一个|的前一条应当设为路径
function run(path, f_ok, f_fail, f_stop)
	
	print("执行路径: " .. path)
	
	EnableTriggerGroup("walk", true)
	
	run_cxt.stop = false
	run_cxt.fail = false
	run_cxt.abort = false
	
	run_cxt.run_ok = f_ok
	run_cxt.run_fail = f_fail
	run_cxt.run_stop = f_stop
	
	local tbl, i, run_next, iterator = utils.split(path, "|"), 0, nil, nil
	
	run_next = function(cmd, f_ok, f_fail, f_stop)		
		-- 用 !来区别是特殊命令还是一般命令-------
		if(cmd == "") then 
			call(f_ok)
		else
			local c = cmd:sub(1,1)
			if(c == ";") then cmd = cmd:sub(2) end
			if(c ~= "!") then 
				--print("cmd " .. cmd)
				local t = utils.split(cmd, ";")
				if(#t > 10 and var.fast_mode == "1") then
					wait.make(function()
						for i = 1, #t do
							if(run_cxt.abort) then return end
							Execute(t[i])
							wait.time(0.1)
						end
						call(f_ok)
					end)
				else
					Execute(cmd)
					call(f_ok)
				end
			else
				-- aw:3:flatter 星宿老仙
				print("special cmd: " .. cmd:sub(2))
				run_special(cmd:sub(2), f_ok, f_fail, f_stop)
			end
		end
	end
	
	iterator = function()
		return function()
			-- run next command
			if(run_cxt.fail) then print("run fail") end--call(run_cxt.run_fail) end
			if(run_cxt.stop) then print("run stop") end--call(run_cxt.run_stop) end
			
			i = i + 1
			if(i <= #tbl) then 
				run_next(tbl[i], iterator(), run_cxt.run_fail, run_cxt.run_stop)
			else
				Execute("set run ok")
			end
		end
	end
	
	call(iterator())
end

function run_ok()
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	call(run_cxt.run_ok)
end

function run_fail()
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	run_cxt.fail = true
	call(run_cxt.run_fail)
end

function run_stop()
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	run_cxt.stop = true
	call(run_cxt.run_stop)
end

function run_abort()
	EnableTriggerGroup("walk_special", false)
	EnableTriggerGroup("walk", false)
	run_cxt.abort = true
end

--执行特殊命令：例如 aw:3:flatter 星宿老仙:nw--
function run_special(cmd, f_ok, f_fail, f_stop)
	local tbl = utils.split(cmd, ":")
	
	handlers.new(tbl, f_ok, f_fail, f_stop)
	handlers.run()
end

handlers = {
	cxt = {},
	
	new = function(tbl, f_ok, f_fail, f_stop)
		handlers.cxt = {}
		local c = handlers.cxt
		
		c.f_ok = f_ok
		c.f_fail = f_fail
		c.f_stop = f_stop
		
		c.cmd = tbl
		--直接check run_cxt.stop了 --------------
		--c.stop = false
		c.block = false
	end,
	
	run = function()
		EnableTriggerGroup("walk_special", true)
		local c = handlers.cxt
		--直接check run_cxt.stop了 --------------
		--c.stop = false
		c.block = false
		--aw:3:flatter 星宿老仙:nw
		--第一个是特殊命令，最后一个是路径-------
		local func = handlers[c.cmd[1]]
		local cmd = c.cmd[#c.cmd]
		
		if(func == nil) then print("没有对应的handler：" .. c.cmd[1]) handlers.fail() else func(unpack(c.cmd, 2, #c.cmd-1)) end
	end,
		
	----遇到挡路的npc时调用 ---------------------
	block = function()
		local c = handlers.cxt
		c.block = true
	end,
	
	unblock = function()
		local c = handlers.cxt
		c.block = false
	end,

	done = function()
		local c, r = handlers.cxt, run_cxt
		--EnableTriggerGroup("walk_special", false)
		if(r.fail) then handlers.fail() return end
		if(r.stop) then handlers.stop() return end
		
		local cmd = c.cmd[#c.cmd]
		core.safehalt(function()
			Execute(cmd .. ";set run special")
			wait.make(function()
				local l, w = wait.regexp("^(> )*设定环境变数：run = \"special\"$")
				if(not c.block) then 
					print("no blocker") 
					EnableTriggerGroup("walk_special", false)
					EnableTriggerGroup("walk_special_boat", true)
					EnableTriggerGroup("walk_special_lht", false)
					EnableTriggerGroup("walk_special_dead", false)
					DeleteTemporaryTriggers()
					call(c.f_ok)
				else 
					handlers.run()
				end
			end)
		end, 
		1)
	end,
	
	stop = function()
		print("special handle stop")
		EnableTriggerGroup("walk_special", false)
		local c = handlers.cxt
		call(c.f_stop)
	end,
	
	fail = function()
		print("special handle fail")
		EnableTriggerGroup("walk_special", false)
		local c = handlers.cxt
		call(c.f_fail)
	end,
	
	done2 = function()
		local c = handlers.cxt
		if(c.k_blocker == true) then return end
		
		wait.make(function()
			local cmd = c.cmd[#c.cmd]
			Execute(cmd .. ";set run special")
			local l, w = wait.regexp("^(> )*设定环境变数：run = \"special\"$")
			if(not c.block) then 
				print("k1 no blocker") 
				EnableTriggerGroup("walk_special", false)
				EnableTriggerGroup("walk_special_boat", false)
				EnableTriggerGroup("walk_special_lht", false)
				EnableTriggerGroup("walk_special_dead", false)
				DeleteTemporaryTriggers()
				call(c.f_ok)
			end
		end)
	end,
	
	["aw"] = function(interval, action)
		wait.make(function()
			print(action)
			Execute(action)
			if(interval ~= nil and tonumber(interval) > 0) then wait.time(tonumber(interval)) end
			handlers.done()
		end)
	end,
	
	------ a:yell boat-------------------------------------------------
	["a"] = function(action)
		Execute(action)
		--tri里调用handlers.done()
		--handlers.done()
	end,
	
	["yellboat"] = function()
		wait.make(function()
			EnableTriggerGroup("walk_special", false)
			wait.time(2)
			Execute("yell boat")
			EnableTriggerGroup("walk_special", true)
		end)
	end,
	
	["k1"] = function(name)
		EnableTriggerGroup("walk_special_dead", true)
		EnableTriggerGroup("walk_special", true)
		EnableTriggerGroup("walk_special_lht", false)
		handlers.done2()
	end,
	
	["lht"] = function(name)
		if(tonumber(var.hp_exp) < 5000000) then 
			handlers.fail()
		else
			EnableTriggerGroup("walk_special_lht", true)
			EnableTriggerGroup("walk_special_dead", true)
			EnableTriggerGroup("walk_special", false)
			handlers.done2()
		end
	end,
	
	["ylj"] = function()
		if(var.room_lz_ylj == "true") then
			config.powerup()
			handlers.done()
		else
			handlers.fail()
		end
	end,
	
	k_blocker = function()--line, name, wildcards)
		local c = handlers.cxt
		c.k_blocker = true
		
		handlers.block()
		--移到trigger里了
		--var.walk_blocker_name = wildcards[2]
		local bl = blocker_npcs[var.walk_blocker_name]
		if(bl == nil or (bl.exp ~= nil and tonumber(var.hp_exp) < bl.exp)) then 
			print("没有blocker id或者经验不足") 
			handlers.fail() 
			return 
		end
		
		var.walk_blocker_id = blocker_npcs[var.walk_blocker_name].id
		print("blocker: " .. var.walk_blocker_name .. " " .. var.walk_blocker_id)
		if(bl.dadizi == true) then var.walk_blocker_name = var.walk_dadizi_name end
		if(bl.pfm == true) then handlers.startFight() else Execute("kill " .. var.walk_blocker_id) end
	end,
	
	k_blocker2 = function()
		local c = handlers.cxt
		c.k_blocker = true
		
		handlers.block()
		--移到trigger里了
		--var.walk_blocker_name = wildcards[2]
		var.walk_blocker_id = blocker_npcs[var.walk_blocker_name]
		
		print("blocker: " .. var.walk_blocker_name .. " " .. var.walk_blocker_id)
		
		if(var.walk_blocker_id == nil) then print("没有blocker id") handlers.fail() return end
		handlers.startFight()
	end,
	
	startFight = function()
		local busy_list = config.busy_list
		local attack_list = config.attack_list1
		fight.prepare(busy_list, attack_list)
		
		Execute("kill " .. var.walk_blocker_id)
		fight.start()
	end,
	
	blocker_dead = function(line, name, wildcards)
		local c = handlers.cxt
		c.k_blocker = false
		
		print(var.walk_blocker_name .. "死了")
		handlers.unblock()
		
		if(var.walk_blocker_name == "崔员外") then
			Execute("get yaoshi from corpse")
		end
		
		--busy_test(function() print("触发handlers.done") handlers.done() end)
		handlers.done()
	end,
	
	["gw"] = function()
		local c = handlers.cxt
		
		wait.make(function()
			Execute("e")
			local l, w = wait.regexp("^(> )*(你见江面结冻，便壮起胆子踩冰而过。)|(船夫在旁边拿眼瞪着你看。冰面化冻，还是乘船吧！)$")
			if(l and string.match(l, "你见江面结冻，便壮起胆子踩冰而过。")) then
				Execute("e")
				handlers.done()
			else
				Execute("give 1 gold to chuan fu")
				l, w = wait.regexp("^(> )*(船很快停靠彼岸。你抬脚跨出船来。)|(你身上没有这样东西。)|(这里没有这个人。)$")
				if(l and string.match(l, "船很快停靠彼岸")) then
					handlers.done()
				else
					handlers.fail()
				end
			end
		end)
	end,
	
	["punk"] = function()
		wait.make(function()
			Execute("sw;se;se;s;s;w;nw;ask punk about 王小二")
			wait.time(2)
			Execute("se;e;n;n;nw;nw;ne")
			handlers.done()
		end)
	end,
	
	["thmz"] = function(dir)
		wait.make(function()
			local l, w
			repeat
				Execute(dir)
				l, w = wait.regexp("^(> )*(你走了半天，终于走出了桃花迷阵)|(突然一阵桃花瓣象雨点般疾射你).*$", 2)
				wait.time(2)
			until(l and l:match("终于走出了桃花迷阵"))

			if(l:match("终于走出了桃花迷阵")) then
				handlers.done()
			else
				handlers.fail()
			end
		end)
	end,
	
	["hotelu"] = function()
		handlers.done2()
	end,
	
	["hoteld"] = function(mode)
		print("mode: " .. mode)
		local c = handlers.cxt
		c.leave_mode = mode
		
		handlers.done2()
	end,
	
	enter_hotel = function()
		handlers.block()
		wait.make(function()
			Execute("give 50 silver to xiao er")
			local l, w = wait.regexp("^(> )*(你拿出.*给店小二。)|(你没有那么多的白银。)$")
			if(l:match("你没有那么多")) then handlers.fail() else handlers.done() end
			handlers.unblock()
		end)
	end,
	
	leave_hotel = function()
		local c = handlers.cxt
		print("mode---" .. c.leave_mode)
		handlers.block()
		wait.make(function()
			if(c.leave_mode == "2") then Execute("u;d;set run hotel_leave") else Execute("u;enter;out;d;set run hotel_leave") end
			local l, w = wait.regexp("^(> )*设定环境变数：run = \"hotel_leave\"")
			handlers.unblock()
			handlers.done()
		end)
	end,
	
	["hsbreak"] = function()
		if(var.me_xunzhang == "true") then
			Execute("wear xunzhang;unwield all;wield " .. var.weapon .. ";break wall;tuo xunzhang")
			handlers.done()
		else
			handlers.fail()
		end
	end,
	
	["mmdd"] = function()
		if(var.me_xunzhang == "true") then
			wait.make(function()
				Execute("wear xunzhang;ask su about 秘密地道;tuo xunzhang")
				local l, w = wait.regexp("^(> )*(这里没有这个人)|(苏星河说道：想要知道密道就得加入逍遥派)|(苏星河把你送到石室的门口).*$", 5)
				if(l and l:match("苏星河把你送到石室的门口") ~= nil) then handlers.done() else handlers.fail() end
			end)
		else
			handlers.fail()
		end
	end,
	
	["gcdt"] = function()
		wait.make(function()
			Execute("look gaochang ditu")
			local l, w = wait.regexp("^(> )*(这是一张高昌迷宫地图)|(你要看什么).*$")
			if(l:match("你要看什么")) then handlers.fail() else handlers.done() end
		end)
	end,
	
	["cao"] = function()
		wait.make(function()
			repeat
				wait.time(0.2)
				Execute("take cao")
				local l, w = wait.regexp("^(> )*(你从悬崖上摔了下来)|(你在悬崖前站定).*$", 1)
			until(not l or l:match("你从悬崖上摔了下来"))
			handlers.done()
		end)
	end,
	
	["press"] = function()
		Execute("press " .. var.fz_coin)
		handlers.done()
	end,
	
	["circle"] = function()
		wait.make(function()
			Execute("circle wan")
			local l, w = wait.regexp("^.*(你将碗旋开)|(很快碗又搬回了原位).*$")
			print(l)
			if(l:match("搬回了原位") ~= nil) then Execute("circle wan") end
			handlers.done()
		end)
	end,
	
	["c"] = function(item)
		if(item == "sling") then
			if(var.me_family == "少林") then handlers.done() return end
			get_sling(handlers.done, handlers.fail)
		elseif(item == "qling") then
			if(var.me_family == "全真") then handlers.done() return end
			get_qling(handlers.done, handlers.fail)
		elseif(item == "shanpai") then
			get_shanpai(handlers.done, handlers.fail)
		elseif(item == "fire") then
			get_fire(handlers.done, handlers.fail)
		elseif(item == "hmling") then
			get_heimuling(handlers.done, handlers.fail)
		elseif(item == "ditu") then
			get_ditu(handlers.done, handlers.fail)
		elseif(item == "jiedao") then
			get_jiedao(handlers.done, handlers.fail)
		end
	end,
	
	["pushstone"] = function()
		wait.make(function()
			Execute("push stone")
			local l, w = wait.regexp("^(> )*(水流一阵涌动)|(你把巨石推到一边).*$", 5)
			if(l == nil) then handlers.fail() return end
			if(l:match("水流一阵涌动") ~= nil) then Execute("push stone") end
			handlers.done2()
		end)
	end,

	["mzdl"] = function()
		wait.make(function()
			Execute("fly mz;n;n;n;e;s;s;w;sw;e")
			local count, l, w = 0, nil, nil
			repeat
				Execute("halt;n")
				count = count + 1
				l, w = wait.regexp("^(> )*你只觉得天旋地转，呼吸也开始困难起来.*$", 2)
			until(l and l:match("你只觉得天旋地转") or (count > 5))

			if(not l) then 
				handlers.fail()
			else
				l, w = wait.regexp("^(> )*家丁们把你一把抓住，捆了个结实，扔进了监狱.*$", 15)
				if(l) then handlers.done() else handlers.fail() end
			end
		end)
	end
}

-------------------------------------------------------------------------------------------------------------------------------
----------------------slow walk------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
local walk_cxt = {}


function getRegion(name)
	local matched = {}
	local re = rex.new("^" .. name .. "[0-9]{0,1}$")
	local re2
	
	if(mappings[name] ~= nil) then re2 = rex.new("^" .. mappings[name] .. "[0-9]{0,1}$") end
	
	for i, v in pairs(regions) do
		local a, b, t = re:match(i)
		if(t ~= nil) then table.insert(matched, v) 
		elseif(re2 ~= nil) then
			a, b, t = re2:match(i)
			if(t ~= nil) then table.insert(matched, v) end
		end			
	end
	
	return matched	
end

function findpath(regionName, roomName)
	local match = {}
	local regions = getRegion(regionName)
	--放到里面去了
	--local prevRoom = nil
	local path = nil

	if(regions == {}) then return end
	
	for j = 1, #regions do
		local region = regions[j]
		local prevRoom = nil
		for i, v in ipairs(region.rooms) do
			--if(v.name == roomName and v.attr ~= "danger") then
			if(v.name == roomName and (v.danger == nil or (var.walk_danger_level ~= nil and tonumber(var.walk_danger_level) >= v.danger))) then
				if(prevRoom == nil) then
					path = "set brief;" .. v.path .. ";unset brief;look"
				else
					local temp = find_path(roomAll, prevRoom, v.id)
					if(temp == nil) then
						path = "set brief;" .. v.path .. ";unset brief"
					else
						if #temp == 1 then
							path = temp[1]
						else
							path = "set brief;"
							for i=1, (#temp-1) do
								path = path .. temp[i] .. ";"
							end
						path = path .. "unset brief;" .. temp[#temp]
					end
						--path = table.concat(temp, ";")
					end
				end
				table.insert(match, {["from"]=prevRoom, ["to"]=v.id, ["path"]=path})
				prevRoom = v.id
			end
		end
	end

	return match
end


function sl(regionName, roomName, f_ok, f_fail, f_stop)
	local path = findpath(regionName, roomName)
	step_by_step(path, f_ok, f_fail, f_stop)
end

function step_by_step(tbl, f_ok, f_fail, f_stop)
	
	if(tbl == nil or #tbl == 0) then return call(f_fail) end
	
	walk_cxt.stop = false
	walk_cxt.fail = false
	walk_cxt.abort = false
	
	walk_cxt.walk_ok = f_ok
	walk_cxt.walk_fail = f_fail
	walk_cxt.walk_stop = f_stop
	
	local i, step, iterator = 0, nil, nil
	
	step = function(cmd, f_ok, f_fail, f_stop)
		--wait.make(function()
		--wait.time(0.3)
		if(var.fast_mode == "1") then
			timer.tickonce("action", 0.3, function() run(cmd, f_ok, f_fail, f_stop) end)
		else
			run(cmd, f_ok, f_fail, f_stop)
		end
		--end)
	end

	iterator = function()
		return function()
			if(walk_cxt.fail or walk_cxt.stop or walk_cxt.abort) then return end
			i = i + 1
			
			if(i <= #tbl) then
				walk_cxt.currentId = tbl[i].to
				print("当前房间: ".. walk_cxt.currentId)
				if(tbl[i].from ~= nil and roomAll[tbl[i].from].danger ~= nil) then tbl[i].path = "halt;" .. tbl[i].path end
				step(tbl[i].path, iterator(), walk_cxt.walk_fail, walk_cxt.walk_stop)
			else
				walk_ok()
			end
		end
	end

	call(iterator())
end

--暂时不需要resume吧----------------------------------------------------------------
--还需要在run和handle上面加一个，如果正在handle的时候stop了，需要把handle resume----
function resume()
	local w, r = walk_cxt, run_cxt
	w.stop = false
	w.fail = false
	r.stop = false
	r.fail = false
	
	local p = w.iter()
	if(p ~= nil) then
		step(p.path, w.walk_next, walk_fail, walk_stop)
	else
		walk_ok()
	end
end

function walk_fail()
	print("slow walk fail")
	walk_cxt.fail = true
	run_fail()
end

function walk_stop()
	print("slow walk stop")
	walk_cxt.stop = true
	run_stop()
end

function stop()
	walk_stop()
end

function fail()
	walk_fail()
end

function abort()
	local w = walk_cxt
	walk_cxt.abort = true
	run_abort()
end

function stopped()
	local w = walk_cxt
	--tprint(w)
	if(w.stop == true) then return true else return false end
end

function walk_ok()
	print("slow walk end")
	-- add stop flag here --------
	walk_cxt.stop = true
	call(walk_cxt.walk_ok)
end

function walkaround(dp, dir, f_ok, f_fail, f_stop)

	local room = roomAll[walk_cxt.currentId]
	local tbl, walked = {}, {}
	local walk_deepth = tonumber(dp)
	
	if(room ==  nil) then print("找不到当前房间 : ", walk_cxt.currentId) call(f_fail) return end
	
	--声明一下两个函数-------------------------------------------------------------------
	local enqueue, findexit
	
	enqueue = function(d, v, room, deepth)
		local p = d
		if(v.con ~= nil and v.con ~= "") then p = "|!" .. v.con .. ":" .. d .. "|" end
		table.insert(tbl, {["from"]=room.id, ["to"]=v.to, ["path"]=p})
		
		walked[v.to] = true
		--deepth = deepth + 1
		findexit(roomAll[v.to], room.id, deepth+1)
		local stepback = find_path(roomAll, v.to, room.id)
		if(stepback) then
			local path = stepback[1]
			if(#stepback > 1) then path = "set brief;" .. table.concat(stepback, ";", 1, #stepback - 1) .. ";unset brief;" .. stepback[#stepback] end
			--local path = table.concat(stepback, ";")
			table.insert(tbl, {["from"]=v.to, ["to"]=room.id, ["path"]=path})
		--else
			-- 没有直连的回去的方向
		--	table.insert(tbl, {["from"]=v.to, ["to"]=room.id, ["path"]="set brief;" .. roomAll[room.id].path .. ";unset brief;look"})
		end
	end
	
	findexit = function(room, from, deepth)
		--走到头了
		if(deepth == walk_deepth) then return end
		
		-------------------优先找符合dir的房间的路径------------------------------------------------------
		if(deepth == 1 and dir ~= nil) then
			for i, v in pairs(room.links) do
				--if(not walked[v.to] and roomAll[v.to].attr ~= "danger" and v.block ~= "y" and directions[i] == dir) then
				if(not walked[v.to] and v.block ~= "y" and directions[i] == dir and (roomAll[v.to].danger == nil or (var.walk_danger_level ~= nil and tonumber(var.walk_danger_level) >= roomAll[v.to].danger))) then
					enqueue(i, v, room, deepth)
				end
			end
		end
		------------------找剩下的还没做过的房间-----------------------------------------------------------
		for i, v in pairs(room.links) do
			--tprint(room.links)
			--if(v.attr ~= "" and v.attr ~= nil) then print("attr: " .. v.attr) else print("attr null") end
			--if(not walked[v.to] and roomAll[v.to].attr ~= "danger" and v.block ~= "y") then
			if(not walked[v.to] and v.block ~= "y" and (roomAll[v.to].danger == nil or (var.walk_danger_level ~= nil and tonumber(var.walk_danger_level) >= roomAll[v.to].danger))) then
				enqueue(i, v, room, deepth)
			end
		end
	end

	--tprint(walked)
	walked[room.id] = true
	findexit(room, room.id, 1)
	--tprint(tbl)

	step_by_step(tbl, f_ok, f_fail, f_stop)
end

to = function(room, f_done, f_fail, f_stop)
	if(tonumber(room) > #roomAll) then call(f_fail) end
	walk_cxt.currentId = tonumber(room)
	walk.run(roomAll[walk_cxt.currentId].path, f_done, f_fail, f_stop)
end

tonpc = function(name, f_done, f_fail, f_stop)
	local npc_list = dofile("worlds\\xkx\\mods\\npcs.lua")
	if(npc_list[name] == nil) then call(f_fail) end
	walk.run(roomAll[npc_list[name].room].path, f_done, f_fail, f_stop)
end