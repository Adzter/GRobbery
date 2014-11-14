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

drillConfig.duration = 360
drillConfig.enableJamming = true      -- Enables/disables the jamming of the drill
drillConfig.drillingText = "DRILLING" -- Text to show when drilling
drillConfig.errorText = "ERROR: JAM"  -- Text to show when the drill gets stuck

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
cabinetConfig.rewards = {
	"weapon_crowbar",
	"weapon_ar2",
	"weapon_pistol" -- Last one shouldn't have a comma
}
cabinetConfig.rewardsAmount = 2 