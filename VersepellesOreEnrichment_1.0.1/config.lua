Mod_Name = "__VersepellesOreEnrichment__"

enrichment_radius = 5			-- distance from ore-enrichment object that ores will be enriched
enrichment_amount = 200			-- amount of ore each enrichment adds
growth_radius = 5				-- distance from ore-growth object that ores will be placed (integer)
growth_chance = 0.65			-- chance of ore growing
growth_amount_min = 250			-- minimum resource amount
growth_amount_max = 2500			-- minimum resource amount

ore_dictionary = {
	-- Vanilla
	["stone"] = true,
	["coal"] = true,
	["iron-ore"] = true,
	["copper-ore"] = true,
	-- Angel's Ores
	["angels-ore1"] = true,
	["angels-ore2"] = true,
	["angels-ore3"] = true,
	["angels-ore4"] = true,
	["angels-ore5"] = true,
	["angels-ore6"] = true,
	-- Bob's Mod
	["bauxite-ore"] = true,
	["cobalt-ore"] = true,
	["gem-ore"] = true,
	["gold-ore"] = true,
	["lead-ore"] = true,
	["nickel-ore"] = true,
	["quartz"] = true,
	["rutile-ore"] = true,
	["silver-ore"] = true,
	--"sulfur"] = true, -- sulfur appears in vanilla, so we omit it for simplicity
	["tin-ore"] = true,
	["tungsten-ore"] = true,
	["zinc-ore"] = true,
	-- Yuoki Industries
	["y-res1"] = true,
	["y-res2"] = true,
	-- Various Uranium
	["uraninite"] = true,
	["fluorite"] = true,
	["uranium-ore"] = true,
	-- Dark Matter
	["tenemut"] = true,
}