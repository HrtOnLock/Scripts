--SENSE SCRIPT
--SENSE SCRIPT
--SENSE SCRIPT

local Sense = loadstring(game:HttpGet('https://sirius.menu/sense'))()

--AIMBOT SCRIPT
--AIMBOT SCRIPT
--AIMBOT SCRIPT
local Aimbot = loadstring(game:HttpGet('https://raw.githubusercontent.com/HrtOnLock/Scripts/refs/heads/main/CURRENT/AIMBOT-LOADSTRING.lua'))()

-- Customize settings
Aimbot:Customize({
    Enabled = true, -- Toggle, "Camera Aimbot"
    FOV = 200, -- Slider, "Fov Radius"
    Smoothness = 0.9, -- Slider, "Smoothness", 0-10, Divide input /10 (to make it decimal, since sliders dont support decimals)
    Prediction = { --DONT make a prediction Control
        Enabled = true,
        Value = 0.005
    },
    Visuals = {
        FOVColor = {Color3.fromRGB(255, 0, 0), 0.5},  -- Color Picker, "Fov Color"
        BoxColor = {Color3.fromRGB(255, 255, 0), 0.8}, -- Color Picker, "Aimpart Highlight Color"
    }
})

-- Load necessary libraries
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Create the main window
local Window = Fluent:CreateWindow({
    Title = "Fluent Script",
    SubTitle = "by dawid",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Create tabs with icons for Visuals, Aimbot, Scripts, and Settings
local Tabs = {
    Visuals = Window:AddTab({ Title = "Visuals", Icon = "eye" }),
    Aimbot = Window:AddTab({ Title = "Aimbot", Icon = "locate" }),
    Scripts = Window:AddTab({ Title = "Scripts", Icon = "scroll" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

-- Options for Visuals (Sense script features)
do
    -- Boxes
    local BoxToggle = Tabs.Visuals:AddToggle("Boxes", {Title = "Enable Boxes", Default = false})
    local BoxColorPicker = Tabs.Visuals:AddColorpicker("BoxColor", {Title = "Box Color", Default = Color3.new(1, 1, 1)})

    -- Chams
    local ChamsToggle = Tabs.Visuals:AddToggle("Chams", {Title = "Enable Chams", Default = true})
    local VisibleChamsToggle = Tabs.Visuals:AddToggle("ChamsVisibleOnly", {Title = "Visible Only (Chams)", Default = false})
    local ChamsFillColor = Tabs.Visuals:AddColorpicker("ChamsFillColor", {Title = "Chams Fill Color", Default = Color3.new(1, 1, 1)})
    local ChamsOutlineColor = Tabs.Visuals:AddColorpicker("ChamsOutlineColor", {Title = "Chams Outline Color", Default = Color3.new(1, 1, 1)})

    -- Health Bar
    local HealthBarToggle = Tabs.Visuals:AddToggle("HealthBar", {Title = "Enable Health Bar", Default = false})
    local HealthyColorPicker = Tabs.Visuals:AddColorpicker("HealthyColor", {Title = "Health Bar Color (Healthy)", Default = Color3.new(1, 1, 1)})
    local DyingColorPicker = Tabs.Visuals:AddColorpicker("DyingColor", {Title = "Health Bar Color (Dying)", Default = Color3.new(1, 1, 1)})

    -- Names
    local NameToggle = Tabs.Visuals:AddToggle("Names", {Title = "Enable Names", Default = false})
    local NameColorPicker = Tabs.Visuals:AddColorpicker("NameColor", {Title = "Names Color", Default = Color3.new(1, 1, 1)})

    -- Distance
    local DistanceToggle = Tabs.Visuals:AddToggle("Distance", {Title = "Enable Distance", Default = false})
    local DistanceColorPicker = Tabs.Visuals:AddColorpicker("DistanceColor", {Title = "Distance Text Color", Default = Color3.new(1, 1, 1)})

    -- Tracers
    local TracerToggle = Tabs.Visuals:AddToggle("Tracers", {Title = "Enable Tracers", Default = false})
    local TracerColorPicker = Tabs.Visuals:AddColorpicker("TracerColor", {Title = "Tracer Color", Default = Color3.new(1, 1, 1)})

    -- Compass
    local CompassToggle = Tabs.Visuals:AddToggle("Compass", {Title = "Enable Compass", Default = true})
    local CompassColorPicker = Tabs.Visuals:AddColorpicker("CompassColor", {Title = "Compass Arrow Color", Default = Color3.new(1, 1, 1)})
    local CompassRadiusSlider = Tabs.Visuals:AddSlider("CompassRadius", {Title = "Compass Radius", Default = 150, Min = 1, Max = 500})
end

-- Options for Aimbot
do
    -- Aimbot settings
    local AimbotToggle = Tabs.Aimbot:AddToggle("AimbotEnabled", {Title = "Enable Aimbot", Default = true})
    local FOVSlider = Tabs.Aimbot:AddSlider("FOV", {Title = "FOV Radius", Default = 200, Min = 1, Max = 500})
    local SmoothnessSlider = Tabs.Aimbot:AddSlider("Smoothness", {Title = "Smoothness", Default = 0.9, Min = 0, Max = 10, Rounding = 1})
    
    -- Aimbot Visuals
    local FOVColorPicker = Tabs.Aimbot:AddColorpicker("FOVColor", {Title = "FOV Color", Default = Color3.fromRGB(255, 0, 0)})
    local AimpartColorPicker = Tabs.Aimbot:AddColorpicker("AimpartHighlight", {Title = "Aimpart Highlight Color", Default = Color3.fromRGB(255, 255, 0)})
end

-- Add Save and Interface management in Settings tab
do
    InterfaceManager:SetLibrary(Fluent)
    SaveManager:SetLibrary(Fluent)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    InterfaceManager:SetFolder("FluentScriptHub")
    SaveManager:SetFolder("FluentScriptHub/specific-game")

    InterfaceManager:BuildInterfaceSection(Tabs.Settings)
    SaveManager:BuildConfigSection(Tabs.Settings)
end

-- Final setup
Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

Sense.Load()
SaveManager:LoadAutoloadConfig()
