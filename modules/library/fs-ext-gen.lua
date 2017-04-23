for k,v in ipairs({{"rm","remove"},"exists",{"isdir","isDirectory"},"list",{"mkdir","makeDirectory"}}) do
 load("function f"..v[1] or v.."(s)\nlocal d,p = fres(s)\nreturn d."..v[2] or v.."(p)\nend")()
end
