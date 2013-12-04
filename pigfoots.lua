require "var"

profile = {
    dazuo_desc = "^(> )*你随意坐下，双手平放在双膝，默念口诀，开始运起独门心法。$",
	dazuo_end_desc = "^(> )*你吸气入丹田，真气运转渐缓，慢慢收功，双手抬起，站了起来。$",
	dazuo_halt_desc = "^(> )*你面色一沉，迅速收气，站了起来。$",
	dazuo_full_desc = "^(> )*你的内力修为似乎已经达到了瓶颈，无法再靠打坐来提升了。$",
	busy_success_desc = "^(> )*(结果.*被你绕得不知所措|结果.*被你攻的蹦跳不停，手忙脚乱).*$",
	busy_fail_desc = "^(> )*(可是.*看破了你的企图，镇定解招，一丝不乱。|结果你自己绕了个头晕眼花。)$",

	powerup = "yun powerup",

	attack_desc = "你心中一急，没头没脑|你大喝一声，缠身而上|你默运混天气功，施展出「雷霆一击」|你平心静气，灵台空明",

	set_cd = function(l)
		if(string.match(l, "你心中一急，没头没脑")) then
			profile.attack["乱棒打狗"].cd = true

		elseif(string.match(l, "你大喝一声，缠身而上")) then
			profile.attack["附骨缠身"].cd = true

		elseif(string.match(l, "你默运混天气功")) then
			profile.attack["雷霆一击"].cd = true

		elseif(string.match(l, "你平心静气")) then
			profile.attack["双手互博之术"].cd = true

		elseif(string.match(l, "绕得不知所措") or string.match(l, "你自己绕了个头晕眼花")) then
			profile.busy["沧海一笑"].cd = true

		elseif(string.match(l, "蹦跳不停") or string.match(l, "看破了你的企图，镇定解招")) then
			profile.busy["缠"].cd = true

		end
	end,

	unset_cd = function(l)
		if(profile.attack[l] ~= nil) then
			profile.attack[l].cd = false

		elseif(profile.busy[l] ~= nil) then
			profile.busy[l].cd = false

		end
	end,

	attack = {
		["乱棒打狗"] = {
			cd = false,
			action = function()
				Execute("yun shengang;perform strike.xianglong;unwield all;wield ".. var.weapon .. ";perform stick.luanda")
			end
		},
		["附骨缠身"]={
			cd = false,
			action = function()
				Execute("enable parry jinshe-zhang;perform parry.fugu")
			end
		},
		["雷霆一击"]={
			cd = false,
			action = function()
				Execute("unwield all;perform strike.leiting")
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
		["沧海一笑"] = {
			cd = false,
			action = function()
				Execute("perform dodge.canghaiyixiao")
			end
		},

		["缠"] = {
			cd = false,
			action = function()
				Execute("wield " .. var.weapon .. ";perform stick.chan")
			end
		}
	},

	gf_busy_list = function()
		local tbl = {}
		tbl[1] = profile.busy["沧海一笑"]
		tbl[2] = profile.busy["缠"]
		return tbl
	end,

	gf_attack_list = function()
		local tbl = {}
		tbl[1] = profile.attack["乱棒打狗"]
		tbl[2] = profile.attack["附骨缠身"]
		tbl[3] = profile.attack["双手互博之术"]
		return tbl
	end
}


return profile
