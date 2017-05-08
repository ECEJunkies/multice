_G.tircb = {}
function ircb(h,p,n) -- host, port
 s("IRC bridge connector", function()
  local ip,h,p = component.proxy(component.list("internet")()),h,p
  local c=ip.connect(h,p)
  local cT = computer.uptime
  while computer.uptime() < cT + 2 do
   C.yield()
  end
  if c.finishConnect() then
   local ct=computer.uptime()
   local function wl(s)
    c.write(s.."\n") 
   end
   _G.wil = wl
   function sc(u,s) wl("PRIVMSG "..u.." :"..s) end
   local function prs(line)
    h,m = string.match(line,":?(.-):(.+)") tH = {} 
    for w in h:gmatch("%S+") do tH[#tH+1] = w end
    if tH[1] == "PING" then
     wl("PONG :"..m)
    elseif tH[2] == "PRIVMSG" then
     local n,r,h = tH[1]:match("(.+)!(.+)@(.+)")
     local t,f,p,ms = m:match("(.+),(.+),(.+),(.+)")
     if t and f and p and ms then
      t,f,p,ms = ub64(t),n..":"..ub64(f),ub64(p),ub64(ms)
      for k,v in ipairs(tM) do
       v.broadcast(nP,t,f,p,ms)
      end
     end
    else
    end
   end
   wl("NICK "..n)
   wl("USER "..n.." "..n.." "..n.." "..n)
   while c.finishConnect() do
    coroutine.yield()
    local d=c.read()
    if type(d) == "string" then
     if d ~= "" and d ~= "\n" then
      for line in d:gmatch("[^\r\n]+") do
       pcall(prs,line)
      end
     end
    end
    if ct+0.25 < computer.uptime() then
     if #tircb > 0 then
      sc(T.unpack(T.remove(tircb,1)))
     end
     ct=computer.uptime()
    end
   end
  else
  end
 end)
 s("IRC bridge",function()
  while true do
   if ev[1] == "modem_message"then
    local pa,pb = ev[6]:match("(.+):(.+)")
    if pa and pb then tircb[#tircb+1] = {pa,b64(pb)..","..b64(ev[7])..","..b64(ev[8])..","..b64(ev[9])} end
   end
   coroutine.yield()
  end
 end)
end
