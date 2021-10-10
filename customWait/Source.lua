local customWaitFunctions = {}
local HB = game:GetService("RunService").Heartbeat

customWaitFunctions.wait = function(delay: number?): (number, number)
    delay = delay or 0.03
    
    local yieldedTime = 0
    
    while yieldedTime < delay do
        yieldedTime += HB:Wait()
    end
    
    return yieldedTime, elapsedTime()
end

customWaitFunctions.delay = function(delay: number?, callback: any)
    assert(typeof(delay) == "number" and typeof(callback) == "function", "delay function requires 2 arguments")
    
    task.spawn(function()
        callback(customWaitFunctions.wait(delay))
    end)
end

return {customWaitFunctions.wait, customWaitFunctions.delay}