# The Shallows

## Features
Enable rendering of 2 types of shallow water tiles next to the shore lines.

* ***Green Shallows***
A shallow water tile having a greenish hue, hinting that is is really really shallow. It is traversable by player and enemy forces alike.

* ***Blue Shallows***
A shallow water tile having a blueish hue, hinting that is is somewhat shallow. It is traversable by player and enemy forces alike.

The shallow water tiles are following the vanilla map generation rules and thus are fitting perfectly to the shoreline. The amount of water on the map is not changing, but a peripheral region around water bodies will be traversable shallow water tiles.
The tiles naturally override each other in the following order:

1. Green Shallows
2. Blue Shallows
3. Light Water
4. Dark Water

Additionally the tiles' graphics were adjusted to minimize any created artifacts around bordering shallow water tiles.

### Configuration
Most aspects of this mod are configurable, but to help simple usage some presets are also available. The configuration values are the following:

* ***Preset***: A list of predefined configuration bundles. Available options:
	* **Custom** - This preset will use the other individually defined setting values for a truly custom look and feel.
	* **Vanilla** - This preset hides shallow water and water vegetation. it looks and feels like vanilla.
	* **Swamp** -This preset contains lush vegetation and heavy shallows all around. 
	* **Blue** - This preset is using only the bluish shallow tiles and the dark water tiles exclusively, for an overall blue look and feel.
	* **Green** - This preset is using the greenish shallow tiles and mostly the light water tiles, for an overall greenish look and feel.
* ***Vegetetation***: Enable rendering decoratives like vegetation and pebbles in the related shallow water tile: Green or Blue. These settings are considered only if the preset is 'Custom'.
* ***Distance***: A factor in determining the distance from shore where the related water tile will start appearing. 0 means it will appear right on the shore, while 20 means, it will appear far away from shore. If you want to disable a tile use the maximum value as distance. These settings are considered only if the preset is 'Custom'.

## Mod Suggestions
* [CanalBuilder Simplified](https://mods.factorio.com/mod/CanalBuilderMAV)) by [MaveTheMaverick](https://mods.factorio.com/user/MaveTheMaverick)
This mod enables you to place shallow water tiles in an immersive non owerpowered way.

## Compatibility
This mod is changing the vanilla shallow water tiles' pictures and collision masks. any mod which is doing the same might cause issues. This mod however is using the **data-updates.lua** file to have a good chance to **override** any conflicting modification. This mod is compatible with [Alien Biomes](https://mods.factorio.com/mod/alien-biomes). [Alien Biomes](https://mods.factorio.com/mod/alien-biomes) already have shallow water implemented, however if you feel like you want to configure its appearance or you want to get rid of the water artifacts, you can use this mod together with that. At this moment the following mods are incompatible:

* [Shallow water](https://mods.factorio.com/mod/shallow_water/downloads) by  [StrikerAT](https://mods.factorio.com/user/StrikerAT) 
This mod is the basis of 'The Shallows'. 'The Shallows' is implementing the same feature set and builds upon it. No need to use both.

## Background
I like small little but meaningful tweaks into my gameplay. Since I first found [Shallow water](https://mods.factorio.com/mod/shallow_water/downloads) from  [StrikerAT](https://mods.factorio.com/user/StrikerAT) I have been using it. I just LOVE that mod. Its is simple and great. However I have notice that it has not been updated for a while now - actually never reached 1.0.0 version. It also seems like he is not interested in answering questions about his mod. In its posts section I have found a request for customization possibility. Before I read that I never wanted to change it, but after... well I just could not get it out of my head. Wouldn't it be great to adjust where can shallow water appear?
As time passed I started to notice that my shallow water is somewhat bleak looking. I started investigating and have found that it wasn't always like that. My decorative vegetation items were stripped from the shallow waters by another mod. A mod I have grown to like: [CanalBuilder Simplified](https://mods.factorio.com/mod/CanalBuilderMAV)) by [MaveTheMaverick](https://mods.factorio.com/user/MaveTheMaverick).
I definitely did not want to choose between the two and hence my will to act has grown. I had a look into the sources here and there and dissected the affected mods. When I was closely inspecting them I have started to see something that I could not unsee anymore.
I have observed that there were some slightly visible almost transparent artifacts right on the border where the shallow water touched light blue water. I have double checked the original [Shallow water](https://mods.factorio.com/mod/shallow_water/downloads) mod and it was right there. It has always been there, but now I have seen it. I have seen it, and I could never unsee it and it bugged me.

I was set on my path. I had to enhance my favourite shallow water.

### Credit
- Thanks to [StrikerAT](https://mods.factorio.com/user/StrikerAT) for [Shallow water](https://mods.factorio.com/mod/shallow_water/downloads)
-  Thanks to [MaveTheMaverick](https://mods.factorio.com/user/MaveTheMaverick) for [CanalBuilder Simplified](https://mods.factorio.com/mod/CanalBuilderMAV)
