require "var"
module ("config", package.seeall)

var.dazuo_desc = "(�������������ù���һ����Ϣ��ʼ������������)|(�����˵�������ڶ��������Ƴ����������������㻺��Ʈ������о����ھ���ʼ������ǿ�ˡ�)"
var.dazuo_end_desc = "(��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�����æ�ջض��غ���Ϣ����Цһ��վ��������)|(���˹���ϣ��������˿�����վ��������)|(�������뵤�������ת�����������չ���˫��̧��վ��������)"
var.dazuo_halt_desc = "(����������е�����ǿ��ѹ�ص��վ��������)|(����ɫһ����Ѹ��������վ��������)|(��˫��һ�����������һ�����⣬��������һЦ��վ��������)"
var.dazuo_full_desc = "���������Ϊ�ƺ��Ѿ��ﵽ��ƿ�����޷��ٿ������������ˡ�"
var.me_id = "larcha"
var.me_pwd = "Larch123"
var.me_name = "����������"
var.me_menpai = "����"
var.me_family = "����"
var.me_dazuo = "dazuo 30000;dazuo max"
var.me_dazuo_factor = 1.3
var.gf_money = "no"
var.task_id = "larcha's task"
var.ttask_id = "larcha's ttask"
var.dig_dummy = "lbt"
var.chatter_whitelist = "byj;lbt;happy;"
var.chatter_blacklist = ""
var.weapon = "zhen"
var.weapon2 = "dao"
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
var.kantou_flag = false

auto_list = {"wei", "guanfu","guo","event","reconnect", "xiao_high", "double", "jiding"}

weapon_list = {"wanyue zhen", "tianfeng dao"}

pfm = {
	[1]= {	name="˫�ֻ���֮��", desc="��ƽ�ľ���", cd=false },
	[2]= {	name="��Ŀ", desc="��������ָ��£���ֱ۱���", cd=false },
	[3]= {	name="������", desc="����ȻһЦ������֮��������Ȼ�ӿ�", cd=false },
	[4]= {	name="��ݾ�ɱ", desc="��ʹ�����ж��еġ���ݾ�ɱ��", cd=false },
	[5]= {	name="zhaohuo", desc="����ȫ�������ע����ϣ����ŵ���һָ", cd=false, reset_time=15 },
	[6]= {	name="��Ӱ", desc="��ǰ�����ߣ��������������иֵ�ԽʹԽ�죬�����������⻯����������", cd=false },
	[7]= {	name="��������", desc="��һƬ�����У�һ�����˹���", cd=false },
	[8]= {	name="��������", desc="���۹�һ�������˻�����", cd=false },
	[9]= {	name="���ǲ���", desc="����һ�����������", cd=false },
	[10]={	name="huagong", desc="��һ����ͻȻ��òҰף�����ֱ�����͵ض�׼", cd=false, reset_time=20}
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
	[1] = { i = 2,
			action = function()
				local wp = choose_sword()
				Execute("unwield all;perform sword.cimu " .. var.pfm_target)
			end
	},

	[2] = { i = 6,
			action = function()
				local wp = choose_blade()
				Execute("unwield all;enable blade hujia-daofa;wield " .. wp .. ";perform blade.huanying " .. var.pfm_target .. ";unwield all")
			end
	},

	[3] = { i = 5,
			action = function()
				Execute("unwield all;enable strike chousui-zhang;perform strike.zhaohuo " .. var.pfm_target)
			end
	},

	[5] = { i = 3,
			action = function()
				choose_force()
				local wp = choose_sword()
				Execute("unwield all;wield " .. wp .. ";perform sword.sanlianci " .. var.pfm_target .. ";unwield all")
			end
	}
}

--
-- attack perform
--
attack_perform_array = {
	[1] = { i = 3,
			action = function()
				choose_force()
				local wp = choose_sword()
				Execute("unwield all;wield " .. wp .. ";perform sword.sanlianci " .. var.pfm_target .. ";unwield all")
			end
	},

	[2] = { i = 8,
			action = function()
				choose_force()
				Execute("unwield all;enable claw youming-zhao;perform claw.youming;perform strike.chousui " .. var.pfm_target)
			end
	},

	[3] = { i = 1,
			action = function()
				choose_force()
				Execute("unwield all;enable claw youming-zhao;perform claw.youming;bei none;bei chousui-zhang;hubo " .. var.pfm_target)
			end
	},

	[4] = { i = 7,
			action = function()
				local wp = choose_blade()
				choose_force()
				Execute("unwield all;wield " .. wp .. ";enable blade hujia-daofa;perform blade.lian " .. var.pfm_target .. ";unwield all")
			end
	},

	[5] = { i = 4,
			action = function()
				local wp = choose_sword()
				choose_force()
				Execute("unwield all;wield " .. wp .. ";enable move five-avoid;perform move.break " .. var.pfm_target .. ";unwield all")
			end
	},

	[6] = { i = 4,
			action = function()
				choose_force()
				Execute("perform move.break " .. var.pfm_target .. ";unwield all")
			end
	},

	[7] = { i = 9,
			action = function()
				choose_force()
				local wp = choose_sword()
				Execute("unwield all;wield " .. wp .. ";enable parry jinshe-zhang;perform parry.fugu;unwield all")
			end
	},

	[8] = { i = 10,
			action = function()
				Execute("unwield all;enable force huagong-dafa;yun huagong " .. var.pfm_target)
			end
	}
}

task_busy_list = { 1, 2, 3}
task_attack_list = {1, 8, 2, 3, 5, 4, 7}

gf_busy_list = { 1, 3 }
gf_attack_list = { 6, 3 }

ttask_busy_list = { 1, 2, 3, 4 }
ttask_attack_list = { 1, 2, 3, 4 }

busy_list = { 1, 2, 3}
busy_list2 = { 1, 2, 3 }
attack_list1 = { 3, 6, 2, 1 } 			-- shan / blocker
attack_list2 = { 1, 2, 3, 5, 4 }	-- xiao
attack_list3 = { 3, 6, 2, 1}			-- wei / xiao
attack_list4 = { 6 }				-- shan / wei
attack_list5 = { 4, 5, 3, 2, 1 }	-- xiao

study_list = {
	--{ loc = "fly wm;e;n;e;e;n;n;", cmd = "yanjiu finger 10000;et;set study done", post_action="fly wm;e;s;s;s;w;w;u;gamble big skill finger 2000"}
	{ loc = "fly wm;e;n;e;e;n;n;", cmd = "yanjiu kuihua-xinfa 10000", wear_int = true, interval = 0.8 }
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
	return "zhen"
end

function choose_force(sf)
	if(sf ~= nil) then var.choose_force = sf end

	if(var.choose_force ~= nil and var.choose_force ~= "") then
		Execute("enable force " .. var.choose_force)
	end
end

function powerup()
	Execute("enable force huagong-dafa;yun powerup;enable force kuihua-xinfa;yun kuihuawudi")
end

function set_menpai(menpai)
	if(menpai ~= nil) then
		local re = rex.new("(����|����|��ɽ|����|ѩɽ|����|����|�ɻ�)")
		local r1,r2,r3 = re:match(menpai)
		if(r3 ~= nil) then
			print("��ˮϵ�ڹ���.......")
			return choose_force("kuihua-xinfa")
		end

		re = rex.new("(����|����|����|����|����|����|ȫ��|�һ�|����|����|÷ׯ|Ľ��|��ü)")
		r1,r2,r3 = re:match(menpai)
		if(r3 ~= nil) then
			print("��ľϵ�ڹ���.......")
			return choose_force("huagong-dafa")
		end

		re = rex.new("(�䵱|����|��ң|����|ؤ��)")
		r1,r2,r3 = re:match(menpai)
		if(r3 ~= nil) then
			print("��ˮϵ�ڹ���.......")
			return choose_force("kuihua-xinfa")
		end
	end

	print("Ĭ�ϻ���ľϵ�ڹ���.......")
	return choose_force("kuihua-xinfa")
end

function buff(menpai)
	Execute("perform strike.youming")
end

function anti_touxi()

end

function init()
	local flag = bit.bor(trigger_flag.KeepEvaluating, trigger_flag.RegularExpression, trigger_flag.Replace)--, trigger_flag.Temporary)

	AddTrigger("fight_busy_success",
		"^(> )*(.*�����������Ļ��棬��ɫ���ɵý���������)|(���һָ����)|(���.*�������ҪѨ)|(.*ֻ��������һ�㣬˫Ŀһ���ʹ����ǰһ�ھ�ʲôҲ�������ˣ���ʱ����ʹ��������)|(.*���˺��ҵ���֮�����λ�Ӱ�����Ի������޴룬��֪�ĸ�������)|(.*����ǧ����һ��������֪����мܣ�)|(.*ֻ��һ���������Ķ���)|(���.*����Χ��ת��ͷ��)|(���.*�����Ƶò�֪����)|(���.*����Χ��ת��ͷ���ۻ�).*$",
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

	AddTrigger("set_hg_status",
		"^(> )*(.*�Ѿ�������ɢ��û�б�Ҫ���������ˣ�)|(��ո���ȡ��������).*$",
		"", flag, -1, 0, "", "config.set_hg_status")

	SetTriggerOption("set_hg_status", "group", "fight")

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
		Execute("wield taibai fu;wear tianguang yi;wear taifeng mao;wear xunzhang;wear yunti xue;wear huanglong hushou;wear tianlong ring")
		wait.time(1)
		call(f_done)
	end)
end

function fight_wear(f_done)
	wait.make(function()
		Execute("tuo all;drop bu yi;drop bu xie;wear luhong xue;wear yunti xue;wear bagua mao;wear taifeng mao;wear haoqi yi;wear tianguang yi;wear sanqing hushou;wear tianlong ring")
		wait.time(1)
		core.busytest(function() call(f_done) end)
	end)
end


init()
