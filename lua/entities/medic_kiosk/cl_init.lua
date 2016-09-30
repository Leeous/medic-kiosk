include('shared.lua')
-- Let client user know addon has loaded
MsgC( Color( 200, 100, 143), "Medic Kiosk has been loaded! Created by LeetheCoder" )
MsgC( Color( 100, 200, 132), "version 1.2" ) 

-- Fonts
surface.CreateFont( "Title", {
	font = "DermaDefault",
	size = 35,
	antialias = true,
} )

surface.CreateFont( "Owner", {
	font = "DermaDefault",
	extended = true,
	size = 15,
	antialias = true,
	underline = false,
	italic = false,
} )

surface.CreateFont( "Price", {
	font = "DermaDefault",
	extended = false,
	size = 25,
	antialias = true,
	underline = false,
} )

-- Code

function ENT:Initialize()

end

function ENT:Draw()
	self:DrawModel()

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
		draw.SimpleText( "Medic", "Title", 0, 75, Color( 255, 255, 255, 255 ), 1, 1)
		draw.SimpleText( "Kiosk", "Title", 0, 100, Color( 255, 255, 255, 255 ), 1, 1)
		draw.SimpleText( "$" .. kiosk_price, "Price", 0, -4, Color( 0, 255, 150, 255 ), 1, 1)
		draw.SimpleText( "Owned by", "Owner", 0, 125, Color( 0, 255, 255, 255 ), 1, 1)
		draw.SimpleText( owner, "Owner", 0, 140, Color( 255, 255, 255, 255 ), 1, 1)
  cam.End3D2D()
end
