# MultICE
## The MultIplexed Computing Environment for OpenComputers
A simple, unprotected, cooperative multitasking operating system.

### Building
MultICE uses a relatively simple build system. It has been tested on Arch Linux, Debian Linux, OpenOS and Plan9k.
#### 1. Choose modules.
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
#### 2. Configure build system
The build system has a configuration file `build.cfg`.
##### `optomise`
Can either be yes or no.  
Specifies whether to run the simple optimisation function on the kernel.
##### `test`
Can either be yes or no.  
Specifies whether to test the final kernel (using load). Only picks up syntax errors.
##### `log`
Can either be yes or no.  
Specifies whether to output log files.
##### `opath`
Specifies where to put the output kernel.

#### 3. Build.
Simply run `build.lua`. Under OpenOS or plan9k that may just be going to the right dir and entering `build`, but under proper UNIX systems it may involve `lua build.lua`.

### Base OS API
#### `s(name,function,environment)`
Spawns a process from `function` under the name `name`, with the environment table specified in `environment`. Environment doesn't really have much use right now.

#### `l() `
Returns the last event. Doesn't actually work right now.

#### `h(...)`
Pushes an event to the queue, with whatever data you specify. Generally used for IPC.
### Module APIs
#### library/print.lua
These functions should be display device independent.
##### `print(...)`
Displays its arguments on the display device as a string, with a newline.
##### `write(...)`
Displays its arguments on the display device as a string, without a newline
#### drivers/keyboard.lua
This is a device-specific driver.
##### `readln()`
Reads a line of input from the keyboard.
#### library/net.lua
Note: Settings have to be set in the kernel module, at the line
```
tM,nP,nID = {}, 4096, 1
```
Where 4096 is the port and 1 is the device ID. Device ID can be any data type, port must be a number.

Network messages can be read from `_G.ev`, they have the type `net_msg`
##### `ns(id,po,msg)`
Sends network message `msg` to device `id` on port `po`

