--
-- Emitter
-- User: simao
--

local mt = {}

function mt:__call(...)
  self.emitter:removeListener(self.name, self)
  return self.callback(...)
end


local Emitter = {}

function Emitter:new()
  rawset(self, "_events", {})
  return setmetatable({}, { __index = self })
end

-- register a new event and a listener
-- one event supports multiple listeners
function Emitter:on(name, callback)
  assert(callback ~= nil)
  local events = rawget(self, "_events")
  if not events then
   events = {}
   rawset(self, "_events", events)
  end
--[[
  local listeners = rawget(events, name)
  if not listeners then
    listeners = {}
    rawset(events, name, listeners)
  end
]]--

  -- change to only support one event
  local listeners = {}
  table.insert(listeners, callback)
  rawset(events, name, listeners)
  --table.insert(listeners, callback)
  return self
end

-- register one-time fire event
function Emitter:once(name, callback)
  return self:on(name, setmetatable({
    emitter = self,
    name = name,
    callback = callback
  }, mt))
end

-- remove listeners
function Emitter:removeListener(name, callback)
  local events = rawget(self, "_events")
  if events then
    local listeners = rawget(events, name)
    if listeners then
      for i = #listeners, 1, -1 do
        if listeners[i] == callback then
          listeners[i] = false
        end
      end
   end
 end
end

-- remove all listeners
function Emitter:removeAllListeners(name)
  local events = rawget(self, "_events")
  if events then
    local listeners = rawget(events, name)
    if listeners then
      rawset(events, name, {})
    end
  end
end

-- listeners count
function Emitter:listenerCount(name)
  local events = rawget(self, "_events")
  if not events then
    return 0
   end

   local listeners = rawget(events, name)
   if not listeners then
    return 0
   else
    return #listeners
   end
end

-- fire an event
function Emitter:emit(name, ...)
  local events = rawget(self, "_events")
  if events then
    local listeners = rawget(events, name)
    if listeners then
      for i = 1, #listeners do
        listeners[i](...)
      end

      for i = #listeners, 1, -1 do
        if not listeners[i] then
          table.remove(listeners, i)
        end
      end
    end
  end
end

return Emitter
