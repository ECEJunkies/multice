-- Initialization
log = ""
oldprint=print
function print(...)
 oldprint(...)
 logline = ""
 if #{...} > 0 then
  if #{...} > 1 then
   for k,v in ipairs({...}) do
    logline = logline .. "\t" .. tostring(v)
   end
  else
   tA = {...}
  logline = tostring(tA[1])
  end
 end
 log = (log .. logline .. "\n"):sub(1,-1)
end
print("Initializing and reading configuration")
ts={}
tA = {...}
ss=""
cfg={}
cfgfile = tA[1] or "build.cfg"
modfile = tA[2] or "modules.cfg"
f=io.open(cfgfile,"rb")
repeat
 line = f:read("*l")
 if line ~= nil then
  w={}
  for wo in line:gmatch("%S+") do table.insert(w, wo) end
  cfg[w[1]] = w[2]
 end
until line == nil or line == ""
cfg.opath = cfg.opath or "kernel.lua"
cfg.ospath = cfg.ospath or "skernel.lua"
print()
-- Module list
print("Reading modules to load")
tm={}
f=io.open(modfile,"rb")
function nl()
 return f:read("*l")
end
for line in nl do
 print(" - "..line)
 table.insert(tm,line)
end
f:close()
print(tostring(#tm).." modules to load.\n")

-- Loading modules
print("Loading modules")
for k,v in ipairs(tm) do
 print(" - "..v.." - modules/"..v)
 f=io.open("modules/"..v,"rb")
 if cfg.optimise == "yes" then
  data = f:read("*a")
 else
  data = "--"..v.."\n"..f:read("*a")
 end
 table.insert(ts,data)
 f:close()
end
print(tostring(#tm).." modules loaded.\n")

-- Generate source
print("Generating source")
if cfg.listmods == "yes" then
 ss=ss.."modules={"
 for k,v in ipairs(tm) do
  ss=ss..'"'..v..'",'
 end
 ss=ss.."}\n"
end
for k,v in pairs(ts) do
 ss=ss..v
 io.write(".")
end
print()

-- Output
print("Outputting to "..cfg.opath)
f=io.open(cfg.opath,"wb")
f:write(ss)
f:close()
print("Total size: "..tostring(ss:len()).."\n")

-- Optimise for space
if cfg.optimise == "yes" then
 if _OSVERSION ~= nil then
  if _OSVERSION:sub(1,6) == "OpenOS" then
   os.execute("strip "..cfg.opath.." "..cfg.ospath)
  end
 else
  os.execute("lua strip.lua "..cfg.opath.." "..cfg.ospath)
 end
end

-- Check syntax
if cfg.test == "yes" then
print("Checking for errors...")
err={pcall(load,ss)}
if err[1] ~= true then
 print(table.unpack(err))
else
 print("No errors detected by load()")
end
end

-- Write log
if cfg.log == "yes" then
f=io.open("build.log","wb")
f:write(log)
f:close()
end
