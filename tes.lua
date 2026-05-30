-- Hapus GUI lama jika ada biar tidak menumpuk saat di-execute ulang
if game.CoreGui:FindFirstChild("mscrip_ManualUI") then
    game.CoreGui.mscrip_ManualUI:Destroy()
end

-- Membuat Instansiasi UI Dasar
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ToggleFarm = Instance.new("TextButton")
local ToggleSnap = Instance.new("TextButton")

ScreenGui.Name = "mscrip_ManualUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- Membuat Kotak Menu Utama
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Position = UDim2.new(0.3, 0, 0.2, 0)
Frame.Size = UDim2.new(0, 350, 0, 250)
Frame.Active = true
Frame.Draggable = true -- Supaya menu bisa digeser-geser di layar HP

-- Judul Menu
Title.Parent = Frame
Title.Text = "mscrip | Kick A Lucky (Delta Fix)"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16

-- Tombol Auto Farm
ToggleFarm.Parent = Frame
ToggleFarm.Position = UDim2.new(0.1, 0, 0.25, 0)
ToggleFarm.Size = UDim2.new(0, 280, 0, 40)
ToggleFarm.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleFarm.Text = "Auto Farm: OFF"
ToggleFarm.TextColor3 = Color3.fromRGB(255, 255, 255)

_G.AutoFarm = false
ToggleFarm.MouseButton1Click:Connect(function()
    _G.AutoFarm = not _G.AutoFarm
    if _G.AutoFarm then
        ToggleFarm.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        ToggleFarm.Text = "Auto Farm: ON"
    else
        ToggleFarm.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        ToggleFarm.Text = "Auto Farm: OFF"
    end
end)

-- Tombol Auto Snap
ToggleSnap.Parent = Frame
ToggleSnap.Position = UDim2.new(0.1, 0, 0.5, 0)
ToggleSnap.Size = UDim2.new(0, 280, 0, 40)
ToggleSnap.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleSnap.Text = "Auto Snap: OFF"
ToggleSnap.TextColor3 = Color3.fromRGB(255, 255, 255)

_G.AutoSnap = false
ToggleSnap.MouseButton1Click:Connect(function()
    _G.AutoSnap = not _G.AutoSnap
    if _G.AutoSnap then
        ToggleSnap.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        ToggleSnap.Text = "Auto Snap: ON"
    else
        ToggleSnap.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        ToggleSnap.Text = "Auto Snap: OFF"
    end
end)
