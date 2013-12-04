-- Path finding algorithm, inspired by Ked and Indoum
--
--  28 August 2006

local region = {}

region.rooms = {}
  region.rooms[1] = {}
    region.rooms[1].path = ""
    region.rooms[1].name = "武庙"
    region.rooms[1].zone = "扬州"
    region.rooms[1].id = 1
    region.rooms[1].links = {}
      region.rooms[1].links.e = {}
        region.rooms[1].links.e.to = 2
        region.rooms[1].links.e.con = ""
    region.rooms[1].exits = "up|northwest|east|west"
    region.rooms[1].desc = "    这里是岳王庙的正殿，内有岳飞像，像上方悬挂岳飞手书“还我河山”的横匾。殿两侧壁上嵌着“尽忠报国”四个大字。武人到此，都放下武器，毕恭毕敬地上香礼拜。旁边似乎有一道侧门。"
  region.rooms[2] = {}
    region.rooms[2].path = ""
    region.rooms[2].name = "北大街"
    region.rooms[2].zone = "扬州"
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
    region.rooms[2].desc = "    这是一条宽阔的青石街道，向南北两头延伸。北边是北城门通向城外。南边显得很繁忙。东边是一座两层的楼阁，挂着“太白遗风”的招帘，门额上悬挂一方横匾，“醉仙楼”三字擦得闪闪发亮，乃是苏学士的手笔。阵阵酒肉香酒香让你垂涎欲滴。西边是一座古朴的庙宇，香火缭绕，那就是天下学武之人所共同敬仰的武庙了。"
  region.rooms[3] = {}
    region.rooms[3].path = ""
    region.rooms[3].name = "醉仙楼"
    region.rooms[3].zone = "扬州"
    region.rooms[3].id = 3
    region.rooms[3].links = {}
      region.rooms[3].links.w = {}
        region.rooms[3].links.w.to = 2
        region.rooms[3].links.w.con = ""
    region.rooms[3].exits = "up|west"
    region.rooms[3].desc = "    方圆数百里内提起醉仙楼可以说是无人不知，无人不晓。当年苏学士云游到此，对醉仙楼的花雕酒赞不绝口，欣然为其题匾，流下一段传遍海内的佳话，从此醉仙楼名声大震。楼下布置简易，顾客多是匆匆的行人，买点包子、鸡腿、米酒就赶路去了。楼上是雅座。"
  region.rooms[4] = {}
    region.rooms[4].path = ""
    region.rooms[4].name = "北大街"
    region.rooms[4].zone = "扬州"
    region.rooms[4].id = 4
    region.rooms[4].links = {}
      region.rooms[4].links.s = {}
        region.rooms[4].links.s.to = 5
        region.rooms[4].links.s.con = ""
      region.rooms[4].links.n = {}
        region.rooms[4].links.n.to = 2
        region.rooms[4].links.n.con = ""
    region.rooms[4].exits = "south|north|east|west"
    region.rooms[4].desc = "    你走在一条繁忙的街道上，看着操着南腔北调的人们行色匆匆，许多人都往南边走去，那里有一个热闹的广场。东边是一家生意兴隆的客栈，来自各地的人们进进出出，据说也是情人们的幽会地点。西边是一家钱庄，可以听到叮叮当当的金银声音。"
  region.rooms[5] = {}
    region.rooms[5].path = ""
    region.rooms[5].name = "中央广场"
    region.rooms[5].zone = "扬州"
    region.rooms[5].id = 5
    region.rooms[5].links = {}
      region.rooms[5].links.e = {}
        region.rooms[5].links.e.to = 6
        region.rooms[5].links.e.con = ""
      region.rooms[5].links.n = {}
        region.rooms[5].links.n.to = 4
        region.rooms[5].links.n.con = ""
    region.rooms[5].exits = "south|north|east|west"
    region.rooms[5].desc = "    这里是城市的正中心，一个很宽阔的广场，铺着青石地面。一些游手好闲的人在这里溜溜达达，经常有艺人在这里表演。中央有一棵大榕树，盘根错节，据传已有千年的树龄，是这座城市的历史见证。树干底部有一个很大的树洞 (dong)。 你可以看到北边有来自各地的行人来来往往，南面人声鼎沸，一派繁华景象，东边不时地传来朗朗的读书声，西边则见不到几个行人，一片肃静。"
  region.rooms[6] = {}
    region.rooms[6].path = ""
    region.rooms[6].name = "东大街"
    region.rooms[6].zone = "扬州"
    region.rooms[6].id = 6
    region.rooms[6].links = {}
      region.rooms[6].links.w = {}
        region.rooms[6].links.w.to = 5
        region.rooms[6].links.w.con = ""
      region.rooms[6].links.e = {}
        region.rooms[6].links.e.to = 7
        region.rooms[6].links.e.con = ""
    region.rooms[6].exits = "south|north|east|west"
    region.rooms[6].desc = "    这是一条宽阔的青石板街道，向东西两头延伸。东边不时地传来金属撞击声，西边人声嘈杂。北边是一座简朴的院子，半月形的大门上方写着“白鹿书院”四个烫金大字，苍劲有力。里面不时地传来学生们抑扬顿挫的读书声。南边是一家杂货铺。"
  region.rooms[7] = {}
    region.rooms[7].path = ""
    region.rooms[7].name = "东大街"
    region.rooms[7].zone = "扬州"
    region.rooms[7].id = 7
    region.rooms[7].links = {}
      region.rooms[7].links.w = {}
        region.rooms[7].links.w.to = 6
        region.rooms[7].links.w.con = ""
      region.rooms[7].links.e = {}
        region.rooms[7].links.e.to = 8
        region.rooms[7].links.e.con = ""
    region.rooms[7].exits = "south|north|east|west"
    region.rooms[7].desc = "    你走在东大街上，踩着坚实的青石板地面。东边是东城门，可以听到守城官兵的吆喝声，与西边朗朗的读书声混杂在一起。北边是一家老字号的药铺，南边是打铁铺，叮叮当当的声音老远就能听到。"
  region.rooms[8] = {}
    region.rooms[8].path = ""
    region.rooms[8].name = "东门"
    region.rooms[8].zone = "扬州"
    region.rooms[8].id = 8
    region.rooms[8].links = {}
      region.rooms[8].links.w = {}
        region.rooms[8].links.w.to = 7
        region.rooms[8].links.w.con = ""
    region.rooms[8].exits = "up|south|north|east|west"
    region.rooms[8].desc = "    这是东城门，城门正上方刻着“东门”两个楷书大字，城墙上贴着几张官府告示(gaoshi)。官兵们警惕地注视着过往行人，你最好小心为妙。一条笔直的青石板大道向东西两边延伸。东边是郊外，隐约可见一片一望无际的树林，神秘莫测。西边是城里。北面有一片茂盛的青竹林。"

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
