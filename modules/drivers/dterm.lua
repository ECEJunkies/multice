do
local gpu, screen = component.list("gpu")(), component.list("screen")()
local sw, sh
local cx, cy = 1, 1
if gpu and screen then
 gp = component.proxy(gpu)
 gp.bind(screen)
 sw, sh = gp.getResolution()
 gp.setResolution(sw, sh)
 gp.setBackground(0x000000)
 gp.setForeground(0xFFFFFF)
 gp.fill(1, 1, sw, sh, " ")
end

local function cv()
 if cx > sw then cx,cy=1,cy+1 end
 if cx < 1 then cx,cy=1,cy-1 end
 if cy > sh then gp.copy(1,2,sw,sh-1,0,-1) gp.fill(1,sh,sw,1," ") cx,cy=1,sh end
end

function wl(str)
 if gpu and screen then
  for c in str:gmatch(".") do
   if c == "\n" then cy=cy+1 cx=1
   elseif c == "\f" then cx=1 cy=1 gp.fill(1, 1, sw, sh, " ")
   elseif c == "\127" then cx=cx-1 gp.set(cx,cy," ")
   else gp.set(cx,cy,c) cx=cx+1 
   end cv()
  end
 end
end
wl("GPU initialized\n")

s("display",function()
while true do
 eT = ev
 if eT[1] == "display" then
  wl(tostring(eT[2]))
 end
 C.yield()
end
end)
end
