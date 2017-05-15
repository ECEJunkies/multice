do
 if _OSVERSION and _BD then
  print("Starting ".._OSVERSION.." built at ".._BD)
 end
 local f=fopen("boot:/init.cfg","rb")
 if f then
 local c=""
 local nc=fread(f,2048)
 while nc ~= nil and nc ~= "" do
  c=c..nc
  nc=fread(f,2048)
 end
 for l in c:gmatch("[^\n]+") do
  print("[init] "..l)
 end
 end
end
