require "wait"
require "tprint"
require "var"

module ("item", package.seeall)

local sell_list, store_list, drop_list, item_list = {}, {}, {}, {}
local item_name = "µ¶|½£|Õë|ÇÙ|¸«|ÕÈ|¼×|ÅÛ|Ñ¥|Ã±|ÒÂ"

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
		print("item: " .. item .. " id: " .. item_id .. " ÑÕÉ«: " .. color)
	else
		print("item: " .. item .. " id: " .. item_id)
	end
end

function record2(name,line,wildcards,style)
	local item, item_id = wildcards[1], string.lower(wildcards[2])
	local color = getColourName(style, item)
	
	if(color ~= nil) then
		item_list[item] = {["id"]=item_id, ["name"]=item, ["color"]=color}
		print("item: " .. item .. " id: " .. item_id .. " ÑÕÉ«: " .. color)
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
		if(string.find(v.text, "µ¶|½£|Õë|ÇÙ|¸«|ÕÈ|¼×|ÅÛ|Ñ¥|Ã±|ÒÂ") ~= nil) then
			print(v.text, RGBColourToName(v.textcolour))
			return v.text, RGBColourToName(v.textcolour)
		end
	end
	
	return nil
end


function getColourName(style, item)
	for i, v in ipairs(style) do
		if(item:find(v.text) ~= nil) then
			return RGBColourToName(v.textcolour)
		end
	end
end
