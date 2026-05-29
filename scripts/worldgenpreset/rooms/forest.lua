--有些东西消失了，这里是修复方法
AddRoom("my_new_room", {
    colour = { r = 0.3, g = 0.2, b = 0.1, a = 0.3 },
    value = WORLD_TILES.METEORCOAST_NOISE,
    --tags = {"ForceDisconnected", "RoadPoison"},
    -- internal_type = NODE_INTERNAL_CONNECTION_TYPE.EdgeCentroid,
    contents = {
        countprefabs =
        {
            --手动添加三个天体雕像
            moon_altar_rock_glass = 1,
            moon_altar_rock_seed = 1,
            moon_altar_rock_idol = 1,
        },
        distributepercent = 0.12,
        distributeprefabs ={    
            moonglass_rock = 1,
            lunar_island_rock1 = 0.4,
            lunar_island_rock2 = 0.2,
            rock_moon = 0.2,
            moonglass = 0.2,
            moonrocknugget = 0.1,
            lunar_island_rocks = 0.1,
            flint = 0.1,
            moon_fissure = 0.5,            
        },
    },
})

AddRoom("MoonIsland_IslandShard_Items",  {
    colour={r=0.3,g=0.2,b=0.1,a=0.3},
    value = WORLD_TILES.METEORCOAST_NOISE,
    tags = {"RoadPoison"}, --"ForceDisconnected"
	-- type = NODE_TYPE.SeparatedRoom,
	contents = {
		countprefabs =
		{
		},
		distributepercent = 0.17,
		distributeprefabs =
		{
			trap_starfish = 1.0,
			bullkelp_beachedroot = 2,
			moon_fissure = 0.5,
			driftwood_log = 0.5,
			driftwood_small1 = 0.5,
			driftwood_small2 = 0.5,
			dead_sea_bones = 0.75,
			lunar_island_rocks = 1.0,
			flint = 0.5,
			reeds = 0.75,
			twigs = 0.5,
			moonglass_rock = 0.3,
			moonglass = 0.1,
		},
	},
})

AddRoom("Beefalowtiny", {
    colour={r=.45,g=.5,b=.85,a=.50},
    value = WORLD_TILES.SAVANNA,
    contents =  {
                    distributepercent = .05,
                    distributeprefabs= {
                        grass = .1,
                        beefalo = 0.02,
                    }
                }
    })
