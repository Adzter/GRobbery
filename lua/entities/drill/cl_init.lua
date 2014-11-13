include('shared.lua')

function ENT:Draw()
    -- self.BaseClass.Draw(self) -- Overrides Draw
    self:DrawModel() -- Draws Model Client Side
	
	local pos = self:GetPos()
	local ang = self:GetAngles() + Angle( 0, 90, 90 )

	if self:GetNWInt( "drillTimer" ) and self:GetNWBool( "isDrilling" ) then
		cam.Start3D2D( self:LocalToWorld(Vector( 3, 12, 1 )), ang, 0.1)
			draw.RoundedBox( 0, -128, 0, 75, 25, drillConfig.backgroundColor )
			draw.RoundedBox( 2, -53, -45, 150, 125, drillConfig.backgroundColor )
			
			draw.RoundedBox( 0, -40, 40, 125, 20, drillConfig.progressBarBackgroundColor )
			draw.RoundedBox( 0, -40, 40, self:GetNWInt( "drillTimer" )/3, 20, drillConfig.progressBarColor )
			
			draw.SimpleText( drillConfig.drillingText, "DermaLarge", -35, -30, drillConfig.textColor, 0, 0)
			draw.SimpleText( self:GetNWInt( "drillTimer" ), "DermaLarge", 0, 0, drillConfig.textColor, 0, 0)
		cam.End3D2D()
	end
end