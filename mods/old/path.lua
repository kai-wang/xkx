require "wait"
require "utils"

wk=""
mappath=""
mapper={
	["n"]="s",
	["s"]="n",
	["w"]="e",
	["e"]="w",
	["u"]="d",
	["d"]="u",
	["ne"]="sw",
	["nw"]="se",
	["nu"]="sd",
	["nd"]="su",
	["se"]="nw",
	["sw"]="ne",
	["su"]="nd",
	["sd"]="nu",
	["wu"]="ed",
	["wd"]="eu",
	["eu"]="wd",
	["ed"]="wu"
}


function find(l,p)
    return string.find(l,p)
end

function automap()
    print("automap启动!")
    local pathlen,t
    while 1 do
    if wk ~= "" then
        if wk=="s" then
        --清空路径，开始新纪录
            mappath=""
            Send("place")   --!!!查看地图的命令，改为帮自己辨向的!!!
        else
            t=utils.split(mappath,"|")
            if t~=nil then
                pathlen=table.getn(t)
                t[1]=nil --开头一个总是空的
            else
                pathlen=0
            end
            --
            if wk=="gb" or wk=="gg" then
                local z=""
                local f=""
                if pathlen>1 then
                    for i =2,pathlen do
                        v=t[i]
                        if v~=nil then
                            re = rex.new ("(.*)/(.*)")
                            s, e, tt = re:match (v)
                            z=z..tt[1]..";"
                            f=tt[2]..";"..f
                        end
                    end
                end
                if wk=="gg" then --再走
                    Execute(z)
                end
                if wk=="gb" then --回去
                    Execute(f)
                end
            else
                if wk=="d" then
                --删除一步,不退回
                    if pathlen>0 then
                        --t[pathlen]=nil
                        mappath=""
                        for i =2,pathlen-1 do
                            v=t[i]
                            if v~=nil then
                                mappath=mappath.."|"..v
                            end
                        end
                    end
                    Send("place")   --!!!查看地图的命令，改为帮自己辨向的!!!
                else
                    if wk=="b" then
                    --删除一步，并且退回
                        if pathlen>1 then
                            re = rex.new ("(.*)/(.*)")
                            s, e, tt = re:match (t[pathlen])
                            if t==nil then
                                Note("出错！一定是出错了！请重新来过吧！")
                            else
                                Execute(tt[2])
                                wait.time(1)
                                Send("place")
                            end
                            t[pathlen]=nil
                            mappath=""
                            for i =2,pathlen-1 do
                                v=t[i]
                                if v~=nil then
                                    mappath=mappath.."|"..v
                                end
                            end
                        end
                    else
                        if wk=="show" then
                        --显示当前路径
                            local z=""
                            local f=""
                            if pathlen>1 then
                                for i =2,pathlen do
                                    v=t[i]
                                    if v~=nil then
                                        re = rex.new ("(.*)/(.*)")
                                        s, e, tt = re:match (v)
                                        z=z..tt[1]..";"
                                        f=tt[2]..";"..f
                                    end
                                end
                            end
                            Note(pathlen-1)
                            Note("正向:"..z)
                            Note("反向:"..f)
                        else
                            if wk=="nouse" then
                            --无用停了吧！
                                wk=""
                                break
                            else
                                if find(wk,"save") then
                                --保存
                                    re=utils.split(wk," ")
                                    ttt={}
                                    ttt[1]=re[2]
                                    ttt[2]=re[3]
                                    ttt[3]=re[4]
                                    if ttt~=nil then
                                        local z=""
                                        local f=""
                                        if pathlen>1 then
                                            for i =2,pathlen do
                                                v=t[i]
                                                if v~=nil then
                                                    re = rex.new ("(.*)/(.*)")
                                                    s, e, tt = re:match (v)
                                                    z=z..tt[1]..";"
                                                    f=tt[2]..";"..f
                                                end
                                            end
                                        end
                                        if ttt[1]~=nil then   --保存正向
                                            AddAlias(ttt[1],ttt[1],z,alias_flag.Enabled+alias_flag.AliasMenu,"")
                                            SetAliasOption(ttt[1],"send_to",10)
                                        end
                                        if ttt[2]~=nil then   --保存反向
                                            AddAlias(ttt[2],ttt[2],f,alias_flag.Enabled+alias_flag.AliasMenu,"")
                                            SetAliasOption(ttt[2],"send_to",10)
                                        end
                                        if ttt[3]~=nil then   --保存正反向循环    这里原数字复制粘贴先写错了
                                            AddAlias(ttt[3],ttt[3],z..f,alias_flag.Enabled+alias_flag.AliasMenu,"")
                                            SetAliasOption(ttt[3],"send_to",10)
                                        end
                                    end
                                    ttt=nil
                                else
                                --路径添加
                                    re = rex.new ("(.+)/(.*)")
                                    s, e, tt = re:match (wk)
                                    if tt==nil then
                                        Note("路径应该是正负两项 如 .wk=n/s")
                                    else
                                        if tt[2]==nil or tt[2]=="" then
                                            Note("自动识别反向")
                                            tt[2]=mapper[tt[1]]
                                            if tt[2]~=nil then
                                                wk=wk..tt[2]   --自动识别了
                                            end
                                        end
                                        if tt[2]==nil or tt[2]=="" then
                                            Note("不能识别的正向命令，手动填写反向.")
                                        else
                                            mappath=mappath.."|"..wk
                                            Execute(tt[1])
                                            wait.time(1)
                                            Send("place")   --!!!查看地图的命令，改为帮自己辨向的!!!
                                        end
                                    end
                                    tt=nil
                                end
                            end
                        end
                    end
                end
            end
        end
        --处理了！
        wk=""
        --Note(mappath)
    end
    wait.time(1)
    end
    Note("automap终止!")
end

path_name=""
cmdline_s=""
function dodo_base()
   local eh
    t=utils.split(cmdline_s,"@")
    for i,v in ipairs(t) do
		print(v)
         if v~=nil and v~="" then
            if find(v,"w:") then
              eh=utils.split(v,":")
              local n=tonumber(eh[2])
			  print("n="..n)
              if n~=nil then
               if n>0 then wait.time(n) end
              end
            else
               if find(v,"t:") then
                 eh=utils.split(v,":")
                 if eh[2]~=nil and eh[2]~="" then
                   wait.regexp(eh[2])
                 end
               else
                  tt=utils.split(v,";")
                  for tti,ttv in ipairs(tt) do
                        if ttv~=nil then
                             Execute(ttv)
                        end
                  end
               end
            end
         end
    end
end
function path_base()
    local s=GetAliasInfo(path_name,2)
    cmdline_s=s
    dodo_base()
end
function dodo(s)
    cmdline_s=s
    wait.make(dodo_base)
end
function path(pathname)
    path_name=pathname
    wait.make(path_base)
end
