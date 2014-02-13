require "wait"
require "tprint"
require "utils"
require "var"

module ("heal", package.seeall)

function fullme(f_done)
	EnableTriggerGroup("HP", true)
	wait.make(function()
		Execute("hp;set hp")
		local l, w = wait.regexp("^(> )*�趨����������hp = \"YES\"$")
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
	if(me["ssf"] == nil or (not me["ssf"])) then print("û��������") call(f_done) return end
	
	wait.make(function()
		Execute("fly wm;e;s;w;qukuan 25 gold")
		wait.time(5)
		Execute("fly lj;s;give 25 gold to shouling")
		local l, w = wait.regexp("^(> )*(����û�������)|(.*��û����������������������).*$")
		
		if(l:match("����û�������") ~= nil) then
			print("����")
			return
		end
		
		wait.time(5)
		me["ssf"] = false
		print("����������")
		call(f_done)
	end)
end

function qudu(f_done)
	if(me["poisonous"] == nil or (not me["poisonous"])) then print("û���ж�") call(f_done) return end
	
	wait.make(function()
		Execute("fly wm;u;er;et;yun cure")
		repeat
			local l, w = wait.regexp("^(> )*(��.*�����ˣ�)|(�㲢δ�ж���)$", 15)
		until((l == nil) or (l:match("�㲢δ�ж�") ~= nil))
		Execute("halt")
		print("�������")
		call(f_done)
	end)
end

function canEatWuchang()
	if(var.last_wuchang == nil) then return true end
	
	local now = tonumber(os.time())
	local old = tonumber(var.last_wuchang)
	
	--25���Ӽ�����Գ�wuchag
	if(now - old >= 1500) then return true end
	return false
end


function jingqi(f_done)
	local jsP = tonumber(me["js%"])
	local qxP = tonumber(me["qx%"])
	if(jsP >= 95 and qxP >= 95) then print("��������") call(f_done) return end
	
	wait.make(function()
		if(jsP < 60 and canEatWuchang()) then
			Execute("fly wm;e;s;w;qukuan 5 gold")
			wait.time(5)
			Execute("e;s;e;e;n;buy wuchang dan")
			wait.time(2)
			Execute("eat wuchang dan")
			var.last_wuchang = os.time()
			print("�޳����ó԰�")
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
				print("�ƾ����")
			end
			Execute("fly wm;u;er;et;yun heal")
			--���˹���ϣ�����վ����������ɫ������������ࡣ
			local l, w = wait.regexp("^(> )*(�㲢û�����ˣ�)|(���˹����).*$")
			print("�������")
			call(f_done)
		end
	end)
end


function foodwater(f_done)
	if(tonumber(me["water"]) > tonumber(me["water_max"]) and tonumber(me["food"]) > tonumber(me["food_max"])) then print("����Ҫ�Ժ�") call(f_done) return end
	wait.make(function()
		Execute("set brief;fly jx;buy zongzi;")
		wait.time(2)
		Execute("fly xx;su;s;ed;nw;w;buy shuinang;")
		wait.time(2)
		Execute("eat zongzi;#8 (drink shuinang);drop zongzi;drop zong ye;")
		wait.time(2)
		Execute("#8 (drink shuinang);drop shuinang;unset brief;fly wm;set foodwater")
		--wait.regexp("^(> )*�趨����������foodwater = \"YES\"$")
		print("���㷹����")
		call(f_done)
	end)
end --function


function call(f)
	if(f ~= nil) then f() end
end