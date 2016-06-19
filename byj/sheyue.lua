require "var"

var.dazuo_desc = "你坐下来运气用功，一股内息开始在体内流动。"
var.dazuo_end_desc = "(你将头上白雾吸尽，睁开双眼，缓缓站起。)|(你运功完毕，深深吸了口气，站了起来。)"
var.dazuo_halt_desc = "你把正在运行的真气强行压回丹田，站了起来。"
var.dazuo_full_desc = "你的内力修为似乎已经达到了瓶颈，无法再靠打坐来提升了。"
var.me_id = "sheyue"
var.me_name = "射月"
var.me_menpai = "铁掌"
var.me_family = "铁掌"
var.me_dazuo = "dazuo 5000;dazuo max"
var.gf_money = "no"
var.task_id = "sheyue's task"
var.ttask_id = "sheyue's ttask"
var.dig_dummy = "lbt"
var.weapon = "qianren dao;wield fengquan dao"
var.weapon2 = "staff"
var.weapon3= "baihe lun;wield jinling lun"
var.study_seq = 1
var.guo_kill_place = "fly tzf"


profile = {
	pfm = {
		[1]= {name="铁掌降龙",			desc="你运起「归元吐纳法」，同时使出「铁掌降龙」", cd=false},
		[2]= {name="修罗焰",			desc="突然你双掌搓了几搓，只听得嗤嗤声响", cd=false},
		[3]= {name="幻影",				desc="你前后游走，身形闪动，手中钢刀越使越快，幻起无数刀光化出数个身形", cd=false},
		[4]= {name="飞杖降魔",			desc="你大喝一声将手中急转着的", cd=false},
		[5]= {name="天马行空",			desc="你使出身空行，身形回转，如天马跃空而行", cd=false},
		[6]= {name="反转流星",			desc="你使出铁雪锤法中的「反转流星」", cd=false},
		[7]= {name="刀刀相连", 			desc="你一咬牙，手上动作加快，同时使出", cd=false},
		[8] = {name="双手互博之术", 	desc="你平心静气", 						cd=false},
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
		[3] = { i = 5, action = "perform move.tianmaxingkong " .. var_task_id},
		[2] = { i = 3, action = "unwield all;wield " .. var.weapon .. ";perform blade.huanying " .. var.task_id},
		[1] = { i = 4, action = "unwield all;wield " .. var.weapon2 .. ";perform staff.feizhang " .. var_task_id}
	},
	
	task_attack_list = {
		[4] = { i = 7, action = "unwield all;wield " .. ver.weapon ";perform blade.lian " .. var.task_id },
		[2] = { i = 2, action = "unwield all;enable strike huoyan-dao;bein none;bei huoyan-dao;perform strike.xiuluo " .. var.task_id},
		[3] = {	i = 6, action = "unwield all;wield " .. var.weapon3 .. ";perform staff.fanzhuan " ..var.task_id },
		[1] = { i = 1, action = "unwield all;enable strike tiezhang-zhangfa;bei none;bei tiezhang-zhangfa;enable stike huoyan-dao;perform parry.tiezhangxianglong ".. var.task_id}
	},

	ttask_busy_list = {
		[4] = { i = 18, action = "unwield all;perform claw.muyeyingyang " .. var.ttask_id },
		[2] = { i = 23, action = "unwield all;perform cuff.yihuanghu " .. var.ttask_id .. ";wield " .. var.weapon},
		[3] = {	i = 15, action = "perform move.ruyingruhuan " ..var.ttask_id },
		[1] = { i = 17, action = "enable sword shenghuo-ling;wield " .. var.weapon .. ";perform sword.xiyanling " .. var.ttask_id}
	},
	
	ttask_attack_list = {
		[3] = {	i = 22, action = "unwield all;perform cuff.qishang " .. var.ttask_id .. ";wield " .. var.weapon},
		[2] = { i = 32, action = "unwield all;perform strike.sanhui " .. var.ttask_id  .. ";wield " .. var.weapon},
		[6] = {	i = 21, action = "unwield all;perform cuff.jingshi " .. var.ttask_id .. ";wield " .. var.weapon},
		[1] = {	i = 26, action = "unwield all;perform cuff.sanjiao " .. var.ttask_id .. ";wield " .. var.weapon},
		[4] = {	i = 31, action = "unwield all;perform strike.leiting " .. var.ttask_id},
		[5] = {	i = 16, action = "enable sword jinshe-jian;wield " .. var.weapon .. ";perform sword.wandao " .. var.ttask_id}
	},
	attack_list3 = {
		[1] = {	i = 21, action = "unwield all;perform cuff.jingshi;wield " .. var.weapon},
		[2] = {	i = 26, action = "unwield all;perform cuff.sanjiao;wield " .. var.weapon},
		[4] = {	i = 30, action = "unwield all;perform cuff.cuiganchang;wield " .. var.weapon},
		[3] = {	i = 22, action = "unwield all;perform cuff.qishang;wield " .. var.weapon}
	},
	
	attack_list1 = {
		[2] = {	i = 16, action = "enable sword jinshe-jian;wield " .. var.weapon .. ";perform sword.wandao"},
		----[2] = {	i = 24, action = "enable sword miaojia-jianfa;wield " .. var.weapon .. ";perform sword.duoming"},
		----[2] = { i = 2, action = "enable parry jinshe-zhang;perform parry.fugu"},
		[3] = {	i = 14, action = "enable sword shenghuo-ling;wield " .. var.weapon .. ";perform sword.shenghuo"},
		[1] = {	i = 22, action = "unwield all;perform cuff.qishang"},
		[4] = {	i = 4, action = "unwield all;hubo"}
	},
	
	attack_list2 = {
		[4] = {	i = 22, action = "nuoyi " .. var.me_id .. ";unwield all;perform cuff.qishang;wield " .. var.weapon},
		[2] = {	i = 16, action = "enable sword jinshe-jian;wield " .. var.weapon .. ";perform sword.wandao"},
		[1] = { i = 32, action = "unwield all;perform strike.sanhui"},
		[3] = {	i = 31, action = "unwield all;perform strike.leiting"},
		[5] = {	i = 14, action = "enable sword shenghuo-ling;wield " .. var.weapon .. ";perform sword.shenghuo"},
		[6] = {	i = 4, action = "unwield all;hubo"}
	},
	
	attack_list4 = {
		[1] = {	i = 8, action = "unwield all;hubo"}
	},
	
	study_list = {
		--{ loc = "fly wm;e;n;e;e;n;n;", cmd = "yanjiu strike 1000;et", post_action="fly wm;e;s;s;s;w;w;u;gamble big skill strike 2000"}
		{ loc = "fly wm;e;n;e;e;n;n;", cmd = "yanjiu huntian-qigong 1000;et"}
		--{ loc = "fly mj", cmd = "xue wei strike 100;et",pre_action="bai wei yixiao", post_action="bai xie xun"}
	},
	
	research_list = {
		{ skill = "xiantian-qigong"}

	},
	
	powerup = function()
		Execute("enable force jiuyang-shengong;yun powerup;yun shield;enable force huntian-qigong;yun powerup;enable force jiuyang-shengong")
	end,

	buff = function()
		Execute("enable force huntian-qigong;yun shengang;unwield all;perform strike.xianglong;enable force jiuyang-shengong;nuoyi " .. var.me_id)
	end,

	anti_touxi = function()
		Execute("unwield all;perform cuff.sanjiao " .. var.task_id)
	end,
	
	init = function()
		local flag = bit.bor(trigger_flag.KeepEvaluating, trigger_flag.RegularExpression, trigger_flag.Replace)--, trigger_flag.Temporary)
		AddTrigger("fight_busy_success",
			"^(> )*(.*气拔千钧的一击，竟不知如何招架！)|(结果.*被你攻了个措手不及)|(结果一指点中)|(.*只觉一股热流穿心而过)|(结果.*被你围着转得头晕)|(结果.*被你绕得不知所措)|(结果.*被你攻了个措手不及)|(结果.*被你点中要穴)|(.*正在奇怪间，已被你的真气制住，神情恍恍忽忽的)|(.*已经很忙了！).*$",
			"", flag, -1, 0, "", "fight.on_busy_success") -----.*目前正自顾不暇，放胆攻击吧 | .*已经很忙了！
		
		SetTriggerOption("fight_busy_success", "group", "fight")
		
		local desc = "("
		for i = 1, #profile.pfm do 
			desc = desc .. profile.pfm[i] .desc
			if(i == #profile.pfm) then desc = desc .. ")" else desc = desc .. "|" end
		end
	
		AddTrigger("fight_perform_cd", 
			"^(> )*" .. desc .. ".*$", --(你脚下左弓右箭|你使出一阳指绝技|你大喝一声，剑招突变|你大喝一声，缠身而上|你倒踩七星步法|你平心静气，灵台空明|你凝气于指，一式|你大喝一声，猛攻数招).*$",
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
