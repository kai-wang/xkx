require "var"
module ("config", package.seeall)

var.dazuo_desc = "你坐下来运气用功，一股内息开始在体内流动。"
var.dazuo_end_desc = "(你将头上白雾吸尽，睁开双眼，缓缓站起。)|(你运功完毕，深深吸了口气，站了起来。)|(你吸气入丹田，真气运转渐缓，慢慢收功，双手抬起，站了起来。)"
var.dazuo_halt_desc = "(你把正在运行的真气强行压回丹田，站了起来。)|(你面色一沉，迅速收气，站了起来。)"
var.dazuo_full_desc = "你的内力修为似乎已经达到了瓶颈，无法再靠打坐来提升了。"
var.me_id = "byj"
var.me_pwd = "Flying1"
var.me_name = "白玉京"
var.me_menpai = "明教"
var.me_family = "明教"
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
	[1] = {name="一剑化三清", 		desc="你大喝一声，剑招突变", 			cd=false},
	[2] = {name="附骨缠身", 		desc="你大喝一声，缠身而上", 			cd=false},
	[3] = {name="璀璨七星", 		desc="你倒踩七星步法", 					cd=false},
	[4] = {name="双手互博之术", 		desc="你平心静气", 						cd=false},
	[5] = {name="定阳针", 			desc="你脚下左弓右箭", 					cd=false},
	[6] = {name="一指乾坤", 		desc="你使出一阳指绝技", 				cd=false},
	[7] = {name="阳关三叠", 		desc="你凝气于指，一式", 				cd=false},
	[8] = {name="天羽狂舞",			desc="你使出天羽奇剑中的绝招",			cd=false},
	--[8] = {name="金蛇万道",		desc="你大喝一声，猛攻数招", 			cd=false},
	--[9] = {name="连环夺命诀",		desc="你使出苗家剑法之「连环夺命诀」", 	cd=false},
	[9] = {name="天女散花",			desc="你凝神息气，手腕疾抖", 			cd=false},
	[10]= {name="凌波微步",			desc="你提起真气，依照先天伏羲六十四卦",cd=false},
	[11]= {name="长相思",			desc="你使出痴心情长剑之绝舞",				cd=false},
	[12]= {name="月光如影",			desc="你照着月光的映射",				cd=false},
	[13]= {name="六阳融雪",			desc="你使出天山六阳掌之绝技『六阳融雪』",			cd=false},
	[14]= {name="醉剑",			desc="你连人带剑扑了上来",		cd=false},
	[15]= {name="如影如幻",			desc="你长空而起，化作一只青蝠",		cd=false},
	[16]= {name="金蛇万道",			desc="你大喝一声，猛攻数招", 			cd=false},
	[17]= {name="吸焰", 			desc="你使出圣火令法「吸焰」令", 		cd=false},
	[18]= {name="牧野鹰扬",			desc="你使出搜骨鹰爪功绝技", 			cd=false},
	[19]= {name="天山月影",			desc="你使出月影舞步的绝技「天山月影」",				cd=false},
	[20]= {name="天外清音",			desc="你一声清啸，剑发琴音，深吸一口气",				cd=false},
	[21]= {name="精失诀",			desc="你凝神定气，使出七伤拳总诀中的「精失诀」", cd=false},
	[22]= {name="七拳七伤",			desc="你仰天怒吼，激起全身力量使出七伤拳终极绝技", cd=false},
	[23]= {name="意恍惚诀",			desc="你凝神定气，使出七伤拳总诀中的「意恍惚诀」", cd=false},
	[24]= {name="修罗焰",			desc="突然你双掌搓了几搓，只听得嗤嗤声响", 			cd=false},
	[25]= {name="血祭狂刀", 		desc="你手中的刀，血光一闪！你只觉眼前一红", cd=false},
	[26]= {name="三焦齐逆诀",		desc="你凝神定气，企图使出七伤拳总诀中的「三焦齐逆诀」", cd=false},
	[27]= {name="伤肺诀",			desc="你凝神定气，使出七伤拳总诀中的「伤肺诀」", 	cd=false},
	[28]= {name="损心诀",			desc="你凝神定气，使出七伤拳总诀中的「损心诀」",	cd=false},
	[29]= {name="藏离诀",			desc="你凝神定气，使出七伤拳总诀中的「藏离诀」",	cd=false},
	[30]= {name="摧肝肠诀",			desc="你凝神定气，使出七伤拳总诀中的「摧肝肠诀」",	cd=false},
	[31]= {name="雷霆一击",			desc="你默运混天气功，施展出「雷霆一击」", 			cd=false},
	[32]= {name="亢龙三悔",			desc="你深吸一口气，将浑天真气提于胸前，大喝一声说道",cd=false},
	[33]= {name="沧海一笑",			desc="你强提真气，身法突变得迷离，有如纵横之式",	cd=false},
	[34]= {name="幻影",			desc="你前后游走，身形闪动，手中钢刀越使越快，幻起无数刀光化出数个身形", cd=false},
	[35]= {name="刀刀相连", 	desc="在一片刀光中，一刀劈了过来", cd=false},
	[36]= {name="无色无相", 	desc="你使出小无相绝技「无色无相」，招式变幻莫测", cd=false},
	[37]= {name="天马行空", 	desc="你使出身空行，身形回转，如天马跃空而行", cd=false},
	[38]= {name="灵犀一指", 	desc="你双手一前一后，缓缓伸出", cd=false}
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
		local re = rex.new("(桃花|星宿|峨嵋|梅庄|慕容|峨眉|灵鹫|铁掌|华山|白驼|雪山|密宗|独孤)")
		local r1,r2,r3 = re:match(menpai)
		if(r3 ~= nil) then
			print("换金系内功了.......")
			var.choose_force = "xiaowuxiang"
			Execute("perform dodge.mengyulingbo")
			return
		end

		re = rex.new("(明教|大理|神龙|江湖|云龙)")
		r1,r2,r3 = re:match(menpai)
		if(r3 ~= nil) then
			print("换水系内功了.......")
			var.choose_force = "beiming-shengong"
			Execute("perform dodge.mengyulingbo")
			return
		end

		re = rex.new("(少林|全真)")
		r1,r2,r3 = re:match(menpai)
		if(r3 ~= nil) then
			print("换木系内功了.......")
			var.choose_force = "wuzheng-xinfa"
			Execute("perform dodge.mengyulingbo")
			return
		end
	end

	print("默认换成水系内功了.......")
	var.choose_force = "beiming-shengong"
	Execute("enable force beiming-shengong;yun beiming;perform dodge.mengyulingbo")
end


function anti_touxi()

end

function init()
	local flag = bit.bor(trigger_flag.KeepEvaluating, trigger_flag.RegularExpression, trigger_flag.Replace)--, trigger_flag.Temporary)

	AddTrigger("fight_busy_success",
		"^(> )*(结果.*被你攻了个措手不及)|(结果一指点中)|(结果.*被你点中要穴)|(.*正在奇怪间，已被你的真气制住，神情恍恍忽忽的)|(.*被此胡家刀法之「无形幻影」所迷惑，手足无措，不知哪个你是真)|(.*气拔千钧的一击，竟不知如何招架！)|(.*只觉一股热流穿心而过)|(结果.*被你围着转得头晕)|(结果.*被你绕得不知所措)|(结果.*被你围着转得头晕眼花).*$",
		"", flag, -1, 0, "", "fight.on_busy_success") -----.*目前正自顾不暇，放胆攻击吧 | .*已经很忙了！

	SetTriggerOption("fight_busy_success", "group", "fight")

	local desc = "("
	for i = 1, #pfm do
		desc = desc .. pfm[i] .desc
		if(i == #pfm) then desc = desc .. ")" else desc = desc .. "|" end
	end

	AddTrigger("fight_perform_cd",
		"^(> )*" .. desc .. ".*$", --(你脚下左弓右箭|你使出一阳指绝技|你大喝一声，剑招突变|你大喝一声，缠身而上|你倒踩七星步法|你平心静气，灵台空明|你凝气于指，一式|你大喝一声，猛攻数招).*$",
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
