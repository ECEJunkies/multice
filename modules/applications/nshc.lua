function nshc_w(evPP,nid)
 write("\f")
 while true do
  if ev[1] == "net_msg" then
   local V,msg=false,tostring(ev[4])
   if ev[3] == evPP and ev[2] == nid then
    if msg:sub(1,3) == "dis" then
     write(msg:sub(4))
    end
   end
  elseif ev[1] == "key" and ev[2] == tT[cT][3].sI then
   ns(nid,evPP,"key"..tostring(ev[3]))
  end
  C.yield()
 end
end

function nshc(P,nid)
 ns(nid,P,"initnsh")
 while true do
  if ev[1] == "net_msg" then
   print(T.unpack(ev))
  end
  if ev[1] == "net_msg" and ev[2] == nid and ev[3] == P then
   nshc_w(ev[4],nid)
  end
  C.yield()
 end
end
