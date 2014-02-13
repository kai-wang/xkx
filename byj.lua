require "var"

var.dazuo_desc = "你坐下来运气用功，一股内息开始在体内流动。"
var.dazuo_end_desc = "你运功完毕，深深吸了口气，站了起来。"
var.dazuo_halt_desc = "你把正在运行的真气强行压回丹田，站了起来。"
var.dazuo_full_desc = "你的内力修为似乎已经达到了瓶颈，无法再靠打坐来提升了。"
var.me_id = "byj"
var.me_name = "白玉京"
var.me_menpai = "全真"
var.task_id = "byj's task"
var.ttask_id = "byj's ttask"


profile = {
	pfm = {
		[1] = {name="一剑化三清", 		desc="你大喝一声，剑招突变", 	cd=false},
		[2] = {name="附骨缠身", 		desc="你大喝一声，缠身而上", 	cd=false},
		[3] = {name="璀璨七星", 		desc="你倒踩七星步法", 			cd=false},
		[4] = {name="双手互博之术", 	desc="你平心静气", 				cd=false},
		[5] = {name="定阳针", 			desc="你脚下左弓右箭", 			cd=false},
		[6] = {name="一指乾坤", 		desc="你使出一阳指绝技", 		cd=false},
		[7] = {name="阳关三叠", 		desc="你凝气于指，一式", 		cd=false},
		[8] = {name="金蛇万道",			desc="你大喝一声，猛攻数招", 	cd=false}
	},
	
	set_cd_status = function(l, flag)
		for i, v in ipairs(profile.pfm) do
			if(v.desc == l or v.name == l) then v.cd = flag return end
		end
	end,
	
	reset_cd_status = function()
		for i, v in ipairs(profile.pfm) do
			v.cd = false
		end
	end,
	
	busy_list = {
		[1] = {	i = 6, action = "wield " .. var.weapon .. ";enable parry sun-finger;perform parry.qiankun" 	},
		[2] = {	i = 5, action = "wield " .. var.weapon .. ";enable sword quanzhen-jian;perform sword.ding" 	}
	},
	
	attack_list1 = {
		[1] = {	i = 1, action = "enable sword quanzhen-jian;wield ".. var.weapon .. ";perform sword.sanqing"},
		[2] = {	i = 3, action = "enable sword quanzhen-jian;enable dodge qixing-bufa;wield ".. var.weapon .. ";perform dodge.qixing"},
		[3] = {	i = 8, action = "enable sword jinshe-jian;unwield all;wield " .. var.weapon .. ";perform sword.wandao"},
		[4] = {	i = 4, action = "unwield all;hubo"}
	},
	
	attack_list2 = {
		[1] = { i = 3, action = "enable sword quanzhen-jian;enable dodge qixing-bufa;unwield all;perform strike.sanhua;wield ".. var.weapon .. ";perform sword.jianyi;perform dodge.qixing" },
		[3] = {	i = 1, action = "enable sword quanzhen-jian;unwield all;perform strike.sanhua;wield ".. var.weapon .. ";perform sword.jianyi;perform sword.sanqing"},
		[2] = {	i = 8, action = "enable sword jinshe-jian;unwield all;wield " .. var.weapon .. ";perform sword.wandao"},
		[4] = {	i = 4, action = "unwield all;hubo"},
		[5] = { i = 7, action = "unwield all;perform finger.sandie"}
	},
	
	study_list = {
		[1] = { loc = "wcy", cmd = "xue wang xiantian-qigong 40;yun regenerate" },
		[2] = { loc = "fly wm;e;s;s;e;n;", cmd = "xue zhu literate 40;yun regenerate" },
		[3] = { loc = "wcy", cmd = "xue wang strike 40;yun regenerate" }
	},
	
	powerup = function()
		Execute("yun powerup")
	end,
	
	init = function()
		local flag = bit.bor(trigger_flag.KeepEvaluating, trigger_flag.RegularExpression, trigger_flag.Replace, trigger_flag.Temporary)
		AddTrigger("fight_busy_success",
			"^(> )*(.*气拔千钧的一击，竟不知如何招架！|结果.*被你攻了个措手不及!).*$",
			"", flag, -1, 0, "", "fight.on_busy_success")
		
		SetTriggerOption("fight_busy_success", "group", "fight")
		
		AddTrigger("fight_perform_cd", 
			"^(> )*(你脚下左弓右箭|你使出一阳指绝技|你大喝一声，剑招突变|你大喝一声，缠身而上|你倒踩七星步法|你平心静气，灵台空明|你凝气于指，一式).*$",
			"", flag, -1, 0, "", "fight.on_perform")
			
		SetTriggerOption("fight_perform_cd", "group", "fight")
	end
}


profile.init()

return profile
