require "wait"
require "tprint"
require "utils"
require "var"

module ("study", package.seeall)

function main()
	EnableTriggerGroup("study", true)
	EnableTriggerGroup("study_check", true)
	EnableTriggerGroup("HP", false)
	me.profile.int_wear(study.start)
	--start()
end

function done()
	EnableTriggerGroup("study", false)
	EnableTriggerGroup("study_check", false)
	me.profile.fight_wear()
	msg.broadcast("msg_study_done")
end

function start()
	wait.make(function()
		if(var.study_loc == nil or var.study_loc == "") then 
			done()
		else
			Execute(var.study_loc)
			Execute("lll")
			Execute("hp")
		end
	end)
end

function continue()
	EnableTriggerGroup("study_check", true)
	Execute("er;et")
	Execute("lll;hp;hp")
end

function givemoney()
	wait.make(function()
		Execute("give zhu 1 gold")
		local l, w = wait.regexp("(> )*(����ͬ��ָ����һЩ����д�ֵ����⡣)|(��û����ô��Ļƽ�)|(������û����������).*$")
		if(l:match("����ͬ��ָ��") == nil) then
			Execute("s;w;n;w;qukuan 1 gold")
			wait.time(5)
			Execute("e;s;e;n;give zhu 1 gold")
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
	print(nl, nl_max)
	if(tonumber(nl) < tonumber(nl_max)*0.3) then
		wait.make(function()
			EnableTriggerGroup("study_check", false)
			repeat
				wait.time(1)
				Execute("suicide")
				local l, w = wait.regexp("^(> )*(����æ���أ�û����ɱ��)|(���� suicide -f ȷ����ɱ��)$")
			until(l:match("ȷ����ɱ") ~= nil)
			Execute("er;et;dazuo max")
		end)
	else
		Execute("lll")
		EnableTriggerGroup("study_check", true)
		Execute("hp")
	end
end