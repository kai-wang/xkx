require "wait"
require "tprint"

event = {
	["����ɽ"] = "fly gw;#3 n;#2 e;ne;e;n;[g]se;e;se;#2 e;eu;su;eu;e;eu;se;sw;sd;",
	["��ü"] = "fly em;#3 (wu);#3 (su);sw;su;se;wu;su",
	["��ɽ"] = "fly hy;#10 n;nu;nw;nu;ed;e;eu",
	["����"] = "fly ws;wd;#2 (nd);#2 (wu);w"
}

event.main = function()
	local loc = GetVariable("event_loc")
	if(loc ~= nil) then
		wait.make(function()
			if(loc == "����ɽ") then
				run()
		end)
	end
end

function event(n,l,w)
	print("�������")

	if string.match(w[1],"����ɽ�������") ~= nil then           --changbaishan
		SetVariable("event_loc", "����ɽ")
	elseif string.match(w[1],"���ҽ��ճ�") ~= nil then
		SetVariable("event_loc", "��ü")
	elseif string.match(w[1],"��ɽˮ�����ٲ�") ~= nil then
		SetVariable("event_loc", "��ɽ")
	elseif string.match("event_loc", "����ɽ��ڽ���") ~= nil then
		SetVariable("event_loc", "����")
	end



		AddTriggerEx("event_cbs","^>?\\s*���ܿ�ͣ���˰�����̧�ſ��������","(se)e(se)2e(eu)(su)(eu)e(eu)(se)(sw)(sd)(exert heal)",49193, -1, 0, "", "", 11, 100)
		Queue(EvaluateSpeedwalk("(chuansong gw)3n2e(ne)en(give 1 gold to chuan fu)"),false)
	end --if
	if string.match(w[1],"���ҽ��ճ�") ~= nil then           --emei
		Queue(EvaluateSpeedwalk("(chuansong em)3(wu)3(su)(sw)(su)(se)(wu)(su)"),false)
	end --if
	if string.match(w[1],"��ɽˮ�����ٲ�") ~= nil then           --hengshan
		Queue(EvaluateSpeedwalk("(chuansong hy)10n(nu)(nw)(nu)(ed)e(eu)"),false)
	end --if
	if string.match(w[1],"����ɽ��ڽ���") ~= nil then           --wuliang
		Queue(EvaluateSpeedwalk("(fly ws)(wd)2(nd)2(wu)w"),false)
	end --if
	AddTrigger("event_end1","^>?\\s*����Ȼ��ۡ�","",49193, -1, 0, "", "event_end")
	AddTrigger("event_end2", "^(> )*��������̾����̫��ϧ�ˣ���$", "", 49193, -1, 0, "", "event_end")
	event_status = true
end --function


return event
