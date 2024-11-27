local Noclip = nil
local Clip = nil
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character and character:FindFirstChild("HumanoidRootPart")

-- Функция для ноуклипа
function noclip()
    Clip = false
    local function Nocl()
        if not Clip and character then
            for _, v in pairs(character:GetDescendants()) do
                if v:IsA('BasePart') and v.CanCollide then
                    v.CanCollide = false
                end
            end
        end
        wait(0.21)
    end
    Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
    if Noclip then Noclip:Disconnect() end
    Clip = true
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
local targetCFrame1 = CFrame.new(1599.91113, 139.349731, 1573.41748)
local targetCFrame2 = CFrame.new(1627.46973, 128.850006, 1579.32495)

-- Включаем ноуклип и перемещение
if rootPart then
    noclip()
    while true do
        moveTo(targetCFrame1, 30)
        wait(45)
        moveTo(targetCFrame2, 30)
        wait(2)
    end
else
    warn("Не удалось найти HumanoidRootPart.")
end
