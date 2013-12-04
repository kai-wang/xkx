hooks={}
hooks.step="step"
--ÿ����һ���·����hook
hooks.searchfrofail="searchfrofail"
--searchʧ�ܵ�hook
hooks.isbusy="isbusy"
--�Ƿ�busy��hook
hooks.infoend="infoend"
--��Ϣ������hook
hooks.stepfail="stepfail"
--����ʧ�ܵ�hook
hooks.flyfail="flyfail"
--flyʧ�ܵ�hook
hooks.logok="logok"
--��½�ɹ����hook
hooks.hurt="hurt"
--����
hooks.faint="faint"
--����
hooks.faint1="faint1"
--����
hooks.fight="onfight"
--ս��ʱ����.�����Ҫս������ʹ�ô�hook,��Ȼ��reconnect
hooks.steptimeout="steptimeout"
--������һ��ָ��4��󴥷���һ������search֮���step��ʱ
hooks.blocked="blocked"
--step ����ס��hook
hooks.maxstep="maxstep"
--�ಽ����
hooks.accept="accept"
--��ս
hooks.dragon="dragon"
--����û

--����npc���hook
hooks.walktonpc="walktonpc"

--npc�����hook
hooks.npcdie="npcdie"

--dazuo�����hook
hooks.dazuofull="dazuofull"


hooks.killme="killme"
---��npc��kill��hook,������һ����������kill��npc������
_hooklist={}
_hookarglist={}
hashook=function(str)
	if _hooklist[str] ==nil then
		return false
	else
		return true
	end
end

hook=function(str,callback,...)
	_hooklist[str]=callback
	if callback==nil then
		_hookarglist[str]=nil
	else
		_hookarglist[str]={...}
	end
end

unhookall=function()
	_hooklist={}
	_hookarglist={}
end

callhook=function(str,removehook)
	thook=_hooklist[str]
	thookarg=_hookarglist[str]
	if removehook==true then
		hook(str,nil)
	end
	if thookarg~=nil then
		call(thook,unpack(thookarg))
	else
		call(thook)
	end
end

call=function(func,...)
	if (func~=nil) then
		func(...)
	end
end
print("Loading Hook mod ok!")
