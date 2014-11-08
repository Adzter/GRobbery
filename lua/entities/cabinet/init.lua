AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
 
include('shared.lua')

function ENT:Initialize()
 
	self:SetModel( table.Random(cabinetConfig.models) )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	-- disable the movement of the entity
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
	self:SetCustomCollisionCheck( true )

end

local inProgress = false
function ENT:Touch( entity )
	if entity:GetClass() == "drill" and not inProgress then
		inProgress = true
		entity:SetPos( self:LocalToWorld( Vector(14, 0, 0) ) )
		entity:SetAngles( self:GetAngles() )
		entity:SetMoveType( MOVETYPE_NONE )
		
		local drillSounds = CreateSound( entity, "npigamers/drill.mp3" )
		drillSounds:Play()
		
		timer.Create( "sparks" .. entity:EntIndex(), 1, 0, function() 
			local effectdata = EffectData()
			effectdata:SetOrigin( entity:GetPos() )
			effectdata:SetMagnitude( 3 )
			effectdata:SetRadius( 10 )
			util.Effect( "Sparks", effectdata, true, true )
		end )
	end
end
 
function ENT:Use( activator, caller )
end

