require "wait"
require "var"

function giveitem(line, name, wildcards)
	local id, item = string.lower(wildcards[3]), wildcards[4]
	
	wait.make(function()
		Execute("give xunzhang to " .. id)
		local l, w = wait.regexp("^(> )*(������û������������)|(����û������ˡ�)|(���.*)$")
		if(l:match("���") ~= nil) then
			Execute("tell " .. id .. " ok")
		else
			Execute("tell " .. id .. " fail")
		end
	end)
end

