require "var"

var.dazuo_desc = "你随意一站，双手缓缓抬起，深吸一口气，真气开始在体内运转。"
--var.dazuo_end_desc = "你运功完毕，深深吸了口气，站了起来。"
var.dazuo_end_desc = "你将真气在体内沿脉络运行了一圈，缓缓纳入丹田，放下手，长吐了一口气。"
var.dazuo_halt_desc = "你眉头一皱，急速运气，把手放了下来。"
var.dazuo_full_desc = "你的内力修为似乎已经达到了瓶颈，无法再靠打坐来提升了。"
var.me_id = "pigfoots"
var.me_name = "猪蹄"
var.me_menpai = "慕容"
var.me_family = "慕容"
var.me_dazuo = "dazuo 1000"
var.task_id = "pigfoots's task"
var.ttask_id = "pigfoots's ttask"
var.dig_dummy = "lbt"


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
		[15]= {name="快剑", 			desc="你使出慕容剑法中的绝招［快剑］", 	cd=false},
		[16]= {name="七剑连环指",		desc="你使出慕容剑法之精髓「七剑连环指」", 			cd=false},
		[17]= {name="天女散花",			desc="你使出「天女散花」",				cd=false},
		[18]= {name="刺字诀",			desc="你突然一掌拍在自己的丹田上激荡",  cd=false}
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
			"^(> )*(.*气拔千钧的一击，竟不知如何招架！|结果.*被你攻了个措手不及!|结果一指点中|.*目前正自顾不暇，放胆攻击吧！|.*只觉一股热流穿心而过|结果.*被你围着转得头晕|结果.*被你绕得不知所措).*$",
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
