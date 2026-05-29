---重写官方的task,这样能直接兼容模组的地形生成
local function ReplaceTask(name, data)
    local tasks = require "map/tasks"
    local task = tasks.GetTaskByName(name)
    for k, v in pairs(data) do
        -- print("=====ReplaceTask", k, v, task[k])
        task[k] = v
        if k == "locks" and type(task[k]) ~= "table" then
            task[k] = { task[k] }
        end
    end
end

modimport("scripts/worldgenpreset/rooms/forest")

--根据原脚本的任务定义自己的任务
--出生门
ReplaceTask("Make a pick", {
    locks = LOCKS.NONE,
    keys_given = { KEYS.PICKAXE, KEYS.AXE, KEYS.GRASS, KEYS.WOOD, KEYS.TIER1 },
    room_choices = {
        ["Forest"] = 1,
        ["Plain"] = 0,
        ["BarePlain"] = 0,
        -- ["Plain"] = function() return 1 + math.random(SIZE_VARIATION) end,
        ["Clearing"] = 0,
    },
    room_bg = WORLD_TILES.GRASS,
    background_room = "BGGrass",
    colour = { r = 0, g = 1, b = 0, a = 1 }
})
--陨石区
ReplaceTask("Dig that rock", {
    locks = { LOCKS.ROCKS },
    keys_given = { KEYS.PICKAXE, KEYS.AXE, KEYS.GRASS, KEYS.WOOD, KEYS.TIER1 },
    room_choices = {
        ["Graveyard"] = 1,
        ["Rocky"] = function() return math.random(1, 3) end,
        ["CritterDen"] = 1,
    },
    room_bg = WORLD_TILES.GRASS,
    background_room = "BGGrass",
    colour = { r = 0, g = 1, b = 0, a = 1 }
})
--热带草原
ReplaceTask("Greater Plains", {
    locks = { LOCKS.ROCKS, LOCKS.BASIC_COMBAT, LOCKS.TIER1 },
    keys_given = { KEYS.MEAT, KEYS.POOP, KEYS.WOOL, KEYS.GRASS, KEYS.TIER2 },
    room_choices = {
        ["BeefalowPlain"] = 2,
        ["WalrusHut_Plains"] = 0,
        ["Beefalowtiny"] = 1,
        ["Plain"] = 0,
    },
    room_bg = WORLD_TILES.SAVANNA,
    background_room = "BGSavanna",
    colour = { r = 0, g = 1, b = 1, a = 1 }
})
--沼泽区域
ReplaceTask("Squeltch", {
    locks = { LOCKS.SPIDERDENS, LOCKS.TIER2 },
    keys_given = { KEYS.MEAT, KEYS.SILK, KEYS.SPIDERS, KEYS.TIER3 },
    room_choices = {
        ["MermTown"] = 2,
        ["SlightlyMermySwamp"] = 0,
    },
    room_bg = WORLD_TILES.MARSH,
    background_room = "BGMarsh",
    colour = { r = .05, g = .05, b = .05, a = 1 }
})
--蜂后区
ReplaceTask("Beeeees!", {
    locks = { LOCKS.BEEHIVE, LOCKS.TIER1 },
    keys_given = { KEYS.HONEY, KEYS.TIER2 },
    room_choices = {
        ["BeeQueenBee"] = 1,
        ["BeeClearing"] = 0,
        --["Wormhole"] = 1,
        ["Forest"] = 0,
        -- ["BeeQueenBee"] = 1,
        ["FlowerPatch"] = 0,
    },
    room_bg = WORLD_TILES.GRASS,
    background_room = "BGGrass",
    colour = { r = 0, g = 1, b = 0.3, a = 1 }
})
--猪王桦树林
ReplaceTask("Speak to the king", {
    locks = { LOCKS.PIGKING, LOCKS.TIER2 },
    keys_given = { KEYS.PIGS, KEYS.GOLD, KEYS.TIER3 },
    room_choices = {
        ["PigKingdom"] = 1,
        ["MagicalDeciduous"] = 1, --有格鲁姆
        ["DeepDeciduous"] = 1,
    },
    room_bg = WORLD_TILES.GRASS,
    background_room = "BGDeciduous",
    colour = { r = 1, g = 1, b = 0, a = 1 }
})
--月台森林
ReplaceTask("Forest hunters", {
    locks = { LOCKS.ADVANCED_COMBAT, LOCKS.MONSTERS_DEFEATED, LOCKS.TIER3 },
    keys_given = { KEYS.WALRUS, KEYS.TIER4 },
    room_choices = {
        ["WalrusHut_Grassy"] = 1,
        ["MoonbaseOne"] = 1,
        -- ["WalrusHut_Grassy"] = 1,
        --["Wormhole"] = 1,
        ["Forest"] = 0,
        ["ForestMole"] = 0,
        ["DeepForest"] = 0,
        ["Clearing"] = 0,
        -- ["MoonbaseOne"] = 1,

    },
    room_bg = WORLD_TILES.FOREST,
    background_room = "BGForest",
    colour = { r = .15, g = .5, b = .05, a = 1 }
})

--曼德拉草平原
ReplaceTask("For a nice walk", {
    locks = { LOCKS.BASIC_COMBAT, LOCKS.TIER2 },
    keys_given = { KEYS.POOP, KEYS.WOOL, KEYS.WOOD, KEYS.GRASS, KEYS.TIER2 },
    room_choices = {
        ["MandrakeHome"] = 1,
        ["DeepForest"] = 1,
    },
    room_bg = WORLD_TILES.GRASS,
    background_room = "BGForest",
    colour = { r = 1, g = 0, b = 1, a = 1 }
})

--龙蝇区
ReplaceTask("Badlands", {
    locks = { LOCKS.ADVANCED_COMBAT, LOCKS.MONSTERS_DEFEATED, LOCKS.TIER4 },
    keys_given = { KEYS.HOUNDS, KEYS.TIER5, KEYS.ROCKS },
    room_choices = {
        ["DragonflyArena"] = 1,
    },
    room_bg = WORLD_TILES.DIRT,
    background_room = "BGBadlands",
    colour = { r = 1, g = 0.6, b = 1, a = 1 },
})
--蚁狮沙漠
ReplaceTask("Lightning Bluff", {
    locks = { LOCKS.SPIDERS_DEFEATED },
    keys_given = { KEYS.PICKAXE, KEYS.TIER2 },
    room_choices = {
        ["LightningBluffAntlion"] = 1,
        ["LightningBluffLightning"] = 1,
        ["LightningBluffOasis"] = 1,
        -- ["LightningBluffOasis"] = 0,
        -- ["BGLightningBluff"] = 0,
    },
    room_bg = WORLD_TILES.DIRT,
    background_room = "BGLightningBluff",
    colour = { r = .05, g = .5, b = .05, a = 1 },
})
--自定义的月岛地区
--月岛地形与大陆地形相连
AddTask("Tiny_MoonIsland_Mine", {
	locks={LOCKS.ISLAND_TIER4},
	keys_given={},
    room_tags = { "lunacyarea" },
    room_choices =
    {
        ["MoonIsland_Mine"] = 1,
        ["MoonIsland_Baths"] = 1,
        -- ["MoonIsland_Meadows"] = 1,
        ["MoonIsland_Forest"] = 1,
        -- ["my_new_room"] = 1,
    },
    room_bg = WORLD_TILES.METEOR,
    background_room = "MoonIsland_Meadows",
    required_prefabs = {"moon_fissure", "moon_fissure", "moon_altar_rock_glass", "moon_altar_rock_seed", "moon_altar_rock_idol", "junk_pile_big"},
    colour = { r = 0.6, g = 0.6, b = 0.0, a = 1 },
})
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--月岛地形与大陆地形分离
ReplaceTask("MoonIsland_IslandShards", {
	locks={},
	keys_given={KEYS.ISLAND_TIER2},
	region_id = "island1",
	level_set_piece_blocker = true,
	room_tags = {"RoadPoison", "nohunt", "nohasslers", "lunacyarea", "not_mainland"},
    room_choices =
    {
        ["MoonIsland_IslandShard"] = 3,
        -- ["Empty_Cove"] = 2,
    },
    room_bg = WORLD_TILES.PEBBLEBEACH,
    background_room = "Empty_Cove",
	cove_room_name = "Blank",
    make_loop = true,
	crosslink_factor = 2,
	cove_room_chance = 1,
	cove_room_max_edges = 2,
    colour={r=0.6,g=0.6,b=0.0,a=1},
})

ReplaceTask("MoonIsland_Beach", {
	locks={LOCKS.ISLAND_TIER2},
	keys_given={KEYS.ISLAND_TIER3},
	region_id = "island1",
	level_set_piece_blocker = true,
	room_tags = {"RoadPoison", "moonhunt", "nohasslers", "lunacyarea", "not_mainland"},
    entrance_room = "MoonIsland_Blank",
    room_choices =
    {
        ["MoonIsland_Beach"] = 1,
    },
    room_bg = WORLD_TILES.PEBBLEBEACH,
    background_room = "Empty_Cove",
	cove_room_name = "Empty_Cove",
	cove_room_chance = 1,
    make_loop = true,
	cove_room_max_edges = 2,
    colour={r=0.6,g=0.6,b=0.0,a=1},
})

ReplaceTask("MoonIsland_Forest", {
	locks={LOCKS.ISLAND_TIER4},
	keys_given={},
	region_id = "island1",
	level_set_piece_blocker = true,
	room_tags = {"RoadPoison", "moonhunt", "nohasslers", "lunacyarea", "not_mainland"},
    room_choices =
    {
        ["MoonIsland_Forest"] = 1,
    },
    room_bg = WORLD_TILES.METEOR,
    background_room = "Empty_Cove",
	cove_room_name = "Empty_Cove",
	crosslink_factor = 1,
	cove_room_chance = 1,
	cove_room_max_edges = 2,
    colour={r=0.6,g=0.6,b=0.0,a=1},
})

ReplaceTask("MoonIsland_Mine", {
	locks={LOCKS.ISLAND_TIER4},
	keys_given={},
	region_id = "island1",
	level_set_piece_blocker = true,
	room_tags = {"RoadPoison", "moonhunt", "nohasslers", "lunacyarea", "not_mainland"},
	room_choices={
		["MoonIsland_Mine"] = 2,
	},
	room_bg=WORLD_TILES.METEOR,
	background_room = "Empty_Cove",
	cove_room_name = "Empty_Cove",
	cove_room_chance = 1,
	cove_room_max_edges = 2,
	colour={r=.05,g=.5,b=.05,a=1},
})

ReplaceTask("MoonIsland_Baths", {
	locks={LOCKS.ISLAND_TIER3},
	keys_given={KEYS.ISLAND_TIER4},
	region_id = "island1",
	level_set_piece_blocker = true,
	room_tags = {"RoadPoison", "moonhunt", "nohasslers", "lunacyarea", "not_mainland"},
    entrance_room = "MoonIsland_Blank",  -- ← 添加这一行
    room_choices =
    {
        ["MoonIsland_Baths"] = 1,
		-- ["MoonIsland_Meadows"] = 1,
    },
    room_bg = WORLD_TILES.METEOR,
    background_room = "MoonIsland_Meadows",
	cove_room_name = "Empty_Cove",
	cove_room_chance = 1,
	cove_room_max_edges = 2,
	required_prefabs = {"moon_fissure", "moon_fissure", "moon_altar_rock_glass", "moon_altar_rock_seed", "moon_altar_rock_idol", "junk_pile_big"},
    colour={r=0.6,g=0.6,b=0.0,a=1},
})
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------