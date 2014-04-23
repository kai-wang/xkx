local cxt = {}

function action(id, name, cmd)
	--if(#cxt ~= 0) then busy(id) return end
	
	cxt.id = id
	cxt.name = name
	cxt.cmd = cmd
	
	tprint(cxt)
	if(cmd == "mjss") then action_mjss() end
end


function action_xz(id)
	wait.make(function()
		Execute("tuo xunzhang;give xunzhang to " .. cxt.id);
		local l, w = wait.regexp("^(> )*(����û�������|������û����������|���.*һö����ѫ��).*$")
		if(l:match("����ѫ��")) then call(f_ok) else call(f_fail) end
	end)
end

function action_mjss()
	wait.make(function()
		Execute("set brief;fly mj;enter;ask xiao zhao about Ǭ����Ų��")
		local l, w = wait.regexp("^(> )*(.*����ʧ��)|(.*����ȥȡ��)|(����û�������).*$")
		if(l:match("����û�������")) then call(f_fail) return end
		if(l:match("����ʧ��") ~= nil) then Execute("ask xiao zhao about Ǭ����Ų��") end
		Execute("out;s;sd;s;sd;sd;sd;sd;out;sd;sd;sd;sd;w;w")
		--Execute("tell hql ok;enter;break men;enter;n;open north;n;open north;n;open north")
	end)
end

function action_kl1()
	wait.make(function()
	end)
end

function f_ok()
	Execute("tell " .. cxt.id .. " done")
	cxt = {}
end

function f_fail()
	Execute("tell " .. cxt.id .. " fail")
	cxt = {}
end

function f_busy(id)
	Execute("tell " .. id .. " busy")
end
