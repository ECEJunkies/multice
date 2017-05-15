function readln()
 local s=""
 write("|")
 while true do
  if ev[1] == "key" and ev[2] == E().sI then
   if ev[3] == 13 then
    write("\127\n")
    C.yield()
    return s
   elseif ev[3] == 8 then
    if s:len()>0 then s=s:sub(1,-2) write("\127\127|") end
   elseif ev[3] > 31 and ev[3] < 127 then
    s=s..string.char(ev[3]) write("\127"..string.char(ev[3]).."|")
   end
  end
  C.yield()
 end
end

