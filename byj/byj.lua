require "var"
module ("config", package.seeall)

var.dazuo_desc = "�������������ù���һ����Ϣ��ʼ������������"
var.dazuo_end_desc = "(�㽫ͷ�ϰ�������������˫�ۣ�����վ��)|(���˹���ϣ��������˿�����վ��������)|(�������뵤�������ת�����������չ���˫��̧��վ��������)"
var.dazuo_halt_desc = "(����������е�����ǿ��ѹ�ص��վ��������)|(����ɫһ����Ѹ��������վ��������)"
var.dazuo_full_desc = "���������Ϊ�ƺ��Ѿ��ﵽ��ƿ�����޷��ٿ������������ˡ�"
var.me_id = "byj"
var.me_name = "����"
var.me_menpai = "����"
var.me_family = "����"
var.me_dazuo = "dazuo 15000;dazuo max"
var.gf_money = "no"
var.task_id = "byj's task"
var.ttask_id = "byj's ttask"
var.dig_dummy = "lbt"
var.weapon = "jian"
var.weapon2 = "dao"
var.study_seq = 1
var.fast_mode = 1
var.xiao_full = 0
var.guo_kill_place = "fly mj"

auto_list = {"wei","shan","baobiao", "guanfu","guo","event","study","reconnect", "sstask", "xiao", "double"}

weapon_list = {"juwei jian", "kunlun dao", "guangcheng jian", "zhaixing jian", "qiankun dao", "shenyuan jian"}

pfm = {
	[1] = {name="һ��������", 		desc="����һ��������ͻ��", 			cd=false},
	--[2] = {name="���ǲ���", 		desc="����һ�����������", 			cd=false},
	[3] = {name="������", 		desc="�㵹�����ǲ���", 					cd=false},
	[4] = {name="˫�ֻ���֮��", 	desc="��ƽ�ľ���", 						cd=false},
	--[5] = {name="������", 			desc="��������Ҽ�", 					cd=false},
	[6] = {name="һָǬ��", 		desc="��ʹ��һ��ָ����", 				cd=false},
	[7] = {name="��������", 		desc="��������ָ��һʽ", 				cd=false},
	[8] = {name="�������",			desc="��ʹ�������潣�еľ���",			cd=false},
	--[8] = {name="�������",		desc="����һ�����͹�����", 			cd=false},
	--[9] = {name="����������",		desc="��ʹ����ҽ���֮��������������", 	cd=false},
	[9] = {name="��Ůɢ��",			desc="������Ϣ�������󼲶�", 			cd=false},
	[10]= {name="�貨΢��",			desc="�������������������������ʮ����",cd=false},
	[11]= {name="����˼",			desc="��ʹ�������鳤��֮����",				cd=false},
	[12]= {name="�¹���Ӱ",			desc="�������¹��ӳ��",				cd=false},
	--[13]= {name="������ѩ",			desc="��ʹ����ɽ������֮������������ѩ��",			cd=false},
	--[14]= {name="����ʥ��",			desc="����ϥ������˫��ʮָ�ſ�",		cd=false},
	--[15]= {name="��Ӱ���",			desc="�㳤�ն��𣬻���һֻ����",		cd=false},
	--[16]= {name="�������",			desc="����һ�����͹�����", 			cd=false},
	--[17]= {name="����", 			desc="��ʹ��ʥ��������桹��", 		cd=false},
	--[18]= {name="��Ұӥ��",			desc="��ʹ���ѹ�ӥצ������", 			cd=false},
	[19]= {name="��ɽ��Ӱ",			desc="��ʹ����Ӱ�貽�ľ�������ɽ��Ӱ��",				cd=false},
	--[20]= {name="͸����",			desc="����������͸����",				cd=false},
	--[21]= {name="��ʧ��",			desc="����������ʹ������ȭ�ܾ��еġ���ʧ����", cd=false},
	[22]= {name="��ȭ����",			desc="������ŭ�𣬼���ȫ������ʹ������ȭ�ռ�����", cd=false},
	--[23]= {name="���㱾�",			desc="����������ʹ������ȭ�ܾ��еġ����㱾���", cd=false},
	--[24]= {name="����������",		desc="��ʹ����ҽ���֮��������������", 			cd=false},
	--[25]= {name="������", 			desc="��ͻȻ����������ֻ�����е�", cd=false},
	--[26]= {name="���������",		desc="������������ͼʹ������ȭ�ܾ��еġ������������", cd=false},
	--[27]= {name="�˷ξ�",			desc="����������ʹ������ȭ�ܾ��еġ��˷ξ���", 	cd=false},
	--[28]= {name="���ľ�",			desc="����������ʹ������ȭ�ܾ��еġ����ľ���",	cd=false},
	--[29]= {name="�����",			desc="����������ʹ������ȭ�ܾ��еġ��������",	cd=false},
	--[30]= {name="�ݸγ���",			desc="����������ʹ������ȭ�ܾ��еġ��ݸγ�����",	cd=false},
	[31]= {name="����һ��",			desc="��Ĭ�˻���������ʩչ��������һ����", 			cd=false},
	[32]= {name="��������",			desc="������һ����������������������ǰ�����һ��˵��",cd=false},
	[33]= {name="�׺�һЦ",			desc="��ǿ����������ͻ������룬�����ݺ�֮ʽ",	cd=false},
	[34]= {name="��Ӱ",			desc="��ǰ�����ߣ��������������иֵ�ԽʹԽ�죬�����������⻯����������", cd=false},
	[35]= {name="��������", 		desc="��һƬ�����У�һ�����˹���", cd=false},
	[36]= {name="��ɫ����", desc="��ʹ��С�����������ɫ���ࡹ����ʽ���Ī��", cd=false},
	[37]= {name="�����п�", desc="��ʹ������У����λ�ת��������Ծ�ն���", cd=false},
	[38]= {name="�����", desc="��Ĭ���񹦣�ʹ����ȭ�����־�", cd=false}
}

function set_cd_status(l, flag, color)
	--print(color)
	for i, v in ipairs(config.pfm) do
		if((v.desc == l or v.name == l) and (v.inuse == true or flag == false)) then
			v.cd = flag
			v.cd_time = os.time()
			v.inuse = flag
		end
	end
end

function reset_cd_status()
	for i, v in ipairs(config.pfm) do
		v.cd = false
	end
end

--
-- busy perform
--
busy_perform_array = {
	[1] = { i = 10,
			action = function()
				Execute("enable dodge lingboweibu;perform dodge.lingbo " .. var.pfm_target)
			end
	},

	[2] = { i = 34,
			action = function()
				local wp = choose_blade()
				Execute("unwield all;enable blade hujia-daofa;wield " .. wp .. ";perform blade.huanying " .. var.pfm_target)
			end
	},

	[3] = { i = 12,
			action = function()
				Execute("enable move yueying-wubu;perform move.yueguangruying " .. var.pfm_target)
			end
	},

	[4] = { i = 37,
			action = function()
				Execute("enable move shenkong-xing;perform move.tianmaxingkong " .. var.pfm_target)
			end
	}
}

--
-- attack perform
--
attack_perform_array = {
	[2] = { i = 36,
			action = function()
				local wp = choose_blade()
				Execute("wield " .. wp .. ";enable blade xue-dao;enable force xiaowuxiang;jiali max;yun wuxiang " .. var.pfm_target .. ";jiali 0")
			end
	},

	[1] = { i = 35,
			action = function()
				local wp = choose_blade()
				Execute("enable blade xue-dao;wield " .. wp .. ";jiali max;perform parry.lian " .. var.pfm_target .. ";jiali 0")
			end
	},

	[3] = { i = 22,
			action = function()
				Execute("unwield all;enable cuff qishang-quan;bei none;bei qishang-quan;perform cuff.qishang " .. var.pfm_target)
			end
	},

	[4] = { i = 4,
			action = function()
				Execute("bei none;bei sun-finger;unwield all;hubo " .. var.pfm_target)
			end
	},

	[5] = { i = 31,
			action = function()
				Execute("unwield all;perform strike.leiting " .. var.pfm_target)
			end
	},

	[6] = { i = 4,
			action = function()
				Execute("unwield all;hubo " .. var.pfm_target)
			end
	},

	[7] = { i = 35,
			action = function()
				local wp = choose_blade()
				Execute("unwield all;wield " .. wp .. ";enable blade hujia-daofa;perform blade.lian " .. var.pfm_target)
			end
	},


	[8] = { i = 36,
			action = function()
				Execute("unwield all;enable force xiaowuxiang;yun wuxiang " .. var.pfm_target)
			end
	},

	[9] = { i = 32,
			action = function()
				Execute("unwield all;perform strike.sanhui " .. var.pfm_target)
			end
	},

	[10] = { i = 32,
			action = function()
				Execute("unwield all;enable force huntian-qigong;perform strike.sanhui " .. var.pfm_target .. ";wield dao")
			end
	},

	[11] = { i = 36,
			action = function()
				Execute("unwield all;enable force xiaowuxiang;yun wuxiang " .. var.pfm_target .. ";wield dao")
			end
	},

	[12] = { i = 36,
			action = function()
				Execute("unwield all;enable force xiaowuxiang;bei none;bei sun-finger;yun wuxiang " .. var.pfm_target)
			end
	},

	[13] = { i = 19,
			action = function()
				Execute("enable move yueying-wubu;bei none;bei sun-finger;perform move.yueying")
			end
	},

	[14] = { i = 11,
			action = function()
				Execute("unwield all;wield jian;enable sword chixin-qingchang-jian;perform sword.xiangsi")
			end
	},

	[15] = { i = 35,
			action = function()
				local wp = choose_blade()
				Execute("enable blade xue-dao;wield " .. wp .. ";jiali max;enable move yueying-wubu;perform move.yueying " .. var.pfm_target .. ";jiali 0")
			end
	},

	[16] = { i = 38,
			action = function()
				Execute("enable cuff houquan;unwield all;perform cuff.zhen")
			end
	}
}

task_busy_list = { 1, 2, 3, 4 }
task_attack_list = { 1, 2, 15, 3 }

gf_busy_list = { 1, 3 }
gf_attack_list = { 6, 7 }

ttask_busy_list = { 1, 2, 3, 4 }
ttask_attack_list = { 1, 2, 3, 4 }

busy_list = { 1, 2, 3, 4 }
attack_list1 = { 7, 3, 6 }
--attack_list2 = { 3, 8, 9, 5, 6 }
attack_list2 = { 3, 8, 14, 6, 7 }
attack_list3 = { 7, 16, 13}
attack_list4 = { 6 }
attack_list5 = { 3, 14, 6, 7, 16 }

study_list = {
	--{ loc = "fly wm;e;n;e;e;n;n;", cmd = "yanjiu finger 10000;et;set study done", post_action="fly wm;e;s;s;s;w;w;u;gamble big skill finger 2000"}
	{ loc = "fly wm;e;n;e;e;n;n;", cmd = "yanjiu xiaowuxiang 1000", wear_int = true, research = true }
		--{ loc = "fly mj", cmd = "xue wei strike 100;et",pre_action="bai wei yixiao", post_action="bai xie xun"}
}


function choose_blade()
	return "dao"
end

function choose_sword()
	return "jian"
end

function powerup()
	Execute("enable force xiaowuxiang;yun powerup;enable force beiming-shengong;yun shield;yun beiming")
end

function buff(menpai)
	if(menpai ~= nil) then
		local re = rex.new("(�һ�|����|��ü|÷ׯ|Ľ��)")
		local r1,r2,r3 = re:match(menpai)
		if(r3 ~= nil) then
			print("����ϵ�ڹ���.......")
			Execute("enable force xiaowuxiang;")
			return
		end
	end

	print("��ˮϵ�ڹ���.......")
	Execute("enable force beiming-shengong;yun beiming")
end


function anti_touxi()

end

function init()
	local flag = bit.bor(trigger_flag.KeepEvaluating, trigger_flag.RegularExpression, trigger_flag.Replace)--, trigger_flag.Temporary)

	AddTrigger("fight_busy_success",
		"^(> )*(���.*���㹥�˸����ֲ���)|(���һָ����)|(���.*�������ҪѨ)|(.*������ּ䣬�ѱ����������ס������лк�����)|(.*���˺��ҵ���֮�����λ�Ӱ�����Ի������޴룬��֪�ĸ�������)|(.*����ǧ����һ��������֪����мܣ�)|(.*ֻ��һ���������Ķ���)|(���.*����Χ��ת��ͷ��)|(���.*�����Ƶò�֪����)|(���.*����Χ��ת��ͷ���ۻ�).*$",
		"", flag, -1, 0, "", "fight.on_busy_success") -----.*Ŀǰ���Թ˲�Ͼ���ŵ������� | .*�Ѿ���æ�ˣ�

	SetTriggerOption("fight_busy_success", "group", "fight")

	local desc = "("
	for i = 1, #pfm do
		desc = desc .. pfm[i] .desc
		if(i == #pfm) then desc = desc .. ")" else desc = desc .. "|" end
	end

	AddTrigger("fight_perform_cd",
		"^(> )*" .. desc .. ".*$", --(��������Ҽ�|��ʹ��һ��ָ����|����һ��������ͻ��|����һ�����������|�㵹�����ǲ���|��ƽ�ľ�������̨����|��������ָ��һʽ|����һ�����͹�����).*$",
		"", flag, -1, 0, "", "fight.on_perform")

	SetTriggerOption("fight_perform_cd", "group", "fight")
end

function login(f_done)
	wait.make(function()
		Execute(var.login_drop)
		Execute(var.login_wear)
		wait.time(5)
		call(f_done)
	end)
end

function int_wear(f_done)
	wait.make(function()
		Execute("unwield all;tuo all")
		Execute("wield qiankun dao;wear yuhuang yi;wear shenshui mao;wear xunzhang;wear yaohou xue;wear jiulong hushou;wear haoqi ring")
		wait.time(1)
		call(f_done)
	end)
end

function fight_wear(f_done)
	wait.make(function()
		Execute("tuo all;give xiaocui xue to byj;give juwei jian to byj;give shenshui mao to byj;give shenyu yi to byj;give jiulong hushou to byj;give qiankun dao to byj;give yecha ring to byj")
		Execute("wear all;tuo xunzhang;wield " .. var.weapon)
		core.busytest(function() call(f_done) end)
	end)
end


init()
