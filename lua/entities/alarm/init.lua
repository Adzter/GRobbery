AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
 
include('shared.lua')

robberyAlarm = false

function ENT:Initialize()
	self:SetModel( "models/props_wasteland/speakercluster01a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	-- disable the movement of the entity
	self:SetMoveType( MOVETYPE_NONE )
	
	-- setup the sound
	drillSounds = CreateSound( self, "ambient/alarms/alarm1.wav" )
end
 
function ENT:Think()
	if robberyAlarm then
		drillSounds:Play()
	else
		drillSounds:Stop()
	end
end