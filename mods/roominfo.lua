--[[
1����ȡ�������ơ�����������npc
2����Щ�������ܻẬ�����������������ж�Ϊ������������һ�к��������ֶεģ�������꣬��Ϊû����ϸ�������ܲ�׼ȷ
3�����ڲ�׼ȷ����������ͨ������add_w��del_w�����ӻ�ɾ��
3����Ҫȫ�ֱ���ways��ȡ��·����18��������
4��ʹ�þ���
	ֱ�ӵ���/get_room_info()��ȡ����������Ϣ
]]--

require "wait"
require "tprint"
require "serialize"

--"����Ψһ�ĳ����� ([a-z]+)��|�������Եĳ����� ([a-z]+) �� ([a-z]+)��|�������Եĳ����� ([a-z]+)��([a-z]+) �� ([a-z]+)��|�������Եĳ����� ([a-z]+)��([a-z]+)��([a-z]+) �� ([a-z]+)��|�������Եĳ����� ([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+) �� ([a-z]+)��|�������Եĳ����� ([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+) �� ([a-z]+)��"
--"����û���κ����Եĳ�·|����Ψһ�ĳ����� ([a-z]+)��|�������Եĳ����� ([a-z]+) �� ([a-z]+)��|�������Եĳ����� ([a-z]+)��([a-z]+) �� ([a-z]+)��|�������Եĳ����� ([a-z]+)��([a-z]+)��([a-z]+) �� ([a-z]+)��|�������Եĳ����� ([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+) �� ([a-z]+)��|�������Եĳ����� ([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+) �� ([a-z]+)��|�������Եĳ����� ([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+) �� ([a-z]+)��|�������Եĳ����� ([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+) �� ([a-z]+)��"
--"Ϧ��|ҹĻ"
--rooms = {}
wk_room = {}

local name_desc = "^(> )*(.*) - $"
--local exits_desc = "^\s{4}����û���κ����Եĳ�·|����Ψһ�ĳ����� ([a-z]+)��|�������Եĳ����� ([a-z]+) �� ([a-z]+)��|�������Եĳ����� ([a-z]+)��([a-z]+) �� ([a-z]+)��|�������Եĳ����� ([a-z]+)��([a-z]+)��([a-z]+) �� ([a-z]+)��|�������Եĳ����� ([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+) �� ([a-z]+)��|�������Եĳ����� ([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+) �� ([a-z]+)��|�������Եĳ����� ([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+) �� ([a-z]+)��|�������Եĳ����� ([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+)��([a-z]+) �� ([a-z]+)��$"
local exits_desc = "^\s{4}����û���κ����Եĳ�·|����Ψһ�ĳ����� ([0-9a-z]+)��|�������Եĳ����� ([0-9a-z]+) �� ([0-9a-z]+)��|�������Եĳ����� ([0-9a-z]+)��([0-9a-z]+) �� ([0-9a-z]+)��|�������Եĳ����� ([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+) �� ([0-9a-z]+)��|�������Եĳ����� ([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+) �� ([0-9a-z]+)��|�������Եĳ����� ([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+) �� ([0-9a-z]+)��|�������Եĳ����� ([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+) �� ([0-9a-z]+)��|�������Եĳ����� ([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+) �� ([0-9a-z]+)��|�������Եĳ����� ([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+)��([0-9a-z]+) �� ([0-9a-z]+)��$"
local weather_desc = "(���|��|��|��|Ϧ��|̫��|��|��|��|��|ҹĻ|���|����|ѩɫ|����|����|����|����|����)"
--local npc_desc = "^\s{4}(\S+)\(([a-zA-Z]+)\s([a-zA-Z]+)\)$|^(> )*�趨����������look = \"YES\"$"
local npc_desc = "^\\s{4}(\\S*)\\(([a-zA-Z]+) ([a-zA-Z]+)\\)$"


function get_room_info()
	local room = {}

	---��ȡ��������/����/����
	wait.make(function()
		print("��ʼ��ȡ��������, ����look")
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
				-- ��ȡ��������
				local re = rex.new(weather_desc)
				for i=nameline+1, exitsline-1 do
					local text = GetLineInfo(i).text
					if(i < exitsline-1) then
						room.desc = room.desc .. text-- .. "\n"
					else
						local r1,r2,r3 = re:match(text)
						--���йؼ��ֲ��ҿ�ͷ��4���ո�
						if(r3 ~= nil and string.sub(text,1,4) == "    ") then
							print("������������>>>>>> "..text .. " <<<<<<")
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
		local l, w = wait.regexp("^(> )*�趨����������look = \"YES\"$")
		if(l ~= nil and wk_room ~= {}) then
			print("��ȡ������Ϣ�ɹ�")
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
		local l, w = wait.regexp("^(> )*�趨����������look = \"YES\"$")
		if(l ~= nil and wk_room ~= {}) then
			print("��ȡ������Ϣ�ɹ�")
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
