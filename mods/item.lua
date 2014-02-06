require "wait"
require "tprint"
require "var"

module ("item", package.seeall)

local sell_list, store_list, drop_list, item_list = {}, {}, {}, {}
local item_name = "��|��|��|��|��|��|��|��|ѥ|ñ|��"

function lookandget()
	sell_list = {}
	store_list = {}
	drop_list = {}
	item_list = {}
	
	EnableTriggerGroup("item", true)
	Execute("look corpse;get all from corpse")
	Execute("set get")
end

function done()
	EnableTriggerGroup("item", false)
	me.package.sell_list = sell_list
	me.package.store_list = store_list
end

function record(name, line, wildcards, style)
	--local item, color = getColourItem(style)
	local item, item_id = wildcards[3],	string.lower(wildcards[4])
	local color = getColourName(style, item)
	print(item, item_id, color)
	if(color ~= nil) then
		item_list[item] = {["id"]=item_id, ["name"]=item, ["color"]=color}
		print("item: " .. item .. " id: " .. item_id .. " ��ɫ: " .. color)
	else
		print("item: " .. item .. " id: " .. item_id)
	end
end

function record2(name,line,wildcards,style)
	local item, item_id = wildcards[1], string.lower(wildcards[2])
	local color = getColourName(style, item)
	
	if(color ~= nil) then
		item_list[item] = {["id"]=item_id, ["name"]=item, ["color"]=color}
		print("item: " .. item .. " id: " .. item_id .. " ��ɫ: " .. color)
	end
end

function classify(name, line, wildcards, style)
	local item = wildcards[3]
	local color = item_list[item].color
	if(color == "yellow" or color == "white" or color == "blue") then
		table.insert(sell_list, item_list[item])
	else
		table.insert(me.package.store_list, item_list[item])
	end
end

function classify2(name, line, wildcards, style)
	local item = wildcards[2]
	local color = item_list[item].color
	if(color == "yellow" or color == "white" or color == "blue") then
		table.insert(sell_list, item_list[item])
	else
		table.insert(me.package.store_list, item_list[item])
	end
end

function test(name, line, wildcards, style)
	local item = wildcards[3]
	local id = string.lower(wildcards[5])
	
	local color = getColourName(style, item)
	if(color == "white" or color == "blue" or color == "yellow") then
		if(var.item_sell_list == nil) then var.item_sell_list = "" end
		var.item_sell_list = var.item_sell_list .. "give " .. id .. " to ouye zi;"
	elseif(color == "red" or color == "magenta") then
		if(var.item_store_list == nil) then var.item_store_list = "" end
		var.item_store_list = var.item_store_list .. "give " .. id .. " to byj;"-- .. var.dami_equip .. ";"
	else
		if(var.item_drop_list == nil) then var.item_drop_list = "" end
		var.item_drop_list = var.item_drop_list .. "drop " .. id .. ";"
	end		
end

function get(name, line, wildcards, style)
	local item, item_id = wildcards[1], string.lower(wildcards[2])

	local color = getColourName(style, item)
	if(color == nil) then
		Execute("drop " .. item_id)
	else
		if(color == "white" or color == "blue") then
			table.insert(sell_list, item_id)
		end
	end

	tprint(sell_list)
end


function getColourItem(style)
	for i, v in ipairs(style) do
		print(v.text)
		if(string.find(v.text, "��|��|��|��|��|��|��|��|ѥ|ñ|��") ~= nil) then
			print(v.text, RGBColourToName(v.textcolour))
			return v.text, RGBColourToName(v.textcolour)
		end
	end
	
	return nil
end


function getColourName(style, item)
	for i, v in ipairs(style) do
		if((v.text):find(item) ~= nil) then
			return RGBColourToName(v.textcolour)
		end
	end
end
