require "wait"
require "tprint"
require "utils"
require "var"

module ("study", package.seeall)

local cxt = {}

function main(f)
	if(var.study_seq == nil or var.study_seq == "0" or tonumber(var.study_seq) > #(me.profile.study_list)) then 
		var.study_seq = 1 
	end
	
	local learnlist = me.profile.study_list[tonumber(var.study_seq)]
	cxt.learnlist = learnlist
	var.lll = learnlist.cmd
	
	wait.make(function()
		var.study_seq = tonumber(var.study_seq) + 1
		walk.run(learnlist.loc, function() start(function() me.cleanup(f) end) end, f, f)
	end)
end

function init()
	EnableTriggerGroup("study", false)
	EnableTriggerGroup("study_check", false)
end

function done()
	EnableTriggerGroup("study", false)
	EnableTriggerGroup("study_check", false)
	Execute(cxt.learnlist.post_action)
	me.profile.fight_wear(cxt.f_done)
end

function start(f_done)
	EnableTriggerGroup("study", true)
	EnableTriggerGroup("study_check", true)
	EnableTriggerGroup("HP", false)
	cxt.f_done = f_done
	
	wait.make(function()
		me.profile.int_wear(function()
			Execute(cxt.learnlist.pre_action)
			wait.time(1)
			Execute(var.lll)
			Execute("hp")
		end)
	end)
end

function continue()
	EnableTriggerGroup("study_check", true)
	Execute("er;et")
	Execute(var.lll)
	Execute("hp")
end

function givemoney()
	wait.make(function()
		Execute("give zhu 1 gold")
		local l, w = wait.regexp("(> )*(朱熹同意指点你一些读书写字的问题。)|(你没有那么多的黄金)|(你身上没有这样东西).*$")
		if(l:match("朱熹同意指点") == nil) then
			Execute("s;w;n;w;qukuan 1 gold")
			wait.time(5)
			Execute("e;s;e;n;give zhu 1 gold")
		else
			Execute("dazuo 10")
		end
	end)
end


function waitandtry()
	wait.make(function()
		EnableTriggerGroup("study_check", false)
		wait.time(10)
		EnableTriggerGroup("study_check", true)
		Execute("er;et;" .. var.me_dazuo)
	end)
end

function check(line, name, wildcards)
	local nl, nl_max = wildcards[4], wildcards[5]
	if(tonumber(nl) < tonumber(nl_max)*0.5) then
		EnableTriggerGroup("study_check", false)
		busy_test(function()
			Execute("er;et;" .. var.me_dazuo)
		end)
	else
		Execute(var.lll)
		EnableTriggerGroup("study_check", true)
		Execute("hp")
	end
end

module ("research", package.seeall)

local cxt = {}

function start(f_done)
	if(var.research_num == nil or tonumber(var.research_num) == 0) then var.research_num = 1
	else var.research_num = 1 + tonumber(tonumber(var.research_num) % #me.profile.research_list) end
	
	local skill = me.profile.research_list[tonumber(var.research_num)].skill
	study.start(function()
		Execute("fly wm;e;s;s;s;w;w;u;u;gamble big skill " .. skill .. " 2000")
		busy_test(function() Execute("fly wm") call(f_done) end )
	end)
	
end