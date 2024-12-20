# QuickTween

Exactly like using a Tween from TweenService, but it automatically destroys the tween when it is done.

## Usage

```lua
local QuickTween = require(...);
QuickTween(Instance, TweenInfo, Properties);
```

## Example

```lua
local QuickTween = require(...);

local Part = ...;
local Info = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);

QuickTween(Part, Info, {
    CFrame = CFrame.new(0, 0, 0),
    Size = Vector3.new(100, 100, 100),
});