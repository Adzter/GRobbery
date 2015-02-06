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
	self.inProgress = false
	self.cooldown = 0
	timer.Create( "cooldownCheck" .. self:EntIndex(), 1, 0, function() 
		if CurTime() > self.cooldown then
			self:SetColor( cabinetConfig.defaultColor )
		end
	end )
end

function ENT:Touch( entity )
	print( CurTime() - self.cooldown )
	print( self.inProgress )
	
	if CurTime() < self.cooldown then return end
	if self.inProgress then return end
	
	if entity:GetClass() == "drill" then
	
		self.cooldown = CurTime() + drillConfig.duration + drillConfig.cooldown
		
		if entity:GetClass() == "drill" and not entity:GetNWBool( "isDrilling" ) then
			
			entity:Remove()
			
			local entity = ents.Create("drill")
			
			entity:SetPos( self:LocalToWorld( Vector(14, 0, 0) ) )
			entity:SetAngles( self:GetAngles() )
			entity:Spawn()
			
			local phys = self:GetPhysicsObject()
	 
			if phys and phys:IsValid() then
				phys:EnableMotion(false) -- Freezes the object in place.
				entity:SetMoveType( MOVETYPE_NONE )
			end
			
			self.drillSounds = CreateSound( self, "npigamers/drill.wav" )
			self.drillSounds:Play()
			
			--Enable the alarm
			for k,v in pairs( ents.FindByClass("alarm")) do
				v:EnableAlarm()
			end
			
			--Make sure we can't have any more on the same drill
			self.inProgress = true
			
			--Set the networked variable isDrilling to true
			entity:SetNWBool( "isDrilling", true )
			
			timer.Create( "countdown" .. self:EntIndex(), 1, 0, function() 
				--Check if timer is less than 1, if it is then the drill is finished
				if not entity:GetNWBool( "isJammed" ) then
					if entity:GetNWInt( "drillTimer" ) < 1 and entity:IsValid() then
					
						local explode = ents.Create( "env_explosion" ) -- creates the explosion
						explode:SetPos( self:GetPos() )
						explode:Spawn()
						explode:SetKeyValue( "iMagnitude", "220" )
						explode:Fire( "Explode", 0, 0 )
						explode:EmitSound( "weapon_AWP.Single", 400, 400 )
						
						timer.Simple( 0.15, function()
							-- Do a loop with the amount of rewards to spawn
							for i = 1,cabinetConfig.rewardsAmount do
								-- Get a random reward from the table and spawn it
								
								local ranReward = table.Random(cabinetConfig.rewards)
								
								if istable(ranReward) then
									DarkRP.createMoneyBag( entity:GetPos(), math.random( ranReward[2], ranReward[3])  )
								else
									local reward = ents.Create( ranReward )
									reward:SetPos( entity:GetPos() )
									reward:Spawn()
								end
							end
						
							self.drillSounds:Stop()
							self.inProgress = false
							
							
							-- kill the timer, remove the drill, disable alarms
							for k,v in pairs( ents.FindByClass("alarm")) do
								v:DisableAlarm()
							end
							
							timer.Destroy( "countdown" .. self:EntIndex() )
							entity:Remove()
							
							self:SetColor( cabinetConfig.cooldownColor )
						end)
					end
			
					if entity:IsValid() then
						local effectdata = EffectData()
						effectdata:SetOrigin( entity:GetPos() )
						effectdata:SetMagnitude( 3 )
						effectdata:SetRadius( 10 )
						util.Effect( "Sparks", effectdata, true, true )

						local newTimer = entity:GetNWInt( "drillTimer" ) - 1
						entity:SetNWInt( "drillTimer", newTimer )
					else
						-- If the entity doesn't exist then disable everything
						for k,v in pairs( ents.FindByClass("alarm")) do
							v:DisableAlarm()
						end
						self.inProgress = false
						self.drillSounds:Stop()
						timer.Destroy( "countdown" .. self:EntIndex() )
						self:SetColor( cabinetConfig.cooldownColor )
					end
				end
			end )
		end
	end
end
 
function ENT:Use( activator, caller )
end

