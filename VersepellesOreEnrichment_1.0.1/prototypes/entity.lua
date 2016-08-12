require("config")

local ent
local name

local entity_names = {
	"ore-enrichment",
	"ore-growth",
	"ore-dissolvent",
}
for __, name in pairs(entity_names) do 
	ent = util.table.deepcopy(data.raw["container"]["steel-chest"])
	ent.name = name
	ent.minable.result = name
	ent.corpse = "small-remnants"
	ent.collision_box = {{-0.35, -0.35}, {0.35, 0.35}}
	ent.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
	ent.fast_replaceable_group = nil
	ent.icon = Mod_Name .. "/graphics/icons/" .. name .. ".png"
	ent.picture = 
		{
		  filename = Mod_Name .. "/graphics/entity/" .. name .. "/" .. name .. ".png",
		  width = 32,
		  height = 32,
		  shift = {0, 0}
		}
	ent.inventory_size = 0
	data:extend({ent})
end