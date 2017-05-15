function kbd(kA,sI)
 s("kbd: "..kA:sub(1,8)..","..tostring(si),function()
 while true do
  if ev[1] == "key_down" and ev[2] == kA then
   h("key",sI,ev[3],ev[4])
  end
  C.yield()
 end
 end)
end
