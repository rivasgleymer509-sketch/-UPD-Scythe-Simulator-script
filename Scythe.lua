--====================================================
-- SCYTHE HUB | KEY SYSTEM + HUB ORIGINAL (ESTABLE)
--====================================================

local Players = game:GetService("Players")
local Rep = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

--====================================================
--============== SISTEMA DE KEYS ======================
--====================================================

local Keys = {
	"SCYTHE-ACCESS-1",
	"SCYTHE-ACCESS-8",
	"SCYTHE-ACCESS-2",
	"SCYTHE-ACCESS-5",
	"SCYTHE-ACCESS-9"
}

-- inicio: HOY (miércoles) 00:00 UTC
local startDate = os.time({
	year = os.date("!*t").year,
	month = os.date("!*t").month,
	day = os.date("!*t").day,
	hour = 0, min = 0, sec = 0
})

local function getKeyIndex()
	local elapsed = os.time(os.date("!*t")) - startDate
	local period = math.floor(elapsed / (5*24*60*60))
	return (period % #Keys) + 1
end

local function getCurrentKey()
	return Keys[getKeyIndex()]
end

local function getRemaining()
	local elapsed = os.time(os.date("!*t")) - startDate
	local period = math.floor(elapsed / (5*24*60*60))
	local nextChange = startDate + (period+1)*5*24*60*60
	return math.max(0, nextChange - os.time(os.date("!*t")))
end

local function format(sec)
	local d = math.floor(sec/86400)
	local h = math.floor((sec%86400)/3600)
	local m = math.floor((sec%3600)/60)
	local s = math.floor(sec%60)
	return string.format("%02dD %02dH %02dM %02dS", d,h,m,s)
end

--====================================================
--================ GUI KEY SYSTEM ====================
--====================================================

local KeyGui = Instance.new("ScreenGui", PlayerGui)
KeyGui.Name = "KeySystem"
KeyGui.ResetOnSpawn = false

local KMain = Instance.new("Frame", KeyGui)
KMain.Size = UDim2.new(0,300,0,240)
KMain.Position = UDim2.new(0.5,-150,0.5,-120)
KMain.BackgroundColor3 = Color3.fromRGB(25,25,25)
KMain.Active = true
Instance.new("UICorner", KMain).CornerRadius = UDim.new(0,16)

-- Drag móvil
do
	local dragging, dragStart, startPos
	KMain.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = i.Position
			startPos = KMain.Position
		end
	end)
	KMain.InputChanged:Connect(function(i)
		if dragging and i.UserInputType == Enum.UserInputType.Touch then
			local d = i.Position - dragStart
			KMain.Position = UDim2.new(
				startPos.X.Scale, startPos.X.Offset + d.X,
				startPos.Y.Scale, startPos.Y.Offset + d.Y
			)
		end
	end)
	UIS.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.Touch then dragging = false end
	end)
end

local Title = Instance.new("TextLabel", KMain)
Title.Size = UDim2.new(1,0,0,40)
Title.BackgroundTransparency = 1
Title.Text = "🔐 SCYTHE HUB KEY"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16

local Box = Instance.new("TextBox", KMain)
Box.Size = UDim2.new(1,-40,0,40)
Box.Position = UDim2.new(0,20,0,60)
Box.PlaceholderText = "Pega la key aquí..."
Box.Text = ""
Box.Font = Enum.Font.Gotham
Box.TextSize = 14
Box.BackgroundColor3 = Color3.fromRGB(35,35,35)
Box.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Box).CornerRadius = UDim.new(0,10)

local Verify = Instance.new("TextButton", KMain)
Verify.Size = UDim2.new(1,-40,0,40)
Verify.Position = UDim2.new(0,20,0,120)
Verify.Text = "VERIFY"
Verify.Font = Enum.Font.GothamBold
Verify.TextSize = 14
Verify.BackgroundColor3 = Color3.fromRGB(0,170,0)
Verify.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Verify).CornerRadius = UDim.new(0,10)

local Timer = Instance.new("TextLabel", KMain)
Timer.Size = UDim2.new(1,-20,0,30)
Timer.Position = UDim2.new(0,10,0,175)
Timer.BackgroundTransparency = 1
Timer.TextColor3 = Color3.new(1,1,1)
Timer.Font = Enum.Font.GothamBold
Timer.TextSize = 14

task.spawn(function()
	while task.wait(1) do
		Timer.Text = "⏳ Cambia en: "..format(getRemaining())
	end
end)

--====================================================
--============== FUNCIÓN: INICIAR HUB =================
--====================================================

local function StartHub()

-- >>>>>> AQUÍ EMPIEZA TU HUB ORIGINAL <<<<<<
-- (NO CAMBIÉ ABSOLUTAMENTE NADA)

-- HUB MOBILE | AUTO RENACIMIENTO + ANTI AFK
-- Simulador de Guadaña - Mook Studios

local Players = game:GetService("Players")
local Rep = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- BUSCAR REMOTES DE RENACIMIENTO (FILTRADO SEGURO)
local RebirthRemotes = {}

for _,v in pairs(Rep:GetDescendants()) do
	if v:IsA("RemoteEvent") then
		local n = v.Name:lower()
		if (n:find("rebirth") or n:find("renac"))
		and not n:find("super")
		and not n:find("mega")
		and not n:find("ultra") then
			table.insert(RebirthRemotes, v)
		end
	end
end

-- GUI
local Gui = Instance.new("ScreenGui")
Gui.Name = "ScytheHub_Mobile"
Gui.ResetOnSpawn = false
Gui.Parent = PlayerGui

local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,260,0,230)
Main.Position = UDim2.new(0.5,-130,0.5,-115)
Main.BackgroundColor3 = Color3.fromRGB(25,25,25)
Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,16)

-- DRAG MÓVIL
local dragging = false
local dragStart, startPos

Main.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = i.Position
		startPos = Main.Position
	end
end)

Main.InputChanged:Connect(function(i)
	if dragging and i.UserInputType == Enum.UserInputType.Touch then
		local delta = i.Position - dragStart
		Main.Position = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y
		)
	end
end)

UIS.InputEnded:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

-- TÍTULO
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1,-40,0,40)
Title.Position = UDim2.new(0,10,0,0)
Title.BackgroundTransparency = 1
Title.Text = "⚔️ SCYTHE HUB"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

-- BOTÓN MINIMIZAR
local MinBtn = Instance.new("TextButton", Main)
MinBtn.Size = UDim2.new(0,30,0,30)
MinBtn.Position = UDim2.new(1,-35,0,5)
MinBtn.Text = "–"
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 20
MinBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
MinBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(1,0)

-- BOTÓN AUTO RENACIMIENTO
local RebirthBtn = Instance.new("TextButton", Main)
RebirthBtn.Size = UDim2.new(1,-20,0,55)
RebirthBtn.Position = UDim2.new(0,10,0,55)
RebirthBtn.Text = "AUTO RENACIMIENTO: OFF"
RebirthBtn.Font = Enum.Font.GothamBold
RebirthBtn.TextSize = 14
RebirthBtn.BackgroundColor3 = Color3.fromRGB(170,0,0)
RebirthBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", RebirthBtn).CornerRadius = UDim.new(0,14)

-- BOTÓN ANTI AFK
local AntiAfkBtn = Instance.new("TextButton", Main)
AntiAfkBtn.Size = UDim2.new(1,-20,0,55)
AntiAfkBtn.Position = UDim2.new(0,10,0,120)
AntiAfkBtn.Text = "ANTI AFK: OFF"
AntiAfkBtn.Font = Enum.Font.GothamBold
AntiAfkBtn.TextSize = 14
AntiAfkBtn.BackgroundColor3 = Color3.fromRGB(170,0,0)
AntiAfkBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", AntiAfkBtn).CornerRadius = UDim.new(0,14)

-- ESTADOS
local autoRebirth = false
local antiAfk = false
local minimized = false

-- BOTONES
RebirthBtn.MouseButton1Click:Connect(function()
	autoRebirth = not autoRebirth
	RebirthBtn.Text = autoRebirth and "AUTO RENACIMIENTO: ON" or "AUTO RENACIMIENTO: OFF"
	RebirthBtn.BackgroundColor3 = autoRebirth and Color3.fromRGB(0,170,0)
		or Color3.fromRGB(170,0,0)
end)

AntiAfkBtn.MouseButton1Click:Connect(function()
	antiAfk = not antiAfk
	AntiAfkBtn.Text = antiAfk and "ANTI AFK: ON" or "ANTI AFK: OFF"
	AntiAfkBtn.BackgroundColor3 = antiAfk and Color3.fromRGB(0,170,0)
		or Color3.fromRGB(170,0,0)
end)

MinBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	RebirthBtn.Visible = not minimized
	AntiAfkBtn.Visible = not minimized
	Main.Size = minimized and UDim2.new(0,260,0,45)
		or UDim2.new(0,260,0,230)
	MinBtn.Text = minimized and "+" or "–"
end)

-- LOOP AUTO RENACIMIENTO
local cooldown = 1.5
local lastTry = 0

task.spawn(function()
	while task.wait(0.3) do
		if not autoRebirth then continue end
		if os.clock() - lastTry < cooldown then continue end
		lastTry = os.clock()
		for _,r in pairs(RebirthRemotes) do
			pcall(function()
				r:FireServer()
			end)
		end
	end
end)

-- LOOP ANTI AFK
task.spawn(function()
	while task.wait(30) do
		if antiAfk then
			pcall(function()
				VirtualUser:CaptureController()
				VirtualUser:ClickButton2(Vector2.new(0,0))
			end)
		end
	end
end)

end -- FIN StartHub()

--====================================================
--============== VERIFICAR KEY ========================
--====================================================

Verify.MouseButton1Click:Connect(function()
	if Box.Text == getCurrentKey() then
		StarterGui:SetCore("SendNotification", {
			Title = "KEY SYSTEM",
			Text = "Key correcta 😎",
			Duration = 4
		})
		KeyGui:Destroy()
		StartHub()
	else
		StarterGui:SetCore("SendNotification", {
			Title = "KEY SYSTEM",
			Text = "Key incorrecta ❌",
			Duration = 4
		})
	end
end)
