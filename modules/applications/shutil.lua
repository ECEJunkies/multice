function ps()
 for k,v in pairs(tT) do
  write("pid: "..tostring(k)..", process name: "..tostring(v[1])..", env={")
  for l,w in pairs(v[3]) do write(tostring(l).." = "..tostring(w)..", ") end
  print("}")
 end
end
function mem()
 print("Total: "..tostring(computer.totalMemory()/1024).."K")
 print("Free: "..tostring(computer.freeMemory()/1024).."K")
 print("Used: "..tostring((computer.totalMemory()-computer.freeMemory())/1024).."K")
end
