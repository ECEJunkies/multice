#MultICE
## The MultIplexed Computing Environment for OpenComputers

### Base OS API
#### s(name,function,environment)
Spawns a process from `function` under the name `name`, with the environment table specified in `environment`. Environment doesn't really have much use right now.

#### l() 
Returns the last event. Doesn't actually work right now.

#### h(...)
Pushes an event to the queue, with whatever data you specify. Generally used for IPC.
