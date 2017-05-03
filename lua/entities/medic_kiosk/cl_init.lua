include('shared.lua')

surface.CreateFont( "Title", {font = "DermaDefault",size = 35,antialias = true,})
surface.CreateFont( "Owner", {font = "DermaDefault",extended = true,size = 15,antialias = true,underline = false,italic = false,})
surface.CreateFont( "Price", {font = "DermaDefault",extended = false,size = 25,antialias = true,underline = false,})
surface.CreateFont( "Option", {font = "DermaDefault",extended = false,size = 20,antialias = true,underline = false,})

function ENT:Initialize()
	chat.AddText( Color( 100, 255, 255 ), "You can change your kiosk's price by typing /kioskprice (price).")
end

function ENT:Draw()

	entData = {
		price = self:Getkiosk_price(),
		owner = self:Getowning_ent():GetName()
	}

	self:DrawModel()
	local Pos = self:GetPos()
	local Ang = self:GetAngles()

	surface.SetFont( "Owner" )
	local width, height = surface.GetTextSize( entData.owner )
	if (width > 80) then
		owner = owner.sub(owner, 0, 9) .. "..."
	end

	Ang:RotateAroundAxis(Ang:Up(), 90)
	Ang:RotateAroundAxis(Ang:Forward(), 90)

	cam.Start3D2D(Pos + Ang:Up() * 0 + Ang:Forward() * 6.75 + Ang:Right() * 0, Ang, 0.11)
		draw.RoundedBox( 0, -55, -30, 100, 195, Color(0, 0, 0, 255))
		draw.SimpleText( "$" .. string.Comma(entData.price), "Price", 0, -3, Color( 0, 255, 150, 255 ), 1, 1)
		draw.SimpleText( "Owned by", "Owner", 0, 95, Color( 215, 180, 36, 255 ), 1, 1)
		draw.SimpleText( entData.owner, "Owner", 0, 110, Color( 255, 255, 255, 255 ), 1, 1)
  cam.End3D2D()
	cam.Start3D2D(Pos + Ang:Up() * 1.1 + Ang:Forward() * 0 + Ang:Right() * -15, Ang, 0.10)
		draw.RoundedBox( 8, -110, -41, 220, 70, Color(0, 0, 0, 255))
		draw.SimpleText( "Medic Kiosk", "Title", 0, -6, Color( 215, 180, 36, 255 ), 1, 1)
	cam.End3D2D()
end
