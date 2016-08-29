require "wait"
require "tprint"
require "utils"
require "string"

module ("maze", package.seeall)

local last_step = ""
local trans_map = {
	["east"] = "e",
	["west"] = "w",
	["south"] = "s",
	["north"] = "n",
	["down"] = "d",
	["up"] = "u"
}

local context = {}

function main(f_ok, f_fail)
end

function start()
	wait.make(function()
		context.stop = false
		walk()
	end)
end

function init()
	context = {}
end

function findexits()
	local exits = {}
	Execute("look")
	local l, w = wait.regexp("^    这里明显的出口是(.*)。$", 1)
	if l then
		for w in string.gmatch(l, "%a+") do
			table.insert(exits, trans_map[w])
		end
	end
	return exits
end

function nextexit(from, tbl)
	local calculate_dir = function(dir)
		local magic_table = {
			["e"] = {"d", "s", "e", "n", "w"},
			["w"] = {"d", "n", "w", "s", "e"},
			["s"] = {"d", "w", "s", "e", "n"},
			["n"] = {"d", "e", "n", "w", "s"},
		}
		if(magic_table[dir] == nil) then 
			return {} 
		else
			return magic_table[dir]
		end
	end

	local exits = calculate_dir(from)
	for k, v in ipairs(exits) do
		for m, n in ipairs(tbl) do
			if v == n then return v end
		end
	end

	return ""
end

function walk()
	if(last_step == "") then
		Execute("look")
	end

	last_step = nextexit(last_step, findexits())
	if(last_step ~= "" and not context.stop) then
		Execute(last_step)
		print("walk to : " .. last_step)
		wait.time(0.5)
		walk()
	end
end

function stop()
	context.stop = true
end

function resume()
	context.stop = false
	walk()
end

init()