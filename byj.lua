require "var"

profile = {
    dazuo_desc = "^(> )*�������������ù���һ����Ϣ��ʼ������������$",
	dazuo_end_desc = "^(> )*���˹���ϣ��������˿�����վ��������$",
	dazuo_halt_desc = "^(> )*����������е�����ǿ��ѹ�ص��վ��������$",
	dazuo_full_desc = "^(> )*���������Ϊ�ƺ��Ѿ��ﵽ��ƿ�����޷��ٿ������������ˡ�$",
	busy_success_desc = "^(> )*(.*����ǧ����һ��������֪����мܣ�|���.*���㹥�˸����ֲ���!).*$",
	busy_fail_desc = "^(> )*(����.*�����������ͼ��бԾ�ܿ���|����.*�����������ͼ����û���ϵ���)$",

	powerup = "yun powerup",

	attack_desc = "����һ��������ͻ��|����һ�����������|�㵹�����ǲ���|��ƽ�ľ�������̨����|��������ָ��һʽ",

	set_cd = function(l)
		if(string.match(l, "����һ��������ͻ��")) then
			profile.attack["һ��������"].cd = true

		elseif(string.match(l, "����һ�����������")) then
			profile.attack["���ǲ���"].cd = true

		elseif(string.match(l, "�㵹�����ǲ���")) then
			profile.attack["������"].cd = true

		elseif(string.match(l, "��ƽ�ľ���")) then
			profile.attack["˫�ֻ���֮��"].cd = true

		elseif(string.match(l, "����֪����м�") or string.match(l, "�����������ͼ��бԾ�ܿ�")) then
			profile.busy["������"].cd = true

		elseif(string.match(l, "���˸����ֲ���") or string.match(l, "�����������ͼ����û���ϵ�")) then
			profile.busy["һָǬ��"].cd = true
			
		elseif(string.match(l, "��������ָ��һʽ")) then
			profile.attack["��������"].cd = true
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
		["һ��������"] = {
			cd = false,
			action = function()
				Execute("enable sword quanzhen-jian;wield ".. var.weapon .. ";perform sword.sanqing")
			end
		},
		["��������"]={
			cd = false,
			action = function()
				Execute("unwield all;perform finger.sandie")
			end
		},
		["������"]={
			cd = false,
			action = function()
				Execute("enable sword quanzhen-jian;enable dodge qixing-bufa;wield ".. var.weapon .. ";perform dodge.qixing")
			end
		},
		["˫�ֻ���֮��"] = {
			cd = false,
			action = function()
				Execute("unwield all;hubo")
			end
		}
	},
	
	buff_attack = {
		["һ��������"] = {
			cd = false,
			action = function()
				Execute("enable sword quanzhen-jian;unwield all;perform strike.sanhua;wield ".. var.weapon .. ";perform sword.jianyi;perform sword.sanqing")
			end
		},
		["��������"]={
			cd = false,
			action = function()
				Execute("unwield all;perform finger.sandie")
			end
		},
		["������"]={
			cd = false,
			action = function()
				Execute("enable sword quanzhen-jian;enable dodge qixing-bufa;perform strike.sanhua;wield ".. var.weapon .. ";perform sword.jianyi;perform dodge.qixing")
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
		["������"] = {
			cd = false,
			action = function()
				Execute("wield " .. var.weapon .. ";enable sword quanzhen-jian;perform sword.ding")
			end
		},

		["һָǬ��"] = {
			cd = false,
			action = function()
				Execute("wield " .. var.weapon .. ";enable parry sun-finger;perform parry.qiankun")
			end
		}
	},

	gf_busy_list = function()
		local tbl = {}
		tbl[2] = profile.busy["������"]
		tbl[1] = profile.busy["һָǬ��"]
		return tbl
	end,

	gf_attack_list = function()
		local tbl = {}
		tbl[1] = profile.attack["һ��������"]
		tbl[2] = profile.attack["������"]
		return tbl
	end,
	
	task_busy_list = function()
		local tbl = {}
		tbl[1] = profile.busy["������"]
		tbl[2] = profile.busy["һָǬ��"]
		return tbl
	end,

	task_attack_list = function()
		local tbl = {}
		tbl[1] = profile.attack["������"]
		tbl[2] = profile.attack["һ��������"]
		tbl[3] = profile.attack["��������"]
		return tbl
	end
	
	
}


return profile
