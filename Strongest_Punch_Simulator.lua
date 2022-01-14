--variables
local plr = game.Players.LocalPlayer
local HRP = plr.Character.HumanoidRootPart
local VI = game:GetService("VirtualInputManager")
local UIS = game:GetService("UserInputService")
local toggle = false
local key = Enum.KeyCode.F --autofarm keybind set to F
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
indicator.Text = "Autofarm["..UIS:GetStringForKeyCode(key).."] - "..tostring(toggle)
indicator.Name = "yeetus"
indicator.TextScaled = true

--input 
UIS.InputBegan:Connect(function(input, processed)
  if processed then return end

  if input.KeyCode == key then
    toggle = not toggle
    indicator.Text = "Autofarm["..UIS:GetStringForKeyCode(key).."] - "..tostring(toggle)

    while toggle do
      local num = plr.leaderstats.WORLD.Value
      local stage = workspace.Map.Stages.Boosts[num]:GetChildren()
      for i, v in pairs(stage) do
        if toggle then
          remote:FireServer(unpack(pet_args))
	  remote:FireServer(unpack(world_args))
	  VI:SendMouseButtonEvent(500, 500, 0, true, game, 1)
	  wait(0.4)
          for j, w in pairs(v:GetChildren()) do
	    w.CFrame = HRP.CFrame
	  end
	end
      end
    end
  end
end)
