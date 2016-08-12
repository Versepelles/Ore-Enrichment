require("config")

local item
local name

-- Ore Enrichment
name = "ore-enrichment"
item = util.table.deepcopy(data.raw["item"]["steel-chest"])
item.name = name
item.icon = Mod_Name .. "/graphics/icons/" .. name .. ".png"
item.place_result = name
item.subgroup = "terrain"
item.order = "z[ore-enrichment]-a"
data:extend({item})

-- Ore Growth
name = "ore-growth"
item = util.table.deepcopy(data.raw["item"]["steel-chest"])
item.name = name
item.icon = Mod_Name .. "/graphics/icons/" .. name .. ".png"
item.place_result = name
item.subgroup = "terrain"
item.order = "z[ore-enrichment]-b"
data:extend({item})

-- Ore Dissolvent
name = "ore-dissolvent"
item = util.table.deepcopy(data.raw["item"]["steel-chest"])
item.name = name
item.icon = Mod_Name .. "/graphics/icons/" .. name .. ".png"
item.place_result = name
item.subgroup = "terrain"
item.order = "z[ore-enrichment]-c"
data:extend({item})