function nshd_w(evPP,cA,sI)
s("netsh daemon - "..tostring(sI),function() print(pcall(function()
 while true do
  if ev[1] == "net_msg" then
   local msg=tostring(ev[4])
   if ev[3] == evPP and ev[2] == cA then
    if msg:sub(1,3) == "key" then
     h("key",tT[cT][3].sI,tonumber(msg:sub(4)),0)
    end
   end
  elseif ev[1] == "display" and ev[3] == tT[cT][3].sI then
   ns(cA,evPP,"dis"..tostring(ev[2]))
  end
  C.yield()
 end
end)) end,{["sI"]=sI})
end

function nshd(P)
 s("nshd",function() print(pcall(function()
  local Cc=1
  while true do
   if ev[1] == "net_msg" and ev[3] == P then
    if ev[4] == "initnsh" then
     nnID="nsh-"..tostring(Cc)
     Cc=Cc+1
     ns(ev[2],P,nnID)
     nshd_w(nnID,ev[2],nnID)
     luash({["sI"]=nnID})
     print("[nshd]Spawned "..nnID.." for "..tostring(ev[2]))
    end
   end
   C.yield()
  end end))
 end,{["sI"]="log"})
end
