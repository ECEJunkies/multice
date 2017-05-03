function irc(h,p,n) -- host, port, nick
 s("IRC client:"..tostring(h), function() print(pcall(function()
  local ip,h,p = component.proxy(component.list("internet")()),h,p
  local c=ip.connect(h,p)
  print("Nick: "..n)
  print("Connected: "..tostring(c.finishConnect()))
  if c.finishConnect() then
   local ct=computer.uptime()
   print("Connected successfully.")
   local function wl(s)
    print("-->| "..tostring(s).."\n")
    c.write(tostring(s).."\n") 
   end
   _G.wil = wl
   function _G.sc(u,s) wl("PRIVMSG "..tostring(u).." :"..tostring(s)) end
   local function prs(line)
    h,m = string.match(line,":?(.-):(.+)") tH = {} 
    for w in h:gmatch("%S+") do tH[#tH+1] = w end
    if tH[1] == "PING" then
     wl("PONG :"..m)
    elseif tH[2] == "PRIVMSG" then
     local n,r,h = tH[1]:match("(.+)!(.+)@(.+)")
     print(n..":"..m.."\n")
    else
     print("|<-- "..line.."\n")
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
   end
  else
   print("Failed to connect:")
   print(c.finishConnect())
  end
 end)) end)
end
