require "var"

var.dazuo_desc = "你坐下来运气用功，一股内息开始在体内流动。"
--var.dazuo_end_desc = "你运功完毕，深深吸了口气，站了起来。"
var.dazuo_end_desc = "(你将头上白雾吸尽，睁开双眼，缓缓站起。)|(你运功完毕，深深吸了口气，站了起来。)"
var.dazuo_halt_desc = "你把正在运行的真气强行压回丹田，站了起来。"
var.dazuo_full_desc = "你的内力修为似乎已经达到了瓶颈，无法再靠打坐来提升了。"
var.me_id = "nohead"
var.me_name = "没头脑"
var.me_menpai = "灵鹫"
var.me_family = "灵鹫"
var.task_id = "nohead's task"
var.ttask_id = "nohead's ttask"
var.heal_dummy_id = "hqly"
var.bag_dummy_id = "hsly"


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
		[14]= {name="天山月影",			desc="你使出月影舞步的绝技", 			cd=false}
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
		[1] = { i = 12, action = "perform move.yueguangruying" },
		[2] = { i = 9, action = "wield " .. var.weapon .. ";enable parry tianyu-qijian;perform parry.san" }
	},
	--杀官府的技能
	attack_list1 = {
		[1] = {	i = 1, action = "enable sword quanzhen-jian;wield jian;perform sword.sanqing"},
		[2] = { i = 7, action = "unwield all;perform finger.sandie;wield " .. var.weapon}
	},
	--杀task的技能
	attack_list2 = {
		[1] = { i = 13,action = "unwield all;enable strike liuyang-zhang;perform strike.rongxue " .. var.task_id .. ";wield " .. var.weapon},
		[2] = { i = 9, action = "wield " .. var.weapon .. ";enable parry tianyu-qijian;perform parry.san " .. var.task_id },
		[3] = { i = 8, action = "wield ".. var.weapon .. ";enable parry tianyu-qijian;perform parry.kuangwu " .. var.task_id },
		[4] = { i = 14,action= "wield " .. var.weapon .. ";perform move.yueying " .. var.task_id}
	},
	
	attack_list3 = {
		[1] = {	i = 4, action = "unwield all;hubo"},
		[2] = { i = 7, action = "unwield all;perform finger.sandie"}
	},
	
	study_list = {
		{ loc = "fly wm;e;n;e;e;n;n", cmd = "yanjiu parry 1000;yun regenerate"}
	},
	
	research_list = {
		{ skill = "bahuang-gong"}
	},
	
	powerup = function()
		Execute("enable force wuzheng-xinfa;yun bingxin;yun powerup;enable force bahuang-gong;yun bahuang")
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
			--Execute("tuo all;unwield all")
			--Execute("wear dizhu yi;wield diyu jian;wear chixia xue;wear jiangmo hushou;wear tianwei mao;wear xunzhang")
			Execute("wear all")
			wait.time(1)
			call(f_done)
		end)
	end,
	
	fight_wear = function(f_done)
		wait.make(function()
			Execute("tuo all;give juanyun hushou to nohead;give duanyu qin to nohead;give xiaowei mao to nohead;give huanfeng yi to nohead;give helan xue to nohead")
			Execute("wear all;wield " .. var.weapon)
			busy_test(function() call(f_done) end)
		end)
		--Execute(var.login_wear)
	end,
}


profile.init()

return profile
