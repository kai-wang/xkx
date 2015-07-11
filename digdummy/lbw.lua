require "var"

var.dazuo_desc = "�������������ù���һ����Ϣ��ʼ������������"
var.dazuo_end_desc = "(�㽫ͷ�ϰ�������������˫�ۣ�����վ��)|(���˹���ϣ��������˿�����վ��������)"
var.dazuo_halt_desc = "����������е�����ǿ��ѹ�ص��վ��������"
var.dazuo_full_desc = "���������Ϊ�ƺ��Ѿ��ﵽ��ƿ�����޷��ٿ������������ˡ�"
var.me_id = "lby"
var.me_name = "�����"
var.me_menpai = "ȫ��"
var.me_family = "ȫ��"
var.me_dazuo = "dazuo 1000"
var.me_qukuan = "qukuan 99 silver"
var.gf_money = "yes"
var.task_id = "lbw's task"
var.ttask_id = "lbw's ttask"
var.dig_dummy = "lbt"


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
		[9] = {name="��Ůɢ��",			desc="������Ϣ�������󼲶�", 			cd=false},
		[10]= {name="�貨΢��",			desc="�������������������������ʮ����",cd=false},
		[11]= {name="����˼",			desc="���貨�ɶ��Ƶ��貽",				cd=false},
		[12]= {name="�¹���Ӱ",			desc="�������¹��ӳ��",				cd=false},
		[13]= {name="������ѩ",			desc="��ʹ����ɽ������֮������������ѩ��",			cd=false}
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
		[1] = {	i = 6, action = "wield " .. var.weapon .. ";enable sword sun-finger;perform sword.qiankun" 	},
		--[2] = { i = 12, action = "perform move.yueguangruying" },
		--[3] = { i = 9, action = "wield " .. var.weapon .. ";enable parry tianyu-qijian;perform parry.san" }
		--[2] = { i = 7, action = "unwield all;perform finger.sandie;wield " .. var.weapon},
		--[2] = {	i = 5, action = "wield " .. var.weapon .. ";enable sword quanzhen-jian;perform sword.ding" 	}
	},
	
	attack_list1 = {
		--[1] = {	i = 3, action = "enable sword quanzhen-jian;enable dodge qixing-bufa;wield jian;perform dodge.qixing"},
		---[1] = { i = 11,action = "enable sword chixin-qingchang-jian;perform sword.xiangsi"},
		---[2] = { i = 8, action = "enable sword sun-finger;enable parry tianyu-qijian;perform parry.kuangwu"},
		--[2] = {	i = 8, action = "enable sword jinshe-jian;unwield all;wield jian;perform sword.wandao"},
		[1] = {	i = 1, action = "enable sword quanzhen-jian;wield jian;perform sword.sanqing"},
		[2] = { i = 7, action = "unwield all;perform finger.sandie;wield " .. var.weapon}
	},
	
	attack_list2 = {
		--[1] = { i = 3, action = "enable sword quanzhen-jian;enable dodge qixing-bufa;unwield all;perform strike.sanhua;wield ".. var.weapon .. ";perform sword.jianyi;perform dodge.qixing" },
		[2] = { i = 9, action = "wield " .. var.weapon .. ";enable parry tianyu-qijian;perform parry.san" },
		[1] = { i = 13,action = "unwield all;enable strike haotian-zhang;perform strike.sanhua;enable strike liuyang-zhang;perform strike.rongxue;wield " .. var.weapon},
		---[2] = { i = 8, action = "enable sword quanzhen-jian;unwield all;perform strike.sanhua;wield ".. var.weapon .. ";perform sword.jianyi;enable parry tianyu-qijian;perform parry.kuangwu"},
		[3] = {	i = 1, action = "wield " .. var.weapon .. ";enable sword quanzhen-jian;unwield all;perform strike.sanhua;wield ".. var.weapon .. ";perform sword.jianyi;perform sword.sanqing"},
		[4] = { i = 8, action = "enable sword quanzhen-jian;unwield all;perform strike.sanhua;wield ".. var.weapon .. ";perform sword.jianyi;enable parry tianyu-qijian;perform parry.kuangwu"},
		--[2] = {	i = 8, action = "enable sword jinshe-jian;unwield all;wield " .. var.weapon .. ";perform sword.wandao"},
		--[4] = { i = 9, action = "wield " .. var.weapon .. "enable parry tianyu-qijian;perform parry.san" },
		[5] = {	i = 4, action = "unwield all;hubo"},
		[6] = { i = 7, action = "unwield all;perform finger.sandie;wield " .. var.weapon}
	},
	
	attack_list3 = {
		[1] = {	i = 4, action = "unwield all;hubo"},
		[2] = { i = 7, action = "unwield all;perform finger.sandie"}
	},
	
	study_list = {
		{ loc = "fly wm;e;n;e;e;n;n", cmd = "yanjiu parry 1000;yun regenerate"}
	--[[
		[1] = { loc = "wcy", cmd = "xue wang xiantian-qigong 40;yun regenerate" },
		[2] = { loc = "fly wm;e;s;s;e;n;", cmd = "xue zhu literate 40;yun regenerate" },
		[3] = { loc = "wcy", cmd = "xue wang strike 40;yun regenerate" },
		[4] = { loc = "wcy", cmd = "xue wang parry 40;yun regenerate" }
	]]--
	},
	
	research_list = {
		{ skill = "xiantian-qigong"}
		--{ skill = "force" },
		--{ skill = "dodge" }
	},
	
	powerup = function()
		Execute("enable sword sun-finger;enable force bahuang-gong;")
		Execute("yun bahuang;enable force xiantian-qigong;yun powerup")
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
			Execute("tuo all;unwield all")
			Execute("wear dizhu yi;wield diyu jian;wear chixia xue;wear jiangmo hushou;wear tianwei mao;wear xunzhang")
			wait.time(1)
			call(f_done)
		end)
	end,
	
	fight_wear = function(f_done)
		wait.make(function()
			Execute("tuo all;give qingwei hushou to byj;give yumen jian to byj;give tianwei mao to byj;give zihe yi to byj;give yinling xue to byj")
			Execute("wear all;wield jian")
			busy_test(function() call(f_done) end)
		end)
		--Execute(var.login_wear)
	end,
}


profile.init()

return profile
