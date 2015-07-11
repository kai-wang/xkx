require "wait"
require "tprint"
require "utils"
require "string"

module ("dig", package.seeall)

local context = {}
local items = {"heshouwu", "renshen", "yulu", "lingxin dan", "qubing dan", "wan"}

init = function()
	DeleteTemporaryTriggers()
end

main = function(f_done, f_fail)

	context.f_done = f_done
	context.f_fail = f_fail
	
	print("曲清任务开始。。")
	start()
end

start = function()
	wait.make(function()
		Execute("set brief;fly wm;e;e;ask qu about job;")
		local l, w = wait.regexp("^(> )*(曲清说道:拿好这个通天镜)|(曲清说道：.*怎么还不去挖宝)|(曲清说道：.*休息)|(这里没有这个人)|(曲清说道：这么大了).*$")
		if(l == nil or l:match("拿好这个通天镜") == nil) then 
			cancel()
		else
			var.dig_start_time = os.time()
			check()
		end
	end)
end


check = function()
	Execute("detect")
	local l, w = wait.regexp("^(> )*宝物的地点似乎在(.*)。$", 3)
	if(l == nil) then return call(fail) end
	
	var.dig_loc = w[2]
	l, w = wait.regexp(".*■.*", 3)
	if(l == nil) then return call(fail) end
	
	search(l)
end


search = function(desc)
	local seperator = "[-., ()\"a-zA-Z]"
	--print(l)
	--有个别房间有,.-这些符号，比如庄府大厅，苏州铁岭关，描述里面没有，所以这里去掉
	local x = desc:gsub(seperator, "")
	x = x:gsub("■", ".*")
	local tbl = {}
	local rooms = regions[var.dig_loc].rooms
	if(rooms == nil) then
		quqling.cancel()
	else
		for i, v in ipairs(rooms) do
			--	有个别房间有,.-这些符号，比如庄府大厅，苏州铁岭关，描述里面没有，所以这里去掉
			local desc = v.desc:gsub(seperator, "")
			--	危险的房间不去，比如食人鱼
			if(string.match(desc, x) ~= nil and v.attr ~= "danger" and v.nodig ~= true) then
				print("匹配的房间id: "..v.id .." 名称:"..v.name)
				table.insert(tbl, v.path)
			end
		end

		if(tbl ~= {}) then
			if(var.dig_loc == "灵州") then
				get_yaopai(function() dig(tbl) end, fail)
			else
				dig(tbl)
			end
		end
	end
end


dig = function(tbl)
	if(var.dig_loc == "灵州") then
		Execute("fly lz;w;n;n;e;ask nu about 腰牌;")
		wait.time(1)
	end
	
	local dignext = nil
	
	local dignext, iterator, i = nil, nil, 0
	iterator = function()
		return function()
			i = i + 1
			if(i <= #tbl) then 
				dignext("halt;" .. tbl[i])
			else
				fail()
			end
		end
	end
	
	dignext = function(path)
		walk.run(path, function()
			wait.make(function()
				Execute("dig")
				local l, w = wait.regexp("你挖了半天，发现什么都没有，似乎找错地方了。|你过了一会儿，从土里掏出一件东西，不禁欢呼起来。|只听“铛”的一声，铁铲断成两节!")
				if(string.match(l, "你过了一会儿，从土里掏出一件东西，不禁欢呼起来。")) then
					return done()
				elseif(string.match(l, "只听“铛”的一声，铁铲断成两节!")) then
					return fail()
				else
					wait.time(5)
					call(iterator())
				end			
			end)
		end,
		fail)
	end
	
	call(iterator())
end

cancel = function()
	Execute("ask qu about cancel;fly wm")
	var.dig_available_time = os.time() + 120
	EnableTriggerGroup("dig", false)
	call(context.f_fail)
	print("曲清任务结束。。")
end

fail = function()
	safeback("halt;fly wm", 
		function()
			Execute("e;e;ask qu about cancel")
			safeback("halt;fly wm", 
			function()
				var.dig_available_time = os.time() + 120
				EnableTriggerGroup("dig", true)
				call(context.f_fail)
				print("曲清任务结束。。")
			end)
		end)
end

done = function()
	safeback("halt;fly wm", 
		function()
			Execute("e;e;give bao wu to qu")
			safeback("halt;fly wm", 
			function()
				Execute("give dan to " .. var.dig_dummy .. ";give yulu to " .. var.dig_dummy .. ";give renshen to " .. var.dig_dummy .. ";give heshouwu to " .. var.dig_dummy .. ";give wan to " .. var.dig_dummy)
				var.dig_available_time = os.time() + 60
				EnableTriggerGroup("dig", true)
				me.updateHP()
				call(context.f_done)
				print("曲清任务结束。。")
			end)
		end
	)
end


guaji = function()
	--wait.make(function()
		local f = nil
		f = function()
			local t = tonumber(var.dig_available_time) - os.time()
			print("重启等待ms: " .. t)
			wait.make(function()
				if(t > 0) then wait.time(t) end
				main(f, f)
			end)
		end
		
		main(f, f)
	--end)
end

init()