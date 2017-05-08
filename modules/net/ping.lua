s("pingd",function()
 while true do
  if ev[1] == "net_msg" then
   if ev[3] == "ping" then
    print("ping ("..ev[2].."): "..ev[4])
    ns(ev[2],"pong",ev[4])
   elseif ev[3] == "pong" then
    print("pong ("..ev[2].."): "..ev[4])
   end
  end
  C.yield()
 end
end)
