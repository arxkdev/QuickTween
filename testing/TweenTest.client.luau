local ReplicatedStorage = game:GetService("ReplicatedStorage");
local QuickTween = require(ReplicatedStorage.QuickTween);

local Part = workspace.Part;
local Info = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);

QuickTween(Part, Info, {
	CFrame = CFrame.new(0, 0, 0),
	Size = Vector3.new(100, 100, 100),
});

QuickTween(Part, Info, {
	Rotation = 100
});