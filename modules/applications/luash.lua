s("lua shell",function()
 print(_VERSION)
 while true do
  h("display","> ")
  print(pcall(load(readln())))
 end
end)
