require "var"

profile = {
    dazuo_desc = "^(> )*���������£�˫��ƽ����˫ϥ��Ĭ��ھ�����ʼ��������ķ���$",
	dazuo_end_desc = "^(> )*�������뵤�������ת�����������չ���˫��̧��վ��������$",
	dazuo_halt_desc = "^(> )*����ɫһ����Ѹ��������վ��������$",
	dazuo_full_desc = "^(> )*���������Ϊ�ƺ��Ѿ��ﵽ��ƿ�����޷��ٿ������������ˡ�$",
	busy_success_desc = "^(> )*(���.*�����Ƶò�֪����|���.*���㹥�ı�����ͣ����æ����).*$",
	busy_fail_desc = "^(> )*(����.*�����������ͼ���򶨽��У�һ˿���ҡ�|������Լ����˸�ͷ���ۻ���)$",

	powerup = "yun powerup",

	attack_desc = "������һ����ûͷû��|����һ�����������|��Ĭ�˻���������ʩչ��������һ����|��ƽ�ľ�������̨����",

	set_cd = function(l)
		if(string.match(l, "������һ����ûͷû��")) then
			profile.attack["�Ұ���"].cd = true

		elseif(string.match(l, "����һ�����������")) then
			profile.attack["���ǲ���"].cd = true

		elseif(string.match(l, "��Ĭ�˻�������")) then
			profile.attack["����һ��"].cd = true

		elseif(string.match(l, "��ƽ�ľ���")) then
			profile.attack["˫�ֻ���֮��"].cd = true

		elseif(string.match(l, "�Ƶò�֪����") or string.match(l, "���Լ����˸�ͷ���ۻ�")) then
			profile.busy["�׺�һЦ"].cd = true

		elseif(string.match(l, "������ͣ") or string.match(l, "�����������ͼ���򶨽���")) then
			profile.busy["��"].cd = true

		end
	end,

	unset_cd = function(l)
		if(profile.attack[l] ~= nil) then
			profile.attack[l].cd = false

		elseif(profile.busy[l] ~= nil) then
			profile.busy[l].cd = false

		end
	end,

	attack = {
		["�Ұ���"] = {
			cd = false,
			action = function()
				Execute("yun shengang;perform strike.xianglong;unwield all;wield ".. var.weapon .. ";perform stick.luanda")
			end
		},
		["���ǲ���"]={
			cd = false,
			action = function()
				Execute("enable parry jinshe-zhang;perform parry.fugu")
			end
		},
		["����һ��"]={
			cd = false,
			action = function()
				Execute("unwield all;perform strike.leiting")
			end
		},
		["˫�ֻ���֮��"] = {
			cd = false,
			action = function()
				Execute("unwield all;hubo")
			end
		}
	},

	busy = {
		["�׺�һЦ"] = {
			cd = false,
			action = function()
				Execute("perform dodge.canghaiyixiao")
			end
		},

		["��"] = {
			cd = false,
			action = function()
				Execute("wield " .. var.weapon .. ";perform stick.chan")
			end
		}
	},

	gf_busy_list = function()
		local tbl = {}
		tbl[1] = profile.busy["�׺�һЦ"]
		tbl[2] = profile.busy["��"]
		return tbl
	end,

	gf_attack_list = function()
		local tbl = {}
		tbl[1] = profile.attack["�Ұ���"]
		tbl[2] = profile.attack["���ǲ���"]
		tbl[3] = profile.attack["˫�ֻ���֮��"]
		return tbl
	end
}


return profile
