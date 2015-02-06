-- Wait a bit for everything to load in
timer.Simple( 3, function()
	MsgC( Color( 0, 255, 0 ), "Spawning PD2Robbery Cabinets\n" )
	
	local i = 0
	for k,v in pairs( cabinetConfig.spawns ) do
		local cabinet = ents.Create("cabinet")
		cabinet:SetPos( v[1] )
		cabinet:SetAngles( v[2] )
		cabinet:Spawn()
		cabinet:SetMoveType( MOVETYPE_NONE )

		MsgC( Color( 0, 255, 0 ), "Cabinet spawned\n" )
	end
end)