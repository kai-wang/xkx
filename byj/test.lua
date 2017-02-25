
regions = {}
roomAll = {}

local JSON = (loadfile ("/Users/simao/workspace/mud/xkx/lib/JSON.lua"))()

assert(JSON ~= nill)

load = function(room)
	local filename = room 
    local file = io.open(filename, "r")
    local content = file:read("*all")
    local area = JSON:decode(content)
    print(area)
    file:close()

    regions[area.id] = area
    regions[area.name] = area
    for i, v in ipairs(area.rooms) do
        print(v.name)
        
		if v.name:find("(树林|草地|森林|星宿海|密林)") then print(v.id .. ' ' .. v.name) end
        roomAll[v.id] = v
    end
end
--[[
.local re = rex.new("(草地|密林|树林|森林)") for i, v in pairs(roomAll["扬州"].room) do local r1,r2,r3=re:match(v.name) if(r3) then print(v.id .. ' ' .. v.name) end end
.local re = rex.new("(草地|密林|树林|森林)") for i, v in pairs(roomAll["扬州"].room) do local r1,r2,r3=re:match(v.name) if(r3) then print(v.id .. ' ' .. v.name) end end
]]--
--[[
--读取所有房间
loadall = function()

	local command = "ls /Users/simao/workspace/mud/xkx/mods/maps/*.json"

    regions = {}
    roomAll = {}
	
    for filename in io.lines(tmpfile) do
        load(filename)
    end

	-- remove temporary file

    for i, v in ipairs(roomAll) do
        if v.path == "" then
            print("房间路径为空 id: " .. v.id .. " name: " .. v.name )
        end
    end
end

loadall()
]]--
--load("/Users/simao/workspace/mud/xkx/mods/maps/dl.json")

local t = math.pow(2,63)

print(t)