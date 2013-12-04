
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


function busytest(callback, ...)
	msg.subscribe("busy",callback, ...)
	Execute("suicide -a")
end

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
	return str, num
end

