function flist(s)
 local d,p = fres(s)
 return d.list(p or "/")
end
function fmkdir(s)
 local d,p = fres(s)
 return d.makeDirectory(p or "/")
end
function frm(s)
 local d,p = fres(s)
 return d.remove(p)
end
function fexists(s)
 local d,p = fres(s)
 return d.exists(p)
end
function fisdir(s)
 local d,p = fres(s)
 return d.isDirectory(p)
end
