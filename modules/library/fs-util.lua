function fcopy(i,o)
 local f1,f2 = fopen(i,"rb"),fopen(o,"wb")
 if f1 and f2 then
  local c=fread(f1,math.huge)
  repeat
   fwrite(f2,c)
   c=fread(f1,math.huge)
  until c == nil
  fclose(f1)
  fclose(f2)
  return true
 end
 return false
end
function fmove(i,o)
 fcopy(i,o)
 frm(i)
end
function fload(i)
 local f,s = fopen(i,"rb"),""
 if f then
  local c=fread(f,math.huge)
  repeat
   s=s..c
   c=fread(f,math.huge)
  until c == nil
  return load(s)
 end
 return false
end
