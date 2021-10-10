# Custom Wait

## Documentation:

`wait(delay: number?): (number, number)` will yield the script for `delay` or 0.03 seconds;

`delay(delay: number, callback: function)` will start a new thread (**WON'T** yield the current thread), waiting the `delay` and firing the `callback` function, returning 2 arguments: `timeTaken` and `elapsedTime`;

## Usage:

```lua
local wait, delay = unpack(require(module))

wait(3)
print("this has been printed after ~3 seconds have passed!")

delay(3, function()
    print("this has been printed after ~3 seconds since the last message!")
end)

print("this has been printed right after the first print!")
```
