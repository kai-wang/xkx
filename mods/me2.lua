require "tprint"

capture = function(group, cmd, f_done)
	wait.make(function()
		EnableTriggerGroup(group)
		EnableTriggerGroup("capture")
		Execute(cmd)
		Execute("set capture " .. group)
		local l, w = wait.regexp("^(> )*设定环境变数：capture = .*$")
		call(f_done)
	end)
end

updateHP = function(f_done)
	return function() capture("HP", "hp", f_done) end
end

fullme = function(f_done)
	call(updateHP(heal_ssf(heal_poison(heal_jing(heal_qi(foodwater(f_done)))))))
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
			bank.cunqu("qukuan 15 gold", function()
				Execute("fly lj;s;give 15 gold to shouling")
				local l, w = wait.regexp("^(> )*(这里没有这个人)|(要解符也要.*)|(.*你没有中生死符啊，你想中吗)|(.*你身上的生死符已解了).*$")
				if(l:match("这里没有这个人") ~= nil or l:match("要解符也要") ~= nil) then callfail(f_done, f_fail) return end

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
				if(l:match("你现在精不够")) then callfail(f_done, f_fail) return end
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
		qukuan("100 gold", function()
			Execute("e;s;e;e;n;buy chan;eat chan")
			call(f_done)
		end)
	end
end

can_eat_wuchang = function()
	if(var.last_wuchang == nil or var.last_wuchang == "") then return true end
	local now, old = tonumber(os.time()), tonumber(var.last_wuchang)
	--20分钟间隔可以吃wuchag
	return (now - old > 1200)
end


eat_wuchang = function(f_done, f_fail)
	return function()
		if(not can_eat_wuchang()) then call(f_fail) return end
		
		wait.make(function()
			bank.cunqu("qukuan 5 gold", function()
				Execute("e;s;e;e;n;buy wuchang dan")
				busy_test(function()
					Execute("fly wm;nw;eat wuchang dan")
					var.last_wuchang = os.time()
					wait.time(5)
					print("无常丹好吃啊")
					call(f_done)
				end)
			end)
		end)
	end
end


heal_jing = function(f_done, f_fail)
	return function()
		local jsP = tonumber(var.hp_jsP)
		print("精神%: " .. jsP)

		if(jsP >= 95) then print("不用疗精") call(f_done) return end

		wait.make(function()
			local f = function()
				local dannumber = math.ceil((100-jsP)/5)
				local price = dannumber * 35
				bank.cunqu("qukuan " .. price .. " silver", function()
					Execute("e;s;e;e;n")
					for i = 1, dannumber do Execute("buy yangjing dan") end
					busy_test(function()
						Execute("fly wm;nw")
						for i = 1, dannumber do Execute("et;eat yangjing dan") wait.time(3) end
						print("疗精完毕")
						call(f_done)
					end)
				end)
			end
			
			if(jsP < 60) then eat_wuchang(f_done, f) elseif(jsP < 95) then call(f) end
		end)
	end
end

heal_qi = function(f_done, f_fail)
	return function()
		local qxP = tonumber(var.hp_qxP)

		if(qxP >= 95) then print("不用疗气") call(f_done) return end

		wait.make(function()
			if(qxP < 30) then
				eat_wuchang(f_done, f_fail)
			elseif(qxP < 95) then
				Execute("er;et;yun heal")
				local l, w = wait.regexp("^(> )*(你并没有受伤！)|(你运功完毕).*$")
				print("疗气完毕")
				call(f_done)
			end
		end)
	end
end

foodwater = function(f_done)
	return function()
		if(tonumber(var.hp_water) > tonumber(var.hp_water_max) and tonumber(var.hp_food) > tonumber(var.hp_food_max)) then print("不需要吃喝") call(f_done) return end

		wait.make(function()
			Execute("set brief;fly jx;buy zongzi")
			wait.time(2)
			Execute("fly xx;su;s;ed;nw;w;buy shuinang;")
			wait.time(2)
			Execute("eat zongzi;#4 (drink shuinang);drop zongzi;drop zong ye;")
			wait.time(2)
			Execute("#4 (drink shuinang);drop shuinang;unset brief;fly wm")
			--wait.regexp("^(> )*设定环境变数：foodwater = \"YES\"$")
			print("酒足饭饱了")
			call(f_done)
		end)
	end
end --function


check_money = function(f_done)
	return function()
		wait.make(function()
			var.me_silver = 1
			var.me_gold = 1
			var.me_goldbar = 1

			capture("check_money", "look silver;look gold;look gold-bar", function()
				local cmd = ""
				if(tonumber(var.me_silver) > 800 or tonumber(var.me_silver) < 50 or tonumber(var.me_gold) < 16 or tonumber(var.me_gold) > 30 or tonumber(var.me_goldbar) > 1) then
					cmd = cmd .. "cunkuan " .. tonumber(var.me_silver) .. " silver;"
					cmd = cmd .. "cunkuan " .. tonumber(var.me_gold) .. " gold;"
					cmd = cmd .. "cunkuan " .. tonumber(var.me_goldbar) .. " gold-bar"
				end

				if(cmd ~= "") then
					bank.cunqu(cmd .. ";qukuan 99 silver; qukuan 19 gold", function() var.me_goldbar = 0 call(f_done) end)
					Execute("fly wm;e;s;w")
					Execute(cmd)
					Execute("qukuan 99 silver;qukuan 19 gold")
					wait.time(5)
					Execute("halt;fly wm")
					var.me_goldbar = 0
				end

				call(f_done)
			end)
		end)
	end
end

function call(f)
	if(f ~= nil) then f() end
end

function callfail(f_done, f_fail)
	if(not f_fail) then call(f_fail) else call(f_done) end
end
