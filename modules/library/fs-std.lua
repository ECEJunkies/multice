hT = {["_c"]=0}
function fopen(p,m)
 local d,p = fres(p)
 local f=d.open(p,m)
 if f then
  hT._c = hT._c + 1
  hT[hT._c] = {d,f}
  return hT._c
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
