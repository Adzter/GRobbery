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
end

function ENT:Touch( entity )
	if entity:GetClass() == "drill" and not entity:GetNWBool( "isDrilling" ) then
		entity:SetPos( self:LocalToWorld( Vector(14, 0, 0) ) )
		entity:SetAngles( self:GetAngles() )
		entity:SetMoveType( MOVETYPE_NONE )
		
		local drillSounds = CreateSound( self, "npigamers/drill.wav" )
		drillSounds:Play()
		
		--Set the networked variable isDrilling to true
		entity:SetNWBool( "isDrilling", true )
		
		timer.Create( "countdown" .. entity:EntIndex(), 1, 0, function() 
			if entity:GetNWInt( "drillTimer" ) < 1 then
				-- Add in reward code here
			end

			local effectdata = EffectData()
			effectdata:SetOrigin( entity:GetPos() )
			effectdata:SetMagnitude( 3 )
			effectdata:SetRadius( 10 )
			util.Effect( "Sparks", effectdata, true, true )

			local newTimer = entity:GetNWInt( "drillTimer" ) - 1
			entity:SetNWInt( "drillTimer", newTimer )
		end )
	end
end
 
function ENT:Use( activator, caller )
end

