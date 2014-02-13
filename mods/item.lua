require "wait"
require "tprint"
require "var"

module ("item", package.seeall)

local sell_list, store_list, drop_list, item_list = {}, {}, {}, {}
local item_name = "��|��|��|��|��|��|��|��|ѥ|ñ|��"


function lookandget(f_done)
	var.item_store_list = ""
	var.item_sell_list = ""
	var.item_drop_list = ""
	
	wait.make(function()
		EnableTriggerGroup("item", true)
		Execute("look corpse;get all from corpse;set get ok")
		local l, w = wait.regexp("�趨����������get = \"ok\"")
		EnableTriggerGroup("item", false)
		
		if(var.item_drop_list ~= nil and var.item_drop_list ~= "") then Execute(var.item_drop_list) end
		if(var.item_sell_list ~= nil and var.item_sell_list ~= "") then Execute("fly wm;u;" .. var.item_sell_list) end
		if(var.item_store_list ~= nil and var.item_drop_list ~= "") then Execute("fly wm;nw") Execute(var.item_store_list) end
		call(f_done)
	end)
end

function match1(name, line, wildcards, style)
	local item = wildcards[3]
	local id = string.lower(wildcards[5])
	
	sort(item, id, style)
end


function match2(name, line, wildcards, style)
	local item = wildcards[1]
	local id = string.lower(wildcards[3])
	
	sort(item, id, style)
end

function sort(item, id, style)
	local color = getColourName(style, item)
	--�׵ģ����ģ��Ƶ�װ������
	if(color == "white" or color == "blue" or color == "yellow") then
		if(var.item_sell_list == nil) then var.item_sell_list = "" end
		var.item_sell_list = var.item_sell_list .. "give " .. id .. " to ouye zi;"
	elseif(color == "red" or color == "magenta") then
	--��ģ��ϵ�����
		if(var.item_store_list == nil) then var.item_store_list = "" end
		var.item_store_list = var.item_store_list .. "give " .. id .. " to byj;"-- .. var.dami_equip .. ";"
	else
	--�������ӵ�
		if(var.item_drop_list == nil) then var.item_drop_list = "" end
		var.item_drop_list = var.item_drop_list .. "drop " .. id .. ";"
	end
end

--[[
function process(f_done)
	wait.make(function()
		Execute("halt;fly wm;u")
		if(var.item_sell_list ~= nil and var.item_sell_list ~= "") then Execute(var.item_sell_list) end
		if(var.item_drop_list ~= nil and var.item_drop_list ~= "") then Execute(var.item_drop_list) end
		if(var.item_store_list ~= nil and var.item_drop_list ~= "") then Execute("fly wm;nw") Execute(var.item_store_list) end
		
		if(f_done ~= nil) then f_done() end
	end)
end
]]--

function getColourName(style, item)
	for i, v in ipairs(style) do
		if((v.text):find(item) ~= nil) then
			return RGBColourToName(v.textcolour)
		end
	end
end
