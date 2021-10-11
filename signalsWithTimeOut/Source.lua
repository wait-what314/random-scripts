local wait, delay = unpack(require(script.Parent:WaitForChild("CustomWait")))

return function(signal: RBXScriptSignal, timeOut: number): any?
	if typeof(signal) == "RBXScriptSignal" then
		local signal = Instance.new("BindableEvent")
		
		local eventFired
		eventFired = signal:Connect(function(...)
			eventFired:Disconnect()
			eventFired = nil
			signal:Fire(...)
		end)
		
		delay(timeOut, function()
			if eventFired then
				eventFired:Disconnect()
				eventFired = nil
				signal:Fire(nil)
				
				signal:Destroy()
			end
		end)
	end
	
	return signal:Wait()
end