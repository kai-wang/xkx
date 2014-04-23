require "wait"
require "tprint"
require "utils"
require "var"

module ("study", package.seeall)

local cxt = {}

--[[
function main()
	EnableTriggerGroup("study", true)
	EnableTriggerGroup("study_check", true)
	EnableTriggerGroup("HP", false)
	me.profile.int_wear(study.start)
	--start()
end
]]--

function done()
	EnableTriggerGroup("study", false)
	EnableTriggerGroup("study_check", false)
	me.profile.fight_wear(cxt.f_done)
	--[[
	busy_test(function() me.profile.fight_wear() end)
	busy_test(function() call(cxt.f_done) end)
	]]--
end

function start(f_done)
	EnableTriggerGroup("study", true)
	EnableTriggerGroup("study_check", true)
	EnableTriggerGroup("HP", false)
	--me.profile.int_wear(study.start)
	cxt.f_done = f_done
	
	wait.make(function()
		if(var.study_loc == nil or var.study_loc == "") then 
			done()
		else
			me.profile.int_wear(function()
				Execute(var.lll)
				Execute("hp")
			end)
		end
	end)
end

function continue()
	EnableTriggerGroup("study_check", true)
	Execute("er;et")
	Execute(var.lll)
	Execute("hp;hp")
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
		Execute("er;et;dazuo max")
	end)
end

function check(line, name, wildcards)
	local nl, nl_max = wildcards[4], wildcards[5]
--	print(nl, nl_max)
	if(tonumber(nl) < tonumber(nl_max)*0.3) then
		EnableTriggerGroup("study_check", false)
		busy_test(function()
			Execute("er;et;dazuo max")
		end)
	else
		--Execute("lll")
		Execute(var.lll)
		EnableTriggerGroup("study_check", true)
		Execute("hp")
	end
end