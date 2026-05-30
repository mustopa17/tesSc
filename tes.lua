local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "mscrip | Kick A Lucky", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "mscrip_delta",
    IntroText = "mscrip Loading..."
})

-- ==========================================
-- TAB MAIN
-- ==========================================
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483362458"
})

MainTab:AddLabel("Info: Welcome to mscrip!")

MainTab:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(Value)
        _G.AutoFarm = Value
        while _G.AutoFarm do
            task.wait(0.1)
            -- Masukkan kode script Auto Farm Anda di sini
            print("Auto Farming...")
        end
    end    
})

MainTab:AddToggle({
    Name = "Auto Snap (Rule Builder)",
    Default = false,
    Callback = function(Value)
        _G.AutoSnap = Value
        while _G.AutoSnap do
            task.wait(0.1)
            -- Masukkan kode script Auto Snap Anda di sini
            print("Auto Snapping...")
        end
    end    
})

-- ==========================================
-- TAB LAINNYA (Sesuai Menu Kiri Gambar)
-- ==========================================
local ConfigTab = Window:MakeTab({ Name = "Config" })
local AutoTab = Window:MakeTab({ Name = "Automatically" })
local MiscTab = Window:MakeTab({ Name = "Miscellaneous" })
local WebhookTab = Window:MakeTab({ Name = "Webhook" })

WebhookTab:AddTextbox({
    Name = "Discord Webhook",
    Default = "",
    TextDisappear = false,
    Callback = function(Text)
        _G.WebhookURL = Text
    end
})

OrionLib:Init()
