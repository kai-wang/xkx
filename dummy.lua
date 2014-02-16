require "wait"
require "var"

function giveitem(line, name, wildcards)
	local id, item = string.lower(wildcards[3]), wildcards[4]
	
	wait.make(function()
		Execute("give xunzhang to " .. id)
		local l, w = wait.regexp("^(> )*(你身上没有这样东西。)|(这里没有这个人。)|(你给.*)$")
		if(l:match("你给") ~= nil) then
			Execute("tell " .. id .. " ok")
		else
			Execute("tell " .. id .. " fail")
		end
	end)
end

