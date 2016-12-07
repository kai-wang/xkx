require "wait"
require "tprint"
require "var"

module ("item", package.seeall)

local sell_list, store_list, drop_list, eat_list = {}, {}, {}, {}
local eat_items = {"������","�˲�","��ɽ��","�����ߵ�","�ܵ�"}
local jicun_items = {"��ת����","��ת��"}
local store_items = {"������","������","�ɵ�","������"}--,"���","���","�鱦","����","����","ˮ��"}
local keep_items = {"����","�ƽ�","����","��Ʊ","����ͭ��","����","�ۻ�","����","����Ӣ����","������","�߲��Թ���ͼ"}

function init() 
	sell_list = {}
	store_list = {}
	drop_list = {}
	eat_list = {}
end

function eat(f)
	for i = 1, #eat_list do
		wait.time(0.1)
		Execute("eat " .. eat_list[i])
	end
	call(f)
end

function sell(f)
	for i = 1, #sell_list do
		wait.time(0.1)
		Execute("give " .. sell_list[i] .. "to ouye zi")
	end
	call(f)
end

function drop(f)
	for i = 1, #drop_list do
		wait.time(0.1)
		Execute("drop " .. drop_list[i])
	end
	call(f)
end

function store(f)
	call(f)
end

function lookandget(f_done)
	init()

	wait.make(function()
		EnableTriggerGroup("item", true)
		Execute("look corpse;get all from corpse;set check item")
		local l, w = wait.regexp("^(> )*�趨����������check = \"item\"$")
		EnableTriggerGroup("item", false)
		wait.time(1)

		core.safeback(function()
			Execute("u")
			drop(function() 
				eat(function()
					sell(function() 
						store(function() 
							if(var.fast_mode == "1") then wait.time(1) end
							call(f_done) 
						end)
					end) 
				end) 
			end)
		end)
	end)
end

function match1(name, line, wildcards, style)
	local item = wildcards[3]
	local id = string.lower(wildcards[5])
	
	sort(item, id, style)
end

function match2(name, line, wildcards, style)
	local item, id
	if(wildcards[3] ~= nil and wildcards[3] ~= "") then
		item, id = wildcards[3], string.lower(wildcards[8])
		if(wildcards[2] == "����") then addtolist("drop", id) return end
		sort(item, id, style)
		return
	end

	if(wildcards[7] ~= nil and wildcards[7] ~= "") then
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

		for i, v in ipairs(keep_items) do
			if(item:match(v)) then return end
		end
		
		addtolist("drop", id)
	end
end

function sort(item, id, style)
	local color = getColourName(style, item)
	--�׵ģ����ģ��Ƶ�װ������
	if(color == "white" or color == "blue" or color == "yellow") then
		addtolist("drop", id)
	elseif(color == "magenta" or color == "red") then
	--��ģ��ϵ�����
		addtolist("store", id)
	else
	--�������ӵ�
		addtolist("drop", id)
	end
end

function addtolist(action, id)
	if(action == "sell") then return table.insert(sell_list, id) end
	if(action == "drop") then return table.insert(drop_list, id) end
	if(action == "store") then return table.insert(store_list, id) end
end

--[[
function sort(item, id, style)
	local color = getColourName(style, item)
	--�׵ģ����ģ��Ƶ�װ������
	--or color == "yellow" or color == "red"
	if(color == "white" or color == "blue" or color == "yellow") then
		addtolist("sell", id)
		--color == "red" or 
	elseif(color == "magenta" or color == "red") then
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
		--var.item_sell_list = var.item_sell_list .. "give " .. id .. " to ouye zi;drop " .. id .. ";"
		-- just drop, not give
		var.item_sell_list = var.item_sell_list .. "drop " .. id .. ";"
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
]]--

function getColourName(style, item)
	for i, v in ipairs(style) do
		if((v.text):find(item) ~= nil) then
			return RGBColourToName(v.textcolour)
		end
	end
end