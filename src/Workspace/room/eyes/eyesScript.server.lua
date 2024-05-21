local event1 = game.ReplicatedStorage.ClickEvent
local event2 = game.ReplicatedStorage.EyesEvent


local jumpscare = game.Workspace.Ambient["Jumpscare Sound"]
local eyes = script.Parent

local function openEyes()
	eyes.Transparency = 0
end

local function closeEyes()
	eyes.Transparency = 1
	jumpscare:Play()
end

event1.OnServerEvent:Connect(openEyes)
event2.OnServerEvent:Connect(closeEyes)