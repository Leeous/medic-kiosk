ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName		= "Medic Kiosk"
ENT.Author			= "LeeTheCoder"
ENT.Contact			= "@LeeTheCoder"

function ENT:SetupDataTables()
	self:NetworkVar("Entity", 0, "owning_ent")
	self:NetworkVar("Float", 0, "kiosk_price")
end
