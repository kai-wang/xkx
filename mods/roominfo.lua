--[[
1、获取房间名称、描述、方向、npc
2、有些描述可能会含有天气描述，基本判定为方向描述的上一行含有特殊字段的，比如风雨，因为没有详细描述可能不准确
3、对于不准确的描述可以通过调用add_w或del_w来增加或删除
3、需要全局变量ways获取出路建立18个出发器
4、使用举例
	直接调用/get_room_info()获取房间描述信息
]]--

require "wait"
require "tprint"
require "serialize"

--"这里唯一的出口是 ([a-z]+)。|这里明显的出口是 ([a-z]+) 和 ([a-z]+)。|这里明显的出口是 ([a-z]+)、([a-z]+) 和 ([a-z]+)。|这里明显的出口是 ([a-z]+)、([a-z]+)、([a-z]+) 和 ([a-z]+)。|这里明显的出口是 ([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+) 和 ([a-z]+)。|这里明显的出口是 ([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+) 和 ([a-z]+)。"
--"这里没有任何明显的出路|这里唯一的出口是 ([a-z]+)。|这里明显的出口是 ([a-z]+) 和 ([a-z]+)。|这里明显的出口是 ([a-z]+)、([a-z]+) 和 ([a-z]+)。|这里明显的出口是 ([a-z]+)、([a-z]+)、([a-z]+) 和 ([a-z]+)。|这里明显的出口是 ([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+) 和 ([a-z]+)。|这里明显的出口是 ([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+) 和 ([a-z]+)。|这里明显的出口是 ([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+) 和 ([a-z]+)。|这里明显的出口是 ([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+) 和 ([a-z]+)。"
--"夕阳|夜幕"
--rooms = {}
wk_room = {}

local name_desc = "^(> )*(.*) - $"
--local exits_desc = "^\s{4}这里没有任何明显的出路|这里唯一的出口是 ([a-z]+)。|这里明显的出口是 ([a-z]+) 和 ([a-z]+)。|这里明显的出口是 ([a-z]+)、([a-z]+) 和 ([a-z]+)。|这里明显的出口是 ([a-z]+)、([a-z]+)、([a-z]+) 和 ([a-z]+)。|这里明显的出口是 ([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+) 和 ([a-z]+)。|这里明显的出口是 ([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+) 和 ([a-z]+)。|这里明显的出口是 ([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+) 和 ([a-z]+)。|这里明显的出口是 ([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+)、([a-z]+) 和 ([a-z]+)。$"
local exits_desc = "^\s{4}这里没有任何明显的出路|这里唯一的出口是 ([0-9a-z]+)。|这里明显的出口是 ([0-9a-z]+) 和 ([0-9a-z]+)。|这里明显的出口是 ([0-9a-z]+)、([0-9a-z]+) 和 ([0-9a-z]+)。|这里明显的出口是 ([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+) 和 ([0-9a-z]+)。|这里明显的出口是 ([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+) 和 ([0-9a-z]+)。|这里明显的出口是 ([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+) 和 ([0-9a-z]+)。|这里明显的出口是 ([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+) 和 ([0-9a-z]+)。|这里明显的出口是 ([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+) 和 ([0-9a-z]+)。|这里明显的出口是 ([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+)、([0-9a-z]+) 和 ([0-9a-z]+)。$"
local weather_desc = "(起风|雨|雷|电|夕阳|太阳|春|夏|秋|冬|夜幕|天空|晨星|雪色|正午|天阴|呼呼|空气|冰冷)"
--local npc_desc = "^\s{4}(\S+)\(([a-zA-Z]+)\s([a-zA-Z]+)\)$|^(> )*设定环境变数：look = \"YES\"$"
local npc_desc = "^\\s{4}(\\S*)\\(([a-zA-Z]+) ([a-zA-Z]+)\\)$"


function get_room_info()
	local room = {}

	---获取房间名称/描述/出口
	wait.make(function()
		print("开始获取房间描述, 输入look")
		local l,w = wait.regexp(name_desc)
		if(l ~= nil) then
			room.name = w[2]
			local nameline = GetLinesInBufferCount()
			l,w = wait.regexp(exits_desc)
			if(l ~= nil) then
				local exitsline = GetLinesInBufferCount()
				local exits = ""
				--local id = 1
				for i,v in ipairs(w) do
					if(v ~= nil and v ~= "") then
						if(exits ~= "") then exits = exits .. "|" .. v else exits = v end
					end
				end

				room.exits = exits
				room.desc = ""
				-- 获取房间描述
				local re = rex.new(weather_desc)
				for i=nameline+1, exitsline-1 do
					local text = GetLineInfo(i).text
					if(i < exitsline-1) then
						room.desc = room.desc .. text-- .. "\n"
					else
						local r1,r2,r3 = re:match(text)
						--含有关键字并且开头是4个空格
						if(r3 ~= nil and string.sub(text,1,4) == "    ") then
							print("屏蔽天气描述>>>>>> "..text .. " <<<<<<")
						else
							room.desc = room.desc .. text
						end
					end
				end

				wk_room =  room
			end
		end
	end)
end


function on_npc_info(name, line, wildcards)
	local npc = {}
	npc.name = wildcards[1]
	npc.id = string.lower(wildcards[2]) .. " " .. string.lower(wildcards[3])
	if(wk_room ~= nil) then
		if(wk_room.npcs == nil) then
			wk_room.npcs = {}
		end
		table.insert(wk_room.npcs, npc)
	end
end


function getroomready(callback)
	wk_room = {}
	get_room_info()

	Execute("look;set look;")

	--Execute("look;set look;")
	wait.make(function()
		local l, w = wait.regexp("^(> )*设定环境变数：look = \"YES\"$")
		if(l ~= nil and wk_room ~= {}) then
			print("获取房间信息成功")
			if(callback ~= nil) then
				callback(wk_room)
			end
		end
	end)
end


function getroomready2(lookcmd, callback)
	wk_room = {}
	get_room_info()

	print(lookcmd)
	Execute(lookcmd .. ";set look;")

	--Execute("look;set look;")
	wait.make(function()
		local l, w = wait.regexp("^(> )*设定环境变数：look = \"YES\"$")
		if(l ~= nil and wk_room ~= {}) then
			print("获取房间信息成功")
			if(callback ~= nil) then
				callback(wk_room)
			end
		end
	end)
end


function del_npc(id)
	for i, v in ipairs(wk_room.npcs) do
		if v.id == id then
			table.remove(wk_room.npcs, i)
		end
	end

	tprint(wk_room.npcs)
end


function saveroom()
	print ((serialize.save ("wk_room")))
end
