require "wait"
require "tprint"
require "var"

module ("item", package.seeall)

local sell_list, store_list, drop_list = {}

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


function getColourName(style, item)
	for i, v in ipairs(style) do
		if(v.text == item) then
			return RGBColourToName(v.textcolour)
		end
	end
end
