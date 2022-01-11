local remote = game.ReplicatedStorage.RemoteEvent
local UIS = game:GetService("UserInputService")
local toggle = false
local plr = game.Players.LocalPlayer
local spawns = workspace.Spawns

local function doQuest(quest, num, atk)
	remote:FireServer("GetQuest", num)
	plr.Character.HumanoidRootPart.CFrame = quest.CFrame
	wait(0.3)
	remote:FireServer(atk, quest.Position)
	wait(0.2)
	plr.Character.HumanoidRootPart.CFrame = workspace.DemonTeleporters.spawn.CFrame
end

UIS.InputBegan:Connect(function(key, processed)
	if processed then return end
	
	if key.KeyCode == Enum.KeyCode.L then
		toggle = not toggle
		print(tostring(toggle))
		
		while toggle do
			wait(0.1)
			if #spawns.PlatinumS:GetChildren() > 0 then
				local platinumS = spawns.PlatinumS.PlatinumS.HumanoidRootPart
				doQuest(platinumS, 27, "HeroHunterAttack1")
			end
			
			if #spawns.GoldenS:GetChildren() > 0 then
				local goldenS = spawns.GoldenS.GoldenS.HumanoidRootPart
				doQuest(goldenS, 26, "HeroHunterAttack3")
			end
		end
	end
end)
