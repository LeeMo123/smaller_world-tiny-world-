modimport("scripts/worldgenpreset/tasks/forest")

local task_type1 = { "Make a pick", "Dig that rock", "Greater Plains", "Squeltch", "Beeeees!", "Speak to the king",
    "For a nice walk", "Badlands", "Lightning Bluff", "Forest hunters", "Tiny_MoonIsland_Mine", }
local task_type2 = { "Make a pick", "Dig that rock", "Greater Plains", "Squeltch", "Beeeees!", "Speak to the king",
    "For a nice walk", "Badlands", "Lightning Bluff", "Forest hunters", }
local task_type3 = {"Make a pick", "Dig that rock", "Greater Plains", "Squeltch", "Beeeees!", "Speak to the king",
                    "For a nice walk", "Badlands", "Lightning Bluff", "Forest hunters", "MoonIsland_IslandShards",
                    "MoonIsland_Beach", "MoonIsland_Forest", "MoonIsland_Baths", "MoonIsland_Mine"}                                                                                                        --自定义自己的任务集1  月岛与大陆相连

--自定义自己的任务集1 月岛与大陆相连
AddTaskSet("tiny_forest_set", {
    name = STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELS.MINIWORLD,
    location = "forest",
    tasks = task_type1,
    numoptionaltasks = 0,
    optionaltasks = {},
    valid_start_tasks = {
        "Make a pick",
    },
    required_prefabs = {
        "gravestone", "sculpture_rook", "sculpture_bishop", "sculpture_knight", "charlie_stage_post", "terrariumchest", 
        "statueharp_hedgespawner",
    },
    set_pieces = {
        ["ResurrectionStone"] = { count = 2, tasks = task_type1 }, --复活石
        ["WormholeGrass"] = { count = 4, tasks = task_type1 },     --虫洞
        ["MooseNest"] = { count = 4, tasks = task_type1 },         --鹿鸭巢穴
        ["CaveEntrance"] = { count = 3, tasks = task_type1 },      --洞穴入口

        ["MoonAltarRockGlass"] = { count = 1, tasks = { "Tiny_MoonIsland_Mine" } },
        ["MoonAltarRockIdol"] = { count = 1, tasks = { "Tiny_MoonIsland_Mine" } },
        ["MoonAltarRockSeed"] = { count = 1, tasks = { "Tiny_MoonIsland_Mine" } },
        ["BathbombedHotspring"] = { count = 1, tasks = { "Tiny_MoonIsland_Mine" } },
        ["MoonFissures"] = { count = 1, tasks = { "Tiny_MoonIsland_Mine" } },
    },
    ocean_prefill_setpieces = {
        -- HermitcrabIsland = 1,           --寄居蟹岛
        -- CrabKing = 1,                   --蟹王
        ["MonkeyIslandSmall"] = { count = 1 },  --猴岛

        ["BrinePool1"] = { count = 4 },   -- todo: make this scale based on world gen size
        ["BrinePool2"] = { count = 2 },   -- todo: make this scale based on world gen size
        ["BrinePool3"] = { count = 2 },   -- todo: make this scale based on world gen size
        ["Waterlogged1"] = { count = 3 }, -- todo: make this scale based on world gen size--盐，海草，水中木等东西
    },
    ocean_population = { "OceanCoastalShore", "OceanCoastal", "OceanSwell", "OceanRough", "OceanHazardous" }
})

--自定义自己的任务集2  月岛与大陆分离
AddTaskSet("tiny_forest_set_sep", {
    name = STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELS.MINISEPWORLD,
    location = "forest",
    tasks = task_type3,
    numoptionaltasks = 0,
    optionaltasks = {},
    valid_start_tasks = {
        "Make a pick",
    },
    required_prefabs = {
        "gravestone", "sculpture_rook", "sculpture_bishop", "sculpture_knight", "charlie_stage_post", "terrariumchest", 
        "statueharp_hedgespawner",
    },
    set_pieces = {
        ["ResurrectionStone"] = { count = 2, tasks = task_type2 }, --复活石
        ["WormholeGrass"] = { count = 4, tasks = task_type2 },     --虫洞
        ["MooseNest"] = { count = 3, tasks = task_type2 },         --鹿鸭巢穴
        ["CaveEntrance"] = { count = 3, tasks = task_type2 },      --洞穴入口

        ["MoonAltarRockGlass"] = { count = 1, tasks={"MoonIsland_Mine"} },
        ["MoonAltarRockIdol"] = { count = 1, tasks={"MoonIsland_Mine"} },
        ["MoonAltarRockSeed"] = { count = 1, tasks={"MoonIsland_Mine"} },
        ["BathbombedHotspring"] = {count = 1, tasks={"MoonIsland_Baths"}},
        ["MoonFissures"] = {count = 1, tasks={"MoonIsland_Fissures","MoonIsland_Mine","MoonIsland_Forest"}},
    },
    ocean_prefill_setpieces = {
        -- HermitcrabIsland = 1,           --寄居蟹岛
        -- CrabKing = 1,                   --蟹王
        ["MonkeyIslandSmall"] = { count = 1 },  --猴岛

        ["BrinePool1"] = { count = 4 },   -- todo: make this scale based on world gen size
        ["BrinePool2"] = { count = 2 },   -- todo: make this scale based on world gen size
        ["BrinePool3"] = { count = 2 },   -- todo: make this scale based on world gen size
        ["Waterlogged1"] = { count = 3 }, -- todo: make this scale based on world gen size--盐，海草，水中木等东西
    },
    ocean_population = { "OceanCoastalShore", "OceanCoastal", "OceanSwell", "OceanRough", "OceanHazardous" }
})

AddRoomPreInit("Badlands", function(room) room.contents.distributeprefabs.tumbleweedspawner = 0.5 end)
AddRoomPreInit("LightningBluffLightning", function(room) room.contents.distributeprefabs.tumbleweedspawner = 0.5 end)
AddRoomPreInit("OceanRough", function(room) room.contents.distributeprefabs.waterplant_spawner_rough = 0.1 end)
