module ("maze", package.seeall)

local basedir = "/Users/simao/Workspace/mud/xkx/"
local libdir = basedir .. "lib/"
local command = "ls " .. basedir .. "mods/maps/*.json"
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

function createRoom(dir)
    if(dir == nil or dir == "") then return end

    local backdir = directions[dir]
    if(backdir == nil or backdir == "") then return end

    local room = currentRoom
    if(not room) then
        room = init()
    end

    if(not room["links"][dir]) then
        local newRoom = {}
        newRoom.id = #roomAll + 1
        newRoom["links"] = {}
        room["links"][dir] = { ["to"] = newRoom.id }
        newRoom["links"][backdir] = { ["to"] = room.id }
        roomAll[newRoom.id] = newRoom

        print("create room -- " .. newRoom.id)
    end

end

    local data = {
        "这里明显的出口是 south、westup、northup 和 east。",
        "这里明显的出口是 south、westup、northup 和 east。",
        "这里明显的出口是 south、westup、northup 和 east。",
        "这里明显的出口是 south、westup、northup 和 east。",
        "这里明显的出口是 south、westup、northup 和 east。"
    }

function moveto(id)
    currentRoom = roomAll[id]
    string.gsub(data[id], "(%w+)", function(dir)
        createRoom(dirmaps[dir])
    end)
end

function init()
    roomAll = {}
    regions = {}
    local room = {}
    room.id = 1
    room["links"] = {}
    roomAll[room.id] = room
    currentRoom = room
    return room
end

function setup()
    for i = 1, #data do
        moveto(i)
    end

    print(JSON:encode_pretty(roomAll))
end

function bfs()
    local unwalked = {}

end

function find_path(rooms, start, destination)

	local make_particle = function(curr_loc, path)
		--particle_count = particle_count + 1
		local path = path or {}
		return {current_room=curr_loc, path=path}
	end

	local dup_table = function(t)
		local new_t = {}
        for k, v in ipairs(t) do
            table.insert(new_t, v)
        end
        --[[
		table.foreachi (t, function (k, v)
			table.insert (new_t, v)
		end)
        ]]--

		return new_t
	end

	local explored_rooms, particles = {}, {}

	-- create particle for the initial room
	table.insert(particles, make_particle(start))

	while #particles > 0 do

		-- give birth to new lot of particles, based on where the existing ones lead
		local new_generation = {}

		-- consider each active particle, see where it goes
		for i, part in ipairs(particles) do
			-- if room doesn't exist, forget it
			if rooms[part.current_room] then
				-- where this one can go (gives birth to one per exit)
				local exits = rooms[part.current_room].links
				--tprint(exits)
				-- make one per possible exit
				for dir, dest in pairs(exits) do
					-- if we have been there before, drop it, don't need to reconsider
					if not explored_rooms[dest.to] then
						explored_rooms[dest.to] = true
						local new_path = dup_table(part.path)

						if dest.con == nil or dest.con == "" then
							table.insert(new_path, dir)
						else
						--新的格式为|aw:3:flatter 星宿老仙:n|
							table.insert(new_path, "|!" .. dest.con .. ":" .. dir .. "|")
						--[[ 以下代码适配老的walk，格式为[aw:3:flatter 星宿老仙]n
							if(string.find(dest.con, ":")==nil) then
								table.insert(new_path, dest.con..";"..dir)
							else
								table.insert(new_path, "["..dest.con.."]"..dir)
							end
						]]
						end

						-- if the destination is where we want to go, we now know how to get there
						if dest.to == destination then
							return new_path
						end -- found it!

						-- make a new particle in the new room
						table.insert(new_generation, make_particle(dest.to, new_path))
					end
				end -- for end
			end -- if room exists in table
		end -- doing each existing particle

		particles = new_generation
	end -- while end
end -- function find_path

setup()

print(JSON:encode_pretty(find_path(roomAll, 2, 21)))