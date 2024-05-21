task.wait(2)
local part1 = game.Workspace:WaitForChild("room"):WaitForChild("scarypart") -- Wait for the "scarypart" object to exist
local part2 = game.Workspace:WaitForChild("room"):WaitForChild("eyesPart")
local fired = false
local eyes = false

part1.Touched:Connect(function()
	if not fired then
		fired = true
		game.ReplicatedStorage.ClickEvent:FireServer()
		part1:Destroy()
	else
	end
end)

part2.Touched:Connect(function()
	if not eyes then
		eyes = true
		game.ReplicatedStorage.EyesEvent:FireServer()
		part2:Destroy()
	else
	end
end)
