timer.Simple(4, function()

	DarkRP.createEntity("Medic Kiosk", {
		ent = "medic_kiosk",
		model = "models/props_lab/hevplate.mdl",
		price = 1000,
		max = 3,
		cmd = "buymedickiosk",
		allowed = {TEAM_MEDIC}
	})

end)
