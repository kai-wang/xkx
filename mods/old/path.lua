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
    print("automap����!")
    local pathlen,t
    while 1 do
    if wk ~= "" then
        if wk=="s" then
        --���·������ʼ�¼�¼
            mappath=""
            Send("place")   --!!!�鿴��ͼ�������Ϊ���Լ������!!!
        else
            t=utils.split(mappath,"|")
            if t~=nil then
                pathlen=table.getn(t)
                t[1]=nil --��ͷһ�����ǿյ�
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
                if wk=="gg" then --����
                    Execute(z)
                end
                if wk=="gb" then --��ȥ
                    Execute(f)
                end
            else
                if wk=="d" then
                --ɾ��һ��,���˻�
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
                    Send("place")   --!!!�鿴��ͼ�������Ϊ���Լ������!!!
                else
                    if wk=="b" then
                    --ɾ��һ���������˻�
                        if pathlen>1 then
                            re = rex.new ("(.*)/(.*)")
                            s, e, tt = re:match (t[pathlen])
                            if t==nil then
                                Note("����һ���ǳ����ˣ������������ɣ�")
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
                        --��ʾ��ǰ·��
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
                            Note("����:"..z)
                            Note("����:"..f)
                        else
                            if wk=="nouse" then
                            --����ͣ�˰ɣ�
                                wk=""
                                break
                            else
                                if find(wk,"save") then
                                --����
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
                                        if ttt[1]~=nil then   --��������
                                            AddAlias(ttt[1],ttt[1],z,alias_flag.Enabled+alias_flag.AliasMenu,"")
                                            SetAliasOption(ttt[1],"send_to",10)
                                        end
                                        if ttt[2]~=nil then   --���淴��
                                            AddAlias(ttt[2],ttt[2],f,alias_flag.Enabled+alias_flag.AliasMenu,"")
                                            SetAliasOption(ttt[2],"send_to",10)
                                        end
                                        if ttt[3]~=nil then   --����������ѭ��    ����ԭ���ָ���ճ����д����
                                            AddAlias(ttt[3],ttt[3],z..f,alias_flag.Enabled+alias_flag.AliasMenu,"")
                                            SetAliasOption(ttt[3],"send_to",10)
                                        end
                                    end
                                    ttt=nil
                                else
                                --·�����
                                    re = rex.new ("(.+)/(.*)")
                                    s, e, tt = re:match (wk)
                                    if tt==nil then
                                        Note("·��Ӧ������������ �� .wk=n/s")
                                    else
                                        if tt[2]==nil or tt[2]=="" then
                                            Note("�Զ�ʶ����")
                                            tt[2]=mapper[tt[1]]
                                            if tt[2]~=nil then
                                                wk=wk..tt[2]   --�Զ�ʶ����
                                            end
                                        end
                                        if tt[2]==nil or tt[2]=="" then
                                            Note("����ʶ�����������ֶ���д����.")
                                        else
                                            mappath=mappath.."|"..wk
                                            Execute(tt[1])
                                            wait.time(1)
                                            Send("place")   --!!!�鿴��ͼ�������Ϊ���Լ������!!!
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
        --�����ˣ�
        wk=""
        --Note(mappath)
    end
    wait.time(1)
    end
    Note("automap��ֹ!")
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
