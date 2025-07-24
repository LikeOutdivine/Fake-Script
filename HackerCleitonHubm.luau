-- LocalScript para StarterPlayerScripts
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

-- GUI principal invisível no começo
local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "ScriptHubUI"
gui.ResetOnSpawn = false

-- Botão principal
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, 150, 0, 40)
openBtn.Position = UDim2.new(0, 10, 0.5, -20)
openBtn.Text = "⚙️ Abrir HackerClaiton"
openBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
openBtn.Font = Enum.Font.SourceSansBold
openBtn.TextScaled = true

-- Frame da interface
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.3, 0, 0.5, 0)
frame.Position = UDim2.new(0.35, 0, 0.25, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
frame.BorderSizePixel = 2
frame.Visible = false
frame.Parent = gui

-- Título
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0.15, 0)
title.Text = "HackerClaiton Hub"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Font = Enum.Font.Arcade
title.TextScaled = true

-- Botão fechar
local closeButton = Instance.new("TextButton", frame)
closeButton.Size = UDim2.new(0.1, 0, 0.12, 0)
closeButton.Position = UDim2.new(0.9, -25, 0, 5)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextScaled = true

-- Mostrar e esconder frame
openBtn.MouseButton1Click:Connect(function()
	frame.Visible = true
	openBtn.Visible = false
end)

closeButton.MouseButton1Click:Connect(function()
	frame.Visible = false
	openBtn.Visible = true
end)

-- Botões do menu
local wallBtn = Instance.new("TextButton", frame)
wallBtn.Size = UDim2.new(0.8, 0, 0.15, 0)
wallBtn.Position = UDim2.new(0.1, 0, 0.2, 0)
wallBtn.Text = "🚪 Ativar WallHack"
wallBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
wallBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
wallBtn.Font = Enum.Font.SourceSansBold
wallBtn.TextScaled = true

local tpBtn = Instance.new("TextButton", frame)
tpBtn.Size = UDim2.new(0.8, 0, 0.15, 0)
tpBtn.Position = UDim2.new(0.1, 0, 0.37, 0)
tpBtn.Text = "📍 Teleportar para base"
tpBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
tpBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
tpBtn.Font = Enum.Font.SourceSansBold
tpBtn.TextScaled = true

local freezeBtn = Instance.new("TextButton", frame)
freezeBtn.Size = UDim2.new(0.8, 0, 0.15, 0)
freezeBtn.Position = UDim2.new(0.1, 0, 0.54, 0)
freezeBtn.Text = "❄️ Congelar jogadores"
freezeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
freezeBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
freezeBtn.Font = Enum.Font.SourceSansBold
freezeBtn.TextScaled = true

local autoGrabBtn = Instance.new("TextButton", frame)
autoGrabBtn.Size = UDim2.new(0.8, 0, 0.15, 0)
autoGrabBtn.Position = UDim2.new(0.1, 0, 0.71, 0)
autoGrabBtn.Text = "🤖 Auto Pegar Brainrot"
autoGrabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
autoGrabBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
autoGrabBtn.Font = Enum.Font.SourceSansBold
autoGrabBtn.TextScaled = true

-- Funcionalidades
local noclip = false
local autoGrabActive = false

RunService.Stepped:Connect(function()
	if noclip then
		for _, part in pairs(Character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
end)

wallBtn.MouseButton1Click:Connect(function()
	noclip = not noclip
	wallBtn.Text = noclip and "✅ WallHack ON" or "🚪 Ativar WallHack"
end)

tpBtn.MouseButton1Click:Connect(function()
	local basePosition = Vector3.new(0, 50, 0)
	Character:PivotTo(CFrame.new(basePosition))
end)

freezeBtn.MouseButton1Click:Connect(function()
	for _, plr in pairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			plr.Character.HumanoidRootPart.Anchored = true
		end
	end
end)

RunService.Heartbeat:Connect(function()
	if autoGrabActive then
		local brainrot = workspace:FindFirstChild("Brainrot")
		if brainrot and brainrot:IsA("BasePart") then
			Character:PivotTo(brainrot.CFrame)
		end
	end
end)

autoGrabBtn.MouseButton1Click:Connect(function()
	autoGrabActive = not autoGrabActive
	autoGrabBtn.Text = autoGrabActive and "✅ Auto Pegar Brainrot ON" or "🤖 Auto Pegar Brainrot"
end)
