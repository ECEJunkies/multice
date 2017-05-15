s("init",function()
 local f=fopen("boot:/init.cfg","rb")
 write("")
 if f then
  local c=""
  local nc=fread(f,2048)
  while nc ~= nil and nc ~= "" do
   c=c..nc
   nc=fread(f,2048)
  end
  for l in c:gmatch("[^\n]+") do
   write("[init] "..l..": ")
   local pf=fload(l)
   print(pcall(pf))
  end
 end
 if _OSVERSION and _BD then
  print("Started ".._OSVERSION.." (built at ".._BD..")")
 end
end,{["sI"]=1})
