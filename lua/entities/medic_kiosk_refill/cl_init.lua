include('shared.lua')

surface.CreateFont( "Title", {font = "DermaDefault",size = 35,antialias = true,})
surface.CreateFont( "Owner", {font = "DermaDefault",extended = true,size = 15,antialias = true,underline = false,italic = false,})
surface.CreateFont( "Price", {font = "DermaDefault",extended = false,size = 25,antialias = true,underline = false,})
surface.CreateFont( "Option", {font = "DermaDefault",extended = false,size = 20,antialias = true,underline = false,})

function ENT:Initialize()
	LocalPlayer():ChatPrint("Pick this up with the Gravity Gun and put it in the Medic Kiosk to refill it.")
end

function ENT:Draw()
	self:DrawModel()
end
