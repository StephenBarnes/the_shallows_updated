local function make_water_autoplace_settings(max_elevation, influence)
	local fitness = "(" .. max_elevation .. " - elevation)"
	-- Adjust fitness to allow higher-influence (usually deeper) water to override shallower water,
	-- even at elevations where they both have >0 fitness
	local adjusted_fitness = "(" .. influence .. " * min(" .. fitness .. ", 1))"
	return {
		-- If fitness is < 0, probability will be -infinity,
		-- so that water doesn't override the default walkable tile (in case no other tile is placed).
		-- Otherwise probability is adjusted_fitness:
		probability_expression = "min(" .. fitness .. " * " .. math.huge .. ", " .. adjusted_fitness .. ")",
	}
end

function update_all_water_autoplace( args )
  local config =
  {
    {
	  tile = "water-shallow",
	  distance = args.green_shallow_distance,
	  influence = 10
	},
    {
	  tile = "water-mud",
	  distance = args.blue_shallow_distance,
	  influence = 20
	},
    {
	  tile = "water",
	  distance = args.light_water_distance,
	  influence = 40
	},
    {
	  tile = "deepwater",
	  distance = args.dark_water_distance,
	  influence = 80
	},
  }
    
  for i = 1, #config do
    local distance = -1 * config[i].distance
    local influence = config[i].influence
	data.raw["tile"][config[i].tile].autoplace = 
	  make_water_autoplace_settings(distance, influence)
  end
end

function update_all_water_collision( args )
  local config =
  {
    {
	  tile = "water-mud",
	  vegetation = args.blue_shallow_vegetation,
	},
    {
	  tile = "water-shallow",
	  vegetation = args.green_shallow_vegetation,
	},
  }
  
  for i = 1, #config do
    update_water_collision(config[i])
  end
end

function update_water_collision( args )
  local vegetation_enabled = args.vegetation
  local mask = data.raw.tile[args.tile].collision_mask
  for i = #mask, 1, -1 do
    -- make sure it is not colliding by default
    if mask[i] == "doodad-layer" then
      table.remove(mask, i)
    end	
  end
  -- add collision if needed
  if not vegetation_enabled then
    table.insert(mask, "doodad-layer")
  end
end

function update_green_shallow_tiles()
  local tile_name = "water-shallow"
  data.raw.tile[tile_name].variants.transition.overlay_layout.inner_corner.spritesheet =
    "__the_shallows_updated__/graphics/terrain/water-shallow/inner-corner.png"
  data.raw.tile[tile_name].variants.transition.overlay_layout.outer_corner.spritesheet =
    "__the_shallows_updated__/graphics/terrain/water-shallow/outer-corner.png"
  data.raw.tile[tile_name].variants.transition.overlay_layout.side.spritesheet =
    "__the_shallows_updated__/graphics/terrain/water-shallow/side.png"
  data.raw.tile[tile_name].effect_color_secondary = { r=55, g=104, b=0 }
end

function update_blue_shallow_tiles()
  local tile_name = "water-mud"
  data.raw.tile[tile_name].variants.transition.overlay_layout.inner_corner.spritesheet =
    "__the_shallows_updated__/graphics/terrain/water-mud/inner-corner.png"
  data.raw.tile[tile_name].variants.transition.overlay_layout.outer_corner.spritesheet =
    "__the_shallows_updated__/graphics/terrain/water-mud/outer-corner.png"
  data.raw.tile[tile_name].variants.transition.overlay_layout.side.spritesheet =
    "__the_shallows_updated__/graphics/terrain/water-mud/side.png"
  data.raw.tile[tile_name].effect_color_secondary = { r=52, g=92, b=5 }
end

function get_settings_custom()
  log ("using custom settings")
  return
  {
    green_shallow_vegetation = settings.startup["ts-water-shallow-vegetation"].value,
    green_shallow_distance = settings.startup["ts-water-shallow-distance"].value,
    blue_shallow_vegetation = settings.startup["ts-water-mud-vegetation"].value,
    blue_shallow_distance = settings.startup["ts-water-mud-distance"].value,
    light_water_distance = settings.startup["ts-water-normal-distance"].value,
    dark_water_distance = settings.startup["ts-water-deep-distance"].value,
  }
end

function get_settings_vanilla()
  return
  {
    green_shallow_vegetation = false,
    green_shallow_distance = 20,
    blue_shallow_vegetation = false,
    blue_shallow_distance = 20,
    light_water_distance = 0,
    dark_water_distance = 10,
  }
end

function get_settings_swamp()
  return
  {
    green_shallow_vegetation = true,
    green_shallow_distance = 0,
    blue_shallow_vegetation = true,
    blue_shallow_distance = 3,
    light_water_distance = 6,
    dark_water_distance = 15,
  }
end

function get_settings_green()
  return
  {
    green_shallow_vegetation = true,
    green_shallow_distance = 0,
    blue_shallow_vegetation = false,
    blue_shallow_distance = 20,
    light_water_distance = 4,
    dark_water_distance = 20,
  }
end

function get_settings_blue()
  return
  {
    green_shallow_vegetation = false,
    green_shallow_distance = 20,
    blue_shallow_vegetation = true,
    blue_shallow_distance = 0,
    light_water_distance = 20,
    dark_water_distance = 5,
  }
end

function get_settings()
  
  local preset = settings.startup["ts-preset"].value
  
  if preset == "vanilla" then
    return get_settings_vanilla()
  elseif preset == "swamp" then
    return get_settings_swamp()
  elseif preset == "blue" then
    return get_settings_blue()
  elseif preset == "green" then
    return get_settings_green()
  elseif preset == "custom" then
    return get_settings_custom()
  else
    return get_settings_custom()
  end
  
end


