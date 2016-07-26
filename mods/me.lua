require "tprint"

local starMappings = {
	["white"] 	= "shan",
	["lime"] 	= "bb",
	["yellow"] 	= "guanfu",
	["magenta"] = "wei",
	["blue"] 	= "sx",
	["red"] 	= "task",
	["cyan"] 	= "guo"
}

on_star_update = function(name, line, wildcards, styles)
	EnableTriggerGroup("HP_star", false)
	for i, v in pairs(starMappings) do
		SetVariable("hp_star_" .. v, 0)
	end

	for i = 1, #styles do
		if(styles[i].text == "★") then
			local t = starMappings[RGBColourToName(styles[i].textcolour)]
			if(t ~= nil) then
				SetVariable("hp_star_" .. t, 1)
			end
		end
	end
end

--[[
	精神:		js
	精神最大值: js_max
	精神百分比:	jx%
	精力：		jl
	精力最大值：jl_max
]]--
on_hp1_update = function(name, line, wildcards)
	var.hp_js 		= tonumber(wildcards[1])
	var.hp_js_max 	= tonumber(wildcards[2])
	var.hp_jsP		= tonumber(wildcards[3])
	var.hp_jl 		= tonumber(wildcards[4])
	var.hp_jl_max 	= tonumber(wildcards[5])
end

--[[
	气血:		qx
	气血最大值: qx_max
	气血百分比:	qx%
	内力：		nl
	内力最大值：nl_max
]]--
on_hp2_update = function(name, line, wildcards)
	var.hp_qx			= tonumber(wildcards[1])
	var.hp_qx_max		= tonumber(wildcards[2])
	var.hp_qxP			= tonumber(wildcards[3])
	var.hp_nl			= tonumber(wildcards[4])
	var.hp_nl_max		= tonumber(wildcards[5])
end


--[[
	正气:		zq
	阅历: 		yl
]]--
on_hp3_update = function(name, line, wildcards)
	var.hp_zq 		= tonumber(wildcards[1])
	var.hp_yl		= tonumber(wildcards[2])
end


--[[
	食物：		food
	食物最大值：food_max
	潜能：		qn
	潜能最大值：qn_max
]]--
on_hp4_update = function(name, line, wildcards)
	var.hp_food		= tonumber(wildcards[1])
	var.hp_food_max	= tonumber(wildcards[2])
	var.hp_qn		= tonumber(wildcards[3])
	var.hp_qn_max	= tonumber(wildcards[4])
end


--[[
	饮水：		water
	饮水最大值: water_max
	经验值：	exp
]]--
on_hp5_update = function(name, line, wildcards)
	var.hp_water		= tonumber(wildcards[1])
	var.hp_water_max	= tonumber(wildcards[2])
	var.hp_exp			= tonumber(wildcards[3])
end


--[[
	丹田:		dt
	丹田最大值:	dt_max
	修为: 		xw
]]--
on_hp6_update = function(name, line, wildcards)
	var.hp_dt			= tonumber(wildcards[1])
	var.hp_dt_max		= tonumber(wildcards[2])
	var.hp_xw			= tonumber(wildcards[3])
end

module ("me", package.seeall)

updateHP = function(f_done)
	wait.make(function()
		EnableTriggerGroup("HP_star", true)
		EnableTriggerGroup("HP", true)
		Execute("hp;set check hp")
		local l, w = wait.regexp("^(> )*设定环境变数：check = \"hp\"$")
		EnableTriggerGroup("HP", false)
		EnableTriggerGroup("HP_star", false)
		call(f_done)
	end)
end

-- qfull for sstask etc
qfull = function(f_done)
	updateHP(function()
		qudu(function()
			foodwater(function()
				jingqi(function()
					recover2(f_done)
				end)
			end)
		end)
	end)
end

full = function(f_done)
	--call(updateHP(healssf(qudu(foodwater(jingqi(f_done))))))

	updateHP(function()
		healssf(function()
			qudu(function()
				foodwater(function()
					jingqi(f_done)
				end)
			end)
		end)
	end)

end

cleanup = function(f_done)
	--call(full(check_money(useqn(recover(f_done)))))

	full(function()
		check_money(function()
			--useqn(function()
				recover(function()
					get_xionghuang(f_done,f_done)
				end)
			--end)
		end)
	end)

end

recover = function(f_done, f_fail)
	updateHP(function()
		if(tonumber(var.hp_nl) > tonumber(var.hp_nl_max) * 0.8) then
			wait.make(function()
				Execute("er;et;fly wm;set check full")
				local l, w = wait.regexp("^(> )*设定环境变数：check = \"full\"$")
				call(f_done)
			end)
		else
			core.busytest(function()
			--Execute("fly wm;u")
				Execute("set brief;fly lj;n;e;e;n;n;w;w;climb ice;e")
				dazuo.start(function()
					wait.make(function()
						Execute("er;ef;d;set check full")
						local l, w = wait.regexp("^(> )*设定环境变数：check = \"full\"$")
						call(f_done)
					end)
				end)
			end)
		end
	end)
end

recover2 = function(f_done, f_fail)
	updateHP(function()
		if(tonumber(var.hp_nl) > tonumber(var.hp_nl_max)) then
			wait.make(function()
				Execute("er;et;set check full")
				local l, w = wait.regexp("^(> )*设定环境变数：check = \"full\"$")
				call(f_done)
			end)
		else
			--Execute("eat yin dan")
			updateHP(function()
				core.busytest(function()
					--Execute("fly wm;u")
					Execute("set brief;fly lj;n;e;e;n;n;w;w;climb ice;e")
					dazuo.start(function()
						wait.make(function()
							Execute("er;ef;d;set check full")
							local l, w = wait.regexp("^(> )*设定环境变数：check = \"full\"$")
							call(f_done)
						end)
					end)
				end)
			end)
		end
	end)
end

healssf = function(f_done, f_fail)
	if(var.me_status_ssf == nil or (var.me_status_ssf == "false")) then print("没中生死符") return call(f_done) end
	local retry, retrytimes = nil, 0

	retry = function()
		if(retrytimes > 5) then return call(f_fail) else retrytimes = retrytimes + 1 end
		qukuan("15 gold",
		function()
			wait.make(function()
				Execute("fly lj;s;give 15 gold to lingjiu shouling")
				local l, w = wait.regexp("^(> )*(这里没有这个人)|(.*你没有中生死符啊，你想中吗)|(.*你身上的生死符已解了).*$", 5)

				if(l == nil or l:match("这里没有这个人") ~= nil) then
					retry()
				else
					core.busytest(function()
						var.me_status_ssf = false
						print("生死符好了")
						call(f_done)
					end)
				end
			end)
		end,
		retry)
	end

	retry()
end

qudu = function(f_done)
	if(var.me_status_poison == "true" and (tonumber(var.hp_nl) < 200 or tonumber(var.hp_jsP) < 60)) then
		qukuan("10 gold", function()
			Execute("e;s;e;e;n;buy yao")
			core.busytest(function()
				wait.make(function()
					Execute("fly wm;nw;eat yao")
					print("冰蟾好吃啊")
					wait.time(5)
					var.me_status_poison = false
					call(f_done)
				end)
			end)
		end)
	else
		wait.make(function()
			Execute("fly wm;nw;er;et;yun cure")
			repeat
			local l, w = wait.regexp("^(> )*(你.*消褪了！)|(你并未中毒。)|(你现在精不够.*)$", 10)
			until((l == nil) or (l:match("你并未中毒") ~= nil) or (l:match("你现在精不够") ~= nil))
			Execute("halt")
			print("驱毒完毕")
			var.me_status_poison = false
			call(f_done)
		end)
	end
end

canEatWuchang = function()
	if(var.last_wuchang == nil or var.last_wuchang == "") then return true end

	local now = tonumber(os.time())
	local old = tonumber(var.last_wuchang)

	--25分钟间隔可以吃wuchag
	if(now - old >= 1500) then return true end
	return false
end


jingqi = function(f_done)
	local jsP = tonumber(var.hp_jsP)
	local qxP = tonumber(var.hp_qxP)
	print(jsP, qxP)
	if(jsP >= 95 and qxP >= 95) then print("不用疗伤") return call(f_done) end

	wait.make(function()
		if(var.me_menpai == "逍遥") then
			Execute("fly xyl;n;n;ask xue about 疗伤;fly wm")
			local l, w = wait.regexp("^(> )*(大约过了一盅茶的时份)|(这里没有这个人).*$", 5)
			if((l ~= nil) and l:match("大约过了一盅茶的时份") ~= nil) then return call(f_done) end
		end

		if(var.me_menpai == "明教") then
			Execute("fly mj;s;sd;s;sd;#3(sd);enter;ask hu about 疗伤;fly wm")
			local l, w = wait.regexp("^(> )*(大约过了一盅茶的时份)|(这里没有这个人).*$", 5)
			if((l ~= nil) and l:match("大约过了一盅茶的时份") ~= nil) then return call(f_done) end
		end

		if((jsP < 60 or qxP < 30) and canEatWuchang())
		then
			qukuan("5 gold", function()
				Execute("e;s;e;e;n;buy wuchang dan")
					core.busytest(function()
					wait.make(function()
						Execute("fly wm;nw;eat wuchang dan")
						var.last_wuchang = os.time()
						print("无常丹好吃啊")
						wait.time(5)
						call(f_done)
					end)
				end)
			end)
		else
			if(jsP < 95) then
				local dannumber = math.ceil((100-jsP)/5)
				local price = dannumber * 35
				--if(dannumber == math.ceil(dannumber)) then dannumber = math.ceil(dannumber) + 1 else dannumber = math.ceil(dannumber) end
				qukuan("" .. price .. " silver", function()
					Execute("e;s;e;e;n")
					for i = 1, dannumber do Execute("buy yangjing dan") end
					core.busytest(function()
						wait.make(function()
							Execute("fly wm;nw")
							for i = 1, dannumber do Execute("et;eat yangjing dan") wait.time(3) end
							print("疗精完毕")
							Execute("er;et;yun heal")
							local l, w = wait.regexp("^(> )*(你并没有受伤！)|(你运功完毕).*$")
							print("疗气完毕")
							call(f_done)
						end)
					end)
				end)
			elseif(qxP < 90) then
				core.busytest(function()
					wait.make(function()
						Execute("er;et;yun heal")
						local l, w = wait.regexp("^(> )*(你并没有受伤！)|(你运功完毕).*$")
						print("疗气完毕")
						call(f_done)
					end)
				end)
			else
				call(f_done)
			end
		end
	end)
end


foodwater = function(f_done)
	if(tonumber(var.hp_water) > tonumber(var.hp_water_max) and tonumber(var.hp_food) > tonumber(var.hp_food_max)) then
		print("不需要吃喝")
		return call(f_done)
	end

	wait.make(function()
		Execute("set brief;fly jx;buy zongzi;")
		wait.time(2)
		Execute("fly xx;su;s;ed;nw;w;buy shuinang;")
		wait.time(2)
		Execute("eat zongzi;#5 (drink shuinang);drop zongzi;drop zong ye;")
		wait.time(2)
		Execute("#5 (drink shuinang);drop shuinang;unset brief;fly wm")
		print("酒足饭饱了")
		call(f_done)
	end)
end --function


useqn = function(f_done)
	if(tonumber(var.hp_qn) >= tonumber(var.hp_qn_max)) then
		study.main(f_done)
	else
		call(f_done)
		print("不需要花qn")
	end
end

check_money = function(f_done)
	wait.make(function()
		var.me_silver = 1
		var.me_gold = 1
		var.me_goldbar = 1

		EnableTriggerGroup("check_money", true)
		Execute("look silver;look gold;look gold-bar;set check money")
		local l, w = wait.regexp("^(> )*设定环境变数：check = \"money\"$")
		EnableTriggerGroup("check_money", false)
		local cmd = ""
		if(tonumber(var.me_silver) > 800 or tonumber(var.me_silver) < 50 or tonumber(var.me_gold) < 15 or tonumber(var.me_gold) > 30 or tonumber(var.me_goldbar) > 1) then
			cmd = cmd .. "cunkuan " .. tonumber(var.me_silver) .. " silver;"
			cmd = cmd .. "cunkuan " .. tonumber(var.me_gold) .. " gold;"
			cmd = cmd .. "cunkuan " .. tonumber(var.me_goldbar) .. " gold-bar"
		end

		if(cmd ~= "") then
			Execute("fly wm;e;s;w")
			Execute(cmd)
			if(var.me_qukuan == nil or var.me_qukuan == "") then var.me_qukuan = "qukuan 99 silver;qukuan 19 gold" end
			Execute(var.me_qukuan)
			wait.time(5)
			Execute("halt;fly wm")
			var.me_goldbar = 0
		end

		call(f_done)
	end)
end
