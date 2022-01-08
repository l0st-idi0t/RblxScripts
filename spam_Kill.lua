local toggle = false
local UIS = game:GetService("UserInputService")

local remote = game.ReplicatedStorage.meleeEvent
local plr = game.Players
local target = "Reading_isfun123"

local function punch(name)
	for i = 1, 100 do
  		remote:FireServer(plr[name])
	end
end

UIS.InputBegan:Connect(function(key, processed)
	if processed then return end
	
	if key.KeyCode == Enum.KeyCode.F then
		toggle = not toggle 
		
		while toggle do
			wait(0.1)
			workspace:WaitForChild(game.Players.LocalPlayer.Name).HumanoidRootPart.CFrame = workspace:WaitForChild(target).HumanoidRootPart.CFrame
			punch(target)
		end
	end
end)
