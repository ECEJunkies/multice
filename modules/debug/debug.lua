s("debug thread",function()
 print(string.format("%." .. 2 .. "f", (computer.totalMemory()/1024)) .. "k memory total")
 while true do
  print(string.format("%." .. 2 .. "f", (computer.totalMemory()-computer.freeMemory())/1024).."k memory used; "..tostring(#tT).." running processes; "..tostring(p).." polling delay")
  for k,v in pairs(tT) do
   print(tostring(k).." - "..tostring(v[1]))
  end
  coroutine.yield()
 end
end)
