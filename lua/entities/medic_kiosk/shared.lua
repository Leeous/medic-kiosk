ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName		= "Medic Kiosk"
ENT.Author			= "LeeTheCoder"
ENT.Contact			= "@LeeTheCoder"

ENT.AdminSpawnable = true
ENT.Spawnable 		= false

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "owning_ent")
	self:NetworkVar("Float", 0, "kiosk_price")
	self:NetworkVar("Int", 0, "kiosk_type")
end
