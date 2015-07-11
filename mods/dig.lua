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
	
	print("��������ʼ����")
	start()
end

start = function()
	wait.make(function()
		Execute("set brief;fly wm;e;e;ask qu about job;")
		local l, w = wait.regexp("^(> )*(����˵��:�ú����ͨ�쾵)|(����˵����.*��ô����ȥ�ڱ�)|(����˵����.*��Ϣ)|(����û�������)|(����˵������ô����).*$")
		if(l == nil or l:match("�ú����ͨ�쾵") == nil) then 
			cancel()
		else
			var.dig_start_time = os.time()
			check()
		end
	end)
end


check = function()
	Execute("detect")
	local l, w = wait.regexp("^(> )*����ĵص��ƺ���(.*)��$", 3)
	if(l == nil) then return call(fail) end
	
	var.dig_loc = w[2]
	l, w = wait.regexp(".*��.*", 3)
	if(l == nil) then return call(fail) end
	
	search(l)
end


search = function(desc)
	local seperator = "[-., ()\"a-zA-Z]"
	--print(l)
	--�и��𷿼���,.-��Щ���ţ�����ׯ����������������أ���������û�У���������ȥ��
	local x = desc:gsub(seperator, "")
	x = x:gsub("��", ".*")
	local tbl = {}
	local rooms = regions[var.dig_loc].rooms
	if(rooms == nil) then
		quqling.cancel()
	else
		for i, v in ipairs(rooms) do
			--	�и��𷿼���,.-��Щ���ţ�����ׯ����������������أ���������û�У���������ȥ��
			local desc = v.desc:gsub(seperator, "")
			--	Σ�յķ��䲻ȥ������ʳ����
			if(string.match(desc, x) ~= nil and v.attr ~= "danger" and v.nodig ~= true) then
				print("ƥ��ķ���id: "..v.id .." ����:"..v.name)
				table.insert(tbl, v.path)
			end
		end

		if(tbl ~= {}) then
			if(var.dig_loc == "����") then
				get_yaopai(function() dig(tbl) end, fail)
			else
				dig(tbl)
			end
		end
	end
end


dig = function(tbl)
	if(var.dig_loc == "����") then
		Execute("fly lz;w;n;n;e;ask nu about ����;")
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
				local l, w = wait.regexp("�����˰��죬����ʲô��û�У��ƺ��Ҵ�ط��ˡ�|�����һ������������ͳ�һ����������������������|ֻ����������һ���������ϳ�����!")
				if(string.match(l, "�����һ������������ͳ�һ����������������������")) then
					return done()
				elseif(string.match(l, "ֻ����������һ���������ϳ�����!")) then
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
	print("���������������")
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
				print("���������������")
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
				print("���������������")
			end)
		end
	)
end


guaji = function()
	--wait.make(function()
		local f = nil
		f = function()
			local t = tonumber(var.dig_available_time) - os.time()
			print("�����ȴ�ms: " .. t)
			wait.make(function()
				if(t > 0) then wait.time(t) end
				main(f, f)
			end)
		end
		
		main(f, f)
	--end)
end

init()