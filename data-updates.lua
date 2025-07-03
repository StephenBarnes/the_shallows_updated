require("prototypes.water-autoplace")

local config = get_settings()

update_all_water_autoplace(config)
update_all_water_collision(config)
update_green_shallow_tiles()
update_blue_shallow_tiles()