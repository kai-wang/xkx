require "wait"
require "tprint"
require "utils"
require "var"

module ("msg", package.seeall)

local mc = {}

mc["msg_bb_end"]		= nil
mc["msg_gf_end"]		= nil
mc["msg_wei_end"]		= nil
mc["msg_shan_end"]		= nil
mc["msg_bei_end"]		= nil
mc["msg_guo_end"]		= nil
mc["msg_sx_end"]		= nil
mc["msg_study_end"]		= nil
mc["msg_dazuo_end"]		= nil
mc["msg_chihe_end"]		= nil

mc["msg_bb_ready"]		= nil
mc["msg_gf_ready"]		= nil
mc["msg_wei_ready"]		= nil
mc["msg_shan_ready"]	= nil
mc["msg_bei_ready"]		= nil
mc["msg_guo_ready"]		= nil
mc["msg_sx_ready"]		= nil
mc["msg_study_ready"]	= nil
mc["msg_chihe_ready"]	= nil


function subscribe(msg, listener, ...)
	local t = {func = listener, args={...}}
	mc[msg] = t
end

function unsubscribe(msg)
	mc[msg] = nil
end

function broadcast(msg)
	local t = mc[msg]

	if(t ~= nil) then
		t.func()--unpack(t.args))
	else
		ColourNote("navy", "tomato", "msg: " .. msg .. "触发了")--print("msg: " .. msg .. "触发了")
	end
end


function listener(msg)
	return mc[msg]
end
