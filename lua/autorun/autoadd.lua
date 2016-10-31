timer.Simple(4, function()
  if engine.ActiveGamemode() == "darkrp" then
    if GetConVar("medickiosk_disableautoadd"):GetBool() then
    else
      DarkRP.createEntity("Medic Kiosk", {
        ent = "medic_kiosk",
        model = "models/props_lab/hevplate.mdl",
        price = GetConVar("medickiosk_price"):GetInt(),
        max = GetConVar("medickiosk_limit"):GetInt(),
        cmd = "buymedickiosk",
        allowed = {TEAM_MEDIC}
      })
    end
  end
end)
