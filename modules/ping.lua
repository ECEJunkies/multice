s("pingd",function()
 while true do
  local evt={l()}
  if evt[1] == "net_msg" then
   ns(evt[2],CO.address,"Ping!")
  end
 end
end)
