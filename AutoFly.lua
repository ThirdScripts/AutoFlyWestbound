local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Функция для ноуклипа
local Noclip = nil
local function noclip()
    Noclip = game:GetService("RunService").Stepped:Connect(function()
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
end

local function clip()
    if Noclip then
        Noclip:Disconnect()
    end
end

-- Функция для перемещения
local function moveTo(targetCFrame, speed)
    local targetPosition = targetCFrame.Position
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)
    bodyVelocity.Velocity = Vector3.zero
    bodyVelocity.Parent = rootPart

    local distance = (targetPosition - rootPart.Position).Magnitude
    local travelTime = distance / speed
    local startTime = tick()

    while tick() - startTime < travelTime do
        local direction = (targetPosition - rootPart.Position).Unit
        bodyVelocity.Velocity = direction * speed
        wait()
    end

    bodyVelocity:Destroy()
    rootPart.CFrame = targetCFrame
end

-- Координаты
local targetCFrame1 = CFrame.new(1597.44568, 139.349731, 1572.37415)
local targetCFrame2 = CFrame.new(1627.47107, 128.850006, 1567.57141)
local targetCFrame3 = CFrame.new(1627.32166, 128.75, 1578.15161)
local targetCFrame4 = CFrame.new(1622.11279, 128.850006, 1588.15698)
local targetCFrame5 = CFrame.new(1612.74792, 128.850006, 1587.80322)

-- Выполнение
noclip()
while true do
    moveTo(targetCFrame1, 50) -- Перемещение к первой точке
    wait(45)                 -- Ожидание 3 секунд
    moveTo(targetCFrame2, 50) -- Перемещение ко второй точке
    wait(3)                 -- Ожидание 3 секунд
    moveTo(targetCFrame1, 50) -- Возврат к первой точке
    wait(45)                 -- Ожидание 3 секунд
    moveTo(targetCFrame3, 50) -- Перемещение к третьей точке
    wait(3)                 -- Ожидание 3 секунд
    moveTo(targetCFrame1, 50) -- Возврат к первой точке
    wait(45)                 -- Ожидание 3 секунд
    moveTo(targetCFrame4, 50) -- Перемещение к четвертой точке
    wait(3)                 -- Ожидание 3 секунд
    moveTo(targetCFrame1, 50) -- Возврат к первой точке
    wait(45)                 -- Ожидание 3 секунд
    moveTo(targetCFrame5, 50) -- Перемещение к пятой точке
    wait(3)                 -- Ожидание 3 секунд
    moveTo(targetCFrame1, 50) -- Возврат к первой точке
    wait(45)                 -- Ожидание 3 секунд
end
