require "wait"
require "tprint"

event = {
	["长白山"] = "fly gw;#3 n;#2 e;ne;e;n;[g]se;e;se;#2 e;eu;su;eu;e;eu;se;sw;sd;",
	["峨眉"] = "fly em;#3 (wu);#3 (su);sw;su;se;wu;su",
	["衡山"] = "fly hy;#10 n;nu;nw;nu;ed;e;eu",
	["无量"] = "fly ws;wd;#2 (nd);#2 (wu);w"
}

event.main = function()
	local loc = GetVariable("event_loc")
	if(loc ~= nil) then
		wait.make(function()
			if(loc == "长白山") then
				run()
		end)
	end
end

function event(n,l,w)
	print("奇观来了")

	if string.match(w[1],"长白山天池流星") ~= nil then           --changbaishan
		SetVariable("event_loc", "长白山")
	elseif string.match(w[1],"峨嵋金顶日出") ~= nil then
		SetVariable("event_loc", "峨眉")
	elseif string.match(w[1],"衡山水帘洞瀑布") ~= nil then
		SetVariable("event_loc", "衡山")
	elseif string.match("event_loc", "无量山玉壁剑舞") ~= nil then
		SetVariable("event_loc", "无量")
	end



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


return event
