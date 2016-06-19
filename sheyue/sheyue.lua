require "var"

var.dazuo_desc = "�������������ù���һ����Ϣ��ʼ������������"
var.dazuo_end_desc = "(��һ�����н���������ʱ����ů���е������ھ�������һ�֡�)|(���˹���ϣ��������˿�����վ��������)"
var.dazuo_halt_desc = "��ͻȻ˫������ǰһ�ϣ�ѹס������Ϣ�����Ծ��"
var.dazuo_full_desc = "���������Ϊ�ƺ��Ѿ��ﵽ��ƿ�����޷��ٿ������������ˡ�"
var.me_id = "sheyue"
var.me_name = "����"
var.me_menpai = "����"
var.me_family = "����"
var.me_dazuo = "dazuo 5000;dazuo max"
var.gf_money = "no"
var.task_id = "sheyue's task"
var.ttask_id = "sheyue's ttask"
var.dig_dummy = "lbt"
var.weapon = "qianren dao;wield fengquan dao"
var.weapon2 = "staff"
var.weapon3 = "baihe lun;wield jinling lun"
var.study_seq = 1
var.guo_kill_place = "fly tzf"


profile = {
	pfm = {
		[1]= {name="���ƽ���",			desc="�����𡸹�Ԫ���ɷ�����ͬʱʹ�������ƽ�����", cd=false},
		[2]= {name="������",			desc="ͻȻ��˫�ƴ��˼��ֻ꣬������������", cd=false},
		[3]= {name="��Ӱ",				desc="��ǰ�����ߣ��������������иֵ�ԽʹԽ�죬�����������⻯����������", cd=false},
		[4]= {name="���Ƚ�ħ",			desc="����һ�������м�ת�ŵ�", cd=false},
		[5]= {name="�����п�",			desc="��ʹ������У����λ�ת��������Ծ�ն���", cd=false},
		[6]= {name="��ת����",			desc="��ʹ����ѩ�����еġ���ת���ǡ�", cd=false},
		[7]= {name="��������", 			desc="��һҧ�������϶����ӿ죬ͬʱʹ��", cd=false},
		[8]= {name="˫�ֻ���֮��", 		desc="��ƽ�ľ���", 						cd=false},
		[9]= {name="���ִ�",			desc="����Ծ���ᣬ��ʱ���ء����ˡ����֮������", cd=false}
	},
	
	set_cd_status = function(l, flag, color)
		--print(color)
		for i, v in ipairs(profile.pfm) do
			if((v.desc == l or v.name == l) and (v.inuse == true or flag == false)) then 
				v.cd = flag 
				v.cd_time = os.time() 
				v.inuse = flag
			end
		end
	end,
	
	reset_cd_status = function()
		for i, v in ipairs(profile.pfm) do
			v.cd = false
		end
	end,
	
	busy_list = {
		[2] = { i = 5, action = "perform move.tianmaxingkong"},
		[1] = { i = 3, action = "unwield all;wield " .. var.weapon .. ";perform blade.huanying"}
	},
	
	task_busy_list = {
		[2] = { i = 5, action = "perform move.tianmaxingkong " .. var.task_id},
		[1] = { i = 3, action = "unwield all;wield " .. var.weapon .. ";perform blade.huanying " .. var.task_id}
	},
	
	task_attack_list = {
		[5] = { i = 7, action = "unwield all;wield " .. var.weapon .. ";perform blade.lian " .. var.task_id },
		[4] = {	i = 6, action = "unwield all;wield " .. var.weapon3 .. ";enable hammer tiexue-hammer;perform hammer.fanzhuan " ..var.task_id },
		[2] = { i = 2, action = "unwield all;enable strike huoyan-dao;bei none;bei huoyan-dao;perform strike.xiuluo " .. var.task_id},
		[3] = {	i = 9, action = "unwield all;wield " .. var.weapon3 .. ";enable hammer riyue-lun;perform hammer.wulundafa " ..var.task_id },
		--[2] = { i = 1, action = "unwield all;enable strike tiezhang-zhangfa;bei none;bei tiezhang-zhangfa;enable strike huoyan-dao;perform parry.tiezhangxianglong ".. var.task_id},
		[1] = { i = 4, action = "unwield all;wield " .. var.weapon2 .. ";perform staff.feizhang " .. var.task_id}
	},

	ttask_busy_list = {
		[3] = { i = 5, action = "perform move.tianmaxingkong " .. var.task_id},
		[2] = { i = 3, action = "unwield all;wield " .. var.weapon .. ";perform blade.huanying " .. var.task_id},
		[1] = { i = 4, action = "unwield all;wield " .. var.weapon2 .. ";perform staff.feizhang " .. var.task_id}
	},
	
	ttask_attack_list = {
		[4] = { i = 7, action = "unwield all;wield " .. var.weapon .. ";perform blade.lian " .. var.ttask_id },
		[1] = { i = 2, action = "unwield all;enable strike huoyan-dao;bei none;bei huoyan-dao;perform strike.xiuluo " .. var.ttask_id},
		[3] = {	i = 6, action = "unwield all;wield " .. var.weapon3 .. ";perform hammer.fanzhuan " ..var.ttask_id },
		[2] = { i = 1, action = "unwield all;enable strike tiezhang-zhangfa;bei none;bei tiezhang-zhangfa;enable strike huoyan-dao;perform parry.tiezhangxianglong ".. var.ttask_id}
	},
	attack_list3 = {
		[1] = {	i = 21, action = "unwield all;perform cuff.jingshi;wield " .. var.weapon},
		[2] = {	i = 26, action = "unwield all;perform cuff.sanjiao;wield " .. var.weapon},
		[4] = {	i = 30, action = "unwield all;perform cuff.cuiganchang;wield " .. var.weapon},
		[3] = {	i = 22, action = "unwield all;perform cuff.qishang;wield " .. var.weapon}
	},
	
	attack_list1 = {
		[4] = { i = 7, action = "unwield all;wield " .. var.weapon .. ";perform blade.lian" },
		[1] = { i = 2, action = "unwield all;enable strike huoyan-dao;bei none;bei huoyan-dao;perform strike.xiuluo"},
		[3] = {	i = 6, action = "unwield all;wield " .. var.weapon3 .. ";perform hammer.fanzhuan"},
		[2] = { i = 1, action = "unwield all;enable strike tiezhang-zhangfa;bei none;bei tiezhang-zhangfa;enable strike huoyan-dao;perform parry.tiezhangxianglong"}
	},
	
	attack_list2 = {
		[4] = { i = 7, action = "unwield all;wield " .. var.weapon .. ";perform blade.lian" },
		[1] = { i = 2, action = "unwield all;enable strike huoyan-dao;bei none;bei huoyan-dao;perform strike.xiuluo"},
		[3] = {	i = 6, action = "unwield all;wield " .. var.weapon3 .. ";perform hammer.fanzhuan"},
		[2] = { i = 1, action = "unwield all;enable strike tiezhang-zhangfa;bei none;bei tiezhang-zhangfa;enable strike huoyan-dao;perform parry.tiezhangxianglong"}
	},
	
	attack_list4 = {
		[1] = {	i = 8, action = "unwield all;hubo"}
	},
	
	study_list = {
		--{ loc = "fly wm;e;n;e;e;n;n;", cmd = "yanjiu strike 1000;et", post_action="fly wm;e;s;s;s;w;w;u;gamble big skill strike 2000"}
		{ loc = "fly wm;e;n;e;e;n;n;", cmd = "yanjiu guiyuan-tunafa 1000;et"}
		--{ loc = "fly mj", cmd = "xue wei strike 100;et",pre_action="bai wei yixiao", post_action="bai xie xun"}
	},
	
	research_list = {
		{ skill = "xiantian-qigong"}

	},
	
	powerup = function()
		Execute("yun powerup;yun shield;enable force guiyuan-tunafa;yun powerup;enable force longxiang")
	end,

	buff = function()
		--Execute("unwield all;perform parry.zhangdao;jiali min;perform strike.honglian")
		Execute("unwield all;jiali min;perform strike.honglian;jiali 0")
	end,

	anti_touxi = function()
		Execute("unwield all;perform cuff.sanjiao " .. var.task_id)
	end,
	
	init = function()
		local flag = bit.bor(trigger_flag.KeepEvaluating, trigger_flag.RegularExpression, trigger_flag.Replace)--, trigger_flag.Temporary)
		AddTrigger("fight_busy_success",
			"^(> )*(.*����ǧ����һ��������֪����мܣ�)|(���.*���㹥�˸����ֲ���)|(���һָ����)|(.*ֻ��һ���������Ķ���)|(���.*����Χ��ת��ͷ��)|(���.*�����Ƶò�֪����)|(���.*���㹥�˸����ֲ���)|(���.*�������ҪѨ)|(.*���˺��ҵ���֮�����λ�Ӱ�����Ի������޴�)|(.*�Ѿ���æ�ˣ�).*$",
			"", flag, -1, 0, "", "fight.on_busy_success") -----.*Ŀǰ���Թ˲�Ͼ���ŵ������� | .*�Ѿ���æ�ˣ�
		
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
			Execute("unwield all;tuo all")
			Execute("wield juwei jian;wear feixue yi;wear yanyu mao;wear xunzhang;wear xiaocui xue;wear xianyue hushou")
			wait.time(1)
			call(f_done)
		end)
	end,
	
	fight_wear = function(f_done)
		wait.make(function()
			Execute("tuo all;give xiaocui xue to byj;give juwei jian to byj;give difeng mao to byj;give shenyu yi to byj;give guiwang hushou to byj")
			Execute("wear all;wield " .. var.weapon)
			busy_test(function() call(f_done) end)
		end)
		--Execute(var.login_wear)
	end,

	auto_list = {"wei","shan","baobiao", "guanfu","guo","task","event","study","reconnect"},

	weapon_list = {"juwei jian", "zongheng jian", "mozhu jian", "zhaixing jian", "ciyun jian", "shenyuan jian"}
}


profile.init()

return profile
