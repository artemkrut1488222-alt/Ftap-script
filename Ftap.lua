-- Загрузка интерфейса Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Создание окна
local Window = Rayfield:CreateWindow({
   Name = "🎯 FTAP Hub | Fling Things and People",
   LoadingTitle = "Загрузка...",
   LoadingSubtitle = "by fr0sty",
   ConfigurationSaving = { Enabled = false }
})

-- Вкладка
local MainTab = Window:CreateTab("🏠 Главная", 4483362458)

-- Настройка скорости
MainTab:CreateSlider({
   Name = "Скорость движения",
   Range = {16, 120},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
          game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
      end
   end,
})

-- Настройка прыжка
MainTab:CreateSlider({
   Name = "Сила прыжка",
   Range = {50, 200},
   Increment = 5,
   CurrentValue = 50,
   Callback = function(Value)
      if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
          game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
      end
   end,
})

-- Включение ESP (Подсветки)
MainTab:CreateButton({
   Name = "Включить подсветку игроков (ESP)",
   Callback = function()
      for _, player in ipairs(game.Players:GetPlayers()) do
         if player ~= game.Players.LocalPlayer and player.Character then
            if not player.Character:FindFirstChild("HighlightESP") then
               local highlight = Instance.new("Highlight")
               highlight.Name = "HighlightESP"
               highlight.FillColor = Color3.fromRGB(255, 0, 0)
               highlight.Parent = player.Character
            end
         end
      end
   end,
})
