local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "mscrip | Kick A Lucky",
   LoadingTitle = "Loading mscrip UI...",
   LoadingSubtitle = "by mscrip Team",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "mscrip_kickalucky",
      FileName = "config"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvites",
      RememberJoins = true
   },
   KeySystem = false -- Setel ke true jika ingin pakai sistem key
})

-- =================================================================
-- TAB 1: MAIN (Menu Utama sesuai isi gambar Anda)
-- =================================================================
local MainTab = Window:CreateTab("Main", 4483362458) -- ID Icon korak/home

local InfoParagraph = MainTab:CreateParagraph({
    Title = "Info", 
    Content = "Welcome to mscrip! Status: Undetected"
})

local FarmToggle = MainTab:CreateToggle({
   Name = "Auto Farm",
   CurrentValue = false,
   Flag = "ToggleAutoFarm", 
   Callback = function(Value)
       _G.AutoFarm = Value
       if Value then
           print("Auto Farm Diaktifkan")
           -- Letakkan fungsi/looping Auto Farm Anda di sini
       else
           print("Auto Farm Dimatikan")
       end
   end,
})

local SnapToggle = MainTab:CreateToggle({
   Name = "Auto Snap (Rule Builder)",
   CurrentValue = false,
   Flag = "ToggleAutoSnap",
   Callback = function(Value)
       _G.AutoSnap = Value
       if Value then
           print("Auto Snap Diaktifkan")
           -- Letakkan fungsi Auto Snap Anda di sini
       else
           print("Auto Snap Dimatikan")
       end
   end,
})

-- =================================================================
-- TAB 2: CONFIG & LAINNYA (Sesuai list menu sebelah kiri gambar)
-- =================================================================
local ConfigTab = Window:CreateTab("Config", 4483362458)
local AutoTab = Window:CreateTab("Automatically", 4483362458)
local MiscTab = Window:CreateTab("Miscellaneous", 4483362458)

-- =================================================================
-- TAB 3: WEBHOOK (Menu paling bawah pada gambar)
-- =================================================================
local WebhookTab = Window:CreateTab("Webhook", 4483362458)

local WebhookInput = WebhookTab:CreateInput({
   Name = "Discord Webhook URL",
   PlaceholderText = "Paste url here...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
       _G.WebhookURL = Text
       print("Webhook disetel ke: " .. Text)
   end,
})

-- Notifikasi saat UI berhasil dimuat
Rayfield:Notify({
   Title = "mscrip Loaded!",
   Content = "Enjoy cheating safely with mscrip.",
   Duration = 5,
   Image = 4483362458,
})
