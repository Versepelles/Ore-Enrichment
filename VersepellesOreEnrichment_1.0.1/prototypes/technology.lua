require("config")

data:extend(
{
	{
		type = "technology",
		name = "ore-enrichment",
		icon = Mod_Name .. "/graphics/icons/ore-enrichment-tech.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "ore-enrichment"
			},
			{
				type = "unlock-recipe",
				recipe = "ore-growth"
			},
			{
				type = "unlock-recipe",
				recipe = "ore-dissolvent"
			},
		},
		prerequisites = {"alien-technology"},
		unit =
		{
			count = 100,
			ingredients =
			{
				{"alien-science-pack", 1},
			},
			time = 60
		},
		order = "z[ore-enrichment]"
	},
})