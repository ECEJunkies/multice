function print(...)
 for k,v in pairs({...}) do
  h("display",tostring(v).."\n")
 end
end
function write(...)
 for k,v in pairs({...}) do
  h("display",tostring(v))
 end
end
