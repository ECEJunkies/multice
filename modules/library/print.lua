function write(...)
 for k,v in pairs({...}) do
  h("display",tostring(v),E().sI)
 end
end
function print(...)
 for k,v in pairs({...}) do
  write(tostring(v).."\n")
 end
end
