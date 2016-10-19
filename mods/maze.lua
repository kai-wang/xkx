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

local handlers = {
	["step"] = function()
	end
}
function main(f_ok, f_fail)
end

function loop()
	wait.make(function()
		local l, w
		repeat
			l, w = wait.regexp("^(> )*设定环境变数：maze = \"(.*))\".*$")
			if(w[2] ~= "exit") then
				invoke(w[2])
			end
		until (w[2] == "exit")
		exit()
	end)
end
function process(l, w, n)
end

function exit()
	DeleteTempraryTriggers()
end

function step()
	if(walk_stop) then return end

	if(not walk_block) then 
		walk_index = walk_index + 1
	end

	if(walk_index > #walk_tbl) then
		walk()
	else
		wait.time(0.1)
		Execute(walk_tbl[walk_index])
		Execute("set maze step")
	end
end

function walk()
	walk_index = 0
	walk_block = false
	walk_tbl = findnextroom()
	if(#walk_tbl >= 0) then
		step()
	else
		exit()
	end
end

function resume()
	Execute("set maze step")
end

function stop()
	local l, w = wait.regexp("^(> )*设定环境变数：maze = \"resume\".*$")
	if(l) then
		walk()
	end
end

function resume()
	Execute("set maze resume")
end


function walk()
	local tbl = findunwalked()
	if(not tbl or #tbl = 0) then
		print("no unwalked rooms")
		return
	end

	local step, i = nil, 1
	step = function()
		if(i > #tbl) then
			walk()
		else
			Execute(tbl[i].path)
			Execute("set maze step")
			local l, w = wait.regexp("^(> )*设定环境变数：maze = \"step\".*$")
			if(l and not context.block) then
				i = i + 1
				context.current_room = tbl[i].id
				wait.time(0.2)
			end
			return step()
		end
	end

	step()
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