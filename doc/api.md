# Base OS API
## `s(name,function,environment)`
Spawns a process from `function` under the name `name`, with the environment table specified in `environment`. Environment doesn't really have much use right now.

## `l() `
Returns the last event.

## `h(...)`
Pushes an event to the queue, with whatever data you specify. Generally used for IPC.
# Module APIs
## library/print.lua
These functions should be display device independent.
### `print(...)`
Displays its arguments on the display device as a string, with a newline.
### `write(...)`
Displays its arguments on the display device as a string, without a newline
## drivers/keyboard.lua
This is a device-specific driver.
### `input = readln()`
Reads a line of input from the keyboard.
## library/fs-min.lua
fs-min implements basic filesystem resolution.
### `fsproxy,path = fres(p)`
Returns the proxy and path for that proxy for an input path `p`. Input paths have the form of `filesystem:/directory/file` or `/filesystem/directory/file`.
## library/fs-std.lua
fs-std implements file handles and methods for said file handles.
### `handle = fopen(path, mode)`
Opens a file handle for `path` with mode `mode`. File handle is for the OS, not the filesystem.
### `fclose(handle)`
Closes a file handle.
### `data = fread(handle)`
Reads data from a file handle `handle`.
### `fwrite(handle,data)`
Writes `data` to the handle `handle`.
## library/fs-ext.lua
fs-ext implements utility functions to do with filesystems.
### `tdir = flist(path)`
Returns a table of contents, `tdir` of a directory `path`
### `fmkdir(path)`
Creates the directory `path`.
### `frm(path)`
Deletes the file/directory `path`.
### `fexists(path)`
Returns true if the file/dir `path` exists.
### `isdir = fisdir(path)`
Returns whether the file/dir `path` is a directory.
## library/net.lua
Note: Settings have to be set in the kernel module, at the line
```
tM,nP,nID = {}, 4096, 1
```
Where 4096 is the port and 1 is the device ID.

Network messages events have the type `net_msg`
### `ns(id,po,msg)`
Sends network message `msg` to device `id` on port `po`

