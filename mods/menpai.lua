require "wait"
require "tprint"
require "utils"
require "var"

local mp = {}


mp["ؤ��"] = {
	id = "gb",
	name = "ؤ��",
	master = {["���߹�"] = {id="hong qigong", path="e;s;s;e;e;e;n;e;n;w;n;e;w;n;enter;e;"}},
	dazuo_desc = "^(> )*���������£�˫��ƽ����˫ϥ��Ĭ��ھ�����ʼ��������ķ���$",
	dazuo_end_desc = "^(> )*�������뵤�������ת�����������չ���˫��̧��վ��������$",
	dazuo_halt_desc = "^(> )*����ɫһ����Ѹ��������վ��������$",
	dazuo_full_desc = "^(> )*���������Ϊ�ƺ��Ѿ��ﵽ��ƿ�����޷��ٿ������������ˡ�$",
	busy_desc = "^(> )*(���.*�����Ƶò�֪����|���.*���㹥�ı�����ͣ����æ����).*$",
	powerup = "yun powerup",
	pfm = {
		["�׺�һЦ"]=		{action=function()Execute("perform dodge.canghaiyixiao")end, cd=false},
		["��"]=				{action=function()Execute("wield bang;perform stick.chan")end, cd=false},
		["�Ұ���"] = 		{action=function()Execute("unwield all;wield bang;perform stick.luanda")end, cd=false},
		["���ǲ���"]=		{action=function()Execute("enable parry jinshe-zhang;perform parry.fugu")end, cd=false},
		["˫�ֻ���֮��"]=	{action=function()Execute("unwield all;hubo;wield bang")end, cd=false},

		gf_busy = function()
			local tbl = {}
			local pfm = mp["ؤ��"].pfm
			table.insert(tbl, pfm["�׺�һЦ"])
			table.insert(tbl, pfm["��"])
			return tbl
		end,

		gf_attack = function()
			local tbl = {}
			local pfm = mp["ؤ��"].pfm
			table.insert(tbl, pfm["�Ұ���"])
			table.insert(tbl, pfm["���ǲ���"])
			table.insert(tbl, pfm["˫�ֻ���֮��"])
			return tbl
		end
	}
}

mp["ȫ���"] = {
	id = "qzj",
	name = "ȫ���",
	master = {["������"] = {id="hong qigong", path="e;s;s;e;e;e;n;e;n;w;n;e;w;n;enter;e;"}},
	dazuo_desc = "^(> )*���������£�˫��ƽ����˫ϥ��Ĭ��ھ�����ʼ��������ķ���$",
	dazuo_end_desc = "^(> )*���˹���ϣ��������˿�����վ��������$",
	dazuo_full_desc = "^(> )*���������Ϊ�ƺ��Ѿ��ﵽ��ƿ�����޷��ٿ������������ˡ�$",
	dazuo_halt_desc = "^(> )*����������е�����ǿ��ѹ�ص��վ��������$",
	busy_desc = "^(> )*(���.*�����Ƶò�֪����|���.*���㹥�ı�����ͣ����æ����)"
}


mp["����Ľ��"] = {
	id = "mr",
	name = "����Ľ��",
	master = {["Ľ�ݸ�"] = {id="murong fu", path="fly yzw;"}},
	dazuo_desc = "^(> )*������һվ��˫�ֻ���̧������һ������������ʼ��������ת��$",
	dazuo_end_desc = "^(> )*�㽫����������������������һȦ���������뵤������֣�������һ������$",
	dazuo_halt_desc = "^(> )*��üͷһ�壬�������������ַ���������$",
	busy_desc = "^(> )*(���.*�����Ƶò�֪����|���.*���㹥�ı�����ͣ����æ����)"
}

return mp
