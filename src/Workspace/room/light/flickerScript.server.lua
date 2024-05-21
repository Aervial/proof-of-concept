local light = script.Parent
local beam = light.Beam
local spotlight = light.SpotLight
local flicker1 = light.SFX.flicker1
local flicker2 = light.SFX.flicker2
local buzz = light.SFX.buzz
local event1 = game.ReplicatedStorage.ClickEvent
local event2 = game.ReplicatedStorage.EyesEvent

buzz:Play()

local function flickerEffect(waitTimes)
	buzz:Stop()
	for _, waitTime in ipairs(waitTimes) do
		beam.Enabled = not beam.Enabled
		spotlight.Enabled = not spotlight.Enabled
		light.Material = beam.Enabled and Enum.Material.Neon or Enum.Material.Glass
		wait(waitTime)
	end
end

local function playRandomFlickerSound()
	if math.random() < 0.5 then
		flicker1:Play()
	else
		flicker2:Play()
	end
end

local waitTimes = {0.05, 0.05, 0.1, 0.25}

local function fx()
	playRandomFlickerSound()
	flickerEffect(waitTimes)
	beam.Enabled = false
	spotlight.Enabled = false
	light.Material = Enum.Material.Glass
end

local function on()
	beam.Enabled = true
	spotlight.Enabled = true
	light.Material = Enum.Material.Neon
	buzz:Play()
end

event1.OnServerEvent:Connect(fx)
event2.OnServerEvent:Connect(on)