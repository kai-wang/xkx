require "wait"
require "tprint"
require "var"

module ("item", package.seeall)

local sell_list, store_list, drop_list, item_list = {}, {}, {}, {}
local item_name = "刀|剑|针|琴|斧|杖|甲|袍|靴|帽|衣"


function lookandget(f_done)
	var.item_store_list = ""
	var.item_sell_list = ""
	var.item_drop_list = ""
	
	wait.make(function()
		EnableTriggerGroup("item", true)
		Execute("look corpse;get all from corpse;set get ok")
		local l, w = wait.regexp("设定环境变数：get = \"ok\"")
		EnableTriggerGroup("item", false)
		
		if(var.item_drop_list ~= nil and var.item_drop_list ~= "") then Execute(var.item_drop_list) end
		if(var.item_sell_list ~= nil and var.item_sell_list ~= "") then Execute("fly wm;u;" .. var.item_sell_list) end
		if(var.item_store_list ~= nil and var.item_drop_list ~= "") then Execute("fly wm;nw") Execute(var.item_store_list) end
		call(f_done)
	end)
end

function match1(name, line, wildcards, style)
	local item = wildcards[3]
	local id = string.lower(wildcards[5])
	
	sort(item, id, style)
end


function match2(name, line, wildcards, style)
	local item = wildcards[1]
	local id = string.lower(wildcards[3])
	
	sort(item, id, style)
end

function sort(item, id, style)
	local color = getColourName(style, item)
	--白的，蓝的，黄的装备卖掉
	if(color == "white" or color == "blue" or color == "yellow") then
		if(var.item_sell_list == nil) then var.item_sell_list = "" end
		var.item_sell_list = var.item_sell_list .. "give " .. id .. " to ouye zi;"
	elseif(color == "red" or color == "magenta") then
	--红的，紫的留着
		if(var.item_store_list == nil) then var.item_store_list = "" end
		var.item_store_list = var.item_store_list .. "give " .. id .. " to byj;"-- .. var.dami_equip .. ";"
	else
	--其他的扔掉
		if(var.item_drop_list == nil) then var.item_drop_list = "" end
		var.item_drop_list = var.item_drop_list .. "drop " .. id .. ";"
	end
end

--[[
function process(f_done)
	wait.make(function()
		Execute("halt;fly wm;u")
		if(var.item_sell_list ~= nil and var.item_sell_list ~= "") then Execute(var.item_sell_list) end
		if(var.item_drop_list ~= nil and var.item_drop_list ~= "") then Execute(var.item_drop_list) end
		if(var.item_store_list ~= nil and var.item_drop_list ~= "") then Execute("fly wm;nw") Execute(var.item_store_list) end
		
		if(f_done ~= nil) then f_done() end
	end)
end
]]--

function getColourName(style, item)
	for i, v in ipairs(style) do
		if((v.text):find(item) ~= nil) then
			return RGBColourToName(v.textcolour)
		end
	end
end


function prepare(name, f_ok, f_fail)

	wait.make(function()
		if(name == "雄黄") then
			Execute("nw;l xionghuang")
			local l, w = wait.regexp("^(> )*(你要看什么)|(这是一包雄黄).*$")
			if(l:match("你要看什么")) then 
				Execute("fly wm;e;s;s;e;e;n;buy xionghuang")
				wait.time(5)
				Execute("fly wm;nw;l xionghuang")
				local l, w = wait.regexp("^(> )*(你要看什么)|(这是一包雄黄).*$")
				if(l:match("你要看什么")) then call(f_fail) else call(f_ok) end
			else 
				call(f_ok) 
			end
			return
		end
		
		if(name == "英雄令") then
			Execute("nw;l yingxiong ling")
			local l, w = wait.regexp("^(> )*(你要看什么)|(这是一块用于通行少林寺的铁铸令牌).*$")
			if(l:match("你要看什么")) then 
				Execute("fly wm;e;s;w;qukuan 1 gold")
				wait.time(5)
				Execute("e;s;s;s;give seng 1 gold;fly wm;nw;l yingxiong ling")
				local l, w = wait.regexp("^(> )*(你要看什么)|(这是一块用于通行少林寺的铁铸令牌).*$")
				if(l:match("你要看什么")) then call(f_fail) else call(f_ok) end
			else 
				call(f_ok) 
			end
			return
		end
		
		if(name == "重阳令") then
			Execute("nw;l chongyang ling")
			local l, w = wait.regexp("^(> )*(你要看什么)|(这是一块用于通行重阳宫的铁铸令牌).*$")
			if(l:match("你要看什么")) then 
				Execute("fly wm;e;s;w;qukuan 1 gold")
				wait.time(5)
				Execute("e;s;w;give daoren 1 gold;fly wm;nw;l chongyang ling")
				local l, w = wait.regexp("^(> )*(你要看什么)|(这是一块用于通行重阳宫的铁铸令牌).*$")
				if(l:match("你要看什么")) then call(f_fail) else call(f_ok) end
			else 
				call(f_ok) 
			end
			return
		end
		
		if(name == "火折") then
			Execute("nw;l fire")
			local l, w = wait.regexp("^(> )*(你要看什么)|(这是一支用于引火的火折).*$")
			if(l:match("你要看什么")) then 
				Execute("fly wm;e;s;s;e;s;buy fire")
				wait.time(5)
				Execute("fly wm;nw;l fire")
				local l, w = wait.regexp("^(> )*(你要看什么)|(这是一支用于引火的火折).*$")
				if(l:match("你要看什么")) then call(f_fail) else call(f_ok) end
			else 
				call(f_ok) 
			end
			return
		end
	end)
end