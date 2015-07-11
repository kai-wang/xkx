require "var"

var.dazuo_desc = "�������������ù���һ����Ϣ��ʼ������������"
var.dazuo_end_desc = "(�㽫ͷ�ϰ�������������˫�ۣ�����վ��)|(���˹���ϣ��������˿�����վ��������)"
var.dazuo_halt_desc = "����������е�����ǿ��ѹ�ص��վ��������"
var.dazuo_full_desc = "���������Ϊ�ƺ��Ѿ��ﵽ��ƿ�����޷��ٿ������������ˡ�"
var.me_id = "byj"
var.me_name = "����"
var.me_menpai = "����"
var.me_family = "����"
var.me_dazuo = "dazuo max"
var.gf_money = "no"
var.task_id = "byj's task"
var.ttask_id = "byj's ttask"
var.dig_dummy = "lbt"
var.weapon = "jian"
var.study_seq = 1
var.guo_kill_place = "fly mj"


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
		[14]= {name="����ʥ��",			desc="����ϥ������˫��ʮָ�ſ�",		cd=false},
		[15]= {name="��Ӱ���",			desc="�㳤�ն��𣬻���һֻ����",		cd=false},
		[16]= {name="�������",			desc="����һ�����͹�����", 			cd=false},
		[17]= {name="����", 			desc="��ʹ��ʥ��������桹��", 		cd=false},
		[18]= {name="��Ұӥ��",			desc="��ʹ���ѹ�ӥצ������", 			cd=false},
		[19]= {name="���絶",			desc="������ʹ�����絶",				cd=false},
		[20]= {name="͸����",			desc="����������͸����",				cd=false},
		[21]= {name="��ʧ��",			desc="����������ʹ������ȭ�ܾ��еġ���ʧ����", cd=false},
		[22]= {name="��ȭ����",			desc="������ŭ�𣬼���ȫ������ʹ������ȭ�ռ�����", cd=false},
		[23]= {name="���㱾�",			desc="����������ʹ������ȭ�ܾ��еġ����㱾���", cd=false}
	},
	
	set_cd_status = function(l, flag, color)
		--print(color)
		for i, v in ipairs(profile.pfm) do
			if((v.desc == l or v.name == l) and (v.inuse == true)) then v.cd = flag v.cd_time = os.time() return end
		end
	end,
	
	reset_cd_status = function()
		for i, v in ipairs(profile.pfm) do
			v.cd = false
		end
	end,
	
	busy_list = {
		[1] = { i = 17, action = "enable sword shenghuo-ling;wield " .. var.weapon .. ";perform sword.xiyanling"},
		[2] = { i = 23, action = "unwield all;perform cuff.yihuanghu;wield " .. var.weapon},
		[3] = {	i = 15, action = "perform move.ruyingruhuan" },
		[4] = { i = 18, action = "unwield all;perform claw.muyeyingyang" }
	},
	
	gf_busy_list = {
		[1] = { i = 17, action = "enable sword shenghuo-ling;wield " .. var.weapon .. ";perform sword.xiyanling"},
		[2] = { i = 23, action = "unwield all;perform cuff.yihuanghu;wield " .. var.weapon},
		[3] = {	i = 15, action = "perform move.ruyingruhuan" },
		[4] = { i = 18, action = "unwield all;perform claw.muyeyingyang" }
	},
	
	gf_attack_list = {
		[1] = {	i = 16, action = "enable sword jinshe-jian;wield " .. var.weapon .. ";perform sword.wandao"},
		[2] = { i = 2, action = "enable parry jinshe-zhang;perform parry.fugu"},
		[3] = {	i = 14, action = "enable sword shenghuo-ling;wield " .. var.weapon .. ";perform sword.shenghuo"},
		[4] = {	i = 4, action = "unwield all;hubo"}
	},
	
	attack_list1 = {
		[1] = {	i = 16, action = "enable sword jinshe-jian;wield " .. var.weapon .. ";perform sword.wandao"},
		[2] = { i = 2, action = "enable parry jinshe-zhang;perform parry.fugu"},
		[3] = {	i = 14, action = "enable sword shenghuo-ling;wield " .. var.weapon .. ";perform sword.shenghuo"},
		[4] = {	i = 22, action = "unwield all;perform cuff.qishang;wield " .. var.weapon},
		[5] = {	i = 4, action = "unwield all;hubo"}
	},
	
	attack_list2 = {
		[1] = {	i = 22, action = "unwield all;perform cuff.qishang;wield " .. var.weapon},
		[2] = {	i = 16, action = "enable sword jinshe-jian;wield " .. var.weapon .. ";perform sword.wandao"},
		[3] = {	i = 14, action = "enable sword shenghuo-ling;wield " .. var.weapon .. ";perform sword.shenghuo"},
		[4] = {	i = 4, action = "unwield all;hubo"},
		[5] = { i = 2, action = "enable parry jinshe-zhang;perform parry.fugu;enable parry qiankun-danuoyi"}
		--[3] = { i = 19, action = "enable sword shenghuo-ling;wield " .. var.weapon .. ";perform sword.yinfeng"},
		--[4] = { i = 20, action = "enable sword shenghuo-ling;wield " .. var.weapon .. ";perform sword.tougu"},
		--[4] = {	i = 14, action = "enable sword shenghuo-ling;wield " .. var.weapon .. ";perform sword.shenghuo"}
	},
	
	attack_list3 = {
		[1] = {	i = 4, action = "unwield all;hubo"}
	},
	
	study_list = {
		{ loc = "fly wm;e;s;s;e;n", cmd = "xue zhu literate 50;et"},
		{ loc = "fly mj", cmd = "xue zhang jiuyang-shengong 50;et",pre_action="bai zhang wuji", post_action="bai xie xun"},
		{ loc = "fly mj", cmd = "xue zhang sword 50;et",pre_action="bai zhang wuji", post_action="bai xie xun"}
	},
	
	research_list = {
		{ skill = "xiantian-qigong"}

	},
	
	powerup = function()
		Execute("yun powerup;yun shield;enable parry qiankun-danuoyi")
	end,
	
	init = function()
		local flag = bit.bor(trigger_flag.KeepEvaluating, trigger_flag.RegularExpression, trigger_flag.Replace)--, trigger_flag.Temporary)
		AddTrigger("fight_busy_success",
			"^(> )*(.*����ǧ����һ��������֪����мܣ�|���.*���㹥�˸����ֲ���|���һָ����|.*Ŀǰ���Թ˲�Ͼ���ŵ������ɣ�|.*ֻ��һ���������Ķ���|���.*����Χ��ת��ͷ��|���.*�����Ƶò�֪����|���.*���㹥�˸����ֲ���|���.*�������ҪѨ|.*������ּ䣬�ѱ����������ס������лк�����).*$",
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
			Execute("unwield all")
			Execute("wear ziyang yi;wield xuanliu jian;wear baihe mao;wear xunzhang;wear bianfu xue")
			wait.time(1)
			call(f_done)
		end)
	end,
	
	fight_wear = function(f_done)
		wait.make(function()
			--Execute("tuo all;give qingwei hushou to byj;give yumen jian to byj;give tianwei mao to byj;give zihe yi to byj;give yinling xue to byj")
			Execute("wear all;wield " .. var.weapon)
			busy_test(function() call(f_done) end)
		end)
		--Execute(var.login_wear)
	end,

	auto_list = {"wei","shan","baobiao", "guanfu","guo","study"}
}


profile.init()

return profile
