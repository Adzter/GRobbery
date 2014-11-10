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
--With the above config you can also use math.Randomn to specify a 
--random value to drill for, example being math.random( 240, 360 )
 
drillConfig.enableJamming = true      -- Enables/disables the jamming of the drill
drillConfig.drillingText = "DRILLING" -- Text to show when drilling
drillConfig.errorText = "ERROR: JAM"  -- Text to show when the drill gets stuck

--[[
   _____              ____    _____   _   _   ______   _______ 
  / ____|     /\     |  _ \  |_   _| | \ | | |  ____| |__   __|
 | |         /  \    | |_) |   | |   |  \| | | |__       | |   
 | |        / /\ \   |  _ <    | |   | . ` | |  __|      | |   
 | |____   / ____ \  | |_) |  _| |_  | |\  | | |____     | |   
  \_____| /_/    \_\ |____/  |_____| |_| \_| |______|    |_|   
                                                               
--]]

cabinetConfig.rewards = {
	-- Entity name, then quantity
	{ "m9k_ak47", 2 },
	{ "weapon_crowbar", 4}
}
