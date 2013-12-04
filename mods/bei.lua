require "wait"
require "tprint"
require "var"

module ("bei", package.seeall)

local bei_info = {}
local task1 = dofile("worlds\\xkx\\mods\\task1.lua")


function task1_init(name, line, wildcards)
	var.bei_npc = wildcards[2]
	print(var.bei_npc)
	EnableTriggerGroup("bei_task1",true)
	bei_info.start = true
	bei_info.task1 = {}
end

function log_task1(name, line, wildcards, style)
	local str = ""
	for i, v in ipairs(style) do
		if(RGBColourToName(v.textcolour) == "yellow") then
			str = str .. (v.text):gsub("#","1")
		else
			str = str .. (v.text):gsub("#","0")
		end
	end

	table.insert(bei_info.task1, str)
end

function task1_end()
	EnableTriggerGroup("bei_task1",false)
	if(bei_info.task1 == {}) then
		return
	else
		parse()
	end
end

---------保存一下task1的内容--------------------------
function save(name)
	table.insert(task1, {["name"]=name, ["text"]=bei_info.task1})
	local content = serialize.save("task1", task1)
	local file = io.open("worlds\\xkx\\mods\\task1.lua", "w")
	file:write("local " .. content)
	file:write("\r\nreturn task1")
	file:close()
end

