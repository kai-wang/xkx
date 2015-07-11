require "var"

var.dazuo_desc = "������һվ��˫�ֻ���̧������һ������������ʼ��������ת��"
--var.dazuo_end_desc = "���˹���ϣ��������˿�����վ��������"
var.dazuo_end_desc = "�㽫����������������������һȦ���������뵤������֣�������һ������"
var.dazuo_halt_desc = "��üͷһ�壬�������������ַ���������"
var.dazuo_full_desc = "���������Ϊ�ƺ��Ѿ��ﵽ��ƿ�����޷��ٿ������������ˡ�"
var.me_id = "pigfoots"
var.me_name = "����"
var.me_menpai = "Ľ��"
var.me_family = "Ľ��"
var.me_dazuo = "dazuo 1000"
var.task_id = "pigfoots's task"
var.ttask_id = "pigfoots's ttask"
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
		--[8] = {name="�������",		desc="����һ�����͹�����", 			cd=false},
		--[9] = {name="����������",		desc="��ʹ����ҽ���֮��������������", 	cd=false},
		[9] = {name="��Ůɢ��",			desc="������Ϣ�������󼲶�", 			cd=false},
		[10]= {name="�貨΢��",			desc="�������������������������ʮ����",cd=false},
		[11]= {name="����˼",			desc="���貨�ɶ��Ƶ��貽",				cd=false},
		[12]= {name="�¹���Ӱ",			desc="�������¹��ӳ��",				cd=false},
		[13]= {name="������ѩ",			desc="��ʹ����ɽ������֮������������ѩ��",			cd=false},
		[14]= {name="����ʥ��",			desc="����ϥ������˫��ʮָ�ſ�",		cd=false},
		[15]= {name="�콣", 			desc="��ʹ��Ľ�ݽ����еľ��Уۿ콣��", 	cd=false},
		[16]= {name="�߽�����ָ",		desc="��ʹ��Ľ�ݽ���֮���衸�߽�����ָ��", 			cd=false},
		[17]= {name="��Ůɢ��",			desc="��ʹ������Ůɢ����",				cd=false},
		[18]= {name="���־�",			desc="��ͻȻһ�������Լ��ĵ����ϼ���",  cd=false}
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
		[1] = {	i = 18, action = "unwield " .. var.weapon .. ";perform finger.ci" 	},
		[2] = { i = 17, action = "wield " .. var.weapon .. ";perform sword.sanhua"	}
	},
	
	attack_list1 = {
		[1] = {	i = 16, action = "enable sword murong-jianfa;wield " .. var.weapon .. ";perform sword.lianhuan;perform sword.kuaijian"}
	},
	
	attack_list2 = {
		[1] = {	i = 16, action = "enable sword murong-jianfa;wield " .. var.weapon .. ";perform sword.lianhuan;perform sword.kuaijian"},
		[5] = {	i = 4, action = "unwield all;hubo"}
	},
	
	attack_list3 = {
		[1] = {	i = 4, action = "unwield all;hubo"}
	},
	
	study_list = {
		{ loc = "fly wm;e;s;s;e;n", cmd = "xue zhu literate 20;et"}
	},
	
	research_list = {
		{ skill = "xiantian-qigong"}

	},
	
	powerup = function()
		Execute("yun powerup;yun shield")
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
