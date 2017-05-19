function luash(si)
s("lua shell",function()
 print(_VERSION)
 while true do
  write("> ")
  print(pcall(load(readln())))
 end
end,si)
end
