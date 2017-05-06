AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include("shared.lua")

-- Variables/tables
delay = 0

function ENT:Initialize()
	self:SetModel( "models/healthvial.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetCollisionGroup(11)
	self:SetSolid(SOLID_VPHYSICS)
  self:SetUseType(SIMPLE_USE)
end

-- function allowPickUp(ply, ent)
-- 	if (ply:IsValid() and (ent:GetClass() == "medic_kiosk") and ply == ent:Getowning_ent()) then
-- 		return true
-- 	end
-- end
-- hook.Add("PhysgunPickup", "allowPickUp", allowPickUp)
