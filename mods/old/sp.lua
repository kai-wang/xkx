-- Path finding algorithm, inspired by Ked and Indoum
--
--  28 August 2006

local region = {}

region.rooms = {}
  region.rooms[1] = {}
    region.rooms[1].path = ""
    region.rooms[1].name = "����"
    region.rooms[1].zone = "����"
    region.rooms[1].id = 1
    region.rooms[1].links = {}
      region.rooms[1].links.e = {}
        region.rooms[1].links.e.to = 2
        region.rooms[1].links.e.con = ""
    region.rooms[1].exits = "up|northwest|east|west"
    region.rooms[1].desc = "    �����������������������������Ϸ������������顰���Һ�ɽ���ĺ��ҡ����������Ƕ�š����ұ������ĸ����֡����˵��ˣ��������������Ϲ��Ͼ���������ݡ��Ա��ƺ���һ�����š�"
  region.rooms[2] = {}
    region.rooms[2].path = ""
    region.rooms[2].name = "�����"
    region.rooms[2].zone = "����"
    region.rooms[2].id = 2
    region.rooms[2].links = {}
      region.rooms[2].links.e = {}
        region.rooms[2].links.e.to = 3
        region.rooms[2].links.e.con = ""
      region.rooms[2].links.w = {}
        region.rooms[2].links.w.to = 1
        region.rooms[2].links.w.con = ""
      region.rooms[2].links.s = {}
        region.rooms[2].links.s.to = 4
        region.rooms[2].links.s.con = ""
    region.rooms[2].exits = "south|north|east|west"
    region.rooms[2].desc = "    ����һ����������ʯ�ֵ������ϱ���ͷ���졣�����Ǳ�����ͨ����⡣�ϱ��Եúܷ�æ��������һ�������¥�󣬹��š�̫���ŷ硱���������Ŷ�������һ�����ң�������¥�����ֲ�������������������ѧʿ���ֱʡ����������������㴹�����Ρ�������һ�����ӵ����������ƣ��Ǿ�������ѧ��֮������ͬ�����������ˡ�"
  region.rooms[3] = {}
    region.rooms[3].path = ""
    region.rooms[3].name = "����¥"
    region.rooms[3].zone = "����"
    region.rooms[3].id = 3
    region.rooms[3].links = {}
      region.rooms[3].links.w = {}
        region.rooms[3].links.w.to = 2
        region.rooms[3].links.w.con = ""
    region.rooms[3].exits = "up|west"
    region.rooms[3].desc = "    ��Բ����������������¥����˵�����˲�֪�����˲�����������ѧʿ���ε��ˣ�������¥�Ļ�����޲����ڣ���ȻΪ�����ң�����һ�δ��麣�ڵļѻ����Ӵ�����¥��������¥�²��ü��ף��˿Ͷ��ǴҴҵ����ˣ������ӡ����ȡ��׾ƾ͸�·ȥ�ˡ�¥����������"
  region.rooms[4] = {}
    region.rooms[4].path = ""
    region.rooms[4].name = "�����"
    region.rooms[4].zone = "����"
    region.rooms[4].id = 4
    region.rooms[4].links = {}
      region.rooms[4].links.s = {}
        region.rooms[4].links.s.to = 5
        region.rooms[4].links.s.con = ""
      region.rooms[4].links.n = {}
        region.rooms[4].links.n.to = 2
        region.rooms[4].links.n.con = ""
    region.rooms[4].exits = "south|north|east|west"
    region.rooms[4].desc = "    ������һ����æ�Ľֵ��ϣ����Ų�����ǻ������������ɫ�Ҵң�����˶����ϱ���ȥ��������һ�����ֵĹ㳡��������һ��������¡�Ŀ�ջ�����Ը��ص����ǽ�����������˵Ҳ�������ǵ��Ļ�ص㡣������һ��Ǯׯ�������������������Ľ���������"
  region.rooms[5] = {}
    region.rooms[5].path = ""
    region.rooms[5].name = "����㳡"
    region.rooms[5].zone = "����"
    region.rooms[5].id = 5
    region.rooms[5].links = {}
      region.rooms[5].links.e = {}
        region.rooms[5].links.e.to = 6
        region.rooms[5].links.e.con = ""
      region.rooms[5].links.n = {}
        region.rooms[5].links.n.to = 4
        region.rooms[5].links.n.con = ""
    region.rooms[5].exits = "south|north|east|west"
    region.rooms[5].desc = "    �����ǳ��е������ģ�һ���ܿ����Ĺ㳡��������ʯ���档һЩ���ֺ��е��������������������������������ݡ�������һ�ô��������̸���ڣ��ݴ�����ǧ������䣬���������е���ʷ��֤�����ɵײ���һ���ܴ������ (dong)�� ����Կ������������Ը��ص��������������������������У�һ�ɷ������󣬶��߲�ʱ�ش������ʵĶ�������������������������ˣ�һƬ�ྲ��"
  region.rooms[6] = {}
    region.rooms[6].path = ""
    region.rooms[6].name = "�����"
    region.rooms[6].zone = "����"
    region.rooms[6].id = 6
    region.rooms[6].links = {}
      region.rooms[6].links.w = {}
        region.rooms[6].links.w.to = 5
        region.rooms[6].links.w.con = ""
      region.rooms[6].links.e = {}
        region.rooms[6].links.e.to = 7
        region.rooms[6].links.e.con = ""
    region.rooms[6].exits = "south|north|east|west"
    region.rooms[6].desc = "    ����һ����������ʯ��ֵ���������ͷ���졣���߲�ʱ�ش�������ײ�����������������ӡ�������һ�����ӵ�Ժ�ӣ������εĴ����Ϸ�д�š���¹��Ժ���ĸ��̽���֣��Ծ����������治ʱ�ش���ѧ��������ٴ�Ķ��������ϱ���һ���ӻ��̡�"
  region.rooms[7] = {}
    region.rooms[7].path = ""
    region.rooms[7].name = "�����"
    region.rooms[7].zone = "����"
    region.rooms[7].id = 7
    region.rooms[7].links = {}
      region.rooms[7].links.w = {}
        region.rooms[7].links.w.to = 6
        region.rooms[7].links.w.con = ""
      region.rooms[7].links.e = {}
        region.rooms[7].links.e.to = 8
        region.rooms[7].links.e.con = ""
    region.rooms[7].exits = "south|north|east|west"
    region.rooms[7].desc = "    �����ڶ�����ϣ����ż�ʵ����ʯ����档�����Ƕ����ţ����������سǹٱ���ߺ���������������ʵĶ�����������һ�𡣱�����һ�����ֺŵ�ҩ�̣��ϱ��Ǵ����̣�����������������Զ����������"
  region.rooms[8] = {}
    region.rooms[8].path = ""
    region.rooms[8].name = "����"
    region.rooms[8].zone = "����"
    region.rooms[8].id = 8
    region.rooms[8].links = {}
      region.rooms[8].links.w = {}
        region.rooms[8].links.w.to = 7
        region.rooms[8].links.w.con = ""
    region.rooms[8].exits = "up|south|north|east|west"
    region.rooms[8].desc = "    ���Ƕ����ţ��������Ϸ����š����š�����������֣���ǽ�����ż��Źٸ���ʾ(gaoshi)���ٱ��Ǿ����ע���Ź������ˣ������С��Ϊ�һ����ֱ����ʯ���������������졣�����ǽ��⣬��Լ�ɼ�һƬһ���޼ʵ����֣�����Ī�⡣�����ǳ��������һƬïʢ�������֡�"

--local rooms = region.rooms


particle_count = 0


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
				-- make one per possible exit
				for dir, dest in pairs(exits) do
					-- if we have been there before, drop it, don't need to reconsider
					if not explored_rooms[dest.to] then
						explored_rooms[dest.to] = true
						local new_path = dup_table(part.path)

						if dest.con == nil or dest.con == "" then
							table.insert(new_path, dir)
						else
							table.insert(new_path, dir.."@"..dest.con)
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

-- test it

starting_point = 2
destination = 8

path = find_path (region.rooms, starting_point, destination)

if path then
 print (string.format ("Found path from room %i (%s) to room %i (%s).\r\n The path is: %s",
                     starting_point,
                     region.rooms[starting_point].name,
                     destination,
                     region.rooms[destination].name,
                     table.concat (path, ";")))
else
 print ("No path to room")
end -- if

print ("Made", particle_count, "particles to do that")
