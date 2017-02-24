require "wait"
require "tprint"
require "utils"
require "var"
require("worlds\\xkx\\mods\\core")

module ("study", package.seeall)

local cxt = {}
local emitter = require("worlds\\xkx\\mods\\emitter"):new()

function main(f)
	if(var.study_seq == nil or var.study_seq == "0" or tonumber(var.study_seq) > #(config.study_list)) then
		var.study_seq = 1
	end

	cxt.learnlist = config.study_list[tonumber(var.study_seq)]
	var.study_seq = tonumber(var.study_seq) + 1
	var.lll = cxt.learnlist.cmd
	var.study_times = cxt.learnlist.times

	local go_study = function()
		walk.run(cxt.learnlist.loc, start(function() done(f) end, cxt.learnlist.interval), f, f)
	end

	if(cxt.learnlist.wear_int) then
		config.int_wear(function()
			go_study()
		end)
	else
		go_study()
	end
end


function init()
	EnableTriggerGroup("study", false)
	EnableTriggerGroup("study_check", false)
end

function done(f)
	EnableTriggerGroup("study", false)
	EnableTriggerGroup("study_check", false)
	if(cxt.learnlist ~= nil and cxt.learnlist.post_action ~= nil) then
		Execute(cxt.learnlist.post_action)
		core.busytest(function() config.fight_wear(function() me.cleanup(f) end) end)
	else
		config.fight_wear(function() me.cleanup(f) end)
	end
end

function emit(event, ...)
	emitter:emit(event, ...)
end

function stop(f_done)
	dazuo.abort(f_done)
end

function start(f_done, t_interval)
	EnableTriggerGroup("study", true)

	emitter:once("study_end", function(err)
		timer.stop("action")
		if err == "dazuo" then
			dazuo.start(function()
				start(f_done)
			end)
		elseif err == "waitandtry" then
			timer.tickonce("action", 10, function()
				Execute("er;et;ef")
				dazuo.start(function()
					start(f_done)
				end)
			end)
		else
			EnableTriggerGroup("study", false)
			call(f_done)
		end
	end)

	local interval = t_interval
	if(not interval) then interval = 0.2 end
	local tmp = 0
	timer.tick("action", interval, 
				function() 
					if(var.study_times == nil or tmp < tonumber(var.study_times)) then
						tmp = tmp + 1
						Execute(var.lll)
					else
						study.emit("study_end", "done")
					end
				end)
	
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
			start()
			--Execute("dazuo 10")
		end
	end)
end

