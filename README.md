# MultICE
## The MultIplexed Computing Environment for OpenComputers

### Base OS API
#### s(name,function,environment)
Spawns a process from `function` under the name `name`, with the environment table specified in `environment`. Environment doesn't really have much use right now.

#### `l() `
Returns the last event. Doesn't actually work right now.

#### `h(...)`
Pushes an event to the queue, with whatever data you specify. Generally used for IPC.
### Module APIs
#### library/print.lua
These functions should be display device indepentent.
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

