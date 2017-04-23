hT = {["_c"]=0}
function fopen(p,m)
 local d,p = fres(p)
 local f,C=d.open(p,m),hT._c
 if f then
  hT._c = C + 1
  hT[C] = {d,f}
  return C
 end
 return false
end
function fclose(h)
 if hT[h] then
  hT[h][1].close(hT[h][2])
 end
 return false
end
function fread(h,n)
 if hT[h] then
  return hT[h][1].read(hT[h][2],n)
 end
 return false
end
function fwrite(h,d)
 if hT[h] then
  return hT[h][1].write(hT[h][2],d)
 end
 return false
end
