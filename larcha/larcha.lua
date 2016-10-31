require "var"
module ("config", package.seeall)

var.dazuo_desc = "(你坐下来运气用功，一股内息开始在体内流动。)|(你气运丹田，将体内毒素慢慢逼出，控制着它环绕你缓缓飘动。你感觉到内劲开始有所加强了。)"
var.dazuo_end_desc = "(你感觉毒素越转越快，就快要脱离你的控制了！你连忙收回毒素和内息，冷笑一声站了起来。)|(你运功完毕，深深吸了口气，站了起来。)|(你吸气入丹田，真气运转渐缓，慢慢收功，双手抬起，站了起来。)"
var.dazuo_halt_desc = "(你把正在运行的真气强行压回丹田，站了起来。)|(你面色一沉，迅速收气，站了起来。)|(你双眼一睁，眼中射出一道精光，接着阴阴一笑，站了起来。)"
var.dazuo_full_desc = "你的内力修为似乎已经达到了瓶颈，无法再靠打坐来提升了。"
var.me_id = "larcha"
var.me_pwd = "Larch123"
var.me_name = "东南西北方"
var.me_menpai = "星宿"
var.me_family = "星宿"
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
	[1]= {	name="双手互博之术", desc="你平心静气", cd=false },
	[2]= {	name="刺目", desc="你左手两指并拢，手臂暴长", cd=false },
	[3]= {	name="三连刺", desc="你嫣然一笑，诡异之极，身法陡然加快", cd=false },
	[4]= {	name="五遁绝杀", desc="你使出五行遁中的「五遁绝杀」", cd=false },
	[5]= {	name="zhaohuo", desc="你用全身的内力注入地上！对着地上一指", cd=false, reset_time=15 },
	[6]= {	name="幻影", desc="你前后游走，身形闪动，手中钢刀越使越快，幻起无数刀光化出数个身形", cd=false },
	[7]= {	name="刀刀相连", desc="在一片刀光中，一刀劈了过来", cd=false },
	[8]= {	name="抽髓三掌", desc="你眼光一闪，暗运化功大法", cd=false },
	[9]= {	name="附骨缠身", desc="你大喝一声，缠身而上", cd=false },
	[10]={	name="huagong", desc="你一张脸突然变得惨白，右掌直出，猛地对准", cd=false, reset_time=20}
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
		-- 飞杖回来而且调息结束
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
			-- 飞杖: tx_finish 记录是否调息结束，fz_back 记录是否飞杖回来
			if(v.fz_back ~= nil) then 
				v.tx_finish = not flag 
				-- 飞杖没回来但调息以结束
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
		local re = rex.new("(灵鹫|铁掌|华山|白驼|雪山|密宗|独孤|采花)")
		local r1,r2,r3 = re:match(menpai)
		if(r3 ~= nil) then
			print("换水系内功了.......")
			return choose_force("kuihua-xinfa")
		end

		re = rex.new("(明教|大理|神龙|江湖|云龙|少林|全真|桃花|星宿|峨嵋|梅庄|慕容|峨眉)")
		r1,r2,r3 = re:match(menpai)
		if(r3 ~= nil) then
			print("换木系内功了.......")
			return choose_force("huagong-dafa")
		end

		re = rex.new("(武当|日月|逍遥|昆仑|丐帮)")
		r1,r2,r3 = re:match(menpai)
		if(r3 ~= nil) then
			print("换水系内功了.......")
			return choose_force("kuihua-xinfa")
		end
	end

	print("默认换成木系内功了.......")
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
		"^(> )*(.*看着这个怪异的火焰，神色不由得紧张起来！)|(结果一指点中)|(结果.*被你点中要穴)|(.*只看到寒尖一点，双目一阵剧痛，眼前一黑就什么也看不见了，顿时长声痛极而呼！)|(.*被此胡家刀法之「无形幻影」所迷惑，手足无措，不知哪个你是真)|(.*气拔千钧的一击，竟不知如何招架！)|(.*只觉一股热流穿心而过)|(结果.*被你围着转得头晕)|(结果.*被你绕得不知所措)|(结果.*被你围着转得头晕眼花).*$",
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

	AddTrigger("set_hg_status",
		"^(> )*(.*已经内力涣散，没有必要化他内力了！)|(你刚刚吸取过内力！).*$",
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
