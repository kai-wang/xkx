require "tprint"

me = {}
--me.status = {}

--[[
	精神:		js
	精神最大值: js_max
	精神百分比:	jx%
	精力：		jl
	精力最大值：jl_max
]]--
on_hp1_update = function(name, line, wildcards)
	me["js"] 		= tonumber(wildcards[1])
	me["js_max"] 	= tonumber(wildcards[2])
	me["js%"]		= tonumber(wildcards[3])
	me["jl"] 		= tonumber(wildcards[4])
	me["jl_max"] 	= tonumber(wildcards[5])
	--tprint(me)
end

--[[
	气血:		qx
	气血最大值: qx_max
	气血百分比:	qx%
	内力：		nl
	内力最大值：nl_max
]]--
on_hp2_update = function(name, line, wildcards)
	me["qx"]			= tonumber(wildcards[1])
	me["qx_max"]		= tonumber(wildcards[2])
	me["qx%"]		= tonumber(wildcards[3])
	me["nl"]			= tonumber(wildcards[4])
	me["nl_max"]		= tonumber(wildcards[5])
	--tprint(me)
end


--[[
	正气:		zq
	阅历: 		yl
]]--
on_hp3_update = function(name, line, wildcards)
	me["zq"] 		= tonumber(wildcards[1])
	me["yl"]		= tonumber(wildcards[2])
end


--[[
	食物：		food
	食物最大值：food_max
	潜能：		qn
	潜能最大值：qn_max
]]--
on_hp4_update = function(name, line, wildcards)
	me["food"]		= tonumber(wildcards[1])
	me["food_max"]	= tonumber(wildcards[2])
	me["qn"]		= tonumber(wildcards[3])
	me["qn_max"]	= tonumber(wildcards[4])
end


--[[
	饮水：		water
	饮水最大值: water_max
	经验值：	exp
]]--
on_hp5_update = function(name, line, wildcards)
	me["water"]		= tonumber(wildcards[1])
	me["water_max"]	= tonumber(wildcards[2])
	me["exp"]		= tonumber(wildcards[3])
end


--[[
	丹田:		dt
	丹田最大值:	dt_max
	修为: 		xw
]]--
on_hp6_update = function(name, line, wildcards)
	me["dt"]			= tonumber(wildcards[1])
	me["dt_max"]		= tonumber(wildcards[2])
	me["xw"]			= tonumber(wildcards[3])
end


me.updateHP = function(f_done)
	wait.make(function()
		EnableTriggerGroup("HP", true)
		Execute("hp;set check hp")
		local l, w = wait.regexp("^(> )*设定环境变数：check = \"hp\"$")
		EnableTriggerGroup("HP", false)
		
		call(f_done)
	end)
end


me.full = function(f_done)
	me.updateHP(function()
		me.ssf(function()
			me.qudu(function()
				me.foodwater(function()
					me.jingqi(function()
						call(f_done)
					end)
				end)
			end)
		end)
	end)
end

me.cleanup = function(f_done)
	me.full(function()
		me.check_money(function()
		me.useqn(function()
			wait.make(function()
				me.updateHP(function()
					if(tonumber(me["nl"]) > tonumber(me["nl_max"]) * 1.2) then 
						Execute("er;et;fly wm;set check full")
						local l, w = wait.regexp("^(> )*设定环境变数：check = \"full\"$")
						call(f_done)
					else
						busy_test(function()
							Execute("fly wm;u")
							dazuo.start(function()
								Execute("er;ef;d;set check full")
								local l, w = wait.regexp("^(> )*设定环境变数：check = \"full\"$")
								call(f_done)
							end)
						end)
					end
				end)
			end)
		end)
		end)
	end)
end

me.ssf = function(f_done)
	if(me["in_ssf"] == nil or (not me["in_ssf"])) then print("没中生死符") call(f_done) return end
	
	wait.make(function()
		Execute("fly wm;e;s;w;qukuan 15 gold")
		wait.time(5)
		Execute("fly lj;s;give 15 gold to shouling")
		local l, w = wait.regexp("^(> )*(这里没有这个人)|(.*你没有中生死符啊，你想中吗)|(.*你身上的生死符已解了).*$")
		
		if(l:match("这里没有这个人") ~= nil) then
			print("首领不在,断线了...........")
			Execute("halt;quit")
			Disconnect()
			return
		end
		
		wait.time(5)
		me["in_ssf"] = false
		print("生死符好了")
		call(f_done)
	end)
end

me.qudu = function(f_done)
	if(me["in_poison"] == nil or (not me["in_poison"])) then print("没有中毒") call(f_done) return end
	
	wait.make(function()
		Execute("fly wm;nw;er;et;yun cure")
		repeat
			local l, w = wait.regexp("^(> )*(你.*消褪了！)|(你并未中毒。)$", 10)
		until((l == nil) or (l:match("你并未中毒") ~= nil))
		Execute("halt")
		print("驱毒完毕")
		me["in_poison"] = false
		call(f_done)
	end)
end

me.canEatWuchang = function()
	if(var.last_wuchang == nil or var.last_wuchang == "") then return true end
	
	local now = tonumber(os.time())
	local old = tonumber(var.last_wuchang)
	
	--25分钟间隔可以吃wuchag
	if(now - old >= 1500) then return true end
	return false
end


me.jingqi = function(f_done)
	local jsP = tonumber(me["js%"])
	local qxP = tonumber(me["qx%"])
	print(jsP, qxP)
	if(jsP >= 95 and qxP >= 95) then print("不用疗伤") call(f_done) return end
	
	wait.make(function()
		if((jsP < 60 or qxP < 30)and me.canEatWuchang()) then
			Execute("fly wm;e;s;w;qukuan 5 gold")
			wait.time(5)
			Execute("e;s;e;e;n;buy wuchang dan")
			busy_test(function()
				Execute("fly wm;nw;eat wuchang dan")
				var.last_wuchang = os.time()
				print("无常丹好吃啊")
				wait.time(5)
				call(f_done)
			end)
		else
			if(jsP < 95) then
				local dannumber = (100-jsP)/5
				local price = dannumber * 35
				if(dannumber == math.ceil(dannumber)) then dannumber = math.ceil(dannumber) + 1 else dannumber = math.ceil(dannumber) end
				Execute("fly wm;e;s;w;qukuan " .. price .. " silver")
				wait.time(5)
				Execute("e;s;e;e;n")
				for i = 1, dannumber do Execute("buy yangjing dan") end
				busy_test(function()
					Execute("fly wm;nw")
					for i = 1, dannumber do Execute("eat yangjing dan") wait.time(5) end
					print("疗精完毕")
					Execute("er;et;yun heal")
					local l, w = wait.regexp("^(> )*(你并没有受伤！)|(你运功完毕).*$")
					print("疗气完毕")
					call(f_done)
				end)
			elseif(qxP < 90) then
				busy_test(function()
					Execute("er;et;yun heal")
					local l, w = wait.regexp("^(> )*(你并没有受伤！)|(你运功完毕).*$")
					print("疗气完毕")
					call(f_done)
				end)
			else
				call(f_done)
			end
		end
	end)
end


me.foodwater = function(f_done)
	if(tonumber(me["water"]) > tonumber(me["water_max"]) and tonumber(me["food"]) > tonumber(me["food_max"])) then print("不需要吃喝") call(f_done) return end
	wait.make(function()
		Execute("set brief;fly jx;buy zongzi;")
		wait.time(2)
		Execute("fly xx;su;s;ed;nw;w;buy shuinang;")
		wait.time(2)
		Execute("eat zongzi;#8 (drink shuinang);drop zongzi;drop zong ye;")
		wait.time(2)
		Execute("#8 (drink shuinang);drop shuinang;unset brief;fly wm")
		--wait.regexp("^(> )*设定环境变数：foodwater = \"YES\"$")
		print("酒足饭饱了")
		call(f_done)
	end)
end --function


me.useqn = function(f_done)
	if(tonumber(me["qn"]) >= tonumber(me["qn_max"])) then
		if(var.study_seq == nil or var.study_seq == "") then var.study_seq = 1 end
		local index = tonumber(var.study_seq)%(#me.profile.study_list)
		if(index == 0) then index = #me.profile.study_list end
		
		local st = me.profile.study_list[index]
		
		wait.make(function()
			--msg.subscribe("msg_study_done", function() call(f_done) end)
			
			var.study_loc = st.loc
			var.lll = st.cmd
			--var.study_cmd = st.cmd
			--AddAlias("lll", "lll", st.cmd, 1025, "")
			--SetAliasOption("lll", "send_to", 10)
			Execute(var.study_loc)
			study.start(f_done)
			var.study_seq = (index + 1)%(#me.profile.study_list)
		end)
	else
		--msg.broadcast("msg_study_done")
		call(f_done)
		print("不需要花qn")
	end
	
end

me.check_money = function(f_done)
	wait.make(function()
		var.me_silver = 1
		var.me_gold = 1
		var.me_goldbar = 1
		
		EnableTriggerGroup("check_money", true)
		Execute("look silver;look gold;look gold-bar;set check money")
		local l, w = wait.regexp("^(> )*设定环境变数：check = \"money\"$")
		EnableTriggerGroup("check_money", false)
		local cmd = ""
		if(tonumber(var.me_silver) > 500 or tonumber(var.me_gold) > 30 or tonumber(var.me_goldbar) > 1) then
			cmd = cmd .. "cunkuan " .. tonumber(var.me_silver) .. " silver;"
			cmd = cmd .. "cunkuan " .. tonumber(var.me_gold) .. " gold;"
			cmd = cmd .. "cunkuan " .. tonumber(var.me_goldbar) .. " gold-bar"
		end
		
		if(cmd ~= "") then
			Execute("fly wm;e;s;w")
			Execute(cmd)
			Execute("qukuan 99 silver;qukuan 19 gold")
			wait.time(5)
			Execute("fly wm")
			var.me_goldbar = 0
		end
		
		call(f_done)
	end)
end

function call(f)
	if(f ~= nil) then f() end
end