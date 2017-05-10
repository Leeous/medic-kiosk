ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName		= "Medic Kiosk"
ENT.Author			= "Leeous"
ENT.Contact			= "@LeeTheCoder"

ENT.AdminSpawnable = true
ENT.Spawnable 		= false

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "owning_ent")
	self:NetworkVar("Int", 0, "kiosk_price")
	self:NetworkVar("Int", 1, "kiosk_fuel_level")
	self:NetworkVar("Int", 2, "kiosk_used")
end
