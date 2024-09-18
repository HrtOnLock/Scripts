-- Load the Sense ESP Library
local Sense = loadstring(game:HttpGet('https://sirius.menu/sense'))()

-- Configuration
Sense.sharedSettings.textSize = 13
Sense.sharedSettings.textFont = 2
Sense.sharedSettings.limitDistance = true
Sense.sharedSettings.maxDistance = 150
Sense.sharedSettings.useTeamColor = true

-- Pastel Colors
local pastelPurple = Color3.fromRGB(207, 159, 255)  -- Pastel Purple
local pastelPink = Color3.fromRGB(255, 182, 193)    -- Pastel Pink

-- Enemy Settings (copy to friendly settings later)
Sense.teamSettings.enemy.enabled = true
Sense.teamSettings.enemy.box = true
Sense.teamSettings.enemy.boxColor = { pastelPurple, 1 }
Sense.teamSettings.enemy.boxOutline = false
Sense.teamSettings.enemy.boxOutlineColor = { pastelPurple, 1 }
Sense.teamSettings.enemy.boxFill = false
Sense.teamSettings.enemy.boxFillColor = { pastelPurple, 0.5 }
Sense.teamSettings.enemy.healthBar = true
Sense.teamSettings.enemy.healthyColor = pastelPink
Sense.teamSettings.enemy.dyingColor = pastelPink
Sense.teamSettings.enemy.healthBarOutline = false
Sense.teamSettings.enemy.healthBarOutlineColor = { pastelPink, 0.5 }
Sense.teamSettings.enemy.healthText = false
Sense.teamSettings.enemy.healthTextColor = { Color3.new(1,1,1), 1 }
Sense.teamSettings.enemy.healthTextOutline = false
Sense.teamSettings.enemy.healthTextOutlineColor = Color3.new(0,0,0)
Sense.teamSettings.enemy.box3d = false
Sense.teamSettings.enemy.box3dColor = { pastelPurple, 1 }
Sense.teamSettings.enemy.name = false
Sense.teamSettings.enemy.nameColor = { Color3.new(1,1,1), 1 }
Sense.teamSettings.enemy.nameOutline = true
Sense.teamSettings.enemy.nameOutlineColor = Color3.new(0,0,0)
Sense.teamSettings.enemy.weapon = false
Sense.teamSettings.enemy.weaponColor = { Color3.new(1,1,1), 1 }
Sense.teamSettings.enemy.weaponOutline = true
Sense.teamSettings.enemy.weaponOutlineColor = Color3.new(0,0,0)
Sense.teamSettings.enemy.distance = false
Sense.teamSettings.enemy.distanceColor = { Color3.new(1,1,1), 1 }
Sense.teamSettings.enemy.distanceOutline = true
Sense.teamSettings.enemy.distanceOutlineColor = Color3.new(0,0,0)
Sense.teamSettings.enemy.tracer = false
Sense.teamSettings.enemy.tracerOrigin = "Bottom"
Sense.teamSettings.enemy.tracerColor = { pastelPurple, 1 }
Sense.teamSettings.enemy.tracerOutline = false
Sense.teamSettings.enemy.tracerOutlineColor = { Color3.new(0,0,0), 1 }
Sense.teamSettings.enemy.offScreenArrow = true
Sense.teamSettings.enemy.offScreenArrowColor = { Color3.new(1,1,1), 1 }
Sense.teamSettings.enemy.offScreenArrowSize = 15
Sense.teamSettings.enemy.offScreenArrowRadius = 150
Sense.teamSettings.enemy.offScreenArrowOutline = false
Sense.teamSettings.enemy.offScreenArrowOutlineColor = { Color3.new(0,0,0), 1 }
Sense.teamSettings.enemy.chams = true
Sense.teamSettings.enemy.chamsVisibleOnly = false
Sense.teamSettings.enemy.chamsFillColor = { pastelPurple, 0 }
Sense.teamSettings.enemy.chamsOutlineColor = { pastelPurple, 0 }

-- Friendly Settings (copy from enemy, change colors)
Sense.teamSettings.friendly.enabled = true
Sense.teamSettings.friendly.box = Sense.teamSettings.enemy.box
Sense.teamSettings.friendly.boxColor = Sense.teamSettings.enemy.boxColor
Sense.teamSettings.friendly.boxOutline = Sense.teamSettings.enemy.boxOutline
Sense.teamSettings.friendly.boxOutlineColor = Sense.teamSettings.enemy.boxOutlineColor
Sense.teamSettings.friendly.boxFill = Sense.teamSettings.enemy.boxFill
Sense.teamSettings.friendly.boxFillColor = Sense.teamSettings.enemy.boxFillColor
Sense.teamSettings.friendly.healthBar = Sense.teamSettings.enemy.healthBar
Sense.teamSettings.friendly.healthyColor = Sense.teamSettings.enemy.healthyColor
Sense.teamSettings.friendly.dyingColor = Sense.teamSettings.enemy.dyingColor
Sense.teamSettings.friendly.healthBarOutline = Sense.teamSettings.enemy.healthBarOutline
Sense.teamSettings.friendly.healthBarOutlineColor = Sense.teamSettings.enemy.healthBarOutlineColor
Sense.teamSettings.friendly.healthText = Sense.teamSettings.enemy.healthText
Sense.teamSettings.friendly.healthTextColor = Sense.teamSettings.enemy.healthTextColor
Sense.teamSettings.friendly.healthTextOutline = Sense.teamSettings.enemy.healthTextOutline
Sense.teamSettings.friendly.healthTextOutlineColor = Sense.teamSettings.enemy.healthTextOutlineColor
Sense.teamSettings.friendly.box3d = Sense.teamSettings.enemy.box3d
Sense.teamSettings.friendly.box3dColor = Sense.teamSettings.enemy.box3dColor
Sense.teamSettings.friendly.name = Sense.teamSettings.enemy.name
Sense.teamSettings.friendly.nameColor = Sense.teamSettings.enemy.nameColor
Sense.teamSettings.friendly.nameOutline = Sense.teamSettings.enemy.nameOutline
Sense.teamSettings.friendly.nameOutlineColor = Sense.teamSettings.enemy.nameOutlineColor
Sense.teamSettings.friendly.weapon = Sense.teamSettings.enemy.weapon
Sense.teamSettings.friendly.weaponColor = Sense.teamSettings.enemy.weaponColor
Sense.teamSettings.friendly.weaponOutline = Sense.teamSettings.enemy.weaponOutline
Sense.teamSettings.friendly.weaponOutlineColor = Sense.teamSettings.enemy.weaponOutlineColor
Sense.teamSettings.friendly.distance = Sense.teamSettings.enemy.distance
Sense.teamSettings.friendly.distanceColor = Sense.teamSettings.enemy.distanceColor
Sense.teamSettings.friendly.distanceOutline = Sense.teamSettings.enemy.distanceOutline
Sense.teamSettings.friendly.distanceOutlineColor = Sense.teamSettings.enemy.distanceOutlineColor
Sense.teamSettings.friendly.tracer = Sense.teamSettings.enemy.tracer
Sense.teamSettings.friendly.tracerOrigin = Sense.teamSettings.enemy.tracerOrigin
Sense.teamSettings.friendly.tracerColor = Sense.teamSettings.enemy.tracerColor
Sense.teamSettings.friendly.tracerOutline = Sense.teamSettings.enemy.tracerOutline
Sense.teamSettings.friendly.tracerOutlineColor = Sense.teamSettings.enemy.tracerOutlineColor
Sense.teamSettings.friendly.offScreenArrow = Sense.teamSettings.enemy.offScreenArrow
Sense.teamSettings.friendly.offScreenArrowColor = Sense.teamSettings.enemy.offScreenArrowColor
Sense.teamSettings.friendly.offScreenArrowSize = Sense.teamSettings.enemy.offScreenArrowSize
Sense.teamSettings.friendly.offScreenArrowRadius = Sense.teamSettings.enemy.offScreenArrowRadius
Sense.teamSettings.friendly.offScreenArrowOutline = Sense.teamSettings.enemy.offScreenArrowOutline
Sense.teamSettings.friendly.offScreenArrowOutlineColor = Sense.teamSettings.enemy.offScreenArrowOutlineColor
Sense.teamSettings.friendly.chams = Sense.teamSettings.enemy.chams
Sense.teamSettings.friendly.chamsVisibleOnly = Sense.teamSettings.enemy.chamsVisibleOnly
Sense.teamSettings.friendly.chamsFillColor = Sense.teamSettings.enemy.chamsFillColor
Sense.teamSettings.friendly.chamsOutlineColor = Sense.teamSettings.enemy.chamsOutlineColor

-- Load the ESP
Sense.Load()
