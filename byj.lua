require "var"

var.dazuo_desc = "你坐下来运气用功，一股内息开始在体内流动。"
var.dazuo_end_desc = "你运功完毕，深深吸了口气，站了起来。"
var.dazuo_halt_desc = "你把正在运行的真气强行压回丹田，站了起来。"
var.dazuo_full_desc = "你的内力修为似乎已经达到了瓶颈，无法再靠打坐来提升了。"

performs = {
	[1] = {	name = "一剑化三清", desc = "你大喝一声，剑招突变" }
}

profile = {
    dazuo_desc = "^(> )*你坐下来运气用功，一股内息开始在体内流动。$",
	dazuo_end_desc = "^(> )*你运功完毕，深深吸了口气，站了起来。$",
	dazuo_halt_desc = "^(> )*你把正在运行的真气强行压回丹田，站了起来。$",
	dazuo_full_desc = "^(> )*你的内力修为似乎已经达到了瓶颈，无法再靠打坐来提升了。$",
	busy_success_desc = "^(> )*(.*气拔千钧的一击，竟不知如何招架！|结果.*被你攻了个措手不及!).*$",
	--busy_fail_desc = "^(> )*(可是.*看破了你的企图，斜跃避开。|可是.*看破了你的企图，并没有上当。)$",
	
	perform_desc = "^(> )*(你脚下左弓右箭|你使出一阳指绝技|你大喝一声，剑招突变|你大喝一声，缠身而上|你倒踩七星步法|你平心静气，灵台空明|你凝气于指，一式).*$",
	
	powerup = function()
		Execute("yun powerup")
	end,
	
	set_perform_cd = function(l)
		if(string.match(l, "你大喝一声，剑招突变")) then
			profile.attack["一剑化三清"].cd = true

		elseif(string.match(l, "你大喝一声，缠身而上")) then
			profile.attack["附骨缠身"].cd = true

		elseif(string.match(l, "你倒踩七星步法")) then
			profile.attack["璀璨七星"].cd = true

		elseif(string.match(l, "你平心静气")) then
			profile.attack["双手互博之术"].cd = true

		elseif(string.match(l, "你脚下左弓右箭")) then
			profile.busy["定阳针"].cd = true

		elseif(string.match(l, "你使出一阳指绝技")) then
			profile.busy["一指乾坤"].cd = true
			
		elseif(string.match(l, "你凝气于指，一式")) then
			profile.attack["阳关三叠"].cd = true
		end
	end,

	unset_perform_cd = function(l)
		if(profile.attack[l] ~= nil) then
			profile.attack[l].cd = false

		elseif(profile.busy[l] ~= nil) then
			profile.busy[l].cd = false

		end
	end,

	attack = {
		["一剑化三清"] = {
			cd = false,
			action = function()
				Execute("enable sword quanzhen-jian;wield ".. var.weapon .. ";perform sword.sanqing")
			end
		},
		["阳关三叠"]={
			cd = false,
			action = function()
				Execute("unwield all;perform finger.sandie")
			end
		},
		["璀璨七星"]={
			cd = false,
			action = function()
				Execute("enable sword quanzhen-jian;enable dodge qixing-bufa;wield ".. var.weapon .. ";perform dodge.qixing")
			end
		},
		["双手互博之术"] = {
			cd = false,
			action = function()
				Execute("unwield all;hubo")
			end
		}
	},
	
	buff_attack = {
		["一剑化三清"] = {
			cd = false,
			action = function()
				Execute("enable sword quanzhen-jian;unwield all;perform strike.sanhua;wield ".. var.weapon .. ";perform sword.jianyi;perform sword.sanqing")
			end
		},
		["阳关三叠"]={
			cd = false,
			action = function()
				Execute("unwield all;perform finger.sandie")
			end
		},
		["璀璨七星"]={
			cd = false,
			action = function()
				Execute("enable sword quanzhen-jian;enable dodge qixing-bufa;unwield all;perform strike.sanhua;wield ".. var.weapon .. ";perform sword.jianyi;perform dodge.qixing")
			end
		},
		["双手互博之术"] = {
			cd = false,
			action = function()
				Execute("unwield all;hubo")
			end
		}
	},

	busy = {
		["定阳针"] = {
			cd = false,
			action = function()
				Execute("wield " .. var.weapon .. ";enable sword quanzhen-jian;perform sword.ding")
			end
		},

		["一指乾坤"] = {
			cd = false,
			action = function()
				Execute("wield " .. var.weapon .. ";enable parry sun-finger;perform parry.qiankun")
			end
		}
	},

	gf_busy_list = function()
		local tbl = {}
		tbl[2] = profile.busy["定阳针"]
		tbl[1] = profile.busy["一指乾坤"]
		return tbl
	end,

	gf_attack_list = function()
		local tbl = {}
		tbl[1] = profile.attack["一剑化三清"]
		tbl[2] = profile.attack["璀璨七星"]
		return tbl
	end,
	
	task_busy_list = function()
		local tbl = {}
		tbl[1] = profile.busy["定阳针"]
		tbl[2] = profile.busy["一指乾坤"]
		return tbl
	end,

	task_attack_list = function()
		local tbl = {}
		tbl[1] = profile.buff_attack["璀璨七星"]
		tbl[2] = profile.buff_attack["一剑化三清"]
		tbl[3] = profile.buff_attack["阳关三叠"]
		tbl[4] = profile.buff_attack["双手互博之术"]
		return tbl
	end
	
	
}


return profile
