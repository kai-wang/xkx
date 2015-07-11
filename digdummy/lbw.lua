require "var"

var.dazuo_desc = "你坐下来运气用功，一股内息开始在体内流动。"
var.dazuo_end_desc = "(你将头上白雾吸尽，睁开双眼，缓缓站起。)|(你运功完毕，深深吸了口气，站了起来。)"
var.dazuo_halt_desc = "你把正在运行的真气强行压回丹田，站了起来。"
var.dazuo_full_desc = "你的内力修为似乎已经达到了瓶颈，无法再靠打坐来提升了。"
var.me_id = "lby"
var.me_name = "礼拜五"
var.me_menpai = "全真"
var.me_family = "全真"
var.me_dazuo = "dazuo 1000"
var.me_qukuan = "qukuan 99 silver"
var.gf_money = "yes"
var.task_id = "lbw's task"
var.ttask_id = "lbw's ttask"
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
		[9] = {name="天女散花",			desc="你凝神息气，手腕疾抖", 			cd=false},
		[10]= {name="凌波微步",			desc="你提起真气，依照先天伏羲六十四卦",cd=false},
		[11]= {name="长相思",			desc="你凌波飞渡似的舞步",				cd=false},
		[12]= {name="月光如影",			desc="你照着月光的映射",				cd=false},
		[13]= {name="六阳融雪",			desc="你使出天山六阳掌之绝技『六阳融雪』",			cd=false}
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
		[1] = {	i = 6, action = "wield " .. var.weapon .. ";enable sword sun-finger;perform sword.qiankun" 	},
		--[2] = { i = 12, action = "perform move.yueguangruying" },
		--[3] = { i = 9, action = "wield " .. var.weapon .. ";enable parry tianyu-qijian;perform parry.san" }
		--[2] = { i = 7, action = "unwield all;perform finger.sandie;wield " .. var.weapon},
		--[2] = {	i = 5, action = "wield " .. var.weapon .. ";enable sword quanzhen-jian;perform sword.ding" 	}
	},
	
	attack_list1 = {
		--[1] = {	i = 3, action = "enable sword quanzhen-jian;enable dodge qixing-bufa;wield jian;perform dodge.qixing"},
		---[1] = { i = 11,action = "enable sword chixin-qingchang-jian;perform sword.xiangsi"},
		---[2] = { i = 8, action = "enable sword sun-finger;enable parry tianyu-qijian;perform parry.kuangwu"},
		--[2] = {	i = 8, action = "enable sword jinshe-jian;unwield all;wield jian;perform sword.wandao"},
		[1] = {	i = 1, action = "enable sword quanzhen-jian;wield jian;perform sword.sanqing"},
		[2] = { i = 7, action = "unwield all;perform finger.sandie;wield " .. var.weapon}
	},
	
	attack_list2 = {
		--[1] = { i = 3, action = "enable sword quanzhen-jian;enable dodge qixing-bufa;unwield all;perform strike.sanhua;wield ".. var.weapon .. ";perform sword.jianyi;perform dodge.qixing" },
		[2] = { i = 9, action = "wield " .. var.weapon .. ";enable parry tianyu-qijian;perform parry.san" },
		[1] = { i = 13,action = "unwield all;enable strike haotian-zhang;perform strike.sanhua;enable strike liuyang-zhang;perform strike.rongxue;wield " .. var.weapon},
		---[2] = { i = 8, action = "enable sword quanzhen-jian;unwield all;perform strike.sanhua;wield ".. var.weapon .. ";perform sword.jianyi;enable parry tianyu-qijian;perform parry.kuangwu"},
		[3] = {	i = 1, action = "wield " .. var.weapon .. ";enable sword quanzhen-jian;unwield all;perform strike.sanhua;wield ".. var.weapon .. ";perform sword.jianyi;perform sword.sanqing"},
		[4] = { i = 8, action = "enable sword quanzhen-jian;unwield all;perform strike.sanhua;wield ".. var.weapon .. ";perform sword.jianyi;enable parry tianyu-qijian;perform parry.kuangwu"},
		--[2] = {	i = 8, action = "enable sword jinshe-jian;unwield all;wield " .. var.weapon .. ";perform sword.wandao"},
		--[4] = { i = 9, action = "wield " .. var.weapon .. "enable parry tianyu-qijian;perform parry.san" },
		[5] = {	i = 4, action = "unwield all;hubo"},
		[6] = { i = 7, action = "unwield all;perform finger.sandie;wield " .. var.weapon}
	},
	
	attack_list3 = {
		[1] = {	i = 4, action = "unwield all;hubo"},
		[2] = { i = 7, action = "unwield all;perform finger.sandie"}
	},
	
	study_list = {
		{ loc = "fly wm;e;n;e;e;n;n", cmd = "yanjiu parry 1000;yun regenerate"}
	--[[
		[1] = { loc = "wcy", cmd = "xue wang xiantian-qigong 40;yun regenerate" },
		[2] = { loc = "fly wm;e;s;s;e;n;", cmd = "xue zhu literate 40;yun regenerate" },
		[3] = { loc = "wcy", cmd = "xue wang strike 40;yun regenerate" },
		[4] = { loc = "wcy", cmd = "xue wang parry 40;yun regenerate" }
	]]--
	},
	
	research_list = {
		{ skill = "xiantian-qigong"}
		--{ skill = "force" },
		--{ skill = "dodge" }
	},
	
	powerup = function()
		Execute("enable sword sun-finger;enable force bahuang-gong;")
		Execute("yun bahuang;enable force xiantian-qigong;yun powerup")
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
