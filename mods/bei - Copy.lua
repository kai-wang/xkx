require "wait"
require "tprint"
require "var"

module ("bei", package.seeall)

local bei_info = {}
task1 = dofile("worlds\\xkx\\mods\\task1.lua")

--tprint(task1)
local distance= {}

function levenshtein_distance(str1, str2)
    local len1, len2 = #str1, #str2
   -- local char1, char2, distance = {}, {}, {}
   local char1, char2 = {}, {}
    str1:gsub('.', function (c) table.insert(char1, c) end)
    str2:gsub('.', function (c) table.insert(char2, c) end)
    for i = 0, len1 do distance[i] = {} end
    for i = 0, len1 do distance[i][0] = i end
    for i = 0, len2 do distance[0][i] = i end
    for i = 1, len1 do
        for j = 1, len2 do
            distance[i][j] = math.min(
                distance[i-1][j] + 1,
                distance[i][j-1] + 1,
                distance[i-1][j-1] + (char1[i] == char2[j] and 0 or 1)
                )
        end
    end
    return distance[len1][len2]
end



function cosine_similarity(vec1, vec2)
	local length = math.min(#vec1, #vec2)
	local dotprod, sum1, sum2 = 0, 0, 0
	for i = 1, length do
		local n = vec1[i]
		local m = vec2[i]
		dotprod = dotprod + n*m
		sum1 = sum1 + n*n
		sum2 = sum2 + m*m
	end

	print(dotprod .. " ".. sum1 .. " ".. sum2)

	return (dotprod)/(math.sqrt(sum1)*math.sqrt(sum2))
end


function task1_init(name, line, wildcards)
	var.bei_npc = wildcards[2]
	bei_info.hstr = ""
	print(var.bei_npc)
	EnableTriggerGroup("bei_task1",true)
	bei_info.start = true
	bei_info.linenum = 0
	bei_info.vec1 = {}
end

function log_task1(name, line, wildcards, style)
	bei_info.linenum = bei_info.linenum + 1
	local num = 0
	for i, v in ipairs(style) do
		if(v.textcolour == 65535) then
			bei_info.hstr = bei_info.hstr .. (v.text):gsub("#","1")
			num = num + 1
		else
			bei_info.hstr = bei_info.hstr .. (v.text):gsub("#","0")
		end
	end

	table.insert(bei_info.vec1, num)
end

function task1_end()
	EnableTriggerGroup("bei_task1",false)
	if(bei_info.hstr == nil or bei_info.hstr == "") then return end

	local vstr = ""
	local len = tonumber(string.len(bei_info.hstr))
	local line = tonumber(bei_info.linenum)

	print("line "..line .. " len" .. len)

	for j = 1, (len/line) do
		for i = 0, (line-1) do
			local pos = i*line + j
			vstr = vstr .. string.sub(bei_info.hstr, pos, pos)
			--print(vstr)
		end
	end

	bei_info.vstr = vstr
	print(string.len(vstr))
	print("\r\n")
	print(string.len(bei_info.hstr))
end

function aaa()

end

function check()
	local dist, index = 10000000000000
	local t = bei_info.hstr

	for i, v in pairs(task1) do
		local wordnum = math.ceil((#(t)/(bei_info.linenum))/17)
		--print(wordnum)
		if(v.n == wordnum) then

			local diff = levenshtein_distance(t, v.text)--levenshtein_distance(t:sub(1,string.len(t)/2), v:sub(1,string.len(v)/2))
			print(i .. " diff:" .. diff )
			if(diff < dist) then
				dist = diff
				index = i
			end
		end
	end

	print(index)
		--end)()

		--if(math.abs(string.len(str)-string.len(bei_info.hstr))<50) then
		--[[
			local vec1 = buildvector(bei_info.hstr)
			local vec2 = buildvector(str)
			local diff = cosine_similarity(vec1, vec2)
			if(diff > dist) then
				dist = diff
				index = i
			end
		]]--

		--local diff = levenshtein_distance(bei_info.hstr, str)
		--local diff = cosine_similarity(bei_info.hstr, str)
		--[[
		print(i .. " str : ".. string.len(str) .. "  str2: " .. string.len(bei_info.hstr) .. " diff:" .. diff )
		if(diff < dist) then
			dist = diff
			index = i
		end
		end
		]]--
	--end

	--return index
end



function test(xx)
	local dist, index = 10000000000
	local t = task1[xx]
	for i, v in pairs(task1) do
		local n, wordnum = 0, 0
		for i in v:gmatch("\n") do n=n+1 end
		wordnum = string.len(v)/n

		--print("wordnum : "..wordnum .. " "..i)

		if(string.len(i) == string.len("¶λαÒΙ½")) then
			local diff = test1(t:sub(1,string.len(t)/2), v:sub(1,string.len(v)/2))--levenshtein_distance(t:sub(1,string.len(t)/2), v:sub(1,string.len(v)/2))
			print(i .. " diff:" .. diff )
			if(diff < dist) then
				dist = diff
				index = i
			end
		end
	end

	print(index)
end


function test1(str1, str2)

	local str11, str22 = "", ""
	local len = math.min(#str1, #str2)
	for i=1, len do
		if(str1:sub(i,i) ~= str2:sub(i,i)) then
			str11 = str11 .. str1:sub(i,i)
			str22 = str22 .. str2:sub(i,i)
		end
	end

	return levenshtein_distance(str11, str22)
end
