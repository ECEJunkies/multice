tM,nP,nID,nVL = {}, 4096, computer.address(), 1
for a,t in component.list("modem") do
 table.insert(tM,component.proxy(a))
 component.proxy(a).open(nVL)
end
function ns(id,po,msg)
 h("sendmsg",id,po,msg)
end
s("network daemon",function ()
 while true do
  if ev[1] == "sendmsg" then
   local eT = ev
   for k,v in ipairs(tM) do
    v.broadcast(nVL,nP,eT[2],nID,eT[3],eT[4])
   end
  elseif ev[1] == "modem_message" then
   if ev[7] == nID then
    h("net_msg",ev[8],ev[9],ev[10])
   end
  end
  C.yield()
 end
end)
