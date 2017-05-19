function nshd(evPP,tEPs,sI)
s("netsh daemon",function() print(pcall(function()
 while true do
  if ev[1] == "net_msg" then
   local V,msg=false,tostring(ev[4])
   for k,v in ipairs(tEPs) do if ev[2] == v then V=true end end
   if ev[3] == evPP and V then
    if msg:sub(1,3) == "key" then
     h("key",tT[cT][3].sI,tonumber(msg:sub(4)),0)
    end
   end
  elseif ev[1] == "display" and ev[3] == tT[cT][3].sI then
   for k,v in ipairs(tEPs) do
    ns(v,evPP,"dis"..tostring(ev[2]))
   end
  end
  C.yield()
 end
end)) end,{["sI"]=sI})
luash({["sI"]=sI})
end
