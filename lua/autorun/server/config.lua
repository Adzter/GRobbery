AddCSLuaFile()

drillConfig = {}
cabinetConfig = {}

--[[
  _____    _____    _____   _        _      
 |  __ \  |  __ \  |_   _| | |      | |     
 | |  | | | |__) |   | |   | |      | |     
 | |  | | |  _  /    | |   | |      | |     
 | |__| | | | \ \   _| |_  | |____  | |____ 
 |_____/  |_|  \_\ |_____| |______| |______|
                                            
--]]

drillConfig.duration = 180
drillConfig.enableJamming = true      -- Enables/disables the jamming of the drill
drillConfig.drillingText = "DRILLING" -- Text to show when drilling
drillConfig.errorText = "ERROR: JAM"  -- Text to show when the drill gets stuck
drillConfig.health = 500			  -- How much damage the drill can take
drillConfig.cooldown = 1200

drillConfig.backgroundColor = Color(50, 90, 255, 50 ) -- In the format Red/Green/Blue/Alpha
drillConfig.progressBarColor = Color(255, 255, 25, 255 ) -- In the format Red/Green/Blue/Alpha
drillConfig.progressBarBackgroundColor = Color(90, 90, 255, 255 ) -- In the format Red/Green/Blue/Alpha
drillConfig.textColor = Color(255, 255, 255, 255) -- In the format Red/Green/Blue/Alpha

drillConfig.jammedBackgroundColor = Color(50, 90, 255, 50 ) -- In the format Red/Green/Blue/Alpha
drillConfig.jammedProgressBarColor = Color(255, 255, 25, 255 ) -- In the format Red/Green/Blue/Alpha
drillConfig.jammedProgressBarBackgroundColor = Color(90, 90, 255, 255 ) -- In the format Red/Green/Blue/Alpha
drillConfig.jammedTextColor = Color(255, 255, 255, 255) -- In the format Red/Green/Blue/Alpha

--[[
   _____              ____    _____   _   _   ______   _______ 
  / ____|     /\     |  _ \  |_   _| | \ | | |  ____| |__   __|
 | |         /  \    | |_) |   | |   |  \| | | |__       | |   
 | |        / /\ \   |  _ <    | |   | . ` | |  __|      | |   
 | |____   / ____ \  | |_) |  _| |_  | |\  | | |____     | |   
  \_____| /_/    \_\ |____/  |_____| |_| \_| |______|    |_|   
                                                               
--]]

cabinetConfig.models = {
	"models/props_wasteland/controlroom_storagecloset001a.mdl",
	"models/props_wasteland/controlroom_storagecloset001b.mdl" -- Last one shouldn't have a comma
}

-- Color of the cabinet when it's on cooldown
cabinetConfig.cooldownColor = Color( 255, 50, 50 )
-- Default color of the cabinet
cabinetConfig.defaultColor = Color( 255, 255, 255 )

-- Money is in the format:
-- {"money", minAmount, maxAmount }
cabinetConfig.rewards = {
	--"weapon_l85",
	"lockpick",
	--"weapon_proxy_mine",
	{"money", 5000, 20000},
	{"money", 5000, 20000},
	"stunstick",
	--"m9k_spas12",
	"unarrest_stick" -- Last one shouldn't have a comma
}
cabinetConfig.rewardsAmount = 2

-- Type getpos in console to get the spawn points
cabinetConfig.spawns = {
	{ Vector(-1800.393433, -284.331299, -152 ), Angle( 0, -180, 0 ) },
	{ Vector(-1799.520142, -371.193665, -152 ), Angle( 0, -180, 0 ) },
	{ Vector(-2000.507202, -320.545685, -152 ), Angle( 0, 0, 0 ) }
}