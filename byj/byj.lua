require "var"

var.dazuo_desc = "你坐下来运气用功，一股内息开始在体内流动。"
var.dazuo_end_desc = "(你将头上白雾吸尽，睁开双眼，缓缓站起。)|(你运功完毕，深深吸了口气，站了起来。)"
var.dazuo_halt_desc = "你把正在运行的真气强行压回丹田，站了起来。"
var.dazuo_full_desc = "你的内力修为似乎已经达到了瓶颈，无法再靠打坐来提升了。"
var.me_id = "byj"
var.me_name = "白玉京"
var.me_menpai = "明教"
var.me_family = "明教"
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
		[1] = {name="一剑化三清", 		desc="你大喝一声，剑招突变", 			cd=false},
		[2] = {name="附骨缠身", 		desc="你大喝一声，缠身而上", 			cd=false},
		[3] = {name="璀璨七星", 		desc="你倒踩七星步法", 					cd=false},
		[4] = {name="双手互博之术", 	desc="你平心静气", 						cd=false},
		[5] = {name="定阳针", 			desc="你脚下左弓右箭", 					cd=false},
		[6] = {name="一指乾坤", 		desc="你使出一阳指绝技", 				cd=false},
		[7] = {name="阳关三叠", 		desc="你凝气于指，一式", 				cd=false},
		[8] = {name="天羽狂舞",			desc="你使出天羽奇剑中的绝招",			cd=false},
		--[8] = {name="金蛇万道",		desc="你大喝一声，猛攻数招", 			cd=false},
		--[9] = {name="连环夺命诀",		desc="你使出苗家剑法之「连环夺命诀」", 	cd=false},
		[9] = {name="天女散花",			desc="你凝神息气，手腕疾抖", 			cd=false},
		[10]= {name="凌波微步",			desc="你提起真气，依照先天伏羲六十四卦",cd=false},
		[11]= {name="长相思",			desc="你凌波飞渡似的舞步",				cd=false},
		[12]= {name="月光如影",			desc="你照着月光的映射",				cd=false},
		[13]= {name="六阳融雪",			desc="你使出天山六阳掌之绝技『六阳融雪』",			cd=false},
		[14]= {name="熊熊圣火",			desc="你盘膝而坐，双手十指张开",		cd=false},
		[15]= {name="如影如幻",			desc="你长空而起，化作一只青蝠",		cd=false},
		[16]= {name="金蛇万道",			desc="你大喝一声，猛攻数招", 			cd=false},
		[17]= {name="吸焰", 			desc="你使出圣火令法「吸焰」令", 		cd=false},
		[18]= {name="牧野鹰扬",			desc="你使出搜骨鹰爪功绝技", 			cd=false},
		[19]= {name="阴风刀",			desc="你悄悄使出阴风刀",				cd=false},
		[20]= {name="透骨针",			desc="你悄悄运起透骨针",				cd=false},
		[21]= {name="精失诀",			desc="你凝神定气，使出七伤拳总诀中的「精失诀」", cd=false},
		[22]= {name="七拳七伤",			desc="你仰天怒吼，激起全身力量使出七伤拳终极绝技", cd=false},
		[23]= {name="意恍惚诀",			desc="你凝神定气，使出七伤拳总诀中的「意恍惚诀」", cd=false}
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
			"^(> )*(.*气拔千钧的一击，竟不知如何招架！|结果.*被你攻了个措手不及|结果一指点中|.*目前正自顾不暇，放胆攻击吧！|.*只觉一股热流穿心而过|结果.*被你围着转得头晕|结果.*被你绕得不知所措|结果.*被你攻了个措手不及|结果.*被你点中要穴|.*正在奇怪间，已被你的真气制住，神情恍恍忽忽的).*$",
			"", flag, -1, 0, "", "fight.on_busy_success")
		
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
