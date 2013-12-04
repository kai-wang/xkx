--require 'tprint'

local stateMachine={}

function stateMachine:new(states)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	local dummy = function() end

	for _, t in ipairs(states) do
		local st, onenter, onexit = t[1], t[2], t[3]
		if(onenter == nil) then onenter = dummy end
		if(onexit == nil) then onexit = dummy end
		o[st] = {name = st, enter = onenter, exit = onexit}
	end

	o._fromState = nil
	o._currentState = nil
	return o
end

function stateMachine:init()
	self._fromState = nil
	self._currentState = nil
end


function stateMachine:changeState(name)
	local to = self[name]

	if(to ~= nil) then
		local from = self._currentState
		if(from ~= nil) then
			self._fromState = from
			from.exit()
			print("state from ¡¾" .. from.name .. "¡¿ to ¡¾" .. to.name .."¡¿")
		end
		self._currentState = to
		to.enter()
	end
end

function stateMachine:state()
	if(self._currentState ~= nil) then return self._currentState["name"] end
end



function stateMachine:fromState()
	if(self._fromState ~= nil) then return self._fromState["name"] end
end

return stateMachine
