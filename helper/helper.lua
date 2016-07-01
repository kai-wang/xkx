module ("helper", package.seeall)

local basedir = "/Users/simao/Workspace/mud/xkx/"
local libdir = basedir .. "lib/"
local mapdir = basedir .. "mods/maps/"
local command = "ls " .. mapdir .. "*.lua |xargs basename"

local JSON = (loadfile (libdir .. 'JSON.lua'))()

function toJSONMaps()
    for filename in io.popen(command):lines() do
        local src = dofile(mapdir .. filename)
        local dest = JSON:encode_pretty(src)

        local file = io.open(basedir .. "mods/maps/" .. string.gsub(filename, ".lua", ".json"), "w")
        file:write(dest)
        file:close()
    end
end

toJSONMaps()
