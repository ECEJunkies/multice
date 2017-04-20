function ps()
 for k,v in pairs(tT) do
  print(v[1])
 end
end
function mem()
 print("Total: "..tostring(computer.totalMemory()/1024).."K")
 print("Free: "..tostring(computer.freeMemory()/1024).."K")
 print("Used: "..tostring((computer.totalMemory()-computer.freeMemory())/1024).."K")
end
