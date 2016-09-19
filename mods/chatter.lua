require "wait"
require "tprint"
require("worlds\\xkx\\mods\\core")

module ("chatter", package.seeall)

local processor = {
  ["ss stop"] = function()
    if(var.ss_can_stop == "1") then
      var.ss_available_time = os.time() + 3600
      var.ss_stop = 1
      print("ss stop : " .. var.ss_stop)
    else
      print("ss cannot stop")
    end
  end,

  ["ss start"] = function()
    var.ss_available_time = os.time()
    var.ss_stop = 0
  end,

  ["auto stop"] = function()
    Execute("reply auto Õ£÷π¡À")
    auto.stop()
  end,

  ["auto start"] = function()
    auto.stop()
    auto.start()
    Execute("reply auto ÷ÿ∆Ù¡À")
  end
}

function react(requester, cmd)
  if((not var.chatter_blacklist) or (not string.match(var.chatter_blacklist, requester))) then
    if(cmd == "ss stop" 
    or cmd == "ss start" 
    or (var.chatter_whitelist ~= nil and string.match(var.chatter_whitelist, requester .. ";") ~= nil)) then
      call(processor[cmd])
    end
  end
end