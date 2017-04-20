function nshc(evPP,nid)
 while true do
  if ev[1] == "net_msg" then
   local V=false
   local msg = tostring(ev[4])
   if ev[3] == evPP and ev[2] == nid then
    if msg:sub(1,3) == "dis" then
     h("display",msg:sub(4))
    end
   end
  elseif ev[1] == "key_down" then
   ns(nid,evPP,"key"..tostring(ev[3]))
  end
  C.yield()
 end
end

