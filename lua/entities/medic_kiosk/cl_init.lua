include('shared.lua')

surface.CreateFont( "Title", {font = "DermaDefault",size = 35,antialias = true,})
surface.CreateFont( "Owner", {font = "DermaDefault",extended = true,size = 15,antialias = true,underline = false,italic = false,})
surface.CreateFont( "Price", {font = "DermaDefault",extended = false,size = 25,antialias = true,underline = false,})
surface.CreateFont( "Option", {font = "DermaDefault",extended = false,size = 20,antialias = true,underline = false,})

function ENT:Initialize()
	chat.AddText( Color( 100, 255, 255 ), "You can change your kiosk's price by typing /kioskprice (price).")
end

function ENT:Draw()
	self:DrawModel()

	function pickLight_Heal()
		if self:Getkiosk_type() == 0 then
		return Color(255, 0, 0, 255)
			else
		return Color(105, 105, 105, 255)
		end
	end

	function pickLight_Armor()
		if self:Getkiosk_type() == 1 then
		return Color(0, 0, 255, 255)
			else
		return Color(105, 105, 105, 255)
		end
	end

	local Pos = self:GetPos()
	local Ang = self:GetAngles()

	local owner = self:Getowning_ent():GetName()

	surface.SetFont( "Owner" )
	local width, height = surface.GetTextSize( owner )

	if (width > 80) then
		owner = owner.sub(owner, 0, 9) .. "..."
	end

	local kiosk_price = self:Getkiosk_price()

	Ang:RotateAroundAxis(Ang:Up(), 90)
	Ang:RotateAroundAxis(Ang:Forward(), 90)

	cam.Start3D2D(Pos + Ang:Up() * 0 + Ang:Forward() * 6.75 + Ang:Right() * 0, Ang, 0.11)
		draw.RoundedBox( 0, -55, -30, 100, 195, Color(0, 0, 0, 255))
		draw.SimpleText( "$" .. kiosk_price, "Price", 0, -4, Color( 0, 255, 150, 255 ), 1, 1)
		draw.SimpleText( "Owned by", "Owner", 0, 95, Color( 0, 255, 255, 255 ), 1, 1)
		draw.SimpleText( owner, "Owner", 0, 110, Color( 255, 255, 255, 255 ), 1, 1)
  cam.End3D2D()
	cam.Start3D2D(Pos + Ang:Up() * 1.1 + Ang:Forward() * 0 + Ang:Right() * -15, Ang, 0.11)
		draw.RoundedBox( 0, -110, -41, 220, 70, Color(0, 0, 0, 255))
		draw.SimpleText( "Medic Kiosk", "Title", 0, -5, Color( 255, 255, 255, 255 ), 1, 1)
	cam.End3D2D()
end
