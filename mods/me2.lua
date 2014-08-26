require "tprint"

module ("cure", package.seeall)

module ("capture", package.seeall)

local cxt = {}
start = function(group, cmd, f_done)
	cxt.f_done = f_done
	cxt.group = group
	EnableTriggerGroup(group)
	Execute(cmd)
	Execute("set capture " .. group)
end

done = function()
	EnableTriggerGroup(cxt.group)
	call(cxt.f_done)
end


updateHP = function(f_done)
	return function() capture.start("HP", "hp", f_done) end
end


fullme = function(f_done)
	call(
		updateHP(cure_ssf(cure_poison(cure_jing(cure_qi(foodwater())))))
	)
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

heal_ssf = function(f_done, f_fail)
	return function()
		if(var.me_status_ssf == "" or var.me_status_ssf == "false") then print("没中生死符") call(f_done) return end
		
		wait.make(function()
			qukuan("15 gold", function()
				local l, w = wait.regexp("^(> )*(这里没有这个人)|(.*你没有中生死符啊，你想中吗)|(.*你身上的生死符已解了).*$")
				if(l:match("这里没有这个人") ~= nil) then call(f_fail) return end
				
				wait.time(5)
				var.me_status_ssf = false
				print("生死符好了")
				call(f_done)
			end)
		end)
	end
end

heal_poison = function(f_done, f_fail)
	return function()
		wait.make(function()
			Execute("fly wm;nw;er;et;yun cure")		
			repeat
				local l, w = wait.regexp("^(> )*(你.*消褪了！)|(你并未中毒。)|(你现在精不够.*)$", 8)
				if(l:match("你现在精不够")) then call(f_fail) return end
			until((l == nil) or (l:match("你并未中毒") ~= nil))
			
			Execute("halt")
			print("驱毒完毕")
			var.me_status_poison = false
			call(f_done)
		end)
	end
end

heal_poison_fail = function(f_done)
	return function()
		wait.make(function()
			qukuan("100 gold",function()
				busy_test(function()
					Execute("e;s;e;e;n;buy chan;eat chan")
					call(f_done)
				end)
			end)
		end)
	end
end


me.eatWuchange = function(f_done, f_fail)
	return function()
		if(var.last_wuchang == nil or var.last_wuchang == "") then call(f_fail) return end
	
		local now = tonumber(os.time())
		local old = tonumber(var.last_wuchang)
	
		--25分钟间隔可以吃wuchag
		if(now - old >= 1500) then call(f_fail) return end
		
		wait.make(function()
			Execute("fly wm;e;s;w;qukuan 5 gold")
			busy_test(function()
				Execute("e;s;e;e;n;buy wuchang dan")
				busy_test(function()
					Execute("fly wm;nw;eat wuchang dan")
					var.last_wuchang = os.time()
					print("无常丹好吃啊")
					wait.time(5)
					call(f_done)
				end)
			end)
		end)
	end
end


me.jingqi = function(f_done)
	local jsP = tonumber(me["js%"])
	local qxP = tonumber(me["qx%"])
	print(jsP, qxP)
	if(jsP >= 95 and qxP >= 95) then print("不用疗伤") call(f_done) return end
	
	wait.make(function()
		if((jsP < 60 or qxP < 30) and me.canEatWuchang()) then
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
				local dannumber = math.ceil((100-jsP)/5)
				local price = dannumber * 35
				--if(dannumber == math.ceil(dannumber)) then dannumber = math.ceil(dannumber) + 1 else dannumber = math.ceil(dannumber) end
				Execute("fly wm;e;s;w;qukuan " .. price .. " silver")
				wait.time(5)
				Execute("e;s;e;e;n")
				for i = 1, dannumber do Execute("buy yangjing dan") end
				busy_test(function()
					Execute("fly wm;nw")
					for i = 1, dannumber do Execute("et;eat yangjing dan") wait.time(3) end
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
			var.study_loc = st.loc
			Execute(var.study_loc)
			research.start(f_done)
			--[[
			var.study_loc = st.loc
			var.lll = st.cmd
			Execute(var.study_loc)
			study.start(f_done)
			var.study_seq = (index + 1)%(#me.profile.study_list)
			]]--
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
		if(tonumber(var.me_silver) > 800 or tonumber(var.me_silver) < 50 or tonumber(var.me_gold) < 16 or tonumber(var.me_gold) > 30 or tonumber(var.me_goldbar) > 1) then
			cmd = cmd .. "cunkuan " .. tonumber(var.me_silver) .. " silver;"
			cmd = cmd .. "cunkuan " .. tonumber(var.me_gold) .. " gold;"
			cmd = cmd .. "cunkuan " .. tonumber(var.me_goldbar) .. " gold-bar"
		end
		
		if(cmd ~= "") then
			Execute("fly wm;e;s;w")
			Execute(cmd)
			Execute("qukuan 99 silver;qukuan 19 gold")
			wait.time(5)
			Execute("halt;fly wm")
			var.me_goldbar = 0
		end
		
		call(f_done)
	end)
end

function call(f)
	if(f ~= nil) then f() end
end