local os = require "os"
local computer = require "computer"
os.execute("cp /home/kbuild/kernel.lua /tmp/init.lua")
computer.setBootAddress(computer.tmpAddress())
computer.shutdown(true)
