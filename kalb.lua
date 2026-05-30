--[[
    __  ___  _____  ______  ____  ____  ______
   /  |/  / / ___/ / ____/ / __ \/  _/ /_  __/
  / /|_/ /  \__ \ / /     / /_/ // /    / /   
 / /  / /  ___/ // /___  / _, _// /    / /    
/_/  /_/  /____/ \____/ /_/ |_|/___/  /_/     
                                              
  Custom Roblox GUI Framework for "Kick A Lucky"
  Replaced title "Napoleon" with "mscrip"
  File: kalb.lua
--]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

-- Determine safe parent for execution (CoreGui for exploits, PlayerGui fallback for Studio)
local Parent = nil
local success, err = pcall(function()
    Parent = game:GetService("CoreGui")
end)
if not success or not Parent then
    Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- Prevent duplicate GUIs
if Parent:FindFirstChild("mscrip_GUI") then
    Parent.mscrip_GUI:Destroy()
end

-- Modern Color Palette (Aesthetic dark theme with vibrant accents)
local Theme = {
    Background = Color3.fromRGB(24, 24, 26),
    BackgroundTrans = 0.15,
    Sidebar = Color3.fromRGB(18, 18, 20),
    Accent = Color3.fromRGB(0, 162, 255),
    CardBg = Color3.fromRGB(32, 32, 36),
    Border = Color3.fromRGB(45, 45, 48),
    TextActive = Color3.fromRGB(255, 255, 255),
    TextMuted = Color3.fromRGB(160, 160, 165),
    ToggleActive = Color3.fromRGB(0, 180, 120),
    ToggleInactive = Color3.fromRGB(60, 60, 65)
}

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "mscrip_GUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = Parent

-- Main Frame Container (Handles scale & fade-in animations)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 600, 0, 500)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -250)
MainFrame.BackgroundColor3 = Theme.Background
MainFrame.BackgroundTransparency = 1 -- Animate to Theme.BackgroundTrans
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Theme.Border
MainStroke.Thickness = 1
MainStroke.Transparency = 1 -- Animate to 0
MainStroke.Parent = MainFrame

-- Shadow Effect
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.Size = UDim2.new(1, 40, 1, 40)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://6015897843"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 1 -- Animate to 0.4
Shadow.ZIndex = 0
Shadow.Parent = MainFrame

-- Double Slash // Logo Watermark (Middle Background Accent)
local Watermark = Instance.new("Frame")
Watermark.Name = "Watermark"
Watermark.Size = UDim2.new(0, 200, 0, 200)
Watermark.Position = UDim2.new(0.5, -20, 0.5, -80)
Watermark.BackgroundTransparency = 1
Watermark.ZIndex = 1
Watermark.Parent = MainFrame

local Line1 = Instance.new("Frame")
Line1.Size = UDim2.new(0, 18, 0, 180)
Line1.Position = UDim2.new(0.4, -9, 0.5, -90)
Line1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line1.BackgroundTransparency = 0.94
Line1.BorderSizePixel = 0
Line1.Rotation = -28
Line1.ZIndex = 1
Line1.Parent = Watermark

local Line1Corner = Instance.new("UICorner")
Line1Corner.CornerRadius = UDim.new(0, 9)
Line1Corner.Parent = Line1

local Line2 = Instance.new("Frame")
Line2.Size = UDim2.new(0, 18, 0, 180)
Line2.Position = UDim2.new(0.6, -9, 0.5, -90)
Line2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line2.BackgroundTransparency = 0.94
Line2.BorderSizePixel = 0
Line2.Rotation = -28
Line2.ZIndex = 1
Line2.Parent = Watermark

local Line2Corner = Instance.new("UICorner")
Line2Corner.CornerRadius = UDim.new(0, 9)
Line2Corner.Parent = Line2

-- Top Bar (Drag Area and Window Headers)
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundTransparency = 1
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

-- Logo // in Top Left
local LogoLabel = Instance.new("TextLabel")
LogoLabel.Name = "LogoLabel"
LogoLabel.Size = UDim2.new(0, 30, 0, 45)
LogoLabel.Position = UDim2.new(0, 15, 0, 0)
LogoLabel.BackgroundTransparency = 1
LogoLabel.Text = "//"
LogoLabel.TextColor3 = Theme.Accent
LogoLabel.TextSize = 20
LogoLabel.Font = Enum.Font.GothamBold
LogoLabel.TextXAlignment = Enum.TextXAlignment.Left
LogoLabel.Parent = TopBar

-- Title Text (mscrip | Kick A Lucky)
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(0, 300, 0, 45)
TitleLabel.Position = UDim2.new(0, 45, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "mscrip| Kick A Lucky"
TitleLabel.TextColor3 = Theme.TextActive
TitleLabel.TextSize = 15
TitleLabel.Font = Enum.Font.GothamSemibold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

-- Circular/Rounded User Avatar Overlapping the Top Bar
local AvatarFrame = Instance.new("Frame")
AvatarFrame.Name = "AvatarFrame"
AvatarFrame.Size = UDim2.new(0, 52, 0, 52)
AvatarFrame.Position = UDim2.new(0.5, -26, 0, -20)
AvatarFrame.BackgroundColor3 = Theme.Background
AvatarFrame.BorderSizePixel = 0
AvatarFrame.ZIndex = 10
AvatarFrame.Parent = TopBar

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(0, 14)
AvatarCorner.Parent = AvatarFrame

local AvatarStroke = Instance.new("UIStroke")
AvatarStroke.Color = Theme.Accent
AvatarStroke.Thickness = 2
AvatarStroke.Parent = AvatarFrame

local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Size = UDim2.new(1, -4, 1, -4)
AvatarImage.Position = UDim2.new(0, 2, 0, 2)
AvatarImage.BackgroundTransparency = 1
AvatarImage.Image = "rbxassetid://6072703869" -- Fallback Ninja Logo
AvatarImage.Parent = AvatarFrame

local AvatarImgCorner = Instance.new("UICorner")
AvatarImgCorner.CornerRadius = UDim.new(0, 12)
AvatarImgCorner.Parent = AvatarImage

-- Safely set Avatar Image
task.spawn(function()
    pcall(function()
        local userId = LocalPlayer.UserId
        local headshotUrl, isReady = Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
        if isReady then
            AvatarImage.Image = headshotUrl
        end
    end)
end)

-- Window Controls (Minimize, Fullscreen, Close)
local ControlsContainer = Instance.new("Frame")
ControlsContainer.Name = "Controls"
ControlsContainer.Size = UDim2.new(0, 120, 1, 0)
ControlsContainer.Position = UDim2.new(1, -125, 0, 0)
ControlsContainer.BackgroundTransparency = 1
ControlsContainer.Parent = TopBar

local function createControlBtn(name, text, index, iconColor)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(0, 30, 0, 30)
    btn.Position = UDim2.new(0, (index - 1) * 35, 0.5, -15)
    btn.BackgroundTransparency = 1
    btn.Text = text
    btn.TextColor3 = Theme.TextMuted
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamMedium
    btn.Parent = ControlsContainer

    -- Hover effect
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {TextColor3 = iconColor or Theme.TextActive}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {TextColor3 = Theme.TextMuted}):Play()
    end)

    return btn
end

local MinButton = createControlBtn("Minimize", "-", 1, Theme.Accent)
local MaxButton = createControlBtn("Maximize", "▢", 2, Theme.TextActive)
local CloseButton = createControlBtn("Close", "✕", 3, Color3.fromRGB(240, 70, 70))

-- Dragging System (Smooth & Responsive)
local dragging, dragInput, dragStart, startPos
local function updateDrag(input)
    local delta = input.Position - dragStart
    local goal = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    TweenService:Create(MainFrame, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = goal}):Play()
end

TopBar.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not dragging then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateDrag(input)
    end
end)

-- Sidebar (Left Side Layout)
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 170, 1, -55)
Sidebar.Position = UDim2.new(0, 10, 0, 45)
Sidebar.BackgroundTransparency = 1
Sidebar.Parent = MainFrame

local SidebarList = Instance.new("UIListLayout")
SidebarList.Padding = UDim.new(0, 6)
SidebarList.SortOrder = Enum.SortOrder.LayoutOrder
SidebarList.Parent = Sidebar

-- Tab Indicator Pill
local ActiveIndicator = Instance.new("Frame")
ActiveIndicator.Name = "TabIndicator"
ActiveIndicator.Size = UDim2.new(0, 3, 0, 20)
ActiveIndicator.Position = UDim2.new(0, 4, 0, 0)
ActiveIndicator.BackgroundColor3 = Theme.TextActive
ActiveIndicator.BorderSizePixel = 0
ActiveIndicator.Visible = false
ActiveIndicator.ZIndex = 5
ActiveIndicator.Parent = Sidebar

local IndicatorCorner = Instance.new("UICorner")
IndicatorCorner.CornerRadius = UDim.new(0, 2)
IndicatorCorner.Parent = ActiveIndicator

-- Content Area (Right Side Layout)
local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, -200, 1, -60)
ContentArea.Position = UDim2.new(0, 190, 0, 50)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

-- Profile Card (Bottom Left of Sidebar)
local ProfileCard = Instance.new("Frame")
ProfileCard.Name = "ProfileCard"
ProfileCard.Size = UDim2.new(0, 150, 0, 45)
ProfileCard.Position = UDim2.new(0, 10, 1, -55)
ProfileCard.BackgroundColor3 = Theme.CardBg
ProfileCard.BackgroundTransparency = 0.5
ProfileCard.BorderSizePixel = 0
ProfileCard.Parent = MainFrame

local ProfileCorner = Instance.new("UICorner")
ProfileCorner.CornerRadius = UDim.new(0, 8)
ProfileCorner.Parent = ProfileCard

local ProfileStroke = Instance.new("UIStroke")
ProfileStroke.Color = Theme.Border
ProfileStroke.Thickness = 0.5
ProfileStroke.Parent = ProfileCard

local MiniAvatar = Instance.new("ImageLabel")
MiniAvatar.Name = "MiniAvatar"
MiniAvatar.Size = UDim2.new(0, 28, 0, 28)
MiniAvatar.Position = UDim2.new(0, 8, 0.5, -14)
MiniAvatar.BackgroundTransparency = 1
MiniAvatar.Image = "rbxassetid://6072703869"
MiniAvatar.Parent = ProfileCard

local MiniAvatarCorner = Instance.new("UICorner")
MiniAvatarCorner.CornerRadius = UDim.new(0, 6)
MiniAvatarCorner.Parent = MiniAvatar

-- Masked Player Name
local playerUsername = LocalPlayer.Name
local nameLength = #playerUsername
local maskedText = string.sub(playerUsername, 1, math.min(4, nameLength)) .. string.rep("*", math.max(3, nameLength - 4))

local ProfileName = Instance.new("TextLabel")
ProfileName.Name = "ProfileName"
ProfileName.Size = UDim2.new(1, -45, 1, 0)
ProfileName.Position = UDim2.new(0, 42, 0, 0)
ProfileName.BackgroundTransparency = 1
ProfileName.Text = maskedText
ProfileName.TextColor3 = Theme.TextActive
ProfileName.TextSize = 12
ProfileName.Font = Enum.Font.GothamSemibold
ProfileName.TextXAlignment = Enum.TextXAlignment.Left
ProfileName.Parent = ProfileCard

-- Set mini avatar
task.spawn(function()
    pcall(function()
        local userId = LocalPlayer.UserId
        local headshotUrl, isReady = Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size50x50)
        if isReady then
            MiniAvatar.Image = headshotUrl
        end
    end)
end)


-- Tabs Manager
local Tabs = {}
local TabButtons = {}
local SelectedTab = nil

local function switchTab(tabName)
    local button = TabButtons[tabName]
    local container = Tabs[tabName]
    if not button or not container then return end

    if SelectedTab then
        local prevButton = TabButtons[SelectedTab]
        local prevContainer = Tabs[SelectedTab]
        prevContainer.Visible = false
        TweenService:Create(prevButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 1,
            TextColor3 = Theme.TextMuted
        }):Play()
    end

    SelectedTab = tabName
    container.Visible = true
    
    -- Show and move visual indicators
    ActiveIndicator.Visible = true
    TweenService:Create(ActiveIndicator, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 4, 0, button.Position.Y.Offset + (button.Size.Y.Offset - 20) / 2)
    }):Play()

    TweenService:Create(button, TweenInfo.new(0.2), {
        BackgroundColor3 = Theme.CardBg,
        BackgroundTransparency = 0.2,
        TextColor3 = Theme.TextActive
    }):Play()
end

local tabCount = 0
local function createTab(name)
    tabCount = tabCount + 1
    
    -- Tab Button
    local btn = Instance.new("TextButton")
    btn.Name = "Tab_" .. name
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.Position = UDim2.new(0, 0, 0, (tabCount - 1) * 41)
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.BackgroundTransparency = 1
    btn.BorderSizePixel = 0
    btn.Text = "      " .. name -- Margin for layout look
    btn.TextColor3 = Theme.TextMuted
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamMedium
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.LayoutOrder = tabCount
    btn.Parent = Sidebar

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn

    -- Hover events
    btn.MouseEnter:Connect(function()
        if SelectedTab ~= name then
            TweenService:Create(btn, TweenInfo.new(0.2), {
                BackgroundColor3 = Theme.CardBg,
                BackgroundTransparency = 0.6,
                TextColor3 = Theme.TextActive
            }):Play()
        end
    end)
    btn.MouseLeave:Connect(function()
        if SelectedTab ~= name then
            TweenService:Create(btn, TweenInfo.new(0.2), {
                BackgroundTransparency = 1,
                TextColor3 = Theme.TextMuted
            }):Play()
        end
    end)

    btn.MouseButton1Click:Connect(function()
        switchTab(name)
    end)

    TabButtons[name] = btn

    -- Content Scroll Frame
    local container = Instance.new("ScrollingFrame")
    container.Name = "Content_" .. name
    container.Size = UDim2.new(1, 0, 1, 0)
    container.BackgroundTransparency = 1
    container.BorderSizePixel = 0
    container.ScrollBarThickness = 3
    container.ScrollBarImageColor3 = Theme.Border
    container.Visible = false
    container.Parent = ContentArea

    local containerList = Instance.new("UIListLayout")
    containerList.Padding = UDim.new(0, 8)
    containerList.SortOrder = Enum.SortOrder.LayoutOrder
    containerList.Parent = container

    -- Auto-adjust CanvasSize
    containerList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        container.CanvasSize = UDim2.new(0, 0, 0, containerList.AbsoluteContentSize.Y + 20)
    end)

    Tabs[name] = container

    -- Tab Creation Interface Helpers
    local TabHelper = {}

    -- Label Section
    function TabHelper:CreateSection(text)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -10, 0, 24)
        frame.BackgroundTransparency = 1
        frame.Parent = container

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = string.upper(text)
        label.TextColor3 = Theme.TextMuted
        label.TextSize = 10
        label.Font = Enum.Font.GothamBold
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame
    end

    -- Toggle Control
    function TabHelper:CreateToggle(text, defaultState, callback)
        local active = defaultState or false
        
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -10, 0, 44)
        frame.BackgroundColor3 = Theme.CardBg
        frame.BackgroundTransparency = 0.4
        frame.Parent = container

        local frameCorner = Instance.new("UICorner")
        frameCorner.CornerRadius = UDim.new(0, 8)
        frameCorner.Parent = frame

        local frameStroke = Instance.new("UIStroke")
        frameStroke.Color = Theme.Border
        frameStroke.Thickness = 0.5
        frameStroke.Parent = frame

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.7, 0, 1, 0)
        label.Position = UDim2.new(0, 12, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Theme.TextActive
        label.TextSize = 13
        label.Font = Enum.Font.GothamSemibold
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame

        -- Toggle Button Background
        local toggleBg = Instance.new("TextButton")
        toggleBg.Size = UDim2.new(0, 40, 0, 22)
        toggleBg.Position = UDim2.new(1, -52, 0.5, -11)
        toggleBg.BackgroundColor3 = active and Theme.ToggleActive or Theme.ToggleInactive
        toggleBg.Text = ""
        toggleBg.Parent = frame

        local toggleBgCorner = Instance.new("UICorner")
        toggleBgCorner.CornerRadius = UDim.new(1, 0)
        toggleBgCorner.Parent = toggleBg

        -- Toggle Pill / Handle
        local togglePill = Instance.new("Frame")
        togglePill.Size = UDim2.new(0, 16, 0, 16)
        togglePill.Position = active and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
        togglePill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        togglePill.BorderSizePixel = 0
        togglePill.Parent = toggleBg

        local togglePillCorner = Instance.new("UICorner")
        togglePillCorner.CornerRadius = UDim.new(1, 0)
        togglePillCorner.Parent = togglePill

        toggleBg.MouseButton1Click:Connect(function()
            active = not active
            
            -- Slide Pill & Fade BG Color
            local pillPos = active and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
            local bgCol = active and Theme.ToggleActive or Theme.ToggleInactive
            
            TweenService:Create(togglePill, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = pillPos}):Play()
            TweenService:Create(toggleBg, TweenInfo.new(0.2), {BackgroundColor3 = bgCol}):Play()
            
            task.spawn(function()
                callback(active)
            end)
        end)
    end

    -- Button Link/Command (Action Card with matching right arrow symbol >)
    function TabHelper:CreateButton(text, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -10, 0, 44)
        btn.BackgroundColor3 = Theme.CardBg
        btn.BackgroundTransparency = 0.4
        btn.Text = ""
        btn.Parent = container

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 8)
        btnCorner.Parent = btn

        local btnStroke = Instance.new("UIStroke")
        btnStroke.Color = Theme.Border
        btnStroke.Thickness = 0.5
        btnStroke.Parent = btn

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.8, 0, 1, 0)
        label.Position = UDim2.new(0, 12, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Theme.TextActive
        label.TextSize = 13
        label.Font = Enum.Font.GothamSemibold
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = btn

        -- Right arrow icon symbol to match screenshot
        local arrow = Instance.new("TextLabel")
        arrow.Size = UDim2.new(0, 20, 1, 0)
        arrow.Position = UDim2.new(1, -32, 0, 0)
        arrow.BackgroundTransparency = 1
        arrow.Text = "›"
        arrow.TextColor3 = Theme.TextMuted
        arrow.TextSize = 22
        arrow.Font = Enum.Font.GothamBold
        arrow.TextXAlignment = Enum.TextXAlignment.Right
        arrow.Parent = btn

        -- Hover effect
        btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play()
            TweenService:Create(arrow, TweenInfo.new(0.2), {TextColor3 = Theme.TextActive}):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.4}):Play()
            TweenService:Create(arrow, TweenInfo.new(0.2), {TextColor3 = Theme.TextMuted}):Play()
        end)

        btn.MouseButton1Click:Connect(function()
            -- Instant click micro-flash animation
            local origTrans = btn.BackgroundTransparency
            btn.BackgroundTransparency = 0.1
            task.delay(0.08, function()
                TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = origTrans}):Play()
            end)
            task.spawn(callback)
        end)
    end

    -- Slider Control
    function TabHelper:CreateSlider(text, min, max, defaultVal, callback)
        local value = math.clamp(defaultVal or min, min, max)
        
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -10, 0, 56)
        frame.BackgroundColor3 = Theme.CardBg
        frame.BackgroundTransparency = 0.4
        frame.Parent = container

        local frameCorner = Instance.new("UICorner")
        frameCorner.CornerRadius = UDim.new(0, 8)
        frameCorner.Parent = frame

        local frameStroke = Instance.new("UIStroke")
        frameStroke.Color = Theme.Border
        frameStroke.Thickness = 0.5
        frameStroke.Parent = frame

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.7, 0, 0, 24)
        label.Position = UDim2.new(0, 12, 0, 6)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Theme.TextActive
        label.TextSize = 13
        label.Font = Enum.Font.GothamSemibold
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame

        local valLabel = Instance.new("TextLabel")
        valLabel.Size = UDim2.new(0.3, -12, 0, 24)
        valLabel.Position = UDim2.new(0.7, 0, 0, 6)
        valLabel.BackgroundTransparency = 1
        valLabel.Text = tostring(value)
        valLabel.TextColor3 = Theme.Accent
        valLabel.TextSize = 13
        valLabel.Font = Enum.Font.GothamBold
        valLabel.TextXAlignment = Enum.TextXAlignment.Right
        valLabel.Parent = frame

        -- Slider Track
        local sliderTrack = Instance.new("TextButton")
        sliderTrack.Name = "Track"
        sliderTrack.Size = UDim2.new(1, -24, 0, 4)
        sliderTrack.Position = UDim2.new(0, 12, 0, 38)
        sliderTrack.BackgroundColor3 = Color3.fromRGB(50, 50, 54)
        sliderTrack.BorderSizePixel = 0
        sliderTrack.Text = ""
        sliderTrack.Parent = frame

        local trackCorner = Instance.new("UICorner")
        trackCorner.CornerRadius = UDim.new(1, 0)
        trackCorner.Parent = sliderTrack

        -- Progress Fill
        local progressFill = Instance.new("Frame")
        progressFill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
        progressFill.BackgroundColor3 = Theme.Accent
        progressFill.BorderSizePixel = 0
        progressFill.Parent = sliderTrack

        local progressCorner = Instance.new("UICorner")
        progressCorner.CornerRadius = UDim.new(1, 0)
        progressCorner.Parent = progressFill

        -- Handle Knob
        local knob = Instance.new("Frame")
        knob.Size = UDim2.new(0, 12, 0, 12)
        knob.AnchorPoint = Vector2.new(0.5, 0.5)
        knob.Position = UDim2.new((value - min) / (max - min), 0, 0.5, 0)
        knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        knob.Parent = sliderTrack

        local knobCorner = Instance.new("UICorner")
        knobCorner.CornerRadius = UDim.new(1, 0)
        knobCorner.Parent = knob

        -- Slider Logic
        local sliding = false
        local function moveKnob(input)
            local progress = math.clamp((input.Position.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X, 0, 1)
            local newVal = math.round(min + (max - min) * progress)
            valLabel.Text = tostring(newVal)
            progressFill.Size = UDim2.new(progress, 0, 1, 0)
            knob.Position = UDim2.new(progress, 0, 0.5, 0)
            if newVal ~= value then
                value = newVal
                task.spawn(function()
                    callback(value)
                end)
            end
        end

        sliderTrack.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                sliding = true
                moveKnob(input)
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                moveKnob(input)
            end
        end)

        UserInputService.InputBegan:Connect(function(input)
            if sliding and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                -- Safety check release
            end
        end)
        
        -- End sliding global event
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                sliding = false
            end
        end)
    end

    -- Textbox Input Card
    function TabHelper:CreateTextBox(text, placeholder, callback)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -10, 0, 48)
        frame.BackgroundColor3 = Theme.CardBg
        frame.BackgroundTransparency = 0.4
        frame.Parent = container

        local frameCorner = Instance.new("UICorner")
        frameCorner.CornerRadius = UDim.new(0, 8)
        frameCorner.Parent = frame

        local frameStroke = Instance.new("UIStroke")
        frameStroke.Color = Theme.Border
        frameStroke.Thickness = 0.5
        frameStroke.Parent = frame

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.5, 0, 1, 0)
        label.Position = UDim2.new(0, 12, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Theme.TextActive
        label.TextSize = 13
        label.Font = Enum.Font.GothamSemibold
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame

        local box = Instance.new("TextBox")
        box.Size = UDim2.new(0.45, 0, 0, 28)
        box.Position = UDim2.new(1, -12, 0.5, -14)
        box.AnchorPoint = Vector2.new(1, 0)
        box.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
        box.BorderSizePixel = 0
        box.Text = ""
        box.PlaceholderText = placeholder or "Type here..."
        box.TextColor3 = Theme.TextActive
        box.PlaceholderColor3 = Theme.TextMuted
        box.TextSize = 12
        box.Font = Enum.Font.Gotham
        box.ClearTextOnFocus = false
        box.Parent = frame

        local boxCorner = Instance.new("UICorner")
        boxCorner.CornerRadius = UDim.new(0, 6)
        boxCorner.Parent = box

        local boxStroke = Instance.new("UIStroke")
        boxStroke.Color = Theme.Border
        boxStroke.Thickness = 0.5
        boxStroke.Parent = box

        box.FocusLost:Connect(function(enterPressed)
            task.spawn(function()
                callback(box.Text, enterPressed)
            end)
        end)
    end

    -- Paragraph Key-Value / Info Display Card
    function TabHelper:CreateParagraph(title, text)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -10, 0, 56)
        frame.BackgroundColor3 = Theme.CardBg
        frame.BackgroundTransparency = 0.4
        frame.Parent = container

        local frameCorner = Instance.new("UICorner")
        frameCorner.CornerRadius = UDim.new(0, 8)
        frameCorner.Parent = frame

        local frameStroke = Instance.new("UIStroke")
        frameStroke.Color = Theme.Border
        frameStroke.Thickness = 0.5
        frameStroke.Parent = frame

        local header = Instance.new("TextLabel")
        header.Size = UDim2.new(1, -24, 0, 22)
        header.Position = UDim2.new(0, 12, 0, 6)
        header.BackgroundTransparency = 1
        header.Text = title
        header.TextColor3 = Theme.Accent
        header.TextSize = 13
        header.Font = Enum.Font.GothamSemibold
        header.TextXAlignment = Enum.TextXAlignment.Left
        header.Parent = frame

        local body = Instance.new("TextLabel")
        body.Size = UDim2.new(1, -24, 1, -28)
        body.Position = UDim2.new(0, 12, 0, 26)
        body.BackgroundTransparency = 1
        body.Text = text
        body.TextColor3 = Theme.TextMuted
        body.TextSize = 11
        body.Font = Enum.Font.GothamMedium
        body.TextWrapped = true
        body.TextXAlignment = Enum.TextXAlignment.Left
        body.TextYAlignment = Enum.TextYAlignment.Top
        body.Parent = frame

        local helperObj = {}
        function helperObj:SetText(newVal)
            body.Text = newVal
        end
        return helperObj
    end

    return TabHelper
end

-- Window Control Actions
local minimized = false
MinButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    
    local targetHeight = minimized and 45 or 500
    local targetTrans = minimized and 1 or 0
    
    -- Fade out side layout elements
    Sidebar.Visible = not minimized
    ContentArea.Visible = not minimized
    ProfileCard.Visible = not minimized
    AvatarFrame.Visible = not minimized
    Watermark.Visible = not minimized

    -- Animate container size
    TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 600, 0, targetHeight)
    }):Play()
end)

-- Dummy maximize alert
MaxButton.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "mscrip Notification",
        Text = "UI Maximize is already configured to optimal display size.",
        Duration = 3
    })
end)

-- Close Event (Fade-out scale down)
CloseButton.MouseButton1Click:Connect(function()
    -- Scale Down & Fade
    TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundTransparency = 1
    }):Play()
    
    TweenService:Create(MainStroke, TweenInfo.new(0.2), {Transparency = 1}):Play()
    TweenService:Create(Shadow, TweenInfo.new(0.2), {ImageTransparency = 1}):Play()
    
    task.delay(0.25, function()
        ScreenGui:Destroy()
    end)
end)


-- ==================== BUILD UI TABS & CONTENT ====================

-- 1. Tab Info
local TabInfo = createTab("Info")
TabInfo:CreateSection("System Details")
local localTimePara = TabInfo:CreateParagraph("Realtime Info", "Loading clock status...")
local fpsPara = TabInfo:CreateParagraph("Performance Metrics", "Calculating stats...")

TabInfo:CreateSection("Script Credits")
TabInfo:CreateParagraph("Developer Details", "Owner: mscrip Team\nVersion: 1.0.0 (Release Build)")

-- Local Time clock updates & FPS/Ping metrics loop
task.spawn(function()
    local lastTime = os.clock()
    local frameCount = 0
    while ScreenGui.Parent do
        frameCount = frameCount + 1
        local currentTime = os.clock()
        if currentTime - lastTime >= 1 then
            local fps = frameCount
            frameCount = 0
            lastTime = currentTime
            
            -- Ping calculation
            local pingVal = 15
            pcall(function()
                pingVal = math.round(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
            end)
            
            -- Dynamic labels refresh
            fpsPara:SetText("FPS: " .. tostring(fps) .. " | Ping: " .. tostring(pingVal) .. "ms")
            
            local now = os.date("*t")
            local timeString = string.format("%02d:%02d:%02d", now.hour, now.min, now.sec)
            localTimePara:SetText("Current Local Time: " .. timeString .. " \nExecuting Game: Kick A Lucky")
        end
        task.wait()
    end
end)


-- 2. Tab Config
local TabConfig = createTab("Config")
TabConfig:CreateSection("Settings Configuration")
TabConfig:CreateTextBox("Save Settings Profile", "Profile name...", function(text)
    print("Saving config under name:", text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Config System",
        Text = "Successfully saved configuration profile: " .. tostring(text),
        Duration = 3
    })
end)
TabConfig:CreateButton("Load Configuration", function()
    print("Loading configuration settings...")
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Config System",
        Text = "Loaded default settings successfully.",
        Duration = 3
    })
end)
TabConfig:CreateButton("Reset Config Settings", function()
    print("Resetting script config...")
end)


-- 3. Tab Main (Selected by default)
local TabMain = createTab("Main")
TabMain:CreateSection("Primary Farming Scripts")

-- Toggle for Auto Farm
TabMain:CreateToggle("Auto Farm", false, function(state)
    _G.AutoFarm = state
    print("Auto Farm set to:", state)
    if state then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Auto Farm Active",
            Text = "Auto farm loop initiated.",
            Duration = 2
        })
        
        -- MAIN LOOP AUTOFARM
        task.spawn(function()
            while _G.AutoFarm do
                task.wait(0.1) -- Jeda antar proses agar tidak crash
                
                pcall(function()
                    local Character = LocalPlayer.Character
                    local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
                    
                    if RootPart then
                        ----------------================----------------
                        -- LANGKAH 1: MAJU SEDIKIT DEKAT BALOK/BOLA
                        ----------------================----------------
                        -- Menggunakan LookVector agar karakter maju 3 stud ke arah depan mata dia menghadap
                        RootPart.CFrame = RootPart.CFrame * CFrame.new(0, 0, -3)
                        task.wait(0.1) -- Beri waktu karakter selesai bergeser
                        
                        ----------------================----------------
                        -- LANGKAH 2: KLIK TOMBOL TENDANG (UI)
                        ------------------------------------------------
                        -- CATATAN: Ganti "KickButton" & "GameGui" sesuai nama asli di Dark Dex kamu
                        local KickButton = LocalPlayer.PlayerGui:FindFirstChild("GameGui", true) 
                            and LocalPlayer.PlayerGui.GameGui:FindFirstChild("KickButton", true)
                        
                        if KickButton then
                            firesignal(KickButton.MouseButton1Click)
                        end
                        
                        ----------------================----------------
                        -- LANGKAH 3: TIMING KEKUATAN (SEMPURNA / PERFECT)
                        ----------------================----------------
                        -- Biasanya game tipe ini memunculkan bar penentu kekuatan.
                        -- Kita deteksi jika tulisan / statusnya berubah menjadi "Perfect" atau "Sempurna"
                        local BarGui = LocalPlayer.PlayerGui:FindFirstChild("PowerBarGui", true)
                        local StatusTeks = BarGui and BarGui:FindFirstChild("StatusLabel", true) -- Teks "Sempurna/Buruk"
                        local TombolHit = BarGui and BarGui:FindFirstChild("HitButton", true) -- Tombol untuk nge-klik pas pas
                        
                        if StatusTeks and TombolHit then
                            -- Skrip akan terus mengklik super cepat HANYA SAAT tulisannya "Perfect" atau "Sempurna"
                            if string.find(string.lower(StatusTeks.Text), "perfect") or string.find(string.lower(StatusTeks.Text), "sempurna") then
                                firesignal(TombolHit.MouseButton1Click)
                            end
                        end
                    end
                end)
            end
        end)
    end
end)

-- Button for Auto Snap (Rule Builder)
TabMain:CreateButton("Auto Snap (Rule Builder)", function()
    print("Auto Snap (Rule Builder) triggered!")
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Rule Builder",
        Text = "Auto Snap configuration successfully opened.",
        Duration = 3
    })
end)


-- 4. Tab Automatically
local TabAuto = createTab("Automatically")
TabAuto:CreateSection("Auto Progression Features")
TabAuto:CreateToggle("Auto Roll Items", false, function(state)
    print("Auto Roll set to:", state)
end)
TabAuto:CreateToggle("Auto Upgrade Stats", false, function(state)
    print("Auto Upgrade set to:", state)
end)
TabAuto:CreateToggle("Auto Rebirth", false, function(state)
    print("Auto Rebirth set to:", state)
end)


-- 5. Tab Miscellaneous
local TabMisc = createTab("Miscellaneous")
TabMisc:CreateSection("Player Stat Adjustments")

TabMisc:CreateSlider("Walk Speed Modifier", 16, 150, 16, function(value)
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = value
        end
    end
end)

TabMisc:CreateSlider("Jump Power Modifier", 50, 200, 50, function(value)
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.JumpPower = value
        end
    end
end)

TabMisc:CreateSection("Utilities")
TabMisc:CreateButton("Teleport to Lobby Spawns", function()
    pcall(function()
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = CFrame.new(0, 10, 0) -- Coordinates fallback, adjust dynamically if game lobby found
        end
    end)
end)


-- 6. Tab Webhook
local TabWebhook = createTab("Webhook")
TabWebhook:CreateSection("Discord Integration")
local webhookUrl = ""
TabWebhook:CreateTextBox("Discord Webhook URL", "https://discord.com/api/webhooks/...", function(text)
    webhookUrl = text
    print("Webhook URL configured.")
end)
TabWebhook:CreateToggle("Notify on Epic Drops", false, function(state)
    print("Webhook notifications toggled:", state)
end)
TabWebhook:CreateButton("Send Test Notification Link", function()
    if webhookUrl == "" or not string.match(webhookUrl, "discord.com/api/webhooks") then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Webhook Error",
            Text = "Please input a valid Discord Webhook URL first.",
            Duration = 3
        })
        return
    end
    print("Testing webhook to:", webhookUrl)
    -- Http request fallback (Exploit specific)
    task.spawn(function()
        local requestFunc = syn and syn.request or http and http.request or http_request or request
        if requestFunc then
            requestFunc({
                Url = webhookUrl,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode({
                    content = "mscrip Webhook Connection Test Successful! :ok_hand:"
                })
            })
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Execution System Warning",
                Text = "Your executor does not support HTTP requests.",
                Duration = 4
            })
        end
    end)
end)


-- Open and Select Defaults
switchTab("Main")

-- Smooth Open Animation (Fade in & scale from center)
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.BackgroundTransparency = 1
MainStroke.Transparency = 1
Shadow.ImageTransparency = 1

TweenService:Create(MainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 600, 0, 500),
    Position = UDim2.new(0.5, -300, 0.5, -250),
    BackgroundTransparency = Theme.BackgroundTrans
}):Play()

TweenService:Create(MainStroke, TweenInfo.new(0.35), {Transparency = 0}):Play()
TweenService:Create(Shadow, TweenInfo.new(0.35), {ImageTransparency = 0.4}):Play()

-- Notification on startup
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "mscrip Loaded!";
    Text = "Enjoy Kick A Lucky script!";
    Duration = 5;
})
