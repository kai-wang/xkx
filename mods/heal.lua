require "wait"
require "tprint"
require "utils"
require "var"

module ("heal", package.seeall)

function fullme(f_done)
	EnableTriggerGroup("HP", true)
	wait.make(function()
		Execute("hp;set hp")
		EnableTriggerGroup("HP", false)
		local l, w = wait.regexp("^(> )*�趨����������hp = \"YES\"$")
		ssf(qudu(waterfood(jingqi(f_done))))
	end)
end

function ssf(f_done)
	if(me["ssf"] == nil or (not me["ssf"])) then print("û��������") call(f_done) return end
	
	wait.make(function()
		Execute("fly wm;e;s;w;qukuan 25 gold")
		wait.time(5)
		Execute("fly lj;s;give 25 gold to shouling")
		wait.time(5)
		me.status.inssf = false
		print("����������")
		call(f_done)
	end)
end

function qudu(f_done)
	if(me["poisonous"] == nil or (not me["poisonous"])) then print("û���ж�") call(f_done) return end
	
	wait.make(function()
		Execute("fly wm;u;er;et;yun cure")
		repeat
			local l, w = wait.regexp("^(> )*��.*�����ˣ�", 15)
		until(l == nil)
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
	if(me["js%"] >= 95 and me["qx%"] >= 95) then print("��������") call(f_done) return end
	
	wait.time(function()
		if(me["js%"] < 60 and canEatWuchange()) then
			Execute("fly wm;e;s;w;qukuan 5 gold")
			wait.time(5)
			Execute("e;s;e;e;n;buy wuchang dan")
			wait.time(2)
			Execute("eat wuchang dan")
			print("�޳����ó԰�")
			call(f_done)
			return
		else
			local dannumber = math.floor((100-tonumber(me["js%"]))/5) + 1
			Execute("fly wm;e;s;w;qukuan 6 gold")
			wait.time(5)
			Execute(e;s;e;e;n)
			for i = 1, dannumber do
				Execute("buy yangjing dan")
				wait.time(2)
				Execute("eat yangjing dan")
				wait.time(5)
			end
			print("�ƾ����")
			Execute("fly wm;u;er;et;yun heal")
			local l, w = wait.time("^(> )*(�㲢û�����ˣ�)|(���˹���ϣ�վ������������ȥ��ɫ�����������ӡ�)$")
			print("�������")
			call(f_done)
		end
	end)
end


function foodwater(f_done)
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