require("prototypes.water-autoplace")

local config = get_settings()

update_all_water_autoplace(config)
update_all_water_collision(config)
update_green_shallow_tiles()
update_blue_shallow_tiles()

-- Add to list of tiles that can spawn on Nauvis.
local nauvis_tiles = data.raw.planet.nauvis.map_gen_settings.autoplace_settings.tile.settings
nauvis_tiles["water-shallow"] = {}
nauvis_tiles["water-mud"] = {}