require "wait"
require "tprint"
require "var"

module ("walk2", package.seeall)

local walk_cxt = {}

local directions = {}

directions["e"] = "��"
directions["eu"] = "��"
directions["ed"] = "��"
directions["w"] = "��"
directions["wu"] = "��"
directions["wd"] = "��"
directions["s"] = "��"
directions["su"] = "��"
directions["sd"] = "��"
directions["n"] = "��"
directions["nu"] = "��"
directions["nd"] = "��"
directions["se"] = "����"
directions["ne"] = "����"
directions["sw"] = "����"
directions["nw"] = "����"
directions["enter"] = "����"
directions["out"] = "����"

local mappings = {}

mappings["�����"] = "����"
mappings["����ɽ"] = "��üɽ"
mappings["���ɽ"] = "���"
mappings["�Ͻ���"] = "�����Ͻ���"


local blocker_npcs = {}

blocker_npcs["����"] = "ya yi"
blocker_npcs["�α�"] = "song bing"
blocker_npcs["�ױ�"] = "qin bing"
blocker_npcs["һƷ����ʿ"] = "wu shi"
blocker_npcs["��ʿ"] = "wei shi"
blocker_npcs["��Ա��"] = "cui yuanwai"
blocker_npcs["Уξ"] = "xiao wei"
blocker_npcs["�ٱ�"] = "guan bing"
blocker_npcs["����ʤ"] = "jiang baisheng"
blocker_npcs["Ů�ܼ�"] = "guan jia"
blocker_npcs["����"] = "men wei"
blocker_npcs["��åͷ"] = "liumang tou"
blocker_npcs["����"] = "ya huan"
blocker_npcs["������ʿ"] = "wei shi"
blocker_npcs["������ʿ"] = "wei shi"
blocker_npcs["ɽ��ͷ"] = "shanzei tou"
blocker_npcs["����ʦ̫"] = "jingxin shitai"
blocker_npcs["ժ����"] = "zhaixing zi"
blocker_npcs["������"] = "chuchen zi"
blocker_npcs["�ɻ���"] = "caihua zi"
blocker_npcs["�ܼ�"] = "guan jia"
blocker_npcs["�Ҷ�"] = "jia ding"
blocker_npcs["�߸���"] = "gao genming"

---------------------------------------------------------- ��������-------------------------------------------------------------------


function run1(path, f_ok, f_fail)
	
	--�����ʽ��Ϊ
	-- path : e;s;|!aw:3:flatter ��������:nw|e;e;e;e;e;e
	-- ��ס���һ��|��ǰһ��Ӧ����Ϊ·��
	
	local tbl = utils.split(path, "|")
	
	--iterator---------------------------------
	local run_iter = function(tbl)
		local i, n = 0, #tbl
		return function() i = i + 1 if(i <= n) then return tbl[i] end end
	end
	
	local iter = run_iter(tbl)
	local p = inter()
	
	if(p == nil) then call(h_fail) return end
	
	--ǰ������һ�£���Ȼ����ò���------------
	local continue 
	continue = function()
		local p = iter()
		--ִ�е��������"set run ok"----------
		if(p == nil) then
			Execute("set run ok")
			--���������f_ok------------------
			call(f_ok)
		else -- ������һ������----------------
			run_cmd(p, continue, f_fail)
		end
	end
	
	run_cmd(p, continue, f_fail)
end

function run_cmd(cmd, f_ok, f_fail)
	-- �� !�����������������һ������-------
	if(cmd[1] ~= "!") then
		Execute(cmd)
		call(f_ok)
	else
		-- aw:3:flatter ��������
		run_special(cmd:sub(2), f_ok, f_fail)
	end
end

function run_special(cmd, f_ok, f_fail)
	local tbl = utils.split(cmd, ":")
	
	handlers.new(tbl, f_ok, f_fail)
	handlers.run()
	
end

handlers = {
	context = {},
	
	["new"] = function(tbl, f_ok, f_fail)
		context.f_ok = f_ok
		context.f_fail = f_fail
		--context.cmd = tbl[#tbl]
		--context.func = tbl[1]
		context.cmd = tbl
		context.stop = false
		context.block = false
	end,
	
	["run"] = function()
		context.stop = false
		context.block = false
		local f = handlers(context.cmd[1])
		local cmd = context.cmd[#context.cmd]
		f(unpack(context.cmd, 2, #context.cmd-1))
	end,
	
	["stop"] = function()
		context.stop = true
	end,
	
	["block"] = function()
		context.block = true
	end,
	
	["h_ok"] = function()
		if(context.stop) then return 
		else
			Execute(cmd .. ";set handler ok")
			local l, w = wait.regexp("dfadf")
			if(not context.block) then call(context.f_ok) else run() end
		end
	end,
	
	["aw"] = function(interval, action)
		wait.make(function()
			Execute(action)
			wait.time(tonumber(interval))
			h_ok()
		end)
	end,
	
	["k1"] = function(name)
		EnableTriggerGroup("fight", true)
		var.blocker_id = block_npcs[name]
		if(blocker_id ~= nil) then
			fight.start("kill " .. blocker_id)
		else
			h_fail()
		end
	end,
	
	["gw"] = function()
		wait.make(function()
			Execute("e")
			local l, w = wait.regexp("^(> )*(�������ᶳ����׳���Ӳȱ�������)|(�������Ա����۵����㿴�����滯�������ǳ˴��ɣ�)$")
			if(l and string.match(l, "�������ᶳ����׳���Ӳȱ�������")) then
				Execute("e")
				h_ok()
			else
				Execute("give 1 gold to chuan fu")
				l, w = wait.regexp("^(> )*(���ܿ�ͣ���˰�����̧�ſ��������)|(������û������������)|(����û������ˡ�)$")
				if(l and string.match(l, "���ܿ�ͣ���˰�")) then
					h_ok()
				else
					h_fail()
				end
			end
		end)
	end,
	
	["w"] = function()
		
	end,
	
	blocker_dead = function()
		h_ok()
	end
	
	
}
