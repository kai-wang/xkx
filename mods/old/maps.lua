local info = function(str)
	print("**********����ͼ����" .. str .. "**********")
end
	
info("��ͼģ������")

Map = {currentCity = nil}
City = {}

function Map:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

--���õ�ǰ��ͼ�ĳ���--
function Map:setCity(name)
	if(self[name] == nil) then
		print("�Ҳ������У� {" ..name .."}")
	else
		self.currentCity = self[name]
		print("��ǰ��������Ϊ�� {" .. self.currentCity.fullname .. "}")
	end
end

--���ҳ���--
function Map:findCity(name)
	return self[name]
end

--��������--
function City:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end


map = Map:new()

map["yz"] = City:new{name="yz", fullname="����", id=1, range={1,1000}}
map["hz"] = City:new{name="hz", fullname="����", id=2, range={1001,2000}}

on_map_room = function()
	print(map:findCity("yz").fullname)
end
