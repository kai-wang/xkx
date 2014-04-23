require "wait"
require "tprint"
require "utils"
require "serialize"
require "worlds\\xkx\\mods\\roominfo"

map = {}
regions = {}
roomAll = {}

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

--	用法：map create yz 扬州 1
map["create"] = function(id, name, cmd)
	if(regions[id] ~= nil or regions[name] ~= nil) then
		print("该区域已经存在")
	else
		local area = {["id"]=id, ["name"]=name, ["cmd"]=cmd}
		--area.rooms = {}
		regions[id] = area
		regions[name] = area
		map.currentRegion = name
	end
end


-- 	用法：map info
--	打印出当前所有的地图信息
map["info"] = function()
	local area = regions[map.currentRegion]
	if(area ~= nil) then
		print("当前地图信息：")
		tprint(area)
	end
end

--	用法1：map insert n/s
--	向n走一格，创建一个新的房间，同时把新房间与老房间连接起来
--	用法2：map insert
--	创建一个空的房间,无任何的方向连接
--	用法3：map insert n@wait:3/s@kill1
--	创建一个带条件的方向
map["insert"] = function(dir)

	if(map.currentRegion == nil) then
		print("定位不到当前区域，如果没有创建需要先创建map create")
		return
	end

	local area = regions[map.currentRegion]

	if(dir == nil or dir == "") then
		getroomready(function(newRoom)
			local room = newRoom
			local id = table.getn(roomAll) + 1
			room["id"] = id
			room["zone"] = area.name
			room["path"] = ""
			room["links"] = {}
			roomAll[id] = room
			map.prevRoom = map.currentRoom
			map.currentRoom = room
		end)
	else
		local room = map.currentRoom
		if(room == nil) then
			print("定位不到当前房间，如果房间没有创建需要先创建map insert")
			return
		end

		local re = rex.new ("([^@]*)@?([^@]*)/([^@]*)@?([^@]*)")
		local s, e, tt = re:match(dir)

		if(tt == nil) then
			print("insert 格式为：insert n/s 或 insert n/")
			return
		end

		local todir, tocon, backdir, backcon = tt[1], tt[2], tt[3], tt[4]
		if(backdir =="" ) then
			backdir = directions[todir]
		end

		--尝试的移动到房间，如果失败则创建
		if(map["move"](todir)) then return end

		Execute(todir..";set walk")

		wait.make(function()
			local l, w = wait.regexp("^(> )*设定环境变数：walk = \"YES\"$")
			if(l ~= nil) then
				getroomready(function(newRoom)
					--tprint(newRoom)
					newRoom.id = table.getn(roomAll) + 1
					newRoom["links"] = {}
					newRoom["zone"] = area.name
					newRoom["path"] = ""
					room["links"][todir] = {["to"]=newRoom.id, ["con"]=tocon}
					newRoom["links"][backdir] = {["to"]=room.id, ["con"]=backcon}
					roomAll[newRoom.id] = newRoom
					map.prevRoom = map.currentRoom
					map.currentRoom = newRoom
					print("创建新房间成功：【" .. map.currentRoom.name .. "】【" .. map.currentRoom.id .. "】")
				end)
			end
		end)

	end
end

--	用法:	move n
--	从当前房间移动到指定的房间
map["move"] = function(dir)

	local room = map.currentRoom
	for i, v in pairs (room.links) do
		if(i == dir) then
			print("移动到房间"..v.to)
			map.prevRoom = map.currentRoom
			map.currentRoom = roomAll[v.to]
			local zone = map.currentRoom["zone"]
			print("zone " .. zone)
			local zt = utils.split(zone, "|")
			local found = false
			for i, v in ipairs(zt) do
				if(map.currentRegion == v) then 
					found = true
				end
			end
			
			if(not found) then
			--if(zone ~= map.currentRegion) then
				--支持一个房间隶属于多个区域
				map.currentRoom["zone"] = zone .. "|" ..map.currentRegion
			end

			Execute(i)
			return true
		end
	end

	return false

end


--	用法：map look 武庙
--	查找房间id
map["lookup"] = function(name)
	local tbl = {}

	for i, v in ipairs(roomAll) do
		if v.name == name then
			table.insert(tbl, {["name"] = v.name, ["id"] = v.id})
		end
	end

	print("符合的房间有：")
	for i, v in ipairs (tbl) do
		print(v.name .. "  房间号：" .. v.id)
	end
end

--	用法: map vnum
--	返回当前所在房间的房间号
map["vnum"] = function(name)
	return map.currentRoom.name
end


--	用法 map delete
--	删除当前创建的房间，并设置上一个房间为当前房间，不退回上一个房间
map["delete"] = function()
	local id = map.currentRoom.id
	local links = map.prevRoom.links
	map.currentRoom = map.prevRoom

	roomAll[id] = nil
	for i, v in pairs(links) do
		if(v["to"] == id) then links[i] = nil end
	end
end

--	用法 map back
--	退回上一个房间，并删除当前创建的房间
map["back"] = function()
	local links = map.currentRoom.links

	for i, v in pairs(links) do
		if(v["to"] == map.prevRoom.id) then Execute(i) break end
	end

	map["delete"]()
end

--	设置当前房间号
map["setroom"] = function(id)
	map.currentRoom = roomAll[id]
end

--	双相连接 map bl n/s 10
--	或map bl n/ 10
map["bl"] = function(dir, num)
	local room = map.currentRoom
	if(room == nil) then
		print("定位不到当前房间，如果房间没有创建需要先创建map insert")
		return
	end

	local target = roomAll[num]
	if(room == nil) then
		print("定位不到目标房间")
		return
	end


	local re = rex.new ("([^@]*)@?([^@]*)/([^@]*)@?([^@]*)")
	local s, e, tt = re:match(dir)

	if(tt == nil) then
		print("bl 格式为：bl n/s 10 或 bl n/ 10")
		return
	end
	local todir, tocon, backdir, backcon = tt[1], tt[2], tt[3], tt[4]
	if(backdir == "" ) then
		backdir = directions[todir]
	end


	room["links"][todir] = {["to"]=target.id, ["con"]=tocon}
	target["links"][backdir] = {["to"]=room.id, ["con"]=backcon}
end

--	用法：map link n 10
--	连接当前房间与房间号为10的房间，其中出口方向为n，从房间10的返回方向为s
map["link"] = function(dir, num)

	local room = map.currentRoom
	if(room == nil) then
		print("定位不到当前房间，如果房间没有创建需要先创建map insert")
		return
	end

	local target = roomAll[num]
	if(room == nil) then
		print("定位不到目标房间")
		return
	end

	local re = rex.new ("([^@]*)@?([^@]*)")
	local s, e, tt = re:match(dir)

	if(tt == nil) then
		print("link 格式为：link n 10或link n@wait:3 10")
		return
	end

	local todir, tocon = tt[1], tt[2]

	room["links"][todir] = {["to"]=target.id, ["con"]=tocon}
end

--	用法：map unlink n 10
map["unlink"] = function(dir, num)
	local room = map.currentRoom
	if(room == nil) then
		print("定位不到当前房间，如果房间没有创建需要先创建map insert")
		return
	end

	local target = roomAll[num]
	if(room == nil) then
		print("定位不到目标房间")
		return
	end

	room["links"][dir] = nil
end

--	用法: map center
--	设置当前房间为当前区域的中心
map["center"] = function(name, id)
	regions[name].center = id
end


--	用法：保存城市地图
map["save"] = function(name)
	local region = regions[name]
	if(region == nil) then print("区域不存在") return end

	region.rooms = {}

	for i, v in ipairs(roomAll) do
		local t = utils.split(v.zone, "|")
		for j, k in ipairs(t) do
			if(name == k) then
				table.insert(region.rooms, v)
				break
			end
		end
	end

	local content = serialize.save("region", region)
	local file = io.open("worlds\\xkx\\mods\\maps\\"..region.id..".lua", "w")
--	file:write("local region = {}\r\n")
	file:write("local " .. content)
	file:write("\r\nreturn region")
	file:close()
end


--	显示当前房间的信息
map["room"] = function()
	tprint(map.currentRoom)
end

--	读取房间信息从文件中
map["load"] = function(room)
	local path = "worlds\\xkx\\mods\\maps\\" .. room .. ".lua"
	local area = dofile(path)

	regions[area.id] = area
	regions[area.name] = area

	for i, v in ipairs(area.rooms) do
		roomAll[v.id] = v
	end
end

--读取所有房间
map["loadall"] = function()
	local files = {
	"yz",
	"sz",
	"jx",
	"hz",
	"fz",
	"qz",
	"fs",
	"hy",
	"dl",
	"cd",
	"xi",
	"ca",
	"wg",
	"lz",
	"zjc",
	"bj",
	"zns",
	"gm",
	"qzj",
	"qc",
	"es",
	"ss",
	"ns",
	"cs",
	"sl",
	"gw",
	"tls",
	"wjg",
	"em",
	"wds",
	"mj",
	"kl",
	"bt",
	"lj",
	"xs",
	"xdm",
	"sld",
	"bhd",
	"tzf",
	"xx",
	"gcmg",
	"hsc",
	"thd",
	"hh",
	"yzw",
	"yzw1",
	"gyz",
	"gyz1",
	"ws",
	"hsc1",
	"mz",
	"xyl",
	"xyl1",
	"xkd",
	"xkd1",
	"hmy1",
	"hmy",
	"fz1",
	"kl1",
	"kl2"
	}

	regions = {}
	roomAll = {}

	for i,v in ipairs(files) do
		map.load(v)
	end

	for i, v in ipairs(roomAll) do
		if v.path == "" then
			print("房间路径为空  id: "..v.id.." name:"..v.name)
		end
	end
end


map["g_all"] = function()
	for i, v in pairs(regions) do
		map["g_path"](v.name)
		print(v.name)
		map["save"](v.name)
	end
end

--	生成相对路径
map["g_path"] = function(name)
	local region = regions[name]
	if(region.center == nil or region.cmd == nil) then
		print(name .. "没有设定中心或中心命令")
		return
	end

	local center = region.center
	for i, v in ipairs(region.rooms) do
		if(v.id ~= center) then
			local path = find_path(roomAll, center, v.id)
			if(path == nil) then
				print("生成路径到房间失败id: "..v.id.." name: "..v.name)
			else
				local tmp = ""
				for i, v in ipairs(path) do
					local pos1 = v:find("%[c")
					if(pos1 ~= nil) then
						local pos2 = v:find("%]")
						tmp = tmp .. v:sub(pos1, pos2)
						path[i] = v:sub(pos2+1)
					end
				end

				v.path = tmp .. region.cmd .. ";" .. table.concat(path, ";")
				--v.path = region.cmd .. ";" .. table.concat(path, ";")
			end
		else
			v.path = region.cmd
		end
	end

	print("生成路径完毕")
end

--查看房间信息
map["view"] = function(num)
	tprint(roomAll[num])
end

map["call"] = function(cmd, params)
	local f = map[cmd]
	if(f ~= nil) then
		--print(cmd)
		--print(params)
		local t = utils.split(params, ",")
		f(unpack(t))
	end
end


function where(dir)
	local look
	if(dir == nil) then
		look = "look"
	elseif dirmaps[dir] == nil then
		look = "look ".. dir
	else
		look = "look " .. dirmaps[dir]
	end

	where_check(function(room)
		print("查看的房间号为: "..room.id)
	end, look)
end


-- 	根据当前信息来判断房间号
--	遇到名称描述方向相同的房间需要扩展
function where_check(callback, look)
	local matched = {}

	getroomready2(look, function(room)
		if(room.name ~= nil) then
			for i, v in ipairs(roomAll) do
				if(v.name == room.name and v.desc == room.desc and v.exits == room.exits) then
					table.insert(matched, v)
				end
			end

			if(table.getn(matched) == 0) then
				print("出错了，找不到房间信息")
				--callback({})
			elseif(table.getn(matched) == 1) then
				callback(matched[1])
			else
			--	方向都一样，取一个出来看看
				lookaround(matched[1].exits,
				function(rooms)
					--print("周围的房间")
					--tprint(rooms)
					for j, k in ipairs(matched) do
						if(compareRooms(rooms, k.links)) then
							--print("当前房间应该为： "..k.id)
							callback(k)
							return
						end
					end
				end)
			end

		else
			print("出错了，找不到房间信息")
		end
	end)
end



function compareRooms(rooms, links)
	for i, v in pairs(rooms) do
		local room = roomAll[links[i].to]
		if(room.name ~= v.name or room.exits ~= v.exits or room.desc ~= v.desc) then
			return false
		end
	end

	return true
end


function lookaround(ways, callback)
	if(ways == nil or ways == "") then
		return false
	end

	local rooms = {}
	local t = utils.split(ways, "|")

	wait.make(function()
		for i, v in ipairs(t) do
			local room = lookat(v)
			rooms[dirmaps[v]] = room
		end

		callback(rooms)
	end)
end

function lookat(dir)

	local room, t, l = {}, true, 0
	while t do
		if(l == 0) then
			l = 1
			getroomready2("look " .. dir,
				function(rm)
					room.name = rm.name
					room.desc = rm.desc
					room.exits = rm.exits
					t = false
			end)
		else
			wait.time(1)
		end
	end

	return room

--[[
	local room, t, l = {}, true, 0
	while t do
		if(l == 0) then
			l = 1
			wait.make(function()
				getroomready2("look "..dir,
				function(rm)
					room.name = rm.name
					room.desc = rm.desc
					room.exits = rm.exits
					--tprint(room)
					t = false
				end)
			end)
		else
			sleep(1)
		end
	end

	return room
	]]--
end



function find_path(rooms, start, destination)

	local make_particle = function(curr_loc, path)
		--particle_count = particle_count + 1
		local path = path or {}
		return {current_room=curr_loc, path=path}
	end

	local dup_table = function(t)
		local new_t = {}
		table.foreachi (t, function (k, v)
			table.insert (new_t, v)
		end)

		return new_t
	end

	local explored_rooms, particles = {}, {}

	-- create particle for the initial room
	table.insert(particles, make_particle(start))

	while table.getn(particles) > 0 do

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





function remap(regionName)
	local rooms = {}
	local trace = {}

	local start = regions[regionName].center
	local startRoom = roomAll[start]

	local bfs = function(room)
		--tprint(room)
		if(room == nil) then print("空房间") return false end

		for i, v in pairs(room.links) do
			local newRoom = roomAll[v.to]
			if(not trace[newRoom.id] and newRoom.zone == regionName) then
				table.insert(rooms, newRoom)
				trace[newRoom.id] = 1
			end
		end
	end

	table.insert(rooms, startRoom)
	local nPos = 0
	while(true) do
		if(nPos < 500) then
			nPos = nPos + 1
			--print(nPos)
			bfs(rooms[nPos])
		else
			break
		end
	end

	tprint(trace)
	return rooms
end
