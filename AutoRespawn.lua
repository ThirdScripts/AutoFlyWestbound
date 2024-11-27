local args = {
    [1] = "Grayridge",
    [2] = false,
    [3] = false
}

local function onCharacterAdded(character)
    local humanoid = character:WaitForChild("Humanoid")

    humanoid.Died:Connect(function()
        wait(15.5)  -- Задержка в 15.5 секунду после смерти
        game:GetService("ReplicatedStorage"):WaitForChild("GeneralEvents"):WaitForChild("Spawn"):FireServer(unpack(args))
    end)
end

local player = game.Players.LocalPlayer
if player.Character then
    onCharacterAdded(player.Character)
end
player.CharacterAdded:Connect(onCharacterAdded)
