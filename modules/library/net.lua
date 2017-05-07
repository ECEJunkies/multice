tM,nP,nID = {}, 4096, "a"
for a,t in component.list("modem") do
 table.insert(tM,component.proxy(a))
 component.proxy(a).open(nP)
end
function ns(id,po,msg)
 h("sendmsg",id,po,msg)
end
s("network daemon",function ()
 while true do
  if ev[1] == "sendmsg" then
   local eT = ev
   for k,v in ipairs(tM) do
    v.broadcast(nP,eT[2],nID,eT[3],eT[4])
   end
  elseif ev[1] == "modem_message" then
   if ev[6] == nID then
    h("net_msg",ev[7],ev[8],ev[9])
   end
  end
  C.yield()
 end
end)
