include('shared.lua')

function ENT:Draw()
    -- self.BaseClass.Draw(self) -- Overrides Draw
    self:DrawModel() -- Draws Model Client Side
	
	local pos = self:GetPos()
	local ang = self:GetAngles() + Angle( 0, 90, 90 )	

	if self:GetNWInt( "drillTimer" ) then
		cam.Start3D2D( pos + Vector( 10, 10, 10 ), ang, 0.2)
			draw.SimpleText( self:GetNWInt( "drillTimer" ), "DermaLarge", 0, 0, Color(255, 255, 255), 0, 0)
		cam.End3D2D()
	end
end