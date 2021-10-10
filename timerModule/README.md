# Timer Module

## Documention:

### Module:

`module.new(Time: number, terminateOnEnd: boolean): Timer` will return a Timer class;
#
### Timer Class:
```
Timer = {
    State: string = timerState;
    CurrentTime: number = Time;
    StartTime: number = Time;
    Dead: boolean = false;
    Callback: function? = nil;
    WaitEvent: BindableEvent? = nil;
    AssignedGUID: string = HttpService:GenerateGUID();
    TerminateOnEnd: boolean = terminateOnEnd or false;
}
```


`Timer:StartTimer(): void` will start the timer, counting from the `Time` variable provided in `module.new` to 0;

`Timer:StopTimer(): void` will stop the timer, resetting the counted time to the `Time` variable;

`Timer:PauseTimer(): void` will stop the timer ***without*** resetting the counted time;

`Timer:ResumeTimer(): void` will resume the timer from the point where it was paused at;

`Timer:AssignCallback(callback: function): void` will assign a callback function:  when the timer reaches 0, it will be fired;

`Timer:TerminateTimer(): void` will stop the timer, and kill it entirely without a way to start it back;

`Timer:Wait(): void` will yield the script until the timer has reached 0;

#

### Example of usage:

```lua
local TimerModule = require(module)

local timer = TimerModule.new(5, false)
print("The timer has been created") -- will be printed after the Timer class is created

timer:StartTimer()
print("The timer has been started") -- will be printed right after the timer starts

timer:Wait()
print("The timer has reached 0!") -- will be printed when the timer reaches 0
```
