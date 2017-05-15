function tty(gA,sA,sI,fg,bg)
 local gP,cx,cy = component.proxy(gA),1,1
 gP.bind(sA)
 local sx, sy = gP.getResolution()
 gP.setResolution(sx,sy)
 gP.setForeground(bg or 0xFFFFFF)
 gP.setBackground(bg or 0x000000)
 gP.fill(1,1,sx,sy," ")
 local function cv()
  if cx > sx then cx,cy=1,cy+1 end
  if cx < 1 then cx,cy=1,cy-1 end
  if cy < 1 then cx,cy=1,1 end
  if cy > sy then gP.copy(1,2,sx,sy-1,0,-1) gP.fill(1,sy,sx,1," ") cx,cy=1,sy end
 end
 local function wl(str)
  for c in str:gmatch(".") do
   if c == "\n" then cx,cy=1,cy+1
   elseif c == "\r" then cx=1
   elseif c == "\f" then cx=1 cy=1 gP.fill(1, 1, sx, sy, " ")
   elseif c == "\127" then cx=cx-1 gP.set(cx,cy," ")
   else gP.set(cx,cy,c) cx=cx+1 
   end cv()
  end
 end
 s("display: "..gA..","..sA,function()
 while true do
  eT = ev
  if eT[1] == "display" and eT[3] == sI then
   wl(tostring(eT[2]))
  end
  C.yield()
 end
 end)
end
