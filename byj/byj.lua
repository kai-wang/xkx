require "var"
module ("config", package.seeall)

var.dazuo_desc = "(�������������ù���һ����Ϣ��ʼ������������)|(����ϥ�붨�����������������ݶ���Ϣ������һ˿˿������������)|(�����˵�������ڶ��������Ƴ����������������㻺��Ʈ������о����ھ���ʼ������ǿ�ˡ�)"
var.dazuo_end_desc = "(��һ�����н���������ʱ����ů���е������ھ�������һ�֡�)|(���˹���ϣ��������˿�����վ��������)|(�������뵤�������ת�����������չ���˫��̧��վ��������)|(��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�����æ�ջض��غ���Ϣ����Цһ��վ��������)"
var.dazuo_halt_desc = "(����������е�����ǿ��ѹ�ص��վ��������)|(����ɫһ����Ѹ��������վ��������)|(��ͻȻ˫������ǰһ�ϣ�ѹס������Ϣ�����Ծ��)|(��˫��һ�����������һ�����⣬��������һЦ��վ��������)"
var.dazuo_full_desc = "���������Ϊ�ƺ��Ѿ��ﵽ��ƿ�����޷��ٿ������������ˡ�"
var.me_id = "byj"
var.me_pwd = "Flying01"
var.me_name = "����"
var.me_menpai = "����"
var.me_family = "����"
var.me_dazuo = "dazuo 30000;dazuo max"
var.me_dazuo_factor = 0.8
var.gf_money = "no"
var.task_id = "byj's task"
var.ttask_id = "byj's ttask"
var.task_auto_kill = 1
var.task_kill_flag = 1
var.dig_dummy = "lbt"
var.chatter_whitelist = "byj;lbt;happy;"
var.chatter_blacklist = ""
var.weapon = "qin"
var.weapon2 = "dao"
var.kantou_wp = "dao;wield qin"
var.study_seq = 1
var.fast_mode = 1
var.xiao_full = 0
var.xiao_retry_threshold = 3
var.guo_kill_place = "fly mj"
var.task_walk_danger_level = 5
var.gf_walk_danger_level = 5
var.ss_walk_danger_level = 5
var.xiao_walk_danger_level = 5
var.ss_shuffle = 0
var.ss_can_stop = 1
var.study_threshold = 10000
var.kantou_flag = true
var.lht_skil_exp_check = 1
--var.sleep_loc = "fly bt;n;w;n" 

auto_list = {"wei", "guanfu","guo","event","double", "baobiao", "shan", "wine", "task", "wait_for_task", "reconnect", "quit"}

weapon_list = {"haoqi qin", "sanqing dao", "kunlun qin", "shentong zhang", "qiankun dao", "kunlun zhang"}

pfm = {
	[1]= {	name="˫�ֻ���֮��", desc="��ƽ�ľ���", cd=false },
	[2]= {	name="��", desc="�����˴�����������", cd=false },
	[3]= {	name="��ȭ����", desc="������ŭ�𣬼���ȫ������ʹ������ȭ�ռ�����", cd=false },
	[4]= {	name="������", desc="ͻȻ��˫�ƴ��˼��ֻ꣬������������", cd=false },
	[5]= {	name="Ѫ����", desc="�����еĵ���Ѫ��һ������ֻ����ǰһ��", cd=false },
	[6]= {	name="��Ӱ", desc="��ǰ�����ߣ��������������иֵ�ԽʹԽ�죬�����������⻯����������", cd=false },
	[7]= {	name="��������", desc="��һƬ�����У�һ�����˹���", cd=false },
	[8]= {	name="�����п�", desc="��ʹ������У����λ�ת��������Ծ�ն���", cd=false },
	[9]= {	name="�����Ի�", desc="��������ƣ�ʹ��һ�С������Ի�", cd=false },
	[10]={	name="���Ƚ�ħ", desc="����һ�������м�ת�ŵ�", cd=false, tx_finish=true, fz_back=true },
	[11]={	name="ǧ������", desc="��ʹ������ָ������ǧ��������", cd=false },
	[12]= {	name="zhaohuo", desc="����ȫ�������ע����ϣ����ŵ���һָ", cd=false, reset_time=15 },
	--[13]= {	name="��������", desc="���۹�һ�������˻�����", cd=false },
	[13]= {name="����˼",			desc="��ʹ�������鳤��֮����",				cd=false},
	[14]= {name="�¹���Ӱ",			desc="�������¹��ӳ��",				cd=false}
	--[[
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
	]]--
}

function set_hg_status()
	for i, v in ipairs(config.pfm) do
		if(v.name == "huagong") then
			v.cd = true
			v.cd_time = os.time()
			return
		end
	end
end

function set_fz_status()
	--print(color)
	for i, v in ipairs(config.pfm) do
		-- ���Ȼ������ҵ�Ϣ����
		if(v.fz_back ~= nil and v.tx_finish == true) then 
			v.fz_back = true
			v.cd = false
			v.cd_time = os.time()
			v.inuse = false
			return
		end
	end
end

function set_cd_status(l, flag, color)
	--print(color)

	for i, v in ipairs(config.pfm) do
		if((v.desc == l or v.name == l) and (v.inuse == true or flag == false)) then
			-- ����: tx_finish ��¼�Ƿ��Ϣ������fz_back ��¼�Ƿ���Ȼ���
			if(v.fz_back ~= nil) then 
				v.tx_finish = not flag 
				-- ����û��������Ϣ�Խ���
				if(flag == false) then return end
			end

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
	[1] = { i = 6,
			action = function()
				local wp = choose_blade()
				Execute("unwield all;enable blade hujia-daofa;wield " .. wp .. ";perform blade.huanying " .. var.pfm_target .. ";unwield all")
			end
	},

	[2] = { i = 14,
			action = function()
				Execute("enable move yueying-wubu;perform move.yueguangruying " .. var.pfm_target)
			end
	}
--[[	,

	[3] = { i = 12,
			action = function()
				Execute("unwield all;enable strike chousui-zhang;perform strike.zhaohuo " .. var.pfm_target)
			end
	}
]]--
}

--
-- attack perform
--
attack_perform_array = {
	[1] = { i = 10,
			action = function()
				choose_force()
				Execute("unwield all;wield staff;perform staff.feizhang " .. var.pfm_target)
			end
	},

	[2] = { i = 5,
			action = function()
				local wp = choose_xuedao()
				choose_force()
				Execute("unwield all;wield " .. wp .. ";enable blade xue-dao;jiali max;perform blade.kuangdao " .. var.pfm_target .. ";jiali 0;unwield all")
			end
	},

	[3] = { i = 7,
			action = function()
				local wp = choose_xuedao()
				choose_force()
				Execute("unwield all;enable blade xue-dao;enable parry hujia-daofa;wield " .. wp .. ";jiali max;perform parry.lian " .. var.pfm_target .. ";jiali 0;unwield all")
			end
	},

	[4] = { i = 3,
			action = function()
				choose_force()
				Execute("unwield all;enable cuff qishang-quan;bei none;bei qishang-quan;perform cuff.qishang " .. var.pfm_target)
			end
	},

	[5] = { i = 1,
			action = function()
				choose_force()
				Execute("bei none;enable finger sun-finger;bei sun-finger;unwield all;hubo " .. var.pfm_target)
			end
	},

	[6] = { i = 1,
			action = function()
				choose_force()
				Execute("unwield all;hubo " .. var.pfm_target)
			end
	},

	[7] = { i = 7,
			action = function()
				local wp = choose_blade()
				choose_force()
				Execute("unwield all;wield " .. wp .. ";enable blade hujia-daofa;perform blade.lian " .. var.pfm_target .. ";unwield all")
			end
	},

	[8] = { i = 4,
			action = function()
				Execute("unwield all;enable strike huoyan-dao;bei none;bei huoyan-dao;perform strike.xiuluo " .. var.pfm_target)
			end
	},

	[9] = { i = 2,
			action = function()
				local wp = choose_sword()
				choose_force()
				Execute("enable parry pomo-jianfa;enable sword wuyun-jianfa;unwield all;wield " .. wp .. ";perform parry.zuijian " .. var.pfm_target .. ";unwield all")
				Execute("unwield all")
			end
	},

	[10] = { i = 13,
			action = function()
				local wp = choose_sword()
				choose_force()
				Execute("unwield all;wield " .. var.wp .. ";enable sword chixin-qingchang-jian;perform sword.xiangsi " .. var.pfm_target .. ";unwield all")
			end		
	}
}

task_busy_list = { 1, 2}
task_attack_list = {5, 9, 10, 7, 4}

gf_busy_list = { 1, 2 }
gf_attack_list = { 6, 7 }

ttask_busy_list = { 1, 2, 3, 4 }
ttask_attack_list = { 1, 2, 3, 4 }

busy_list = { 1, 2}
busy_list2 = { 1, 2 }
attack_list1 = { 6, 7, 10 } 			-- shan / blocker
attack_list2 = { 5, 9, 10, 7, 4 }	-- xiao
attack_list3 = { 7, 10, 5}			-- wei / xiao
attack_list4 = { 6 }				-- shan / wei
attack_list5 = { 5, 10, 7, 1 }	-- ss

study_list = {
	{ loc = "fly wm;e;n;e;e;n;n;", cmd = "yanjiu finger 10000", wear_int = true, interval = 0.8, post_action="fly wm;e;s;s;s;w;w;u;gamble big skill finger 2000"},
	{ loc = "fly wm;e;n;e;e;n;n;", cmd = "yanjiu force 10000", wear_int = true, interval = 0.8, post_action="fly wm;e;s;s;s;w;w;u;gamble big skill force 2000"},
	{ loc = "fly wm;e;n;e;e;n;n;", cmd = "yanjiu dodge 10000", wear_int = true, interval = 0.8, post_action="fly wm;e;s;s;s;w;w;u;gamble big skill dodge 2000"},
	{ loc = "fly wm;e;n;e;e;n;n;", cmd = "yanjiu longxiang 10000", wear_int = true, interval = 0.8 },
	{ loc = "fly wm;e;n;e;e;n;n;", cmd = "yanjiu huagong-dafa 5000", wear_int = true, interval = 0.8 }
	--{ loc = "fly mj", cmd = "xue wei strike 100;et",pre_action="bai wei yixiao", post_action="bai xie xun"}
}

function choose_xuedao(p)
	if(p ~= nil) then Execute("give dao 2 to " .. var.me_id) end
	return "dao"
end

function choose_blade()
	return "dao"
end

function choose_sword()
	return "qin"
end

function choose_force(sf)
	if(sf ~= nil) then var.choose_force = sf end

	if(var.choose_force ~= nil and var.choose_force ~= "") then
		Execute("enable force " .. var.choose_force)
	end
end

function powerup()
	Execute("enable force wuzheng-xinfa;yun bingxin;enable force beiming-shengong;yun beiming;yun shield")
end

function set_menpai(menpai)
	if(menpai ~= nil) then
		local re = rex.new("(�һ�|����|����|÷ׯ|Ľ��|��ü|����|����|��ɽ|����|ѩɽ|����|����|�ɻ�)")
		local r1,r2,r3 = re:match(menpai)
		if(r3 ~= nil) then
			print("����ϵ�ڹ���.......")
			return choose_force("beiming-shengong")
		end

		re = rex.new("(����|����|����|����|����|����|ȫ��)")
		r1,r2,r3 = re:match(menpai)
		if(r3 ~= nil) then
			print("��ľϵ�ڹ���.......")
			return choose_force("wuzheng-xinfa")
		end

		re = rex.new("(�䵱|����|��ң|����|ؤ��)")
		r1,r2,r3 = re:match(menpai)
		if(r3 ~= nil) then
			print("��ľϵ�ڹ���.......")
			return choose_force("wuzheng-xinfa")
		end
	end

	print("Ĭ�ϻ��ɽ�ϵ�ڹ���.......")
	return choose_force("beiming-shengong")
end

function buff(menpai)
	--Execute("unwield all;jiali max;enable strike huoyan-dao;perform strike.honglian;jiali 0")
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
--[[
	AddTrigger("set_fz_status",
		"^(> )*��������ǰ����������.*�ջء�.*$",
		"", flag, -1, 0, "", "config.set_fz_status")

	SetTriggerOption("set_fz_status", "group", "system")
]]--
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
		Execute("wield bagua dao;wear lianyu yi;wear shentong mao;wear shenshui mao;wear xunzhang;wear kunlun xue;wear jiulong hushou;wear sanqing ring")
		wait.time(1)
		call(f_done)
	end)
end

function fight_wear(f_done)
	wait.make(function()
		Execute("tuo all;wear shentong xue;wear bagua xue;wear shentong mao;wear shenshui mao;wear taiji yi;wear xuanyuan yi;wear xuanyuan hushou;wear lianyu ring;give sanqing dao to " .. var.me_id)
		wait.time(1)
		core.busytest(function() call(f_done) end)
	end)
end


init()
