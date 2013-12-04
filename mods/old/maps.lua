local info = function(str)
	print("**********【地图】：" .. str .. "**********")
end
	
info("地图模块载入")

Map = {currentCity = nil}
City = {}

function Map:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

--设置当前地图的城市--
function Map:setCity(name)
	if(self[name] == nil) then
		print("找不到城市： {" ..name .."}")
	else
		self.currentCity = self[name]
		print("当前城市设置为： {" .. self.currentCity.fullname .. "}")
	end
end

--查找城市--
function Map:findCity(name)
	return self[name]
end

--创建城市--
function City:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end


map = Map:new()

map["yz"] = City:new{name="yz", fullname="扬州", id=1, range={1,1000}}
map["hz"] = City:new{name="hz", fullname="杭州", id=2, range={1001,2000}}

on_map_room = function()
	print(map:findCity("yz").fullname)
end
