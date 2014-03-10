require "wait"
require "tprint"
require "var"

module ("item", package.seeall)

local sell_list, store_list, drop_list, item_list = {}, {}, {}, {}
local eat_items = {"������","�˲�","��ɽ��","�����ߵ�","�ܵ�"}
local jicun_items = {"��ת����","��ת��"}
local store_items = {"������","������","�ɵ�","������"}

function lookandget(f_done)
	var.item_store_list = ""
	var.item_sell_list = ""
	var.item_drop_list = ""
	var.item_eat_list = ""
	var.item_jicun_list = ""
	
	wait.make(function()
		EnableTriggerGroup("item", true)
		Execute("look corpse;get all from corpse;set get ok")
		local l, w = wait.regexp("�趨����������get = \"ok\"")
		EnableTriggerGroup("item", false)
		
		if(var.item_eat_list ~= nil and var.item_eat_list ~= "") then Execute(var.item_eat_list) end
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
	local item, id-- = wildcards[1]
	--local id = string.lower(wildcards[3])
	--tprint(wildcards)
	if(wildcards[3] ~= nil and wildcards[3] ~= "") then
		item, id = wildcards[3], string.lower(wildcards[8])
		sort(item, id, style)
	elseif(wildcards[7] ~= nil and wildcards[7] ~= "") then
		item, id = wildcards[7], string.lower(wildcards[8])
		for i, v in ipairs(eat_items) do 
			if(item:match(v)) then addtolist("eat", id) return end
		end
		
		for i,v in ipairs(store_items) do
			if(item:match(v)) then addtolist("store", id) return end
		end
		
		for i, v in ipairs(jicun_items) do
			if(item:match(v)) then addtolist("jicun", id) return end
		end

		if(item:match("����") == nil and item:match("�ƽ�") == nil and item:match("����") == nil and item:match("��Ʊ") == nil ) then
			addtolist("drop", id)
		end
	end
end

function sort(item, id, style)
	local color = getColourName(style, item)
	--�׵ģ����ģ��Ƶ�װ������
	if(color == "white" or color == "blue" or color == "yellow") then
		addtolist("sell", id)
	elseif(color == "red" or color == "magenta") then
	--��ģ��ϵ�����
		addtolist("store", id)
	else
	--�������ӵ�
		addtolist("drop", id)
	end
end


function addtolist(action, id)
	if(action == "sell") then
		if(var.item_sell_list == nil) then var.item_sell_list = "" end
		var.item_sell_list = var.item_sell_list .. "give " .. id .. " to ouye zi;"
	elseif(action == "store") then 
		if(var.item_store_list == nil) then var.item_store_list = "" end
		var.item_store_list = var.item_store_list .. "give " .. id .. " to byj;"-- .. var.dami_equip .. ";"
	elseif(action == "drop") then
		if(var.item_drop_list == nil) then var.item_drop_list = "" end
		var.item_drop_list = var.item_drop_list .. "drop " .. id .. ";"
	elseif(action == "eat") then
		if(var.item_eat_list == nil) then var.item_eat_list = "" end
		var.item_eat_list = var.item_eat_list .. "eat " .. id .. ";"
	elseif(action == "jicun") then
		if(var.item_jicun_list == nil) then var.item_jicun_list = "" end
		var.item_jicun_list = var.item_jicun_list .. "jicun " .. id .. ";"
	end
end


function getColourName(style, item)
	for i, v in ipairs(style) do
		if((v.text):find(item) ~= nil) then
			return RGBColourToName(v.textcolour)
		end
	end
end