require "wait"
require "tprint"
require "utils"
require "var"

module ("heal", package.seeall)

function fullme(f_done)
	EnableTriggerGroup("HP", true)
	wait.make(function()
		Execute("hp;set hp")
		local l, w = wait.regexp("^(> )*设定环境变数：hp = \"YES\"$")
		EnableTriggerGroup("HP", false)
		ssf(function()
			qudu(function()
				foodwater(function()
					jingqi(function()
						call(f_done)
					end)
				end)
			end)
		end)

	end)
end

function ssf(f_done)
	if(me["ssf"] == nil or (not me["ssf"])) then print("没中生死符") call(f_done) return end
	
	wait.make(function()
		Execute("fly wm;e;s;w;qukuan 25 gold")
		wait.time(5)
		Execute("fly lj;s;give 25 gold to shouling")
		local l, w = wait.regexp("^(> )*(这里没有这个人)|(.*你没有中生死符啊，你想中吗).*$")
		
		if(l:match("这里没有这个人") ~= nil) then
			print("断线")
			return
		end
		
		wait.time(5)
		me["ssf"] = false
		print("生死符好了")
		call(f_done)
	end)
end

function qudu(f_done)
	if(me["poisonous"] == nil or (not me["poisonous"])) then print("没有中毒") call(f_done) return end
	
	wait.make(function()
		Execute("fly wm;u;er;et;yun cure")
		repeat
			local l, w = wait.regexp("^(> )*(你.*消褪了！)|(你并未中毒。)$", 15)
		until((l == nil) or (l:match("你并未中毒") ~= nil))
		Execute("halt")
		print("驱毒完毕")
		call(f_done)
	end)
end

function canEatWuchang()
	if(var.last_wuchang == nil) then return true end
	
	local now = tonumber(os.time())
	local old = tonumber(var.last_wuchang)
	
	--25分钟间隔可以吃wuchag
	if(now - old >= 1500) then return true end
	return false
end


function jingqi(f_done)
	local jsP = tonumber(me["js%"])
	local qxP = tonumber(me["qx%"])
	if(jsP >= 95 and qxP >= 95) then print("不用疗伤") call(f_done) return end
	
	wait.make(function()
		if(jsP < 60 and canEatWuchang()) then
			Execute("fly wm;e;s;w;qukuan 5 gold")
			wait.time(5)
			Execute("e;s;e;e;n;buy wuchang dan")
			wait.time(2)
			Execute("eat wuchang dan")
			var.last_wuchang = os.time()
			print("无常丹好吃啊")
			call(f_done)
			return
		else
			if(jsP < 95) then
				local dannumber = (100-jsP)/5
				if(dannumber == math.ceil(dannumber)) then dannumber = math.ceil(dannumber) + 1 else dannumber = math.ceil(dannumber) end
				Execute("fly wm;e;s;w;qukuan 3 gold")
				wait.time(5)
				Execute("e;s;e;e;n")
				for i = 1, dannumber do
					Execute("buy yangjing dan")
					wait.time(2)
					Execute("eat yangjing dan")
					wait.time(5)
				end
				print("疗精完毕")
			end
			Execute("fly wm;u;er;et;yun heal")
			--你运功完毕，缓缓站了起来，脸色看起来好了许多。
			local l, w = wait.regexp("^(> )*(你并没有受伤！)|(你运功完毕).*$")
			print("疗气完毕")
			call(f_done)
		end
	end)
end


function foodwater(f_done)
	if(tonumber(me["water"]) > tonumber(me["water_max"]) and tonumber(me["food"]) > tonumber(me["food_max"])) then print("不需要吃喝") call(f_done) return end
	wait.make(function()
		Execute("set brief;fly jx;buy zongzi;")
		wait.time(2)
		Execute("fly xx;su;s;ed;nw;w;buy shuinang;")
		wait.time(2)
		Execute("eat zongzi;#8 (drink shuinang);drop zongzi;drop zong ye;")
		wait.time(2)
		Execute("#8 (drink shuinang);drop shuinang;unset brief;fly wm;set foodwater")
		--wait.regexp("^(> )*设定环境变数：foodwater = \"YES\"$")
		print("酒足饭饱了")
		call(f_done)
	end)
end --function


function call(f)
	if(f ~= nil) then f() end
end