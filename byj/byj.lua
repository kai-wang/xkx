require "var"
module ("config", package.seeall)

var.dazuo_desc = "你坐下来运气用功，一股内息开始在体内流动。"
var.dazuo_end_desc = "(你将头上白雾吸尽，睁开双眼，缓缓站起。)|(你运功完毕，深深吸了口气，站了起来。)|(你吸气入丹田，真气运转渐缓，慢慢收功，双手抬起，站了起来。)"
var.dazuo_halt_desc = "(你把正在运行的真气强行压回丹田，站了起来。)|(你面色一沉，迅速收气，站了起来。)"
var.dazuo_full_desc = "你的内力修为似乎已经达到了瓶颈，无法再靠打坐来提升了。"
var.me_id = "byj"
var.me_name = "白玉京"
var.me_menpai = "明教"
var.me_family = "明教"
var.me_dazuo = "dazuo 15000;dazuo max"
var.gf_money = "no"
var.task_id = "byj's task"
var.ttask_id = "byj's ttask"
var.dig_dummy = "lbt"
var.weapon = "jian"
var.weapon2 = "dao"
var.study_seq = 1
var.fast_mode = 1
var.xiao_full = 0
var.guo_kill_place = "fly mj"

auto_list = {"wei","shan","baobiao", "guanfu","guo","event","study","reconnect", "sstask", "xiao", "double"}

weapon_list = {"juwei jian", "kunlun dao", "guangcheng jian", "zhaixing jian", "qiankun dao", "shenyuan jian"}

pfm = {
	[1] = {name="一剑化三清", 		desc="你大喝一声，剑招突变", 			cd=false},
	--[2] = {name="附骨缠身", 		desc="你大喝一声，缠身而上", 			cd=false},
	[3] = {name="璀璨七星", 		desc="你倒踩七星步法", 					cd=false},
	[4] = {name="双手互博之术", 	desc="你平心静气", 						cd=false},
	--[5] = {name="定阳针", 			desc="你脚下左弓右箭", 					cd=false},
	[6] = {name="一指乾坤", 		desc="你使出一阳指绝技", 				cd=false},
	[7] = {name="阳关三叠", 		desc="你凝气于指，一式", 				cd=false},
	[8] = {name="天羽狂舞",			desc="你使出天羽奇剑中的绝招",			cd=false},
	--[8] = {name="金蛇万道",		desc="你大喝一声，猛攻数招", 			cd=false},
	--[9] = {name="连环夺命诀",		desc="你使出苗家剑法之「连环夺命诀」", 	cd=false},
	[9] = {name="天女散花",			desc="你凝神息气，手腕疾抖", 			cd=false},
	[10]= {name="凌波微步",			desc="你提起真气，依照先天伏羲六十四卦",cd=false},
	[11]= {name="长相思",			desc="你使出痴心情长剑之绝舞",				cd=false},
	[12]= {name="月光如影",			desc="你照着月光的映射",				cd=false},
	--[13]= {name="六阳融雪",			desc="你使出天山六阳掌之绝技『六阳融雪』",			cd=false},
	--[14]= {name="熊熊圣火",			desc="你盘膝而坐，双手十指张开",		cd=false},
	--[15]= {name="如影如幻",			desc="你长空而起，化作一只青蝠",		cd=false},
	--[16]= {name="金蛇万道",			desc="你大喝一声，猛攻数招", 			cd=false},
	--[17]= {name="吸焰", 			desc="你使出圣火令法「吸焰」令", 		cd=false},
	--[18]= {name="牧野鹰扬",			desc="你使出搜骨鹰爪功绝技", 			cd=false},
	[19]= {name="天山月影",			desc="你使出月影舞步的绝技「天山月影」",				cd=false},
	--[20]= {name="透骨针",			desc="你悄悄运起透骨针",				cd=false},
	--[21]= {name="精失诀",			desc="你凝神定气，使出七伤拳总诀中的「精失诀」", cd=false},
	[22]= {name="七拳七伤",			desc="你仰天怒吼，激起全身力量使出七伤拳终极绝技", cd=false},
	--[23]= {name="意恍惚诀",			desc="你凝神定气，使出七伤拳总诀中的「意恍惚诀」", cd=false},
	--[24]= {name="连环夺命诀",		desc="你使出苗家剑法之「连环夺命诀」", 			cd=false},
	--[25]= {name="绝命刺", 			desc="你突然运足内力，只听手中的", cd=false},
	--[26]= {name="三焦齐逆诀",		desc="你凝神定气，企图使出七伤拳总诀中的「三焦齐逆诀」", cd=false},
	--[27]= {name="伤肺诀",			desc="你凝神定气，使出七伤拳总诀中的「伤肺诀」", 	cd=false},
	--[28]= {name="损心诀",			desc="你凝神定气，使出七伤拳总诀中的「损心诀」",	cd=false},
	--[29]= {name="藏离诀",			desc="你凝神定气，使出七伤拳总诀中的「藏离诀」",	cd=false},
	--[30]= {name="摧肝肠诀",			desc="你凝神定气，使出七伤拳总诀中的「摧肝肠诀」",	cd=false},
	[31]= {name="雷霆一击",			desc="你默运混天气功，施展出「雷霆一击」", 			cd=false},
	[32]= {name="亢龙三悔",			desc="你深吸一口气，将浑天真气提于胸前，大喝一声说道",cd=false},
	[33]= {name="沧海一笑",			desc="你强提真气，身法突变得迷离，有如纵横之式",	cd=false},
	[34]= {name="幻影",			desc="你前后游走，身形闪动，手中钢刀越使越快，幻起无数刀光化出数个身形", cd=false},
	[35]= {name="刀刀相连", 		desc="在一片刀光中，一刀劈了过来", cd=false},
	[36]= {name="无色无相", desc="你使出小无相绝技「无色无相」，招式变幻莫测", cd=false},
	[37]= {name="天马行空", desc="你使出身空行，身形回转，如天马跃空而行", cd=false},
	[38]= {name="神功震敌", desc="你默运神功，使出猴拳「震」字诀", cd=false}
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
				Execute("unwield all;enable blade hujia-daofa;wield " .. wp .. ";perform blade.huanying " .. var.pfm_target)
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
				Execute("wield " .. wp .. ";enable blade xue-dao;enable force xiaowuxiang;jiali max;yun wuxiang " .. var.pfm_target .. ";jiali 0")
			end
	},

	[1] = { i = 35,
			action = function()
				local wp = choose_blade()
				Execute("enable blade xue-dao;wield " .. wp .. ";jiali max;perform parry.lian " .. var.pfm_target .. ";jiali 0")
			end
	},

	[3] = { i = 22,
			action = function()
				Execute("unwield all;enable cuff qishang-quan;bei none;bei qishang-quan;perform cuff.qishang " .. var.pfm_target)
			end
	},

	[4] = { i = 4,
			action = function()
				Execute("bei none;bei sun-finger;unwield all;hubo " .. var.pfm_target)
			end
	},

	[5] = { i = 31,
			action = function()
				Execute("unwield all;perform strike.leiting " .. var.pfm_target)
			end
	},

	[6] = { i = 4,
			action = function()
				Execute("unwield all;hubo " .. var.pfm_target)
			end
	},

	[7] = { i = 35,
			action = function()
				local wp = choose_blade()
				Execute("unwield all;wield " .. wp .. ";enable blade hujia-daofa;perform blade.lian " .. var.pfm_target)
			end
	},


	[8] = { i = 36,
			action = function()
				Execute("unwield all;enable force xiaowuxiang;yun wuxiang " .. var.pfm_target)
			end
	},

	[9] = { i = 32,
			action = function()
				Execute("unwield all;perform strike.sanhui " .. var.pfm_target)
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
				Execute("unwield all;enable force xiaowuxiang;bei none;bei sun-finger;yun wuxiang " .. var.pfm_target)
			end
	},

	[13] = { i = 19,
			action = function()
				Execute("enable move yueying-wubu;bei none;bei sun-finger;perform move.yueying")
			end
	},

	[14] = { i = 11,
			action = function()
				Execute("unwield all;wield jian;enable sword chixin-qingchang-jian;perform sword.xiangsi")
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
				Execute("enable cuff houquan;unwield all;perform cuff.zhen")
			end
	}
}

task_busy_list = { 1, 2, 3, 4 }
task_attack_list = { 1, 2, 15, 3 }

gf_busy_list = { 1, 3 }
gf_attack_list = { 6, 7 }

ttask_busy_list = { 1, 2, 3, 4 }
ttask_attack_list = { 1, 2, 3, 4 }

busy_list = { 1, 2, 3, 4 }
attack_list1 = { 7, 3, 6 }
--attack_list2 = { 3, 8, 9, 5, 6 }
attack_list2 = { 3, 8, 14, 6, 7 }
attack_list3 = { 7, 16, 13}
attack_list4 = { 6 }
attack_list5 = { 3, 14, 6, 7, 16 }

study_list = {
	--{ loc = "fly wm;e;n;e;e;n;n;", cmd = "yanjiu finger 10000;et;set study done", post_action="fly wm;e;s;s;s;w;w;u;gamble big skill finger 2000"}
	{ loc = "fly wm;e;n;e;e;n;n;", cmd = "yanjiu xiaowuxiang 1000", wear_int = true, research = true }
		--{ loc = "fly mj", cmd = "xue wei strike 100;et",pre_action="bai wei yixiao", post_action="bai xie xun"}
}


function choose_blade()
	return "dao"
end

function choose_sword()
	return "jian"
end

function powerup()
	Execute("enable force xiaowuxiang;yun powerup;enable force beiming-shengong;yun shield;yun beiming")
end

function buff(menpai)
	if(menpai ~= nil) then
		local re = rex.new("(桃花|星宿|峨眉|梅庄|慕容)")
		local r1,r2,r3 = re:match(menpai)
		if(r3 ~= nil) then
			print("换金系内功了.......")
			Execute("enable force xiaowuxiang;")
			return
		end
	end

	print("换水系内功了.......")
	Execute("enable force beiming-shengong;yun beiming")
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
		Execute("wield qiankun dao;wear yuhuang yi;wear shenshui mao;wear xunzhang;wear yaohou xue;wear jiulong hushou;wear haoqi ring")
		wait.time(1)
		call(f_done)
	end)
end

function fight_wear(f_done)
	wait.make(function()
		Execute("tuo all;give xiaocui xue to byj;give juwei jian to byj;give shenshui mao to byj;give shenyu yi to byj;give jiulong hushou to byj;give qiankun dao to byj;give yecha ring to byj")
		Execute("wear all;tuo xunzhang;wield " .. var.weapon)
		core.busytest(function() call(f_done) end)
	end)
end


init()
