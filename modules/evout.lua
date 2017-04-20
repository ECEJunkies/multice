s("evp",function()
 while true do
 if ev ~= nil and ev[1] ~= "display" and ev[1] ~= "key_down" and ev[1] ~= "key_up" and ev[1] ~= "screen_resized" and ev[1] ~= "modem_message" and ev[1] ~= "sendmsg" then
--  ns(T.unpack(evs))
  print(T.unpack(ev))
 end
 C.yield()
 end
end)
