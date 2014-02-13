require "var"

var.dazuo_desc = "�������������ù���һ����Ϣ��ʼ������������"
var.dazuo_end_desc = "���˹���ϣ��������˿�����վ��������"
var.dazuo_halt_desc = "����������е�����ǿ��ѹ�ص��վ��������"
var.dazuo_full_desc = "���������Ϊ�ƺ��Ѿ��ﵽ��ƿ�����޷��ٿ������������ˡ�"
var.me_id = "byj"
var.me_name = "����"
var.me_menpai = "ȫ��"
var.task_id = "byj's task"
var.ttask_id = "byj's ttask"


profile = {
	pfm = {
		[1] = {name="һ��������", 		desc="����һ��������ͻ��", 	cd=false},
		[2] = {name="���ǲ���", 		desc="����һ�����������", 	cd=false},
		[3] = {name="������", 		desc="�㵹�����ǲ���", 			cd=false},
		[4] = {name="˫�ֻ���֮��", 	desc="��ƽ�ľ���", 				cd=false},
		[5] = {name="������", 			desc="��������Ҽ�", 			cd=false},
		[6] = {name="һָǬ��", 		desc="��ʹ��һ��ָ����", 		cd=false},
		[7] = {name="��������", 		desc="��������ָ��һʽ", 		cd=false},
		[8] = {name="�������",			desc="����һ�����͹�����", 	cd=false}
	},
	
	set_cd_status = function(l, flag)
		for i, v in ipairs(profile.pfm) do
			if(v.desc == l or v.name == l) then v.cd = flag return end
		end
	end,
	
	reset_cd_status = function()
		for i, v in ipairs(profile.pfm) do
			v.cd = false
		end
	end,
	
	busy_list = {
		[1] = {	i = 6, action = "wield " .. var.weapon .. ";enable parry sun-finger;perform parry.qiankun" 	},
		[2] = {	i = 5, action = "wield " .. var.weapon .. ";enable sword quanzhen-jian;perform sword.ding" 	}
	},
	
	attack_list1 = {
		[1] = {	i = 1, action = "enable sword quanzhen-jian;wield ".. var.weapon .. ";perform sword.sanqing"},
		[2] = {	i = 3, action = "enable sword quanzhen-jian;enable dodge qixing-bufa;wield ".. var.weapon .. ";perform dodge.qixing"},
		[3] = {	i = 8, action = "enable sword jinshe-jian;unwield all;wield " .. var.weapon .. ";perform sword.wandao"},
		[4] = {	i = 4, action = "unwield all;hubo"}
	},
	
	attack_list2 = {
		[1] = { i = 3, action = "enable sword quanzhen-jian;enable dodge qixing-bufa;unwield all;perform strike.sanhua;wield ".. var.weapon .. ";perform sword.jianyi;perform dodge.qixing" },
		[3] = {	i = 1, action = "enable sword quanzhen-jian;unwield all;perform strike.sanhua;wield ".. var.weapon .. ";perform sword.jianyi;perform sword.sanqing"},
		[2] = {	i = 8, action = "enable sword jinshe-jian;unwield all;wield " .. var.weapon .. ";perform sword.wandao"},
		[4] = {	i = 4, action = "unwield all;hubo"},
		[5] = { i = 7, action = "unwield all;perform finger.sandie"}
	},
	
	study_list = {
		[1] = { loc = "wcy", cmd = "xue wang xiantian-qigong 40;yun regenerate" },
		[2] = { loc = "fly wm;e;s;s;e;n;", cmd = "xue zhu literate 40;yun regenerate" },
		[3] = { loc = "wcy", cmd = "xue wang strike 40;yun regenerate" }
	},
	
	powerup = function()
		Execute("yun powerup")
	end,
	
	init = function()
		local flag = bit.bor(trigger_flag.KeepEvaluating, trigger_flag.RegularExpression, trigger_flag.Replace, trigger_flag.Temporary)
		AddTrigger("fight_busy_success",
			"^(> )*(.*����ǧ����һ��������֪����мܣ�|���.*���㹥�˸����ֲ���!).*$",
			"", flag, -1, 0, "", "fight.on_busy_success")
		
		SetTriggerOption("fight_busy_success", "group", "fight")
		
		AddTrigger("fight_perform_cd", 
			"^(> )*(��������Ҽ�|��ʹ��һ��ָ����|����һ��������ͻ��|����һ�����������|�㵹�����ǲ���|��ƽ�ľ�������̨����|��������ָ��һʽ).*$",
			"", flag, -1, 0, "", "fight.on_perform")
			
		SetTriggerOption("fight_perform_cd", "group", "fight")
	end
}


profile.init()

return profile
