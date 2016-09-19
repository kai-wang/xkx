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
	
	local l, w = wait.regexp("^    这里.*出口是(.*)。$", 1)
	if w ~= nil and w[1] ~= nil then
		for dir in string.gmatch(w[1], "%a+") do
			--print(dir)
			table.insert(exits, trans_map[dir])
		end
	end

	return exits
end

function nextexit(from, tbl)
	local calculate_dir = function(dir)
		local magic_table = {
			["e"] = {"n", "e", "s", "w"},
			["w"] = {"s", "w", "n", "e"},
			["s"] = {"e", "s", "w", "n"},
			["n"] = {"w", "n", "e", "s"}
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
			if v == n then 
				print("found direction : " .. v)
				return v 
			end
		end
	end

	return tbl[1]
end

function walk()
	if(last_step == "") then
		Execute("look")
		print("look ")
	end

	local exits_tbl = findexits()
	--tprint(exits_tbl)
	--print("from " .. last_step)
	last_step = nextexit(last_step, exits_tbl)
	--print("to " .. last_step)
	if(last_step ~= "" and not context.stop) then
		Execute(last_step)
		--print("walk to : " .. last_step)
		wait.time(0.3)
		Execute("set maze walk")
		local l, w = wait.regexp("^(> )*设定环境变数：maze = \"walk\".*$")
		if(l ~= nil) then
			if(var.maze_block ~= "1") then
 				walk()
			else
				core.salfehalt(function()
					walk()
				end, 1)
			end
		end
	else
		local l, w = wait.regexp("^(> )*设定环境变数：maze = \"resume\".*$")
		walk()
	end
end

function stop()
	context.stop = true
end

function resume()
	context.stop = false
	Execute("set maze resume")
end

init()