include('shared.lua')

-- Variables
ply = LocalPlayer()

function ENT:Initialize()
	surface.CreateFont( "Title", {font = "Open Sans", extended = true, size = 80,antialias = true, weight = 700})
	surface.CreateFont( "Owner", {font = "Open Sans",extended = true,size = 32,antialias = true,underline = false,italic = false, weight = 700})
	surface.CreateFont( "Owner title", {font = "Open Sans",extended = true,size = 40,antialias = true,underline = false,italic = false, weight = 500})
	surface.CreateFont( "Price", {font = "Open Sans",extended = true,size = 75,antialias = true,underline = false, weight = 700})
	surface.CreateFont( "Fuel level", {font = "Open Sans",extended = true,size = 45,antialias = true,underline = false, weight = 700})
	surface.CreateFont( "Other", {font = "Open Sans",extended = true,size = 150,antialias = true,underline = false, weight = 700})
	surface.CreateFont( "Uses label", {font = "Open Sans",extended = true,size = 40	,antialias = true,underline = false, weight = 700})
end

function ENT:Draw()
	entData = {
		price = self:Getkiosk_price(),
		owner = self:Getowning_ent():GetName(),
		used = self:Getkiosk_used(),
		fuelLevel = self:Getkiosk_fuel_level()
	}

	self:DrawModel()
	local Pos = self:GetPos()
	local Ang = self:GetAngles()

	--[[
	Checks how long the name of the owner is,
	if too large will tack on "..." and cut off the rest to ensure the name doesn't drag off of the model.
	]]--
	surface.SetFont( "Owner" )
	local width, height = surface.GetTextSize( entData.owner )
	if (width > 200) then
		owner_name = entData.owner
		entData.owner = owner_name.sub(owner_name, 0, 9) .. "..."
	end


	function getFuelLevel()
		if entData.fuelLevel > 480 then
			return -480
		else
			return -entData.fuelLevel
		end
	end

	function draw.OutlinedBox( x, y, w, h, thickness, clr )
		surface.SetDrawColor( clr )
		for i=0, thickness - 1 do
			surface.DrawOutlinedRect( x + i, y + i, w - i * 2, h - i * 0.4 )
		end
	end

	Ang:RotateAroundAxis(Ang:Up(), 90)
	Ang:RotateAroundAxis(Ang:Forward(), 90)

	-- Info panel
	cam.Start3D2D(Pos + Ang:Up() * 0.95 + Ang:Forward() * 7.50 + Ang:Right() * 0, Ang, 0.05)
		surface.SetDrawColor( 0, 0, 0, 255 )
		surface.DrawRect( -120, 345, 205, -558 )
		draw.SimpleText( "$" .. string.Comma(entData.price), "Price", -20, -10, Color( 0, 255, 150, 255 ), 1, 1)
		draw.SimpleText( "Owned by", "Owner title", -20, -170, Color(255, 255, 255, 255), 1, 1)
		draw.SimpleText( entData.owner, "Owner", -20, -135, Color( 0, 150, 255, 255 ), 1, 1)
		draw.SimpleText( entData.used, "Other", -20, 210, Color( 255, 255, 255, 255 ), 1, 1)
		draw.SimpleText( "uses", "Uses label", -20, 275, Color( 255, 255, 255, 255 ), 1, 1)
  cam.End3D2D()

	-- Title bar
	cam.Start3D2D(Pos + Ang:Up() * 1.1 + Ang:Forward() * -11.3 + Ang:Right() * -19.2, Ang, 0.05)
		draw.RoundedBox( 14, 0, 0, 450, 150, Color(0, 0, 0, 255))
		surface.SetTextColor( 215, 180, 36, 255 )
		surface.SetTextPos( 55, 35 )
		surface.SetFont( "Title" )
		surface.DrawText( "Medic Kiosk" )
	cam.End3D2D()

	-- Fuel bar
	cam.Start3D2D(Pos + Ang:Up() * 1.85 + Ang:Forward() * -11 + Ang:Right() * 16.5, Ang, 0.05)
		surface.DrawRect( 0, 0, 180, -530 )
		surface.SetTextColor( 255, 255, 255, 255 )
		surface.SetDrawColor(117, 117, 0, 255)
		surface.DrawRect( 0, 0, 180, -480 )
		draw.OutlinedBox( 0, -3.5, 180, -480, 10, Color(153, 153, 0, 255) )
		surface.DrawRect( 0, 0, 180, getFuelLevel())
		surface.SetFont( "Fuel level" )
		surface.SetTextPos( 59, -529 )
		surface.DrawText( "Fuel" )
	cam.End3D2D()
end

-- Tells the owner of the Medic Kiosk that someone has used it
net.Receive( "usedMK", function()
	caller = net.ReadEntity()
	notification.AddLegacy( caller:Name() .. " used your Medic Kiosk!", NOTIFY_GENERIC, 2 )
	surface.PlaySound( "buttons/button15.wav" )
	print(caller:Name() .. " used your Medic Kiosk!")
end )

-- Tells player how to change the price of the Medic Kiosk
net.Receive( "alertMedic", function()
	notification.AddLegacy( "You can change your kiosk's price by typing /kioskprice (price).", NOTIFY_HINT, 10)
	surface.PlaySound( "buttons/button15.wav" )
	print("You can change your kiosk's price by typing /kioskprice (price).")
end )
