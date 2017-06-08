local function autoadd()
  if not GetConVar("medickiosk_disableautoadd"):GetBool() then
    DarkRP.createCategory {
      name = "Medic Kiosk", -- The name of the category.
      categorises = "entities", -- What it categorises. MUST be one of "jobs", "entities", "shipments", "weapons", "vehicles", "ammo".
      startExpanded = true, -- Whether the category is expanded when you open the F4 menu.
      color = Color(215, 180, 36, 255), -- The color of the category header.
    }

    DarkRP.createEntity("Medic Kiosk", {
      ent = "medic_kiosk",
      model = "models/props_lab/hevplate.mdl",
      price = GetConVar("medickiosk_price"):GetInt(),
      max = GetConVar("medickiosk_limit"):GetInt(),
      cmd = "buymedickiosk",
      allowed = {TEAM_MEDIC},
      category = "Medic Kiosk"
    })

    DarkRP.createEntity("Medic Kiosk (Refill)", {
      ent = "medic_kiosk_refill",
      model = "models/healthvial.mdl",
      price = 100,
      max = 2,
      cmd = "buymedickioskrefill",
      allowed = {TEAM_MEDIC},
      category = "Medic Kiosk"
    })
  end
end

local function init()
  local result = pcall(autoadd)
  if not result then
    MsgC( Color( 255, 0, 150 ), "\n\n[ERROR] It seems like you may have setup the Medic Kiosk twice, try using 'medickiosk_disableautoadd 0' in the server console (this screen).\nIt could be something else, but try that, restart the server, and see if the error pops up again.\nIf it keeps popping up, contact me at contact@leeous.com or check the client console for more info.\n\n" )
  end
end
hook.Add( "Initialize", "", init )

