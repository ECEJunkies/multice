fT = {}
function fres(p)
 local fid = (p:match("(%a-):") or p:match("/?(%a-)/"))
 local pt = (p:match("%a-:(.+)") or p:match("/?%a-/(.+)"))
 if fT[fid] ~= nil then return fT[fid],pt else return false end
end
