require "var"
module ("config", package.seeall)

var.dazuo_desc = "�������������ù���һ����Ϣ��ʼ������������"
var.dazuo_end_desc = "(�㽫ͷ�ϰ�������������˫�ۣ�����վ��)|(���˹���ϣ��������˿�����վ��������)|(�������뵤�������ת�����������չ���˫��̧��վ��������)"
var.dazuo_halt_desc = "(����������е�����ǿ��ѹ�ص��վ��������)|(����ɫһ����Ѹ��������վ��������)"
var.dazuo_full_desc = "���������Ϊ�ƺ��Ѿ��ﵽ��ƿ�����޷��ٿ������������ˡ�"
var.me_id = "byj"
var.me_pwd = "Flying1"
var.me_name = "����"
var.me_menpai = "����"
var.me_family = "����"
var.me_dazuo = "dazuo 15000;dazuo max"
var.gf_money = "no"
var.task_id = "byj's task"
var.ttask_id = "byj's ttask"
var.dig_dummy = "lbt"
var.chatter_whitelist = "byj;lbt;happy;"
var.chatter_blacklist = ""
var.weapon = "qin"
var.weapon2 = "dao"
var.study_seq = 1
var.fast_mode = 1
var.xiao_full = 0
var.guo_kill_place = "fly mj"
var.task_walk_danger_level = 3
var.gf_walk_danger_level = 5
var.ss_walk_danger_level = 5
var.xiao_walk_danger_level = 4
var.ss_shuffle = 1
var.study_threshold = 10000

auto_list = {"wei", "guanfu","guo","event","gamble_study","reconnect", "sstask", "xiao", "double", "baobiao", "shan", "wine", "task"}

weapon_list = {"kunlun qin", "kunlun dao", "haoqi qin", "tiandi dao", "qiankun dao", "lianyu qin"}

pfm = {
	[1] = {name="һ��������", 		desc="����һ��������ͻ��", 			cd=false},
	[2] = {name="���ǲ���", 		desc="����һ�����������", 			cd=false},
	[3] = {name="������", 		desc="�㵹�����ǲ���", 					cd=false},
	[4] = {name="˫�ֻ���֮��", 		desc="��ƽ�ľ���", 						cd=false},
	[5] = {name="������", 			desc="��������Ҽ�", 					cd=false},
	[6] = {name="һָǬ��", 		desc="��ʹ��һ��ָ����", 				cd=false},
	[7] = {name="��������", 		desc="��������ָ��һʽ", 				cd=false},
	[8] = {name="�������",			desc="��ʹ�������潣�еľ���",			cd=false},
	--[8] = {name="�������",		desc="����һ�����͹�����", 			cd=false},
	--[9] = {name="����������",		desc="��ʹ����ҽ���֮��������������", 	cd=false},
	[9] = {name="��Ůɢ��",			desc="������Ϣ�������󼲶�", 			cd=false},
	[10]= {name="�貨΢��",			desc="�������������������������ʮ����",cd=false},
	[11]= {name="����˼",			desc="��ʹ�������鳤��֮����",				cd=false},
	[12]= {name="�¹���Ӱ",			desc="�������¹��ӳ��",				cd=false},
	[13]= {name="������ѩ",			desc="��ʹ����ɽ������֮������������ѩ��",			cd=false},
	[14]= {name="��",			desc="�����˴�����������",		cd=false},
	[15]= {name="��Ӱ���",			desc="�㳤�ն��𣬻���һֻ����",		cd=false},
	[16]= {name="�������",			desc="����һ�����͹�����", 			cd=false},
	[17]= {name="����", 			desc="��ʹ��ʥ��������桹��", 		cd=false},
	[18]= {name="��Ұӥ��",			desc="��ʹ���ѹ�ӥצ������", 			cd=false},
	[19]= {name="��ɽ��Ӱ",			desc="��ʹ����Ӱ�貽�ľ�������ɽ��Ӱ��",				cd=false},
	[20]= {name="��������",			desc="��һ����Х����������������һ����",				cd=false},
	[21]= {name="��ʧ��",			desc="����������ʹ������ȭ�ܾ��еġ���ʧ����", cd=false},
	[22]= {name="��ȭ����",			desc="������ŭ�𣬼���ȫ������ʹ������ȭ�ռ�����", cd=false},
	[23]= {name="���㱾�",			desc="����������ʹ������ȭ�ܾ��еġ����㱾���", cd=false},
	[24]= {name="������",			desc="ͻȻ��˫�ƴ��˼��ֻ꣬������������", 			cd=false},
	[25]= {name="Ѫ����", 		desc="�����еĵ���Ѫ��һ������ֻ����ǰһ��", cd=false},
	[26]= {name="���������",		desc="������������ͼʹ������ȭ�ܾ��еġ������������", cd=false},
	[27]= {name="�˷ξ�",			desc="����������ʹ������ȭ�ܾ��еġ��˷ξ���", 	cd=false},
	[28]= {name="���ľ�",			desc="����������ʹ������ȭ�ܾ��еġ����ľ���",	cd=false},
	[29]= {name="�����",			desc="����������ʹ������ȭ�ܾ��еġ��������",	cd=false},
	[30]= {name="�ݸγ���",			desc="����������ʹ������ȭ�ܾ��еġ��ݸγ�����",	cd=false},
	[31]= {name="����һ��",			desc="��Ĭ�˻���������ʩչ��������һ����", 			cd=false},
	[32]= {name="��������",			desc="������һ����������������������ǰ�����һ��˵��",cd=false},
	[33]= {name="�׺�һЦ",			desc="��ǿ����������ͻ������룬�����ݺ�֮ʽ",	cd=false},
	[34]= {name="��Ӱ",			desc="��ǰ�����ߣ��������������иֵ�ԽʹԽ�죬�����������⻯����������", cd=false},
	[35]= {name="��������", 	desc="��һƬ�����У�һ�����˹���", cd=false},
	[36]= {name="��ɫ����", 	desc="��ʹ��С�����������ɫ���ࡹ����ʽ���Ī��", cd=false},
	[37]= {name="�����п�", 	desc="��ʹ������У����λ�ת��������Ծ�ն���", cd=false},
	[38]= {name="��Ϭһָ", 	desc="��˫��һǰһ�󣬻������", cd=false}
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
				Execute("unwield all;enable blade hujia-daofa;wield " .. wp .. ";perform blade.huanying " .. var.pfm_target .. ";unwield all")
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
				choose_force()
				Execute("unwield all;wield " .. wp .. ";enable blade xue-dao;enable force xiaowuxiang;jiali max;yun wuxiang " .. var.pfm_target .. ";jiali 0")
			end
	},

	[1] = { i = 35,
			action = function()
				local wp = choose_blade()
				choose_force()
				Execute("unwield all;enable blade xue-dao;enable parry hujia-daofa;wield " .. wp .. ";jiali max;perform parry.lian " .. var.pfm_target .. ";jiali 0")
			end
	},

	[3] = { i = 22,
			action = function()
				choose_force()
				Execute("unwield all;enable cuff qishang-quan;bei none;bei qishang-quan;perform cuff.qishang " .. var.pfm_target)
			end
	},

	[4] = { i = 4,
			action = function()
				choose_force()
				Execute("bei none;enable finger sun-finger;bei sun-finger;unwield all;hubo " .. var.pfm_target)
			end
	},

	[5] = { i = 20,
			action = function()
				local wp = choose_sword()
				Execute("unwield all;wield " .. wp .. ";enable sword yuxiao-jian;perform sword.tianwai " .. var.pfm_target)
			end
	},

	[6] = { i = 4,
			action = function()
				choose_force()
				Execute("unwield all;hubo " .. var.pfm_target)
			end
	},

	[7] = { i = 35,
			action = function()
				local wp = choose_blade()
				choose_force()
				Execute("unwield all;wield " .. wp .. ";enable blade hujia-daofa;perform blade.lian " .. var.pfm_target)
			end
	},


	[8] = { i = 36,
			action = function()
				choose_force()
				Execute("unwield all;enable force xiaowuxiang;bei none;enable finger sun-finger;bei sun-finger;yun wuxiang " .. var.pfm_target)
			end
	},

	[9] = { i = 24,
			action = function()
				Execute("unwield all;bei none;bei huoyan-dao;perform strike.xiuluo " .. var.pfm_target)
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
				Execute("unwield all;enable force xiaowuxiang;bei none;enable finger tanzhi-shentong;bei lanhua-shou;bei tanzhi-shentong;enable finger sun-finger;yun wuxiang " .. var.pfm_target)
			end
	},

	[13] = { i = 19,
			action = function()
				Execute("enable move yueying-wubu;bei none;bei sun-finger;perform move.yueying")
			end
	},

	[14] = { i = 11,
			action = function()
				local wp = choose_sword()
				choose_force()
				Execute("unwield all;wield " .. wp .. ";enable sword chixin-qingchang-jian;perform sword.xiangsi")
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
				Execute("enable finger taizhi-shentong;unwield all;perform finger.lingxi")
			end
	},

	[17] = { i = 14,
			action = function()
				local wp = choose_sword()
				choose_force()
				Execute("enable parry pomo-jianfa;enable sword wuyun-jianfa;unwield all;wield " .. wp .. ";perform parry.zuijian " .. var.pfm_target)
				Execute("unwield all")
			end
	},

	[18] = { i = 8,
			action = function()
				local wp = choose_sword()
				choose_force()
				Execute("enable parry tianyu-qijian;enable sword wuyun-jianfa;unwield all;wield " .. wp .. ";perform parry.kuangwu " .. var.pfm_target)
				Execute("unwield all")
			end
	},

	[19] = { i = 9,
			action = function()
				local wp = choose_sword()
				choose_force()
				Execute("enable parry tianyu-qijian;unwield all;wield " .. wp .. ";perform parry.san " .. var.pfm_target .. ";unwield all")
			end
	}
}

task_busy_list = { 1, 2, 3, 4 }
task_attack_list = { 17, 12, 6, 3, 18 }

gf_busy_list = { 1, 3 }
gf_attack_list = { 6, 7 }

ttask_busy_list = { 1, 2, 3, 4 }
ttask_attack_list = { 1, 2, 3, 4 }

busy_list = { 1, 2, 3, 4 }
busy_list2 = { 1, 3, 4, 2 }
attack_list1 = { 7, 3, 6 } 			-- shan / blocker
attack_list2 = { 3, 8, 17, 4, 7 }	-- xiao
attack_list3 = { 7, 19, 13}			-- wei / xiao
attack_list4 = { 6 }				-- shan / wei
attack_list5 = { 3, 12, 17, 6, 7 }	-- xiao

study_list = {
	--{ loc = "fly wm;e;n;e;e;n;n;", cmd = "yanjiu finger 10000;et;set study done", post_action="fly wm;e;s;s;s;w;w;u;gamble big skill finger 2000"}
	{ loc = "fly wm;e;n;e;e;n;n;", cmd = "yanjiu dodge 1000", wear_int = true, interval = 0.8, post_action="fly wm;e;s;s;s;w;w;u;gamble big skill dodge 2000"}
		--{ loc = "fly mj", cmd = "xue wei strike 100;et",pre_action="bai wei yixiao", post_action="bai xie xun"}
}


function choose_blade()
	return "dao"
end

function choose_sword()
	return "qin"
end

function choose_force()
	if(var.choose_force ~= nil and var.choose_force ~= "") then
		Execute("enable force " .. var.choose_force)
	end
end

function powerup()
	Execute("enable force wuzheng-xinfa;yun bingxin;yun powerup;enable force beiming-shengong;yun beiming")
end

function buff(menpai)
	if(menpai ~= nil) then
		local re = rex.new("(�һ�|����|����|÷ׯ|Ľ��|��ü|����|����|��ɽ|����|ѩɽ|����|����)")
		local r1,r2,r3 = re:match(menpai)
		if(r3 ~= nil) then
			print("����ϵ�ڹ���.......")
			var.choose_force = "xiaowuxiang"
			Execute("perform dodge.mengyulingbo")
			return
		end

		re = rex.new("(����|����|����|����|����)")
		r1,r2,r3 = re:match(menpai)
		if(r3 ~= nil) then
			print("��ˮϵ�ڹ���.......")
			var.choose_force = "beiming-shengong"
			Execute("perform dodge.mengyulingbo")
			return
		end

		re = rex.new("(����|ȫ��)")
		r1,r2,r3 = re:match(menpai)
		if(r3 ~= nil) then
			print("��ľϵ�ڹ���.......")
			var.choose_force = "wuzheng-xinfa"
			Execute("perform dodge.mengyulingbo")
			return
		end
	end

	print("Ĭ�ϻ���ˮϵ�ڹ���.......")
	var.choose_force = "beiming-shengong"
	Execute("enable force beiming-shengong;yun beiming;perform dodge.mengyulingbo")
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
		Execute("wield qiankun dao;wear haoqi yi;wear shenshui mao;wear xunzhang;wear yaohou xue;wear jiulong hushou;wear sanqing ring")
		wait.time(1)
		call(f_done)
	end)
end

function fight_wear(f_done)
	wait.make(function()
		Execute("tuo all;wear shentong xue;wear bagua xue;wear shenshui mao;wear taiji yi;wear haoqi yi;wear lianyu hushou;wear yecha ring;give byj kunlun qin")
		wait.time(1)
		core.busytest(function() call(f_done) end)
	end)
end


init()
