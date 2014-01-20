require "wait"
require "tprint"
--module ("misc", package.seeall)
------------------------------------------------------------------------------
--                 variable
------------------------------------------------------------------------------
act_flag = false
event_status = false
------------------------------------------------------------------------------
--                 supply water and food
------------------------------------------------------------------------------
function chihe()
	wait.make(function()
		Execute("set brief;fly jx;buy zongzi;")
		wait.time(2)
		Execute("fly xx;su;s;ed;nw;w;buy shuinang;")
		wait.time(2)
		Execute("eat zongzi;#8 (drink shuinang);drop zongzi;drop zong ye;")
		wait.time(2)
		Execute("#8 (drink shuinang);drop shuinang;unset brief;fly wm;")
	end)
end --function

------------------------------------------------------------------------------
--                 event
------------------------------------------------------------------------------
function event_end(n,l,w)
	wait.make(function ()  --- coroutine below here
		wait.time(5)
		Execute("fly wm;")
		event_status = false
	end)  -- end of coroutine
end --function

function event(n,l,w)
	print("奇观来了")
	if act_flag then
		act_stop()
	end --if
	Execute("#2 (halt)")
	if string.match(w[1],"长白山天池流星") ~= nil then           --changbaishan
		AddTriggerEx("event_cbs","^>?\\s*船很快停靠彼岸。你抬脚跨出船来。","(se)e(se)2e(eu)(su)(eu)e(eu)(se)(sw)(sd)(exert heal)",49193, -1, 0, "", "", 11, 100)
		Queue(EvaluateSpeedwalk("(chuansong gw)3n2e(ne)en(give 1 gold to chuan fu)"),false)
	end --if
	if string.match(w[1],"峨嵋金顶日出") ~= nil then           --emei
		Queue(EvaluateSpeedwalk("(chuansong em)3(wu)3(su)(sw)(su)(se)(wu)(su)"),false)
	end --if
	if string.match(w[1],"衡山水帘洞瀑布") ~= nil then           --hengshan
		Queue(EvaluateSpeedwalk("(chuansong hy)10n(nu)(nw)(nu)(ed)e(eu)"),false)
	end --if
	if string.match(w[1],"无量山玉壁剑舞") ~= nil then           --wuliang
		Queue(EvaluateSpeedwalk("(fly ws)(wd)2(nd)2(wu)w"),false)
	end --if
	AddTrigger("event_end1","^>?\\s*【自然奇观】","",49193, -1, 0, "", "event_end")
	AddTrigger("event_end2", "^(> )*你心中连叹：“太可惜了！”$", "", 49193, -1, 0, "", "event_end")
	event_status = true
end --function

------------------------------------------------------------------------------
--                 study
------------------------------------------------------------------------------
function study(act)
	act_flag = true;
	wait.make (function ()  --- coroutine below here
		while act_flag do
			repeat
				wait.time(0.1)
				Execute(act)
				Execute("yun regenerate")
				if act_flag == false then
					break;
				end --if
				local line, wildcards = wait.regexp("^>?\\s*(你深深吸了几口气，精神看起来好多了。|\\( 你上一个动作还没有完成，不能施用内功。\\)|你现在精神饱满。|你的内力不够。)")
				if line and string.match(line,"你上一个动作还没有完成，不能施用内功") then
					wait.time(0.6)
					Execute("exert regenerate")
				end --if
			until (line and string.match(line,"你的内力不够。"))
			if act_flag == true then
				Execute("dazuo max")
				local ll, ww = wait.regexp(me.profile["dazuo_end_desc"])
				if ll ~= nil then
					Execute("exert recover")
				end --if
			end -- if
		end --while
	end)  -- end of coroutine
end --function

function act_stop()
	print("结束")
	act_flag = false
	DeleteTemporaryTriggers()
end --function

------------------------------------------------------------------------------
--                 practice
------------------------------------------------------------------------------

function practice_end()
	msg.broadcast("msg_practice_end")
end


function practice(act)
	act_flag = true
	wait.make(function()  --- coroutine below here
		while act_flag do
			repeat
				--wait.time(0.1)
				Execute(act .. ";yun recover")
				if act_flag == false then
					break
				end --if
				local line, wildcards = wait.regexp("^>?\\s*(你深深吸了几口气，脸色看起来好多了。|\\( 你上一个动作还没有完成，不能施用内功。\\)|你现在气力充沛。|你的内力不够。|你的基本功火候未到，必须先打好基础才能继续提高。)")
				if line and string.match(line,"你上一个动作还没有完成，不能施用内功") then
					wait.time(0.6)
					Execute("exert recover")
				end --if
			until (line and string.match(line,"你的内力不够。"))
			if act_flag == true then
				Execute("dazuo max")
				local ll, ww = wait.regexp(me.profile["dazuo_end_desc"])
				if ll ~= nil then
					Execute("exert recover")
				end --if
			end -- if
		end --while
	end)  -- end of coroutine
end --function

------------------------------------------------------------------------------
--                 dazuo
------------------------------------------------------------------------------

dazuo = {}

dazuo.start = function(callback)
	EnableTriggerGroup("dazuo", true)
	dazuo.done_flag = false
	Execute("et;dazuo max")
	if(callback ~= nil) then
		msg.subscribe("msg_dazuo_end", callback)
	else
		msg.unsubscribe("msg_dazuo_end")
	end
end

dazuo.continue = function()
	if(not dazuo.done_flag) then
		Execute("er;ef;dazuo max")
	else
		dazuo.done()
	end
end

dazuo.done = function()
	EnableTriggerGroup("dazuo", false)
	msg.broadcast("msg_dazuo_end")
end

dazuo.halt = function()
	Execute("halt;er")
	dazuo.done()
end

--[[
function dazuo_end()
	msg.broadcast("msg_dazuo_end")
end



function dazuo()
	wait.make(function()  --- coroutine below here
		--Execute("fly wm;u")
		dazuo_start()
		--Execute("d")
	end)  -- end of coroutine
end --function


function dazuo_start()
	done_flag = false
	local end_desc, full_desc, halt_desc = me.profile["dazuo_end_desc"], me.profile["dazuo_full_desc"], me.profile["dazuo_halt_desc"]
	Execute("dazuo max")
	while true do
		--Execute("dazuo max")
		local ll, ww = wait.regexp(end_desc .. "|" .. full_desc .. "|" .. halt_desc)
		if string.match(full_desc, ll) then
			done_flag = true
			--Execute("halt")
			--break
		elseif string.match(halt_desc, ll) then
			done_flag = true
			print("halt")
			break
		else
			if not done_flag then
				Execute("exert recover")
				Execute("dazuo max")
			else
				break
			end
		end --if
	end
	msg.broadcast("msg_dazuo_end")
end
]]--

------------------------------------------------------------------------------
--                 jump_tower
------------------------------------------------------------------------------
function jump_tower()
	act_flag = true
	wait.make(function()  --- coroutine below here
		while act_flag do
			Execute("out")
			local ll, ww = wait.regexp("^>?\\s*你已稳稳地站在地上。")
			if ll ~= nil then
				wait.time(2)
				Execute("halt;enter;#6 u;")
				Execute("dazuo 100")
				wait.time(2.5)
				Execute("yun powerup;yun recover;yun regenerate")
			end --if
		end --while
	end)  -- end of coroutine
end --function

------------------------------------------------------------------------------
--                 run
------------------------------------------------------------------------------

--[[
handlers = {
	["w"] = function(interval)
		wait.time(tonumber(interval))
	end,

	["y"] = function()
		while true do
			Execute("yell boat")
			local l, w = wait.regexp("^(> )*一叶扁舟缓缓地驶了过来，艄公将一块踏脚板搭上堤岸.*$|只听得.*传来：“别急嘛，这儿正忙着呐……”")
			if(l and string.match(l, "别急嘛，这儿正忙着呐")) then
				wait.time(1)
			else
				break
			end
		end
	end,

	["k"] = function(name)
		while true do
			Execute("kill "..name)
			local l, w = wait.regexp("^(> )*\\S+扑在地上挣扎了几下，口中喷出几口鲜血，死了！|^(> )*这里没有这个人。$")
			if( l and string.match(l, "这里没有这个人。")) then
				break
			else
				wait.time(1)
			end
		end
	end,

	["ph"] = function()
		Execute("enter chuan")
		local l, w = wait.regexp("^(> )*大船终于抵达了大海中一个大岛屿。你走下船来。$|^(> )*大船终于抵达了中原的一个繁华城市。你走下船来。$")
	end,

	["tw"] = function()
		Execute("enter zhou")
		local l, w = wait.regexp("^(> )*兵舟终于抵达了海峡中一个大岛。你走下船来。$|^(> )*战舟终于抵达了台湾一个被红毛鬼和倭寇侵袭的破败城市。你走下船来。$")
	end,

	["q"] = function(money)
		Execute("fly wm;e;s;w;qukuan "..money)
		wait.time(2)
	end,

	["g"] = function()
		Execute("e")
		local l, w = wait.regexp("^(> )*你见江面结冻，便壮起胆子踩冰而过。$")
		if(l and string.match(l, "你见江面结冻，便壮起胆子踩冰而过。")) then
			Execute("e")
		else
			Execute("give 1 gold to chuan fu")
			l, w = wait.regexp("^(> )*船很快停靠彼岸。你抬脚跨出船来。$")
		end
	end
}



function run(path)
	local pos1 = string.find(path, "%[")

	if(pos1 == nil) then
		Execute(path)
	else
		local pos2 = string.find(path, "%]")
		if(pos2 == nil) then print("命令: "..path.."格式出错了") return
		else
			if(pos1 > 1) then
				Execute(path:sub(0,pos1-1))
			end
			runcmd(path:sub(pos1+1, pos2-1), path:sub(pos2+1))
		end
	end
end
]]--

--function runcmd(cmd, rest)
--	wait.make(function()
--		local tt = utils.split(cmd, ":")
--		if(tt == nil or tt =="") then print("错误的命令格式: "..cmd) return
--		else
--			handlers[tt[1]](tt[2])

			--run(rest)
		--end
	--end)
--end
