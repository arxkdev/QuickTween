local TweenService = game:GetService("TweenService");
local FreeThread = nil;

local function DestroyTween(tween: Tween)
	local Thread = FreeThread;

	while (true) do
		FreeThread = nil;
		tween.Completed:Wait();
		tween:Destroy();

		FreeThread = Thread;
		tween = coroutine.yield() :: thread;
	end;
end

local function QuickAssert(condition: boolean, message: string)
	if (not condition) then
		error(message);
	end;
end

return function(instance: Instance, tweenInfo: TweenInfo, properties: {[string]: any}): Tween
	QuickAssert(typeof(instance) == "Instance", "Must be an instance");
	QuickAssert(typeof(tweenInfo) == "TweenInfo", "Must be TweenInfo");
	QuickAssert(typeof(properties) == "table", "Must be a table");

	local Tween: Tween = TweenService:Create(instance, tweenInfo, properties);
	Tween:Play();

	if (FreeThread == nil) then
		FreeThread = coroutine.create(DestroyTween) :: thread;
	end;

	task.spawn(FreeThread :: thread, Tween);
	return Tween;
end