
system = {}


function on_system_busy(n, l, w)
	if(msg.listener("busy")) then
		print("has hook on event busy")
		if(string.match(l, "suicide -f")) then
			DoAfterSpecial(tonumber(var.busydelay), "Execute(\"suicide -a\")",12)
		else
			msg.broadcast("busy")
		end
	end
end


function on_system_fainting()
	if(msg.listener("fainting")) then
		print("has hook on event fainting")
		msg.broadcast("fainting")
	else
		print("no hook on event fainting, disconnecting...")
		wait.make(function()
			Execute("#2 (halt);quit;")
			wait(1)
			Execute("#2 (halt);quit;")
			wait(1)
			Execute("#2 (halt);quit;")
		end)
	end
end

function on_system_dead()
	if(msg.listener("dead")) then
		print("has hook on event dead")
		msg.broadcast("dead")
	else
		print("no hook on event dead, disconnecting...")
		Disconnect()
	end
end

function on_system_fainted()
	if(msg.listener("fainted") == true) then
		print("has hook on event fainted")
		raiseEvent("fainted")
	end
end


function queue(cmd)
	Execute(cmd)
end

function capture(cmd, f_done, f_fail)
	DeleteTemporaryTriggers()
	
	wait.make(function()
		local t = GetUniqueNumber()
		Execute(cmd .. ";set capture " .. t)
		local l, w = wait.regexp("^(> )*设定环境变数：capture = (\\d+)$", 10)
		print(t)
		print(w[2])
		if(l ~= nil and tonumber(w[2]) == t) then call(f_done) else call(f_fail) end
	end)
end

function busy_test(f_done, interval)
	DeleteTemporaryTriggers()
	local i = tonumber(interval) or 1
	local f = nil
	f = function()
		wait.make(function()
			Execute("suicide")
			local l, w = wait.regexp("^(> )*(你正忙着呢，没空自杀！)|(请用 suicide -f 确定自杀。)$")
			if(l ~= nil and l:match("确定自杀") ~= nil) then
				call(f_done)
			else
				timer.tickonce("action", i, f) 
			end
		end)
	end
	
	f()
end

function abort_busytest()
end

local safeback_cxt = {}

function safeback(cmd, f_done, interval)
	--if(safeback_cxt.f_done ~= nil) then safeback_cxt.f_done = f_done return end
	
	var.faint_flag = false
	safeback_cxt.f_done = f_done
	local i = tonumber(interval) or 0.1
	local f = nil
	f = function()
		wait.make(function()
			if(var.faint_flag == "true") then safeback_cxt = {} return end
			Execute(cmd)
			local l, w = wait.regexp("^(> )*(只见你消失在一团烟雾之中)|(你现在很忙)|(你正忙着)|(战斗中无法飞行).*$", 10)
			if(l ~= nil and l:match("只见你消失") ~= nil) then 
				call(safeback_cxt.f_done)
				safeback_cxt = {}
			else
				timer.tickonce("action", i, f) 
			end
		end)
	end
	
	f()
end

local safehalt_cxt = {}
function safehalt(f_done, interval)
	--if(safehalt_cxt.f_done ~= nil) then safehalt_cxt.f_done = f_done return end

	var.faint_flag = false
	safehalt_cxt.f_done = f_done
	local i = tonumber(interval) or 0.1
	local f = nil
	f = function()
		wait.make(function()
			if(var.faint_flag == "true") then safehalt_cxt = {} return end
			Execute("halt")
			local l, w = wait.regexp("^(> )*(你身行向后一跃，跳出战圈不打了)|(你现在很忙)|(你正忙着)|(你现在不忙).*$", 10)
			if(l ~= nil and (l:match("跳出战圈不打了") ~= nil or l:match("你现在不忙") ~= nil)) then 
				local f = safehalt_cxt.f_done
				call(f)
				safehalt_cxt = {}
			else
				timer.tickonce("action", i, f) 
			end
		end)
	end
	
	f()
end

--[[
function busy_test(f_done, interval)
	DeleteTemporaryTriggers()
	var.system_magic_number = GetUniqueNumber()
	local i = tonumber(interval) or 1
	local n = tonumber(var.system_magic_number)
	wait.make(function()
		repeat
			Execute("suicide")
			local l, w = wait.regexp("^(> )*(你正忙着呢，没空自杀！)|(请用 suicide -f 确定自杀。)$")
			if(l:match("你正忙着呢，没空自杀") ~= nil) then wait.time(i) end
			if(n ~= tonumber(var.system_magic_number)) then return end
		until(l:match("确定自杀") ~= nil)
		call(f_done)
	end)
end


function abort_busytest()
	var.system_magic_number = GetUniqueNumber()
end


function safeback(cmd, f_done)
	var.faint_flag = false
	wait.make(function()
		repeat
			if(var.faint_flag == "true") then return end
			Execute(cmd)
			local l, w = wait.regexp("^(> )*(只见你消失在一团烟雾之中)|(你现在很忙)|(你正忙着)|(战斗中无法飞行).*$", 10)
			if(l == nil or l:match("只见你消失") == nil) then wait.time(0.3) end
		until(l ~= nil and l:match("只见你消失") ~= nil)
		call(f_done)
	end)
end
]]--

chs2num = function (s)----------------数字转换
   local cur = 0
   local yi = 0
   local sgl = 0
   local len = string.len(s)
   local tt = {}
   tt["零"] = function() end
   tt["一"] = function() sgl = 1   end
   tt["二"] = function() sgl = 2   end
   tt["三"] = function() sgl = 3   end
   tt["四"] = function() sgl = 4   end
   tt["五"] = function() sgl = 5   end
   tt["六"] = function() sgl = 6   end
   tt["七"] = function() sgl = 7   end
   tt['八'] = function() sgl = 8   end
   tt["九"] = function() sgl = 9   end
   tt["十"] = function()
      if sgl == 0 then sgl = 1 end
      cur = cur + sgl * 10
      sgl = 0
   end
   tt["百"] = function()
      cur = cur + sgl * 100
      sgl = 0
   end
   tt["千"] = function()
      cur = cur + sgl * 1000
      sgl = 0
   end
   tt["万"] = function()
      cur = (cur +sgl) * 10000
      sgl = 0
   end
   tt["亿"] = function()
      yi = (cur + sgl) * 100000000
      cur = 0
      sgl = 0
   end
   for i = 1,len,2 do
      k = string.sub(s,i,i+1)
      tt[k]()
   end
   num = yi + cur +sgl
----   print(num)
   return num
end


getitemnum = function(str)
	local num = 1
	local re = rex.new("(((零|一|二|三|四|五|六|七|八|九|十|百|千|万)*)(位|支|颗|个|把|只|粒|张|枚|件|柄|根|块|文|两|碗|点)){0,1}(.*)")
	local a, b, matchs = re:match(str)
	if(matchs ~= nil) then
		if(matchs[2] ~= false) then
			num = chs2num(matchs[2])
			str = matchs[5]
		end
	end
	return num
end

getseconds = function(str)
	local minute, second = 0, 0
	local re = rex.new("(((零|一|二|三|四|五|六|七|八|九|十|百|千|万)*)(分)){0,1}(((零|一|二|三|四|五|六|七|八|九|十|百|千|万)*)(秒)){0,1}(.*)")
	local a, b, matchs = re:match(str)
	
	if(matchs ~= nil) then
		if(matchs[2] ~= false) then
			minute = chs2num(matchs[2])
		end
		
		if(matchs[6] ~= false) then
			second = chs2num(matchs[6])
		end
	end
	
	return (minute*60 + second)
end
