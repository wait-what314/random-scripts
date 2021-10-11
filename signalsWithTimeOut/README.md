# Signals with time-out

## Dependencies:
`customWait` (parent: parented to the same instance with the module)

## Documentation:

`module(signal: RBXScriptSignal, timeOut: number): any?` will yield the current thread for `timeOut` seconds, if the signal IS fired before the time ran out it will return the arguments it received, else it will return `nil`

## Usage:

```lua
local signalWithTimeOut = require(module)

local child = signalWithTimeOut(workspace.ChildAdded, 5)

if child then
	print("Instance added: ".. child.Name)
else
	print("Nothing added in the given time period.")
end
```