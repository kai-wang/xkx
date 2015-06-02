require "var"

var.dazuo_desc = "�������������ù���һ����Ϣ��ʼ������������"
--var.dazuo_end_desc = "���˹���ϣ��������˿�����վ��������"
var.dazuo_end_desc = "(�㽫ͷ�ϰ�������������˫�ۣ�����վ��)|(���˹���ϣ��������˿�����վ��������)"
var.dazuo_halt_desc = "����������е�����ǿ��ѹ�ص��վ��������"
var.dazuo_full_desc = "���������Ϊ�ƺ��Ѿ��ﵽ��ƿ�����޷��ٿ������������ˡ�"
var.me_id = "nohead"
var.me_name = "ûͷ��"
var.me_menpai = "����"
var.me_family = "����"
var.task_id = "nohead's task"
var.ttask_id = "nohead's ttask"
var.heal_dummy_id = "hqly"
var.bag_dummy_id = "hsly"


profile = {
	pfm = {
		[1] = {name="һ��������", 		desc="����һ��������ͻ��", 			cd=false},
		[2] = {name="���ǲ���", 		desc="����һ�����������", 			cd=false},
		[3] = {name="������", 		desc="�㵹�����ǲ���", 					cd=false},
		[4] = {name="˫�ֻ���֮��", 	desc="��ƽ�ľ���", 						cd=false},
		[5] = {name="������", 			desc="��������Ҽ�", 					cd=false},
		[6] = {name="һָǬ��", 		desc="��ʹ��һ��ָ����", 				cd=false},
		[7] = {name="��������", 		desc="��������ָ��һʽ", 				cd=false},
		[8] = {name="�������",			desc="��ʹ�������潣�еľ���",			cd=false},
		--[8] = {name="�������",		desc="����һ�����͹�����", 			cd=false},
		--[9] = {name="����������",		desc="��ʹ����ҽ���֮��������������", 	cd=false},
		[9] = {name="��Ůɢ��",			desc="������Ϣ�������󼲶�", 			cd=false},
		[10]= {name="�貨΢��",			desc="�������������������������ʮ����",cd=false},
		[11]= {name="����˼",			desc="���貨�ɶ��Ƶ��貽",				cd=false},
		[12]= {name="�¹���Ӱ",			desc="�������¹��ӳ��",				cd=false},
		[13]= {name="������ѩ",			desc="��ʹ����ɽ������֮������������ѩ��",			cd=false},
		[14]= {name="��ɽ��Ӱ",			desc="��ʹ����Ӱ�貽�ľ���", 			cd=false}
	},
	
	set_cd_status = function(l, flag)
		for i, v in ipairs(profile.pfm) do
			if(v.desc == l or v.name == l) then v.cd = flag v.cd_time = os.time() return end
		end
	end,
	
	reset_cd_status = function()
		for i, v in ipairs(profile.pfm) do
			v.cd = false
		end
	end,
	
	busy_list = {
		[1] = { i = 12, action = "perform move.yueguangruying" },
		[2] = { i = 9, action = "wield " .. var.weapon .. ";enable parry tianyu-qijian;perform parry.san" }
	},
	--ɱ�ٸ��ļ���
	attack_list1 = {
		[1] = {	i = 1, action = "enable sword quanzhen-jian;wield jian;perform sword.sanqing"},
		[2] = { i = 7, action = "unwield all;perform finger.sandie;wield " .. var.weapon}
	},
	--ɱtask�ļ���
	attack_list2 = {
		[1] = { i = 13,action = "unwield all;enable strike liuyang-zhang;perform strike.rongxue " .. var.task_id .. ";wield " .. var.weapon},
		[2] = { i = 9, action = "wield " .. var.weapon .. ";enable parry tianyu-qijian;perform parry.san " .. var.task_id },
		[3] = { i = 8, action = "wield ".. var.weapon .. ";enable parry tianyu-qijian;perform parry.kuangwu " .. var.task_id },
		[4] = { i = 14,action= "wield " .. var.weapon .. ";perform move.yueying " .. var.task_id}
	},
	
	attack_list3 = {
		[1] = {	i = 4, action = "unwield all;hubo"},
		[2] = { i = 7, action = "unwield all;perform finger.sandie"}
	},
	
	study_list = {
		{ loc = "fly wm;e;n;e;e;n;n", cmd = "yanjiu parry 1000;yun regenerate"}
	},
	
	research_list = {
		{ skill = "bahuang-gong"}
	},
	
	powerup = function()
		Execute("enable force wuzheng-xinfa;yun bingxin;yun powerup;enable force bahuang-gong;yun bahuang")
	end,
	
	init = function()
		local flag = bit.bor(trigger_flag.KeepEvaluating, trigger_flag.RegularExpression, trigger_flag.Replace)--, trigger_flag.Temporary)
		AddTrigger("fight_busy_success",
			"^(> )*(.*����ǧ����һ��������֪����мܣ�|���.*���㹥�˸����ֲ���!|���һָ����|.*Ŀǰ���Թ˲�Ͼ���ŵ������ɣ�|.*ֻ��һ���������Ķ���|���.*����Χ��ת��ͷ��|���.*�����Ƶò�֪����).*$",
			"", flag, -1, 0, "", "fight.on_busy_success")
		
		SetTriggerOption("fight_busy_success", "group", "fight")
		
		local desc = "("
		for i = 1, #profile.pfm do 
			desc = desc .. profile.pfm[i] .desc
			if(i == #profile.pfm) then desc = desc .. ")" else desc = desc .. "|" end
		end
	
		AddTrigger("fight_perform_cd", 
			"^(> )*" .. desc .. ".*$", --(��������Ҽ�|��ʹ��һ��ָ����|����һ��������ͻ��|����һ�����������|�㵹�����ǲ���|��ƽ�ľ�������̨����|��������ָ��һʽ|����һ�����͹�����).*$",
			"", flag, -1, 0, "", "fight.on_perform")
			
		SetTriggerOption("fight_perform_cd", "group", "fight")
	end,
	
	login = function()
		Execute(var.login_drop)
		Execute(var.login_wear)
	end,
	
	int_wear = function(f_done)
		wait.make(function()
			--Execute("tuo all;unwield all")
			--Execute("wear dizhu yi;wield diyu jian;wear chixia xue;wear jiangmo hushou;wear tianwei mao;wear xunzhang")
			Execute("wear all")
			wait.time(1)
			call(f_done)
		end)
	end,
	
	fight_wear = function(f_done)
		wait.make(function()
			Execute("tuo all;give juanyun hushou to nohead;give duanyu qin to nohead;give xiaowei mao to nohead;give huanfeng yi to nohead;give helan xue to nohead")
			Execute("wear all;wield " .. var.weapon)
			busy_test(function() call(f_done) end)
		end)
		--Execute(var.login_wear)
	end,
}


profile.init()

return profile
