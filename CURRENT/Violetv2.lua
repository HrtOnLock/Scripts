--SENSE SCRIPT
--SENSE SCRIPT
--SENSE SCRIPT

local Sense = loadstring(game:HttpGet('https://sirius.menu/sense'))()

--Boxes
Sense.teamSettings.enemy.box = false -- Toggle, named "Boxes"
Sense.teamSettings.enemy.boxColor = { Color3.new(1,1,1), 1 } -- Color Picker, "Box Color"
Sense.teamSettings.enemy.boxOutline = false -- ALWAYS FALSE - DONT CREATE A CONTROL FOR THIS

--Chams
Sense.teamSettings.enemy.chams = true -- Toggle, "Chams"
Sense.teamSettings.enemy.chamsVisibleOnly = false -- Toggle, "Visible Only (Chams)"
Sense.teamSettings.enemy.chamsFillColor = { Color3.new(1,1,1), 1 } -- Color Picker, "Chams Fill Color"
Sense.teamSettings.enemy.chamsOutlineColor = { Color3.new(1,1,1), 1 } -- Color Picker, "Chams Outline Color"

--Health Bar
Sense.teamSettings.enemy.healthBar = false
Sense.teamSettings.enemy.healthyColor = { Color3.new(1,1,1), 1 } -- Color Picker, "Health Bar Color"
Sense.teamSettings.enemy.dyingColor = { Color3.new(1,1,1), 1 } -- Color Picker, Same as Healthy Color
Sense.teamSettings.enemy.healthBarOutline = false -- ALWAYS FALSE - DONT CREATE A CONTROL FOR THIS

--Names
Sense.teamSettings.enemy.name = false -- Toggle, named "Names"
Sense.teamSettings.enemy.nameColor = { Color3.new(1,1,1), 1 } -- Color Picker, "Names Color"
Sense.teamSettings.enemy.nameOutline = false -- ALWAYS FALSE - DONT CREATE A CONTROL FOR THIS

--Distance
Sense.teamSettings.enemy.distance = false -- Toggle, "Distance"
Sense.teamSettings.enemy.distanceColor = { Color3.new(1,1,1), 1 } -- Color Picker, "Distance Text Color"
Sense.teamSettings.enemy.distanceOutline = false -- ALWAYS FALSE - DONT CREATE A CONTROL FOR THIS
--Tracers
Sense.teamSettings.enemy.tracer = false -- Toggle, "Tracers"
Sense.teamSettings.enemy.tracerOrigin = "Bottom" -- DO NOT CREATE A CONTROL FOR THIS
Sense.teamSettings.enemy.tracerColor = { Color3.new(1,1,1), 1 } -- Color Picker, "Tracer Color"
Sense.teamSettings.enemy.tracerOutline = false -- ALWAYS FALSE - DONT CREATE A CONTROL FOR THIS

--Compass
Sense.teamSettings.enemy.offScreenArrow = true -- Toggle, "Compass"
Sense.teamSettings.enemy.offScreenArrowColor = { Color3.new(1,1,1), 1 } -- Color Picker, "Compass Arrow Color"
Sense.teamSettings.enemy.offScreenArrowSize = 15 -- DONT CREATE A CONTROL FOR THIS
Sense.teamSettings.enemy.offScreenArrowRadius = 150 -- Slider, "Compass Radius"
Sense.teamSettings.enemy.offScreenArrowOutline = false -- ALWAYS FALSE - DONT CREATE A CONTROL FOR THIS

--Misc Config
Sense.sharedSettings.textSize = 13 --DONT CREATE A CONTROL FOR THIS
Sense.sharedSettings.textFont = 2 --DONT CREATE A CONTROL FOR THIS
Sense.sharedSettings.limitDistance = true --DONT CREATE A CONTROL FOR THIS
Sense.sharedSettings.maxDistance = 150 -- Slider, "Esp Distance", Min/Max 1-500, Default 150

--AIMBOT SCRIPT
--AIMBOT SCRIPT
--AIMBOT SCRIPT

