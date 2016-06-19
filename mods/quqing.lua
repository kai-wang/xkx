require "wait"
require "tprint"
require "utils"
require "string"


quqing = {}

quqing.main = function()

	print("��������ʼ����")

	AddTrigger("quqing_1", "^(> )*����˵��:�ú����ͨ�쾵�����а����ʱ���ڱ�����������ͨ�쾵�ͻ���ʧ��$", "", 49193, -1, 0, "", "quqing_do")
	AddTrigger("quqing_2", "^(> )*����˵����.*��ô����ȥ�ڱ���$", "", 49193, -1, 0, "", "quqing_cancel")
	AddTrigger("quqing_3", "^(> )*����˵����.*���ϴ�ʧ�ܲ��������ӣ���������ȥ��Ϣ��$", "", 49193, -1, 0, "", "quqing_end")
	AddTrigger("quqing_4", "^(> )*����˵����.*���Ǹո�����������ȥ����Ϣ��Ϣ�ɣ�$", "", 49193, -1, 0, "", "quqing_end")
	AddTrigger("quqing_5", "^(> )*����û������ˡ�$", "", 49193, -1, 0, "", "quqing_end")
	AddTrigger("quqing_6", "^(> )*����˵������ô���˾ͱ���Ѱ���ˡ�$", "", 49193, -1, 0, "", "quqing_end")

	Execute("set brief;fly wm;e;e;ask qu about job;")
end


quqing.done = function()
	DeleteTemporaryTriggers()
	print("���������������")
end

quqing_do = function()
	DeleteTemporaryTriggers()

	Execute("detect")
	AddTrigger("quqing_dig1", "^(> )*����ĵص��ƺ���(.*)��$", "", 49193, -1, 0, "", "quqing_loc")
	AddTrigger("quqing_dig2", ".*��.*", "", 49193, -1, 0, "", "quqing_search")
end

quqing_loc = function(n, l, w)
	SetVariable("quqing_loc", w[2])
end

quqing_search = function(n, l, w)
	DeleteTemporaryTriggers()

	local seperator = "[-., ()\"a-zA-Z]"
	--print(l)
	--�и��𷿼���,.-��Щ���ţ�����ׯ����������������أ���������û�У���������ȥ��
	local x = l:gsub(seperator, "")
	x = x:gsub("��", ".*")
	local loc = GetVariable("quqing_loc")
	local tbl = {}
	local rooms = regions[loc].rooms
	if(rooms == nil) then
		quqling.cancel()
	else
		for i, v in ipairs(rooms) do
			--	�и��𷿼���,.-��Щ���ţ�����ׯ����������������أ���������û�У���������ȥ��
			local desc = v.desc:gsub(seperator, "")
			--	Σ�յķ��䲻ȥ������ʳ����
			if(string.match(desc, x) ~= nil and v.attr ~= "danger") then
				print("ƥ��ķ���id: "..v.id .." ����:"..v.name)
				table.insert(tbl, v.path)
			end
		end

		if(tbl ~= {}) then
			quqing_dig(tbl)
		end
	end
end


quqing_dig = function(tbl)
	local loc = GetVariable("quqing_loc")
	wait.make(function()
		if(loc == "����") then
			Execute("fly lz;w;n;n;e;ask nu about ����;")
			wait.time(1)
		end
--��ϲ�����˶��⽱��: �����ڡ�
		for i, v in ipairs(tbl) do
			Execute("halt;" .. v)
			Execute("dig")
			local l, w = wait.regexp("�����˰��죬����ʲô��û�У��ƺ��Ҵ�ط��ˡ�|�����һ������������ͳ�һ����������������������|ֻ����������һ���������ϳ�����!")
			if(string.match(l, "�����һ������������ͳ�һ����������������������")) then
				wait.time(5)
				Execute("halt;fly wm;e;e;give bao wu to qu")
				wait.time(2)
				Execute("halt;fly wm")
				return
			elseif(string.match(l, "ֻ����������һ���������ϳ�����!")) then
				wait.time(5)
				Execute("halt;fly wm;e;e;ask qu about cancel")
				wait.time(2)
				Execute("halt;fly wm")
				return
			else
				wait.time(5)
			end
		end

		print("�Ҳ�������")
		Execute("fly wm;e;e;ask qu about cancel;")
		wait.time(2)
		Execute("halt;fly wm")
	end)
end

quqing_cancel = function()
	wait.make(function()
		Execute("fly wm;e;e;ask qu about cancel;")
		wait.time(2)
		Execute("halt;fly wm")
		quqing.done()
	end)
end


quqing_end = function()
	wait.make(function()
		wait.time(1)
		Execute("halt;fly wm")
		quqing.done()
	end)
end
