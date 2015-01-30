AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
 
include('shared.lua')

function ENT:Initialize()
	self:SetModel( "models/props_wasteland/speakercluster01a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	-- disable the movement of the entity
	self:SetMoveType( MOVETYPE_NONE )
end
 
function ENT:Think()
end

function ENT:EnableAlarm()
	self.drillSounds = CreateSound( self, "ambient/alarms/alarm1.wav" )
	self.drillSounds:Play()
end

function ENT:DisableAlarm()
	self.drillSounds:Stop()
end

robberyAlarm = false