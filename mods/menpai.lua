require "wait"
require "tprint"
require "utils"
require "var"

local mp = {}


mp["丐帮"] = {
	id = "gb",
	name = "丐帮",
	master = {["洪七公"] = {id="hong qigong", path="e;s;s;e;e;e;n;e;n;w;n;e;w;n;enter;e;"}},
	dazuo_desc = "^(> )*你随意坐下，双手平放在双膝，默念口诀，开始运起独门心法。$",
	dazuo_end_desc = "^(> )*你吸气入丹田，真气运转渐缓，慢慢收功，双手抬起，站了起来。$",
	dazuo_halt_desc = "^(> )*你面色一沉，迅速收气，站了起来。$",
	dazuo_full_desc = "^(> )*你的内力修为似乎已经达到了瓶颈，无法再靠打坐来提升了。$",
	busy_desc = "^(> )*(结果.*被你绕得不知所措|结果.*被你攻的蹦跳不停，手忙脚乱).*$",
	powerup = "yun powerup",
	pfm = {
		["沧海一笑"]=		{action=function()Execute("perform dodge.canghaiyixiao")end, cd=false},
		["缠"]=				{action=function()Execute("wield bang;perform stick.chan")end, cd=false},
		["乱棒打狗"] = 		{action=function()Execute("unwield all;wield bang;perform stick.luanda")end, cd=false},
		["附骨缠身"]=		{action=function()Execute("enable parry jinshe-zhang;perform parry.fugu")end, cd=false},
		["双手互博之术"]=	{action=function()Execute("unwield all;hubo;wield bang")end, cd=false},

		gf_busy = function()
			local tbl = {}
			local pfm = mp["丐帮"].pfm
			table.insert(tbl, pfm["沧海一笑"])
			table.insert(tbl, pfm["缠"])
			return tbl
		end,

		gf_attack = function()
			local tbl = {}
			local pfm = mp["丐帮"].pfm
			table.insert(tbl, pfm["乱棒打狗"])
			table.insert(tbl, pfm["附骨缠身"])
			table.insert(tbl, pfm["双手互博之术"])
			return tbl
		end
	}
}

mp["全真教"] = {
	id = "qzj",
	name = "全真教",
	master = {["王重阳"] = {id="hong qigong", path="e;s;s;e;e;e;n;e;n;w;n;e;w;n;enter;e;"}},
	dazuo_desc = "^(> )*你随意坐下，双手平放在双膝，默念口诀，开始运起独门心法。$",
	dazuo_end_desc = "^(> )*你运功完毕，深深吸了口气，站了起来。$",
	dazuo_full_desc = "^(> )*你的内力修为似乎已经达到了瓶颈，无法再靠打坐来提升了。$",
	dazuo_halt_desc = "^(> )*你把正在运行的真气强行压回丹田，站了起来。$",
	busy_desc = "^(> )*(结果.*被你绕得不知所措|结果.*被你攻的蹦跳不停，手忙脚乱)"
}


mp["姑苏慕容"] = {
	id = "mr",
	name = "姑苏慕容",
	master = {["慕容复"] = {id="murong fu", path="fly yzw;"}},
	dazuo_desc = "^(> )*你随意一站，双手缓缓抬起，深吸一口气，真气开始在体内运转。$",
	dazuo_end_desc = "^(> )*你将真气在体内沿脉络运行了一圈，缓缓纳入丹田，放下手，长吐了一口气。$",
	dazuo_halt_desc = "^(> )*你眉头一皱，急速运气，把手放了下来。$",
	busy_desc = "^(> )*(结果.*被你绕得不知所措|结果.*被你攻的蹦跳不停，手忙脚乱)"
}

return mp
