AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include("shared.lua")

function ENT:Initialize()
	self:SetModel( "models/props_lab/hevplate.mdl" )
	if (SERVER) then self:PhysicsInit( SOLID_VPHYSICS ) end
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetCollisionGroup(11)
	self:SetSolid(SOLID_VPHYSICS)
  self:SetUseType(SIMPLE_USE)
	self:Setkiosk_price(GetConVar("medickiosk_minprice"):GetInt())

  local phys = self:GetPhysicsObject()

	function changeInfo(ply, said)

		local said_check = string.lower(said)
		local said_check = string.sub(said_check, 0, 11)

		if said_check == "/kioskprice" then

			local new_price = said.sub(said, 12)
			local new_price = tonumber(new_price)
			local check_price = isnumber(new_price)
			local new_price = math.floor(new_price)

			if check_price == true and new_price >= 0 and new_price <= GetConVar("medickiosk_maxprice"):GetInt() and new_price >= GetConVar("medickiosk_minprice"):GetInt() then

						for k, v in pairs(ents.FindByClass("medic_kiosk")) do
							if v:Getowning_ent() == ply then
								v:Setkiosk_price(new_price)
								ply:ChatPrint("Kiosk price has been changed to $" .. new_price .. "!")
							end
						end
						return ""

			else

				if new_price > GetConVar("medickiosk_maxprice"):GetInt() then

					ply:ChatPrint("The max price you can you can set is $" .. GetConVar("medickiosk_maxprice"):GetInt() .. ".")
					return ""

				else

					ply:ChatPrint("The minimum price you can you can set is $" .. GetConVar("medickiosk_minprice"):GetInt() .. ".")
					return ""

				end
			end
		end
	end
	hook.Add("PlayerSay", "changeInfo", changeInfo)
  if (phys:IsValid()) then
		phys:Wake()
	end
end

function ENT:Use( activator, caller )
if (caller:Health() > 99 and caller:IsPlayer()) then
	caller:ChatPrint("You already have full health.")
	else
		if (caller:getDarkRPVar("money") >=  self:Getkiosk_price()) then
			caller:addMoney(-self:Getkiosk_price())
			caller:SetHealth(100)
			self:Getowning_ent():addMoney(self:Getkiosk_price())
			self:EmitSound("items/smallmedkit1.wav")
	else
			caller:ChatPrint("You don't have enough money.")
		end
	end
end

function allowPickUp(ply, ent)
	if (ply:IsValid() and (ent:GetClass() == "medic_kiosk") and ply == ent:Getowning_ent()) then
		return true
	end
end
hook.Add("PhysgunPickup", "allowPickUp", allowPickUp)
