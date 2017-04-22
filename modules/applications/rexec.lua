reP,tREs=4,{}
s("rexec",function()
 while true do
  if ev[1] == "net_msg" then
   local V=false
   for k,v in ipairs(tREs) do if ev[2] == v then V=true end end
   if ev[3] == reP and V then
    ns(ev[2],ev[3],pcall(load(msg)))
   end
  end
  C.yield()
 end
end)

