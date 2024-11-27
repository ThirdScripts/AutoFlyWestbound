while true do
    -- Первый вызов: открытие сейфа
    local args1 = {
        [1] = "Complete"
    }
    workspace:WaitForChild("Safe"):WaitForChild("OpenSafe"):FireServer(unpack(args1))
    
    -- Второй вызов: ограбление сейфа
    local args2 = {
        [1] = "Safe",
        [2] = workspace:WaitForChild("Safe")
    }
    game:GetService("ReplicatedStorage"):WaitForChild("GeneralEvents"):WaitForChild("Rob"):FireServer(unpack(args2))
    
    -- Задержка перед повторением цикла (настраиваемая)
    wait(0.1) -- Установи нужную паузу, например, 1 секунда 
end
