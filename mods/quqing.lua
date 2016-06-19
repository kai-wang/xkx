require "wait"
require "tprint"
require "utils"
require "string"


quqing = {}

quqing.main = function()

	print("曲清任务开始。。")

	AddTrigger("quqing_1", "^(> )*曲清说道:拿好这个通天镜，你有半天的时间挖宝，半天后这个通天镜就会消失！$", "", 49193, -1, 0, "", "quqing_do")
	AddTrigger("quqing_2", "^(> )*曲清说道：.*怎么还不去挖宝？$", "", 49193, -1, 0, "", "quqing_cancel")
	AddTrigger("quqing_3", "^(> )*曲清说道：.*离上次失败不到两分钟，还是先下去休息吧$", "", 49193, -1, 0, "", "quqing_end")
	AddTrigger("quqing_4", "^(> )*曲清说道：.*不是刚刚做了任务，下去先休息休息吧？$", "", 49193, -1, 0, "", "quqing_end")
	AddTrigger("quqing_5", "^(> )*这里没有这个人。$", "", 49193, -1, 0, "", "quqing_end")
	AddTrigger("quqing_6", "^(> )*曲清说道：这么大了就别来寻宝了。$", "", 49193, -1, 0, "", "quqing_end")

	Execute("set brief;fly wm;e;e;ask qu about job;")
end


quqing.done = function()
	DeleteTemporaryTriggers()
	print("曲清任务结束。。")
end

quqing_do = function()
	DeleteTemporaryTriggers()

	Execute("detect")
	AddTrigger("quqing_dig1", "^(> )*宝物的地点似乎在(.*)。$", "", 49193, -1, 0, "", "quqing_loc")
	AddTrigger("quqing_dig2", ".*■.*", "", 49193, -1, 0, "", "quqing_search")
end

quqing_loc = function(n, l, w)
	SetVariable("quqing_loc", w[2])
end

quqing_search = function(n, l, w)
	DeleteTemporaryTriggers()

	local seperator = "[-., ()\"a-zA-Z]"
	--print(l)
	--有个别房间有,.-这些符号，比如庄府大厅，苏州铁岭关，描述里面没有，所以这里去掉
	local x = l:gsub(seperator, "")
	x = x:gsub("■", ".*")
	local loc = GetVariable("quqing_loc")
	local tbl = {}
	local rooms = regions[loc].rooms
	if(rooms == nil) then
		quqling.cancel()
	else
		for i, v in ipairs(rooms) do
			--	有个别房间有,.-这些符号，比如庄府大厅，苏州铁岭关，描述里面没有，所以这里去掉
			local desc = v.desc:gsub(seperator, "")
			--	危险的房间不去，比如食人鱼
			if(string.match(desc, x) ~= nil and v.attr ~= "danger") then
				print("匹配的房间id: "..v.id .." 名称:"..v.name)
				table.insert(tbl, v.path)
			end
		end

		if(tbl ~= {}) then
			quqing_dig(tbl)
		end
	end
end


quqing_dig = function(tbl)
	local loc = GetVariable("quqing_loc")
	wait.make(function()
		if(loc == "灵州") then
			Execute("fly lz;w;n;n;e;ask nu about 腰牌;")
			wait.time(1)
		end
--恭喜你获得了额外奖励: 何首乌。
		for i, v in ipairs(tbl) do
			Execute("halt;" .. v)
			Execute("dig")
			local l, w = wait.regexp("你挖了半天，发现什么都没有，似乎找错地方了。|你过了一会儿，从土里掏出一件东西，不禁欢呼起来。|只听“铛”的一声，铁铲断成两节!")
			if(string.match(l, "你过了一会儿，从土里掏出一件东西，不禁欢呼起来。")) then
				wait.time(5)
				Execute("halt;fly wm;e;e;give bao wu to qu")
				wait.time(2)
				Execute("halt;fly wm")
				return
			elseif(string.match(l, "只听“铛”的一声，铁铲断成两节!")) then
				wait.time(5)
				Execute("halt;fly wm;e;e;ask qu about cancel")
				wait.time(2)
				Execute("halt;fly wm")
				return
			else
				wait.time(5)
			end
		end

		print("找不到宝物")
		Execute("fly wm;e;e;ask qu about cancel;")
		wait.time(2)
		Execute("halt;fly wm")
	end)
end

quqing_cancel = function()
	wait.make(function()
		Execute("fly wm;e;e;ask qu about cancel;")
		wait.time(2)
		Execute("halt;fly wm")
		quqing.done()
	end)
end


quqing_end = function()
	wait.make(function()
		wait.time(1)
		Execute("halt;fly wm")
		quqing.done()
	end)
end
