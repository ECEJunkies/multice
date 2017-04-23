fT = {}
function fres(p)
 local F = (p:match("(%a-):") or p:match("/?(%a-)/"))
 local P = (p:match("%a-:(.+)") or p:match("/?%a-/(.+)"))
 if fT[F] ~= nil then return fT[fid],P else return false end
end
