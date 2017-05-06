ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName		= "Medic Kiosk"
ENT.Author			= "LeeTheCoder"
ENT.Contact			= "@LeeTheCoder"

ENT.AdminSpawnable = true
ENT.Spawnable 		= true

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "owning_ent")
	self:NetworkVar("Int", 0, "kiosk_price")
	self:NetworkVar("Int", 1, "kiosk_fuel_level")
end
