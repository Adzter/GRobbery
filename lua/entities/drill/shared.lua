ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName= "Drill"
ENT.Author= "Adzter"
ENT.Contact= "http://steamcommunity.com/id/imadzter"
ENT.Purpose= ""
ENT.Instructions= ""
ENT.Spawnable = true
ENT.AdminSpawnable = false

hook.Add("AllowPlayerPickup", "allowDrillPickup", function( ply, ent )
	if ent:GetClass() == "drill" then return true end
end)