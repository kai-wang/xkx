module ("maze", package.seeall)

local basedir = "/Users/simao/Workspace/mud/xkx/"
local libdir = basedir .. "lib/"
local command = "ls " .. basedir .. "mods/json/*.json"
local JSON = (loadfile (libdir .. 'JSON.lua'))()

local regions, roomAll = {}, {}
local currentRoom = nil

directions = {
	["n"]="s",
	["s"]="n",
	["w"]="e",
	["e"]="w",
	["u"]="d",
	["d"]="u",
	["ne"]="sw",
	["nw"]="se",
	["nu"]="sd",
	["nd"]="su",
	["se"]="nw",
	["sw"]="ne",
	["su"]="nd",
	["sd"]="nu",
	["wu"]="ed",
	["wd"]="eu",
	["eu"]="wd",
	["ed"]="wu",
	["enter"]="out",
	["out"]="enter"
}

dirmaps = {
	["n"]="north",
	["s"]="south",
	["w"]="west",
	["e"]="east",
	["u"]="up",
	["d"]="down",
	["ne"]="northeast",
	["nw"]="northwest",
	["nu"]="northup",
	["nd"]="northdown",
	["se"]="southeast",
	["sw"]="southwest",
	["su"]="southup",
	["sd"]="southdown",
	["wu"]="westup",
	["wd"]="westdown",
	["eu"]="eastup",
	["ed"]="eastdown",
	["north"]="n",
	["south"]="s",
	["west"]="w",
	["east"]="e",
	["up"]="u",
	["down"]="d",
	["northeast"]="ne",
	["northwest"]="nw",
	["northup"]="nu",
	["northdown"]="nd",
	["southeast"]="se",
	["southwest"]="sw",
	["southup"]="su",
	["southdown"]="sd",
	["westup"]="wu",
	["westdown"]="wd",
	["eastup"]="eu",
	["eastdown"]="ed"
}

function load(filename)
    local file = io.open(filename, "r")
    local content = file:read("*all")
    local area = JSON:decode(content)
    file:close()

    regions[area.id] = area
    regions[area.name] = area

    for i, v in ipairs(area.rooms) do
        roomAll[v.id] = v
    end
end

function loadAll()
    regions = {}
    roomAll = {}

    for filename in io.popen(command):lines() do
        load(filename)
    end

    for i, v in ipairs(roomAll) do
        if v.path == "" then
            print("房间路径为空 id: " .. v.id .. " name: " .. v.name )
        end
    end
end

function create()
    local l = "    这里明显的出口是 south、westup、northup 和 east。"
    print(string.match(l, "%w"))
end

function createRooms(dir)
    if(dir == nil or dir == "") then return end

    local backdir = directions[dir]
    if(backdir == nil or backdir == "") then return end

    local room = currentRoom
    if(not room) then
        room = {}
        room.id = 1
        room["links"] = {}
        roomAll[room.id] = room
        currentRoom = room
    end

    if(not room["links"][dir]) then
        local newRoom = {}
        newRoom.id = #roomAll + 1
        newRoom["links"] = {}
        room["links"][dir] = { ["to"] = newRoom.id }
        newRoom["links"][backdir] = { ["to"] = room.id }
        roomAll[newRoom.id] = newRoom
    end

end

function moveto(id)
    currentRoom = roomAll[id]
end

function test()
    local l = "    这里明显的出口是 south、westup、northup 和 east。"
    string.gsub(l, "(%w+)", function(dir)
        createRooms(dirmaps[dir])
    end)
--[[
    createRooms("e")
    moveto(2)
    createRooms("w")
    moveto(3)
    createRooms("s")
    moveto(4)
    createRooms("n")
]]--
    print(JSON:encode_pretty(roomAll))
end

test()