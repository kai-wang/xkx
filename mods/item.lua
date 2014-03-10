require "wait"
require "tprint"
require "var"

module ("item", package.seeall)

local sell_list, store_list, drop_list, item_list = {}, {}, {}, {}
local eat_items = {"何首乌","人参","老山参","新鲜蛇胆","熊胆"}
local jicun_items = {"九转银丹","九转金丹"}
local store_items = {"菩提子","美容丸","仙丹","神力丸"}

function lookandget(f_done)
	var.item_store_list = ""
	var.item_sell_list = ""
	var.item_drop_list = ""
	var.item_eat_list = ""
	var.item_jicun_list = ""
	
	wait.make(function()
		EnableTriggerGroup("item", true)
		Execute("look corpse;get all from corpse;set get ok")
		local l, w = wait.regexp("设定环境变数：get = \"ok\"")
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

		if(item:match("白银") == nil and item:match("黄金") == nil and item:match("金条") == nil and item:match("银票") == nil ) then
			addtolist("drop", id)
		end
	end
end

function sort(item, id, style)
	local color = getColourName(style, item)
	--白的，蓝的，黄的装备卖掉
	if(color == "white" or color == "blue" or color == "yellow") then
		addtolist("sell", id)
	elseif(color == "red" or color == "magenta") then
	--红的，紫的留着
		addtolist("store", id)
	else
	--其他的扔掉
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