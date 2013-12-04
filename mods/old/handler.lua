require "wait"
require "tprint"
require "utils"


print("导入handler")


handler = {}

function handler:invoke(str)
	local t = utils.split(str, "@")
	--tprint(t)
	local params = t[1]
	local ins = t[2]
	if(self[ins] ~= nil) then self[ins]:invoke(params) end
end


--[[
	wait_handler 调用格式 2:e@wait_handler
]]--

local wait_handler = {}

function wait_handler:invoke(params)
	local t = utils.split(params, ":")
	wait.make(function ()
	print("等待"..t[1].."秒")
	wait.time(t[1])
	Send(t[2])
end)

end

handler["wait"] = wait_handler
