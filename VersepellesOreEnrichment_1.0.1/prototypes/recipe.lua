data:extend(
{
  {
    type = "recipe",
    name = "ore-enrichment",
	enabled = "false",
	ingredients = 
    {
		{"alien-artifact", 10},
	},
	result = "ore-enrichment",
	result_count = 1,
  },
  
  {
    type = "recipe",
    name = "ore-growth",
	enabled = "false",
	ingredients = 
    {
		{"ore-enrichment", 10},
		{"iron-ore", 1},
		{"copper-ore", 1},
		{"coal", 1},
		{"stone", 1},
	},
	result = "ore-growth",
	result_count = 1,
  },
  
  {
    type = "recipe",
    name = "ore-dissolvent",
	enabled = "false",
	ingredients = 
    {
		{"alien-artifact", 1},
	},
	result = "ore-dissolvent",
	result_count = 1,
  },
})