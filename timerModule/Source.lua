local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")

local timerModule = {}
local timerFunctions = {}
local timers = {}

timerFunctions.__index = timerFunctions

timerModule.new = function(Time: number, terminateOnEnd: boolean?)
	local timer = setmetatable({
		State = "Paused";
		CurrentTime = Time;
		StartTime = Time;
		Dead = false;
		Callback = nil;
		WaitEvent = nil;
		AssignedGUID = HttpService:GenerateGUID();
		TerminateOnEnd = terminateOnEnd or false;
	}, timerFunctions)
	
	timers[timer.AssignedGUID] = timer

	return timer
end

function timerFunctions:StartTimer()
	if self.State ~= "Running" and self.Dead == false then
		self.CurrentTime = self.StartTime
		self.State = "Running"
	end
end

function timerFunctions:StopTimer()
	if not self.State == "Stopped" and not self.Dead then
		self.CurrentTime = self.StartTime
		self.State = "Stopped"
	end
end

function timerFunctions:PauseTimer()
	if not self.State == "Paused" and not self.Dead then
		self.State = "Paused"
	end
end

function timerFunctions:ResumeTimer()
	if not self.State == "Running" and not self.Dead then
		self.State = "Running"
	end
end

function timerFunctions:AssignCallback(callback)
	if not self.Dead and typeof(callback) == "function" then
		self.Callback = callback
	end
end

function timerFunctions:TerminateTimer()
	if not self.State == "Dead" and not self.Dead then
		self.State = "Dead"
		self.Dead = true
		
		if self.WaitEvent then
			self.WaitEvent:Destroy()
			self.WaitEvent = nil
		end
		
		timers[self.AssignedGUID] = nil
	end
end

function timerFunctions:Wait()
	if self.State == "Running" and not self.Dead then
		self.WaitEvent = self.WaitEvent or Instance.new("BindableEvent")
		self.WaitEvent.Event:Wait()
	end
end

RunService.Heartbeat:Connect(function(deltaTime)
	for GUID, timer in pairs(timers) do
		if timer.State == "Running" and not timer.Dead then
			timer.CurrentTime -= deltaTime
			
			if timer.CurrentTime <= 0 then
				timer.State = "Finished"
				
				if timer.WaitEvent then
					timer.WaitEvent:Fire(timer.CurrentTime)
				end
				
				if timer.Callback then
					timer.Callback(timer.CurrentTime)
				end
				
				if timer.TerminateOnEnd then
					timer:TerminateTimer()
				end
			end
		end
	end
end)

return timerModule