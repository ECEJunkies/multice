# Building MultICE
MultICE uses a relatively simple build system. It has been tested on Arch Linux, Debian Linux, OpenOS and Plan9k.
## 1. Choose modules.
The system is made out of modules from the `modules/` directory. When you run the build script, it assembles them, and optionally optomises the code for space.

Modules are specified in the `modules.cfg` file and are relative to the `modules/` folder.  
An example for interactive usage with networking:
```
base/header.lua
drivers/dterm.lua
library/print.lua
drivers/keyboard.lua
library/net.lua
applications/luash.lua
base/footer.lua
```
## 2. Configure build system
The build system has a configuration file `build.cfg`.
### `optomise`
Can either be yes or no.  
Specifies whether to run the simple optimisation function on the kernel.
### `test`
Can either be yes or no.  
Specifies whether to test the final kernel (using load). Only picks up syntax errors.
### `log`
Can either be yes or no.  
Specifies whether to output log files.
### `opath`
Specifies where to put the output kernel.

## 3. Build.
Simply run `build.lua`. Under OpenOS or plan9k that may just be going to the right dir and entering `build`, but under proper UNIX systems it may involve `lua build.lua`.
