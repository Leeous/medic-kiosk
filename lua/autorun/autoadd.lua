timer.Simple(4, function()
  if engine.ActiveGamemode() == "darkrp" then
    if GetConVar("medickiosk_disableautoadd"):GetBool() then
    else
      DarkRP.createCategory{
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

      DarkRP.createEntity("Medic Kiosk Refill", {
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
end)
