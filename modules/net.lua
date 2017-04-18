tMn, tMs, tTs, CT, CO = {},{},{},component,computer
for m in CT.list("modem") do
 T.insert(tMs,CT.proxy(m))
 tMs[#tMs].open(4096)
end
for m in CT.list("tunnel") do
 T.insert(tTs,CT.proxy(m))
 tTs[#tTs].open(4096)
end

function ncs(n)
 for k,v in ipairs(tMn) do
  if v == n then return true end
 end
end
function grn()
 repeat
  mn=math.random(-65536,65535)
 until not ncs(mn)
 return mn
end
function rns(...)
 for k,m in ipairs(tMs) do
  m.broadcast(4096,...)
 end
 for m in ipairs(tTs) do
  m.send(4096,...)
 end
end
function ns(to,msg)
 if msg:len() > 4096 then
  msg=msg:sub(1,4096)
 end
 rns(grn(),to,CO.address(),msg)
end
function netrecv()
 CO.beep()
 while true do
  evtype,_,_,_,_,mn,to,from,msg=l()
  if evtype == "modem_message" then
   ns("Debug 1",mn,to,from,msg)
   if not ncs(mn) then
    if to == CO.address() then
     h("net_msg",from,msg)
     CO.beep()
    else
     rns(mn,to,from,msg)
    end
   end
  end
  C.yield()
 end
end
s("netrecv",function()
 while true do ns(pcall(netrecv)) end
end)
