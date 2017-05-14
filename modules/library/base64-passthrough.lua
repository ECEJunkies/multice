do
function b64(data)
 component.invoke(component.list("data")(),"encode64",data)
end

function ub64(data)
 component.invoke(component.list("data")(),"decode64",data)
end
