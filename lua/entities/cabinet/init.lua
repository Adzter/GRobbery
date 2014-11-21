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
		
		--Enable the alarm
		for k,v in pairs( ents.FindByClass("alarm")) do
			v:EnableAlarm()
		end
		
		--Set the networked variable isDrilling to true
		entity:SetNWBool( "isDrilling", true )
		
		timer.Create( "countdown" .. entity:EntIndex(), 1, 0, function() 
			--Check if timer is less than 1, if it is then the drill is finished
			if not entity:GetNWBool( "isJammed" ) then
				if entity:GetNWInt( "drillTimer" ) < 1 then
				
					-- Do a loop with the amount of rewards to spawn
					for i = 1,cabinetConfig.rewardsAmount do
						-- Get a random reward from the table and spawn it
						local reward = ents.Create( table.Random(cabinetConfig.rewards) )
						reward:SetPos( entity:GetPos() )
						reward:Spawn()
					end
				
					-- kill the timer and remove the drill
					timer.Destroy( "countdown" .. entity:EntIndex() )
					entity:Remove()
				end
		
				if entity then
					local effectdata = EffectData()
					effectdata:SetOrigin( entity:GetPos() )
					effectdata:SetMagnitude( 3 )
					effectdata:SetRadius( 10 )
					util.Effect( "Sparks", effectdata, true, true )

					local newTimer = entity:GetNWInt( "drillTimer" ) - 1
					entity:SetNWInt( "drillTimer", newTimer )
				end
			end
		end )
	end
end
 
function ENT:Use( activator, caller )
end

