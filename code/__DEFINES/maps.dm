/*
The /tg/ codebase allows mixing of hardcoded and dynamically-loaded z-levels.
Z-levels can be reordered as desired and their properties are set by "traits".
See map_config.dm for how a particular station's traits may be chosen.
The list DEFAULT_MAP_TRAITS at the bottom of this file should correspond to
the maps that are hardcoded, as set in _maps/_basemap.dm. SSmapping is
responsible for loading every non-hardcoded z-level.

As of 2018-02-04, the typical z-levels for a single-level station are:
1: CentCom
2: Station
3-4: Randomized space
5: Mining
6: City of Cogs
7-11: Randomized space
12: Empty space
13: Transit space

Multi-Z stations are supported and multi-Z mining and away missions would
require only minor tweaks.
*/

// helpers for modifying jobs, used in various job_changes.dm files

#define MAP_CURRENT_VERSION 1

#define SPACERUIN_MAP_EDGE_PAD 15

// traits
// boolean - marks a level as having that property if present
#define ZTRAIT_CENTCOM "CentCom"
#define ZTRAIT_STATION "Station"
#define ZTRAIT_MINING "Mining"
#define ZTRAIT_RESERVED "Reserved"
#define ZTRAIT_AWAY "Away Mission"
#define ZTRAIT_SPACE_RUINS "Space Ruins"
#define ZTRAIT_LAVA_RUINS "Lava Ruins"
#define ZTRAIT_ICE_RUINS "Ice Ruins"
#define ZTRAIT_ICE_RUINS_UNDERGROUND "Ice Ruins Underground"
#define ZTRAIT_SAND_RUINS "Sand Ruins"
#define ZTRAIT_JUNGLE_RUINS "Jungle Ruins"
#define ZTRAIT_ROCK_RUINS "Rock Ruins"
#define ZTRAIT_WASTE_RUINS "Waste Ruins"

// boolean - weather types that occur on the level
#define ZTRAIT_SANDSTORM "Weather_Sandstorm"
#define ZTRAIT_SNOWSTORM "Weather_Snowstorm"
#define ZTRAIT_ASHSTORM "Weather_Ashstorm"
#define ZTRAIT_ACIDRAIN "Weather_Acidrain"
#define ZTRAIT_TEMPERATURE_GRADIENT "Weather_Gradient" //WS edit - Whitesands

// enum - how SSsun should calculate sun exposure on this level
#define ZTRAIT_SUN_TYPE "Sun Cycle Type"
	// if left null, the value below will be assumed
	// default & original SSsun behaviour - orbit the 'station' horizontially
	#define AZIMUTH null
	// static - exposed everywhere by default
	#define STATIC_EXPOSED "Static Exposed"
	// static - obstructed everywhere
	#define STATIC_OBSCURED "Static Obscured"

// number - bombcap is multiplied by this before being applied to bombs
#define ZTRAIT_BOMBCAP_MULTIPLIER "Bombcap Multiplier"

// number - default gravity if there's no gravity generators or area overrides present
#define ZTRAIT_GRAVITY "Gravity"

// numeric offsets - e.g. {"Down": -1} means that chasms will fall to z - 1 rather than oblivion
#define ZTRAIT_UP "Up"
#define ZTRAIT_DOWN "Down"

// enum - how space transitions should affect this level
#define ZTRAIT_LINKAGE "Linkage"
	// UNAFFECTED if absent - no space transitions
	#define UNAFFECTED null
	// SELFLOOPING - space transitions always self-loop
	#define SELFLOOPING "Self"
	// CROSSLINKED - mixed in with the cross-linked space pool
	#define CROSSLINKED "Cross"

// string - type path of the z-level's baseturf (defaults to space)
#define ZTRAIT_BASETURF "Baseturf"

// default trait definitions, used by SSmapping
#define ZTRAITS_CENTCOM list(ZTRAIT_CENTCOM = TRUE)
#define ZTRAITS_STATION list(ZTRAIT_LINKAGE = SELFLOOPING, ZTRAIT_STATION = TRUE)
#define ZTRAITS_SPACE list(ZTRAIT_LINKAGE = SELFLOOPING, ZTRAIT_SPACE_RUINS = TRUE)
#define ZTRAITS_LAVALAND list( \
	ZTRAIT_MINING = TRUE, \
	ZTRAIT_ASHSTORM = TRUE, \
	ZTRAIT_LAVA_RUINS = TRUE, \
	ZTRAIT_BOMBCAP_MULTIPLIER = 2, \
	ZTRAIT_BASETURF = /turf/open/lava/smooth/lava_land_surface)
#define ZTRAITS_WHITESANDS list( \
	ZTRAIT_MINING = TRUE, \
	ZTRAIT_TEMPERATURE_GRADIENT = TRUE, \
	ZTRAIT_SAND_RUINS = TRUE, \
	ZTRAIT_BOMBCAP_MULTIPLIER = 2, \
	ZTRAIT_BASETURF = /turf/open/floor/plating/asteroid/whitesands)
#define ZTRAITS_ICEMOON list( \
	ZTRAIT_MINING = TRUE, \
	ZTRAIT_SNOWSTORM = TRUE, \
	ZTRAIT_ICE_RUINS = TRUE, \
	ZTRAIT_BOMBCAP_MULTIPLIER = 2, \
	ZTRAIT_DOWN = -1, \
	ZTRAIT_BASETURF = /turf/open/floor/plating/asteroid/snow/ice)
#define ZTRAITS_ICEMOON_UNDERGROUND list( \
	ZTRAIT_MINING = TRUE, \
	ZTRAIT_ICE_RUINS_UNDERGROUND = TRUE, \
	ZTRAIT_BOMBCAP_MULTIPLIER = 2, \
	ZTRAIT_UP = 1, \
	ZTRAIT_BASETURF = /turf/open/lava/plasma/ice_moon)

#define DL_NAME "name"
#define DL_TRAITS "traits"
#define DECLARE_LEVEL(NAME, TRAITS) list(DL_NAME = NAME, DL_TRAITS = TRAITS)

// must correspond to _basemap.dm for things to work correctly
#define DEFAULT_MAP_TRAITS list( \
	DECLARE_LEVEL("CentCom", ZTRAITS_CENTCOM), \
)

//Reserved turf type
#define RESERVED_TURF_TYPE /turf/open/space/basic //What the turf is when not being used

//Ruin Generation

#define PLACEMENT_TRIES 100 //How many times we try to fit the ruin somewhere until giving up (really should just swap to some packing algo)

#define PLACE_DEFAULT "random"
#define PLACE_SAME_Z "same" //On same z level as original ruin
#define PLACE_SPACE_RUIN "space" //On space ruin z level(s)
#define PLACE_LAVA_RUIN "lavaland" //On lavaland ruin z levels(s)
#define PLACE_BELOW "below" //On z levl below - centered on same tile
#define PLACE_RESERVED "reserved" //On reserved ruin z level


///Map generation defines

// These are used by SSmap_gen to run the phases of map generation in order.
// As they are numeric, they can also be used to estimate the progress a map
// has made towards generating, even in a queue.
#define MAPGEN_PHASE_GENERATE 0
#define MAPGEN_PHASE_AFTERCHANGE 1
#define MAPGEN_PHASE_RUIN_PLACE 2
#define MAPGEN_PHASE_RUIN_PLACING 3
#define MAPGEN_PHASE_POPULATE 4
#define MAPGEN_PHASE_FINISHED 5

// Map generation priorities. Lower numbers are higher priority
// as they are inserted at earlier positions in the queue.
#define MAPGEN_PRIORITY_HIGH 1
#define MAPGEN_PRIORITY_MED 2
#define MAPGEN_PRIORITY_LOW 3

#define BIOME_LOWEST_HUMIDITY "biome_lowest_humidity"
#define BIOME_LOW_HUMIDITY "biome_low_humidity"
#define BIOME_MEDIUM_HUMIDITY "biome_medium_humidity"
#define BIOME_HIGH_HUMIDITY "biome_high_humidity"
#define BIOME_HIGHEST_HUMIDITY "biome_highest_humidity"

#define BIOME_COLDEST "coldest"
#define BIOME_COLD "cold"
#define BIOME_WARM "warm"
#define BIOME_TEMPERATE "perfect"
#define BIOME_HOT "hot"
#define BIOME_HOTTEST "hottest"

#define BIOME_COLDEST_CAVE "coldest_cave"
#define BIOME_COLD_CAVE "cold_cave"
#define BIOME_WARM_CAVE "warm_cave"
#define BIOME_HOT_CAVE "hot_cave"


#define ALLOCATION_FREE 1
#define ALLOCATION_QUADRANT 2

#define QUADRANT_MAP_SIZE 127

#define QUADRANT_SIZE_BORDER 3
#define TRANSIT_SIZE_BORDER 3

#define DEFAULT_ALLOC_JUMP 5

#define MAP_EDGE_PAD 5
