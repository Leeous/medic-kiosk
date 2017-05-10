include('shared.lua')

surface.CreateFont( "Title", {font = "DermaDefault",size = 35,antialias = true, weight = 700})
surface.CreateFont( "Owner", {font = "DermaDefault",extended = true,size = 15,antialias = true,underline = false,italic = false,})
surface.CreateFont( "Price", {font = "DermaDefault",extended = false,size = 25,antialias = true,underline = false,})
surface.CreateFont( "Option", {font = "DermaDefault",extended = false,size = 20,antialias = true,underline = false,})
surface.CreateFont( "Fuel level", {font = "DermaDefault",extended = true,size = 15,antialias = true,underline = false, weight = 700})

-- Variables
ply = LocalPlayer()

function ENT:Initialize()
end

function ENT:Draw()
	entData = {
		price = self:Getkiosk_price(),
		owner = self:Getowning_ent():GetName(),
		fuelLevel = self:Getkiosk_fuel_level()
	}

	function getFuelLevel()
		if entData.fuelLevel > 90 then
			return 90
		else
			return entData.fuelLevel
		end
	end

	self:DrawModel()
	local Pos = self:GetPos()
	local Ang = self:GetAngles()

	surface.SetFont( "Owner" )
	local width, height = surface.GetTextSize( entData.owner )
	if (width > 80) then
		owner_name = entData.owner
		entData.owner = owner_name.sub(owner_name, 0, 9) .. "..."
	end

	Ang:RotateAroundAxis(Ang:Up(), 90)
	Ang:RotateAroundAxis(Ang:Forward(), 90)

	cam.Start3D2D(Pos + Ang:Up() * 0 + Ang:Forward() * 7.50 + Ang:Right() * 0, Ang, 0.11)
		draw.RoundedBox( 0, -55, -30, 95, 195, Color(0, 0, 0, 255))
		draw.SimpleText( "$" .. string.Comma(entData.price), "Price", -8, -5, Color( 0, 255, 150, 255 ), 1, 1)
		draw.SimpleText( "Owned by", "Owner", -7, 80, Color(215, 180, 36, 255), 1, 1)
		draw.SimpleText( entData.owner, "Owner", -7, 95, Color( 0, 255, 255, 255 ), 1, 1)
		surface.SetDrawColor( 153,153,0, 255 )
		surface.SetTextColor( 255, 255, 255, 255 )
		surface.DrawOutlinedRect( -54, 150, 92, 10 )
		surface.DrawRect( -54, 150, getFuelLevel(), 10 )
		surface.SetFont( "Fuel level" )
		surface.SetTextPos( -19, 135 )
		surface.DrawText( "Fuel" )
  cam.End3D2D()
	cam.Start3D2D(Pos + Ang:Up() * 1.1 + Ang:Forward() * 0 + Ang:Right() * -15, Ang, 0.10)
		draw.RoundedBox( 8, -110, -41, 220, 70, Color(0, 0, 0, 255))
		draw.SimpleText( "Medic Kiosk", "Title", 0, -6, Color( 215, 180, 36, 255 ), 1, 1)
	cam.End3D2D()
end
