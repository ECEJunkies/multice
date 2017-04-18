do
push = h
local gpu, screen = component.list("gpu")(), component.list("screen")()
local w, h
if gpu and screen then
 gp = component.proxy(gpu)
 component.invoke(gpu, "bind", screen)
 w, h = component.invoke(gpu, "getResolution")
 gp.setResolution(w, h)
 gp.setBackground(0x000000)
 gp.setForeground(0xFFFFFF)
 gp.fill(1, 1, w, h, " ")
end
local y = 1
function wl(msg)
 if gpu and screen and gp then
  gp.set(1, y, msg)
  if y == h then
   gp.copy(1, 2, w, h - 1, 0, -1)
   gp.fill(1, h, w, 1, " ")
  else
   y = y + 1
  end
 end
end
wl("GPU initialized.")
s("display",function(...)
 while true do
  eT = ev
  if table.remove(eT,1) == "display" then
   for k,v in ipairs(eT) do
    wl(v)
   end
  end
  coroutine.yield()
 end
end)
function sbt(line)
 gp.set(1,h,tostring(line))
end
push("display","test")
sbt("Test.")
end
