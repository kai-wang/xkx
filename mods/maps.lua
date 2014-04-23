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

--	�÷���map create yz ���� 1
map["create"] = function(id, name, cmd)
	if(regions[id] ~= nil or regions[name] ~= nil) then
		print("�������Ѿ�����")
	else
		local area = {["id"]=id, ["name"]=name, ["cmd"]=cmd}
		--area.rooms = {}
		regions[id] = area
		regions[name] = area
		map.currentRegion = name
	end
end


-- 	�÷���map info
--	��ӡ����ǰ���еĵ�ͼ��Ϣ
map["info"] = function()
	local area = regions[map.currentRegion]
	if(area ~= nil) then
		print("��ǰ��ͼ��Ϣ��")
		tprint(area)
	end
end

--	�÷�1��map insert n/s
--	��n��һ�񣬴���һ���µķ��䣬ͬʱ���·������Ϸ�����������
--	�÷�2��map insert
--	����һ���յķ���,���κεķ�������
--	�÷�3��map insert n@wait:3/s@kill1
--	����һ���������ķ���
map["insert"] = function(dir)

	if(map.currentRegion == nil) then
		print("��λ������ǰ�������û�д�����Ҫ�ȴ���map create")
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
			print("��λ������ǰ���䣬�������û�д�����Ҫ�ȴ���map insert")
			return
		end

		local re = rex.new ("([^@]*)@?([^@]*)/([^@]*)@?([^@]*)")
		local s, e, tt = re:match(dir)

		if(tt == nil) then
			print("insert ��ʽΪ��insert n/s �� insert n/")
			return
		end

		local todir, tocon, backdir, backcon = tt[1], tt[2], tt[3], tt[4]
		if(backdir =="" ) then
			backdir = directions[todir]
		end

		--���Ե��ƶ������䣬���ʧ���򴴽�
		if(map["move"](todir)) then return end

		Execute(todir..";set walk")

		wait.make(function()
			local l, w = wait.regexp("^(> )*�趨����������walk = \"YES\"$")
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
					print("�����·���ɹ�����" .. map.currentRoom.name .. "����" .. map.currentRoom.id .. "��")
				end)
			end
		end)

	end
end

--	�÷�:	move n
--	�ӵ�ǰ�����ƶ���ָ���ķ���
map["move"] = function(dir)

	local room = map.currentRoom
	for i, v in pairs (room.links) do
		if(i == dir) then
			print("�ƶ�������"..v.to)
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
				--֧��һ�����������ڶ������
				map.currentRoom["zone"] = zone .. "|" ..map.currentRegion
			end

			Execute(i)
			return true
		end
	end

	return false

end


--	�÷���map look ����
--	���ҷ���id
map["lookup"] = function(name)
	local tbl = {}

	for i, v in ipairs(roomAll) do
		if v.name == name then
			table.insert(tbl, {["name"] = v.name, ["id"] = v.id})
		end
	end

	print("���ϵķ����У�")
	for i, v in ipairs (tbl) do
		print(v.name .. "  ����ţ�" .. v.id)
	end
end

--	�÷�: map vnum
--	���ص�ǰ���ڷ���ķ����
map["vnum"] = function(name)
	return map.currentRoom.name
end


--	�÷� map delete
--	ɾ����ǰ�����ķ��䣬��������һ������Ϊ��ǰ���䣬���˻���һ������
map["delete"] = function()
	local id = map.currentRoom.id
	local links = map.prevRoom.links
	map.currentRoom = map.prevRoom

	roomAll[id] = nil
	for i, v in pairs(links) do
		if(v["to"] == id) then links[i] = nil end
	end
end

--	�÷� map back
--	�˻���һ�����䣬��ɾ����ǰ�����ķ���
map["back"] = function()
	local links = map.currentRoom.links

	for i, v in pairs(links) do
		if(v["to"] == map.prevRoom.id) then Execute(i) break end
	end

	map["delete"]()
end

--	���õ�ǰ�����
map["setroom"] = function(id)
	map.currentRoom = roomAll[id]
end

--	˫������ map bl n/s 10
--	��map bl n/ 10
map["bl"] = function(dir, num)
	local room = map.currentRoom
	if(room == nil) then
		print("��λ������ǰ���䣬�������û�д�����Ҫ�ȴ���map insert")
		return
	end

	local target = roomAll[num]
	if(room == nil) then
		print("��λ����Ŀ�귿��")
		return
	end


	local re = rex.new ("([^@]*)@?([^@]*)/([^@]*)@?([^@]*)")
	local s, e, tt = re:match(dir)

	if(tt == nil) then
		print("bl ��ʽΪ��bl n/s 10 �� bl n/ 10")
		return
	end
	local todir, tocon, backdir, backcon = tt[1], tt[2], tt[3], tt[4]
	if(backdir == "" ) then
		backdir = directions[todir]
	end


	room["links"][todir] = {["to"]=target.id, ["con"]=tocon}
	target["links"][backdir] = {["to"]=room.id, ["con"]=backcon}
end

--	�÷���map link n 10
--	���ӵ�ǰ�����뷿���Ϊ10�ķ��䣬���г��ڷ���Ϊn���ӷ���10�ķ��ط���Ϊs
map["link"] = function(dir, num)

	local room = map.currentRoom
	if(room == nil) then
		print("��λ������ǰ���䣬�������û�д�����Ҫ�ȴ���map insert")
		return
	end

	local target = roomAll[num]
	if(room == nil) then
		print("��λ����Ŀ�귿��")
		return
	end

	local re = rex.new ("([^@]*)@?([^@]*)")
	local s, e, tt = re:match(dir)

	if(tt == nil) then
		print("link ��ʽΪ��link n 10��link n@wait:3 10")
		return
	end

	local todir, tocon = tt[1], tt[2]

	room["links"][todir] = {["to"]=target.id, ["con"]=tocon}
end

--	�÷���map unlink n 10
map["unlink"] = function(dir, num)
	local room = map.currentRoom
	if(room == nil) then
		print("��λ������ǰ���䣬�������û�д�����Ҫ�ȴ���map insert")
		return
	end

	local target = roomAll[num]
	if(room == nil) then
		print("��λ����Ŀ�귿��")
		return
	end

	room["links"][dir] = nil
end

--	�÷�: map center
--	���õ�ǰ����Ϊ��ǰ���������
map["center"] = function(name, id)
	regions[name].center = id
end


--	�÷���������е�ͼ
map["save"] = function(name)
	local region = regions[name]
	if(region == nil) then print("���򲻴���") return end

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


--	��ʾ��ǰ�������Ϣ
map["room"] = function()
	tprint(map.currentRoom)
end

--	��ȡ������Ϣ���ļ���
map["load"] = function(room)
	local path = "worlds\\xkx\\mods\\maps\\" .. room .. ".lua"
	local area = dofile(path)

	regions[area.id] = area
	regions[area.name] = area

	for i, v in ipairs(area.rooms) do
		roomAll[v.id] = v
	end
end

--��ȡ���з���
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
			print("����·��Ϊ��  id: "..v.id.." name:"..v.name)
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

--	�������·��
map["g_path"] = function(name)
	local region = regions[name]
	if(region.center == nil or region.cmd == nil) then
		print(name .. "û���趨���Ļ���������")
		return
	end

	local center = region.center
	for i, v in ipairs(region.rooms) do
		if(v.id ~= center) then
			local path = find_path(roomAll, center, v.id)
			if(path == nil) then
				print("����·��������ʧ��id: "..v.id.." name: "..v.name)
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

	print("����·�����")
end

--�鿴������Ϣ
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
		print("�鿴�ķ����Ϊ: "..room.id)
	end, look)
end


-- 	���ݵ�ǰ��Ϣ���жϷ����
--	������������������ͬ�ķ�����Ҫ��չ
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
				print("�����ˣ��Ҳ���������Ϣ")
				--callback({})
			elseif(table.getn(matched) == 1) then
				callback(matched[1])
			else
			--	����һ����ȡһ����������
				lookaround(matched[1].exits,
				function(rooms)
					--print("��Χ�ķ���")
					--tprint(rooms)
					for j, k in ipairs(matched) do
						if(compareRooms(rooms, k.links)) then
							--print("��ǰ����Ӧ��Ϊ�� "..k.id)
							callback(k)
							return
						end
					end
				end)
			end

		else
			print("�����ˣ��Ҳ���������Ϣ")
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
						--�µĸ�ʽΪ|aw:3:flatter ��������:n|
							table.insert(new_path, "|!" .. dest.con .. ":" .. dir .. "|")
						--[[ ���´��������ϵ�walk����ʽΪ[aw:3:flatter ��������]n
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
		if(room == nil) then print("�շ���") return false end

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
