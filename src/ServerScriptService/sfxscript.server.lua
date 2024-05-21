local event1 = game.ReplicatedStorage.ClickEvent
local event2 = game.ReplicatedStorage.EyesEvent
local atmosphere = game.Lighting.Atmosphere

local sfxFolder = game.Workspace.SFX
local ambience = game.Workspace.Ambient.ambience

ambience:Play()

local function playRandomSound()
	local sounds = sfxFolder:GetChildren()
	if #sounds > 0 then
		local randomIndex = math.random(1, #sounds)
		sounds[randomIndex]:Play()
	end
end

local function darken()
	atmosphere.Density = 1
end

local function boo()
	playRandomSound()
	darken()
end

local function ah()
	atmosphere.Density = 0.8
end

event1.OnServerEvent:Connect(boo)
event2.OnServerEvent:Connect(ah)
