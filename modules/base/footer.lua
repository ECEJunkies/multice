while #tT > 0 do
 ev={computer.pullSignal(p)}
 for k,v in ipairs(tT) do
  _G.cT=k
  if C.status(v[2])~="dead" then
   C.resume(v[2],table.unpack(ev))
  else
   T.remove(tT,k)
  end
 end
end
