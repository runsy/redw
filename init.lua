local modname = minetest.get_current_modname()
local S = minetest.get_translator(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

-- Register Biomes

minetest.register_biome({
	name = "redwood_forest",
	node_top = "redw:dirt_with_grass",
	depth_top = 1,
	node_filler = "redw:dirt",
	depth_filler = 8,
	node_riverbed = "redw:dirt",
	depth_riverbed = 2,
	node_water = "default:water_source",
	depth_water_top = 5,
	node_water_top = "default:water_source",
	node_stone = "redw:sandstone",
	y_max = 31000,
	y_min = 1,
	heat_point = 51.7,
	humidity_point = 91.7,
})

-- Register Nodes

minetest.register_node("redw:dirt_with_grass", {
	description = S("Red Dirt with Grass"),
	tiles = {"redw_dirt_with_grass.png", "redw_dirt.png",
		{name = "redw_dirt.png^redw_dirt_with_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("redw:dirt", {
	description = S("Red Dirt"),
	tiles = {"redw_dirt.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("redw:sandstone", {
	description = S("Red Sandstone"),
	tiles = {"redw_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

-- Ferns

minetest.register_node("redw:dudley_shield_fern", {
	description = S("Dudley's Shield Fern"),
	drawtype = "plantlike",
	waving = 1,
	tiles = {"redw_dudley_shield_fern.png"},
	inventory_image = "redw_dudley_shield_fern.png",
	wield_image = "redw_dudley_shield_fern.png",
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 4,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 1 / 16, 3 / 16},
	},
})

minetest.register_node("redw:deer_fern", {
	description = S("Deer Fern"),
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"redw_deer_fern.png"},
	inventory_image = "redw_deer_fern.png",
	wield_image = "redw_deer_fern.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, 0, 2 / 16},
	},
})

minetest.register_node("redw:polypody_fern", {
	description = S("Polypody Fern"),
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"redw_polypody_fern.png"},
	inventory_image = "redw_polypody_fern.png",
	wield_image = "redw_polypody_fern.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 0, 3 / 16},
	},
})

minetest.register_node("redw:western_swordfern", {
	description = S("Western Swordfern"),
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"redw_western_swordfern.png"},
	inventory_image = "redw_western_swordfern.png",
	wield_image = "redw_western_swordfern.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 0, 4 / 16},
	},
})

--Grass

minetest.register_node("redw:grass", {
	description = S("Redwood Grass"),
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 0.8,
	tiles = {"redw_grass.png"},
	inventory_image = "redw_grass.png",
	wield_image = "redw_grass.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -5 / 16, 4 / 16},
	},
})

--Redcurrant Bush Stuff

-- Required wrapper to allow customization of default.after_place_leaves
local function after_place_leaves(...)
	return default.after_place_leaves(...)
end

minetest.register_craftitem("redw:redcurrants", {
	description = S("Redcurrants"),
	inventory_image = "redw_redcurrants.png",
	groups = {food_redcurrants = 1, food_berry = 1},
	on_use = minetest.item_eat(3),
})

minetest.register_node("redw:redcurrant_bush_leaves_with_berries", {
	description = S("Redcurrant Bush Leaves with Berries"),
	drawtype = "plantlike",
	tiles = {"redw_redcurrant_bush_leaves.png^redw_redcurrant_overlay.png"},
	inventory_image = "redw_redcurrant_bush_leaves.png^redw_redcurrant_overlay.png",
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1, dig_immediate = 3},
	drop = "redw:redcurrants",
	sounds = default.node_sound_leaves_defaults(),
	node_dig_prediction = "redw:redcurrant_bush_leaves",
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		minetest.set_node(pos, {name = "redw:redcurrant_bush_leaves"})
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,
})

minetest.register_node("redw:redcurrant_bush_leaves", {
	description = S("Redcurrant Bush Leaves"),
	drawtype = "plantlike",
	tiles = {"redw_redcurrant_bush_leaves.png"},
	inventory_image = "redw_redcurrant_bush_leaves.png",
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"redw:redcurrant_bush_sapling"}, rarity = 5},
			{items = {"redw:redcurrant_bush_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
		selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},

	on_timer = function(pos, elapsed)
		if minetest.get_node_light(pos) < 11 then
			minetest.get_node_timer(pos):start(200)
		else
			minetest.set_node(pos, {name = "redw:redcurrant_bush_leaves_with_berries"})
		end
	end,

	after_place_node = after_place_leaves,
})

minetest.register_node("redw:redcurrant_bush_sapling", {
	description = S("Redcurrant Bush Sapling"),
	drawtype = "plantlike",
	tiles = {"redw_redcurrant_bush_sapling.png"},
	inventory_image = "redw_redcurrant_bush_sapling.png",
	wield_image = "redw_redcurrant_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name = "redw:redcurrant_bush_leaves"})
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, -2 / 16, 3 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"redw:redcurrant_bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

--Flowers

minetest.register_node("redw:forsythia", {
	description = S("Forsythia"),
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"redw_forsythia.png"},
	inventory_image = "redw_forsythia.png",
	wield_image = "redw_forsythia.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flower = 1, flora = 1, attached_node = 1, flammable = 1, color_yellow = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1/16, 4 / 16},
	},
})

minetest.register_node("redw:hydrangea", {
	description = S("Hydrangea"),
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"redw_hydrangea.png"},
	inventory_image = "redw_hydrangea.png",
	wield_image = "redw_hydrangea.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flower = 1, flora = 1, attached_node = 1, flammable = 1, color_orange = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2/16, 4 / 16},
	},
})

minetest.register_node("redw:sage", {
	description = S("Sage"),
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"redw_sage.png"},
	inventory_image = "redw_sage.png",
	wield_image = "redw_sage.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flower = 1, flora = 1, attached_node = 1, flammable = 1, color_blue = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, 0, 2 / 16},
	},
})

minetest.register_node("redw:white_potentilla", {
	description = S("White Potentilla"),
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"redw_white_potentilla.png"},
	inventory_image = "redw_white_potentilla.png",
	wield_image = "redw_white_potentilla.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flower = 1, flora = 1, attached_node = 1, flammable = 1, color_white = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 2/16, 3 / 16},
	},
})

minetest.register_node("redw:hollycock", {
	description = S("Hollycock"),
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"redw_hollycock.png"},
	inventory_image = "redw_hollycock.png",
	wield_image = "redw_hollycock.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flower = 1, flora = 1, attached_node = 1, flammable = 1, color_pink = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -3/16, 5 / 16},
	},
})

--Mushroom

minetest.register_node("redw:verdigris_agaric", {
	description = S("Verdigris Agaric"),
	tiles = {"redw_verdigris_agaric.png"},
	inventory_image = "redw_verdigris_agaric.png",
	wield_image = "redw_verdigris_agaric.png",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	stack_max = 99,
	groups = {snappy = 3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_use = minetest.item_eat(-5),
	selection_box = {
		type = "fixed",
		fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, -1 / 16, 2 / 16},
	}
})

if mg_name ~= "v6" and mg_name ~= "singlenode" then

	minetest.register_decoration({
		decoration = "redw:dirt",
		deco_type = "simple",
		place_on = "redw:dirt_with_grass",
		biomes = {"redwood_forest"},
		fill_ratio = 0.1,
		place_offset_y = -1,
		flags = "place_center_x, place_center_z, force_placement",
		y_min = 1,
		y_max = 31000,
	})

	minetest.register_decoration({
		decoration = "redw:dirt",
		deco_type = "simple",
		place_on = "redw:dirt_with_grass",
		biomes = {"redwood_forest"},
		spawn_by = "redw:dirt_with_grass",
		num_spawn_by = 1,
		fill_ratio = 0.1,
		place_offset_y = -1,
		flags = "place_center_x, place_center_z, force_placement",
		y_min = 1,
		y_max = 31000,
	})

	minetest.register_decoration({
		decoration = "redw:dudley_shield_fern",
		deco_type = "simple",
		place_on = {"redw:dirt_with_grass", "redw:dirt"},
		biomes = {"redwood_forest"},
		fill_ratio = 0.008,
		y_min = 1,
		y_max = 31000,
	})

	minetest.register_decoration({
		decoration = "redw:deer_fern",
		deco_type = "simple",
		place_on = {"redw:dirt_with_grass", "redw:dirt"},
		biomes = {"redwood_forest"},
		fill_ratio = 0.008,
		y_min = 1,
		y_max = 31000,
	})

	minetest.register_decoration({
		decoration = "redw:polypody_fern",
		deco_type = "simple",
		place_on = {"redw:dirt_with_grass", "redw:dirt"},
		biomes = {"redwood_forest"},
		fill_ratio = 0.008,
		y_min = 1,
		y_max = 31000,
	})

	minetest.register_decoration({
		decoration = "redw:western_swordfern",
		deco_type = "simple",
		place_on = {"redw:dirt_with_grass", "redw:dirt"},
		biomes = {"redwood_forest"},
		fill_ratio = 0.008,
		y_min = 1,
		y_max = 31000,
	})

	minetest.register_decoration({
		decoration = "flowers:mushroom_red",
		deco_type = "simple",
		place_on = {"redw:dirt_with_grass", "redw:dirt"},
		biomes = {"redwood_forest"},
		fill_ratio = 0.0008,
		y_min = 1,
		y_max = 31000,
	})

	minetest.register_decoration({
		decoration = "flowers:mushroom_brown",
		deco_type = "simple",
		place_on = {"redw:dirt_with_grass", "redw:dirt"},
		biomes = {"redwood_forest"},
		fill_ratio = 0.0008,
		y_min = 1,
		y_max = 31000,
	})


	--Redcurrant

	minetest.register_decoration({
		decoration = "redw:redcurrant_bush_leaves_with_berries",
		deco_type = "simple",
		place_on = {"redw:dirt_with_grass", "redw:dirt"},
		biomes = {"redwood_forest"},
		noise_params = {
			offset = 0.0008,
			scale = 0.008,
			spread = {x = 250, y = 250, z = 250},
			seed = 278,
			octaves = 3,
			persist = 0.66
		},
		y_min = 1,
		y_max = 80,
	})

	--Grass
	minetest.register_decoration({
		decoration = "redw:grass",
		deco_type = "simple",
		place_on = {"redw:dirt_with_grass"},
		sidelen = 16,
		biomes = {"redwood_forest"},
		fill_ratio = 0.05,
		y_min = 1,
		y_max = 80,
	})

	--Flowers

	minetest.register_decoration({
		decoration = "redw:hydrangea",
		deco_type = "simple",
		place_on = "redw:dirt_with_grass",
		sidelen = 16,
		fill_ratio = 0.1,
		biomes = {"redwood_forest"},
		noise_params = {
			offset = 0.005,
			scale = 0.008,
			spread = {x = 250, y = 250, z = 250},
			seed = 67,
			octaves = 3,
			persist = 0.66
		},
		y_min = 1,
		y_max = 80,
	})

	minetest.register_decoration({
		decoration = "redw:forsythia",
		deco_type = "simple",
		place_on = "redw:dirt_with_grass",
		sidelen = 16,
		fill_ratio = 0.1,
		biomes = {"redwood_forest"},
		noise_params = {
			offset = 0.005,
			scale = 0.008,
			spread = {x = 250, y = 250, z = 250},
			seed = 645,
			octaves = 3,
			persist = 0.66
		},
		y_min = 1,
		y_max = 80,
	})

	minetest.register_decoration({
		decoration = "redw:white_potentilla",
		deco_type = "simple",
		place_on = "redw:dirt_with_grass",
		sidelen = 16,
		fill_ratio = 0.1,
		biomes = {"redwood_forest"},
		noise_params = {
			offset = 0.005,
			scale = 0.008,
			spread = {x = 250, y = 250, z = 250},
			seed = 309,
			octaves = 3,
			persist = 0.66
		},
		y_min = 1,
		y_max = 80,
	})

	minetest.register_decoration({
		decoration = "redw:sage",
		deco_type = "simple",
		place_on = "redw:dirt_with_grass",
		sidelen = 16,
		fill_ratio = 0.1,
		biomes = {"redwood_forest"},
		noise_params = {
			offset = 0.005,
			scale = 0.008,
			spread = {x = 250, y = 250, z = 250},
			seed = 459,
			octaves = 3,
			persist = 0.66
		},
		y_min = 1,
		y_max = 80,
	})

	minetest.register_decoration({
		decoration = "redw:hollycock",
		deco_type = "simple",
		place_on = "redw:dirt_with_grass",
		sidelen = 16,
		fill_ratio = 0.1,
		biomes = {"redwood_forest"},
		noise_params = {
			offset = 0.005,
			scale = 0.008,
			spread = {x = 250, y = 250, z = 250},
			seed = 47,
			octaves = 3,
			persist = 0.66
		},
		y_min = 1,
		y_max = 80,
	})

	--Mushroom
	minetest.register_decoration({
		decoration = "redw:verdigris_agaric",
		deco_type = "simple",
		place_on = "redw:dirt",
		sidelen = 16,
		fill_ratio = 0.05,
		noise_params = {
			offset = 0.005,
			scale = 0.008,
			spread = {x = 250, y = 250, z = 250},
			seed = 55,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"redwood_forest"},
		y_min = 1,
		y_max = 80,
	})
end
