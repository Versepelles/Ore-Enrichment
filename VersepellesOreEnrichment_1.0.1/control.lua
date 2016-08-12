require("util")
require("config")

---------------------------------------------------------
-- Constants
local ore_list = nil							-- list of the valid keys from the ore_dictionary

---------------------------------------------------------
-- Keep track of built objects
function builtEntity(event)
	local ent = event.created_entity
	local name = ent.name
	local pos = ent.position
	
	if name == "ore-enrichment" then
		local search_area = {{pos.x - enrichment_radius, pos.y - enrichment_radius}, {pos.x + enrichment_radius, pos.y + enrichment_radius}}
		local ores = ent.surface.find_entities(search_area)
		ores = filterOres(ores, pos, enrichment_radius)
		for __, ore in pairs(ores) do
			ore.amount = ore.amount + enrichment_amount
		end
		ent.destroy()
	elseif name == "ore-growth" then
		generateOrePatch(ent.surface, pos)
		ent.destroy()
	elseif name == "ore-dissolvent" then
		local delta = 0.1
		local search_area = {{pos.x - delta, pos.y - delta}, {pos.x + delta, pos.y + delta}}
		local ores = ent.surface.find_entities(search_area)
		ores = filterOres(ores, pos, enrichment_radius)
		for __, ore in pairs(ores) do
			ore.destroy()
		end
		ent.destroy()
	end
end
script.on_event(defines.events.on_built_entity, builtEntity)
script.on_event(defines.events.on_robot_built_entity, builtEntity)

-- Return only ores that are within radius enrichment_radius of pos
function filterOres(potential_ores, pos, radius)
	local ores = {}
	for __, ent in pairs(potential_ores) do
		if ore_dictionary[ent.name] and (distanceBetween(pos, ent.position) <= radius) then
			table.insert(ores, ent)
		end
	end
	return ores
end

-- Build a list of the valid keys from the ore_dictionary
function buildOreList()
	ore_list = {}
	for ore, __ in pairs(ore_dictionary) do
		if game.entity_prototypes[ore] then
			table.insert(ore_list, ore)
		end
	end
end

-- Returns the name of a random ore from the dictionary
function getRandomOre()
	return ore_list[math.random(1, #ore_list)]
end

-- Creates an ore patch at a specified location
function generateOrePatch(surface, center)
	if not ore_list then buildOreList() end
	local ores = {}
	for i = (-1 * growth_radius), growth_radius do
		for j = (-1 * growth_radius), growth_radius do
			local pos = {x = center.x + i, y = center.y + j}
			if (math.random() < growth_chance) and (distanceBetween(center, pos) <= growth_radius) then
				if surface.can_place_entity{name = getRandomOre(), position = pos, force = game.forces.neutral} then
					local ore = surface.create_entity{name = getRandomOre(), position = pos, force = game.forces.neutral}
					ore.amount = math.random() * (growth_amount_max - growth_amount_min) + growth_amount_min
				end
			end
		end
	end
	return ores
end

-- Utility function to print all players
function pall(msg)
	for __, player in pairs(game.players) do
		if player.connected then
			player.print(msg)
		end
	end
end

-- Utility function for regular L-2 norm distance
function distanceBetween(pos1, pos2)
	return math.sqrt(math.pow((pos1.x - pos2.x), 2) + math.pow((pos1.y - pos2.y), 2))
end