AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
 
include('shared.lua')
 
function ENT:Initialize()
	self:SetModel( "models/props_lab/tpplug.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	-- disable the movement of the entity
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
	
	self:SetNWBool( "isDrilling", false )
	self:SetNWInt( "drillTimer", drillConfig.duration )
	self:SetNWBool( "isJammed", false )
	self.health = drillConfig.health
end
 
function ENT:Use( activator, caller )
end

function ENT:Think()
end

function ENT:OnTakeDamage( damage )
	
	-- Reduce health based on damage
	self.health = self.health - damage:GetDamage()
	
	if self.health <= 0 then
		local explode = ents.Create( "env_explosion" ) -- creates the explosion
		explode:SetPos( self:GetPos() )
		explode:Spawn()
		explode:SetKeyValue( "iMagnitude", "220" )
		explode:Fire( "Explode", 0, 0 )
		explode:EmitSound( "weapon_AWP.Single", 400, 400 )

		self:Remove()
	end
end