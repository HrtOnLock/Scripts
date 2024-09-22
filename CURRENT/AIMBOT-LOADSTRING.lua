local Aimbot = {}
local HttpService = game:GetService("HttpService")

-- Default configuration
Aimbot.Config = {
    Enabled = true,
    KeyActivation = Enum.KeyCode.LeftShift,

    FOV = 175,
    TeamCheck = true,
    DistanceCheck = true,
    VisibleCheck = true,

    Smoothness = 0.975,
    Prediction = {
        Enabled = false,
        Value = 0.185
    },

    -- Visual settings
    Visuals = {
        FOVColor = {Color3.fromRGB(0, 185, 35), 0.6}, -- Color and transparency for FOV circle
        BoxColor = {Color3.fromRGB(0, 185, 35), 0.6}, -- Color and transparency for target box
        BoxSize = Vector2.new(20, 20),                -- Size of the target box
        BoxThickness = 20,                            -- Thickness of the box border
    }
}

-- Customization function
function Aimbot:Customize(settings)
    for key, value in pairs(settings) do
        if typeof(value) == "table" then
            if typeof(Aimbot.Config[key]) == "table" then
                for subKey, subValue in pairs(value) do
                    Aimbot.Config[key][subKey] = subValue
                end
            else
                Aimbot.Config[key] = value
            end
        else
            Aimbot.Config[key] = value
        end
    end
end

-- Load settings from string or URL
function Aimbot:LoadSettings(settingsURL)
    local settings = HttpService:JSONDecode(game:HttpGet(settingsURL))
    Aimbot:Customize(settings)
end

-- Services
local input_service = game:GetService("UserInputService")
local players = game:GetService("Players")
local run_service = game:GetService("RunService")

-- Objects
local camera = workspace.CurrentCamera
local player = players.LocalPlayer
local fovCircle, targetBox = Drawing.new("Circle"), Drawing.new("Square")

-- Variables
local current_nearest_plr

-- Functions
local function is_player_valid(plrArg)
    local plrChar = plrArg.Character
    local plrHumanoid, target_part = (plrChar and plrChar:FindFirstChildWhichIsA("Humanoid")), (plrChar and plrChar:FindFirstChild("HumanoidRootPart"))
    return plrArg ~= player and (plrChar and (plrHumanoid and plrHumanoid.Health ~= 0)) and not plrArg.Character:FindFirstChildWhichIsA("ForceField") and (if Aimbot.Config.TeamCheck then (plrArg.Neutral or plrArg.TeamColor ~= player.TeamColor) else true), target_part
end

local function get_rootpart(plr)
    return (if plr.Character then plr.Character:FindFirstChild("HumanoidRootPart") else nil)
end

local function in_line_of_sight(origin_pos, ...)
    return #camera:GetPartsObscuringTarget({origin_pos}, {camera, player.Character, ...}) == 0
end

local function get_vel_prediction(velocity)
    return Vector3.new(velocity.X, math.clamp((velocity.Y * 0.5), -5, 10), velocity.Z)
end

local function get_camera_prediction(predicting_part)
    return predicting_part.CFrame + get_vel_prediction(predicting_part.Velocity) * (Aimbot.Config.Prediction.Value)
end

-- Gets nearest player relative to cursor
local function get_nearest_player()
    local nearest_plr_data = {aimPart = nil, cursor_dist = math.huge, char_dist = math.huge}

    for _, plr in players:GetPlayers() do
        local passed, target_part = is_player_valid(plr)
        if not (passed and target_part) then continue end
        local screen_pos, on_screen = camera:WorldToViewportPoint(target_part.Position)
        local fov_dist = (input_service:GetMouseLocation() - Vector2.new(screen_pos.X, screen_pos.Y)).Magnitude
        local char_dist = (get_rootpart(player).Position - target_part.Position).Magnitude

        if (not Aimbot.Config.VisibleCheck or (on_screen and in_line_of_sight(camera.CFrame, plr.Character))) then
            if ((fov_dist <= Aimbot.Config.FOV) and (fov_dist < nearest_plr_data.cursor_dist)) and (not Aimbot.Config.DistanceCheck or (char_dist < nearest_plr_data.char_dist)) then
                nearest_plr_data.aimPart = target_part
                nearest_plr_data.cursor_dist = fov_dist
                nearest_plr_data.char_dist = char_dist
            end
        end
    end
    return (if nearest_plr_data.aimPart then nearest_plr_data else nil)
end

-- Main
targetBox.Color = Aimbot.Config.Visuals.BoxColor[1]
targetBox.Filled = true
targetBox.Size = Aimbot.Config.Visuals.BoxSize
targetBox.Thickness = Aimbot.Config.Visuals.BoxThickness
targetBox.Transparency = Aimbot.Config.Visuals.BoxColor[2]

fovCircle.Color = Aimbot.Config.Visuals.FOVColor[1]
fovCircle.Thickness = 2
fovCircle.Transparency = Aimbot.Config.Visuals.FOVColor[2]
fovCircle.Visible = true

run_service.PreSimulation:Connect(function()
    current_nearest_plr = get_nearest_player()

    fovCircle.Radius = Aimbot.Config.FOV
    fovCircle.Position = input_service:GetMouseLocation()

    if current_nearest_plr then
        local screen_pos, on_screen = camera:WorldToViewportPoint(current_nearest_plr.aimPart.Position)

        targetBox.Visible = on_screen
        targetBox.Position = (Vector2.new(screen_pos.X, screen_pos.Y) - (targetBox.Size / 2))

        if input_service:IsKeyDown(Aimbot.Config.KeyActivation) then
            local target_position = (if Aimbot.Config.Prediction.Enabled then get_camera_prediction(current_nearest_plr.aimPart) else current_nearest_plr.aimPart)
            local horizontal_look = CFrame.lookAt(camera.CFrame.Position, target_position.Position)

            camera.CFrame = camera.CFrame:Lerp(horizontal_look, Aimbot.Config.Smoothness)
        end
    else
        targetBox.Visible = false
        targetBox.Position = Vector3.zero
    end
end)

return Aimbot
