--variables
local plr = game.Players.LocalPlayer
local HRP = plr.Character.HumanoidRootPart
local VI = game:GetService("VirtualInputManager")
local UIS = game:GetService("UserInputService")
local mouse = plr:GetMouse()
local toggle = false
local remote = game:GetService("ReplicatedStorage").RemoteEvent
local pet_args = {
	[1] = {
		[1] = "UpgradeCurrentPet"
	}
}
local world_args = {
   [1] = {
       [1] = "WarpPlrToOtherMap",
       [2] = "Next"
   }
}

--gui
local indicator = Instance.new("TextLabel", plr.PlayerGui.ScreenGui)
indicator.Position = UDim2.new(0.05, 0, 0.8, 0)
indicator.Size = UDim2.new(0.1, 0, 0.1, 0)
indicator.Text = "Autofarm[F] - "..toggle
indicator.Name = "yeetus"
indicator.TextScaled = true

--input 
UIS.InputBegan:Connect(function(input, processed)
  if processed then return end

  if input.KeyCode == Enum.KeyCode.F then
    toggle = not toggle
    
    if toggle then
      while toggle do
        local num = plr.leaderstats.WORLD.Value
        local stage = workspace.Map.Stages.Boosts[num]:GetChildren()
        for i, v in pairs(stage) do
          if toggle then
          	remote:FireServer(unpack(pet_args))
          	remote:FireServer(unpack(world_args))
          	VI:SendMouseButtonEvent(mouse.X, mouse.Y, 0, true, game, 1)
          	wait(0.5)
          	for j, w in pairs(v:GetChildren()) do
                w.CFrame = HRP.CFrame
            end
          end
        end
      end
    end
  end
end)