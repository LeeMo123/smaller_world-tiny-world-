---重写官方的task,这样能直接兼容模组的地形生成
local function ReplaceTask(name, data)
    local tasks = require "map/tasks"
    local task = tasks.GetTaskByName(name)
    for k, v in pairs(data) do
        -- print("=====replaceTask", k, v, task[k])
        task[k] = v
        if k == "locks" and type(task[k]) ~= "table" then
            task[k] = { task[k] }
        end
    end
end
-- Central Cave Node + Antechamber nodes to decompress the middle
--中央洞穴节点+前厅节点解压中间
------------------------------------------------------------
-- 蕨类植物泥泞区
AddTask("m_MudWorld", {
    locks = { LOCKS.NONE },
    keys_given = { KEYS.CAVE, KEYS.TIER1 },
    room_choices = {
        ["LightPlantField"] = 1, --发光植物田
        --["WormPlantField"] = 1,--虫植物田
        --["FernGully"] = 1,--蕨类峡谷
        --["SlurtlePlains"] = 1,--蜗牛平原
        ["MudWithRabbit"] = 1, --泥土与兔子
        ["PitRoom"] = 1,       --必须保留，是某些task的入口房间
    },
    background_room = "BGMud",
    room_bg = WORLD_TILES.MUD,
    colour = { r = 0.6, g = 0.4, b = 0.0, a = 0.9 },
})
--无光蜗牛区
AddTask("m_MudCave", {
    locks={ LOCKS.CAVE, LOCKS.TIER1 },
    keys_given = { KEYS.CAVE, KEYS.TIER2 },
    room_choices = {
        --["WormPlantField"] = 1,--虫植物田
        ["SlurtlePlains"] = 1, --蜗牛平原
        --["MudWithRabbit"] = 1,--泥土与兔子
        --["PitRoom"] = 1,
    },
    background_room = "BGBatCaveRoom",
    room_bg = WORLD_TILES.MUD,
    colour = { r = 0.7, g = 0.5, b = 0.0, a = 0.9 },
})
--大片荧光果区
AddTask("m_MudLights", {
    locks={ LOCKS.CAVE, LOCKS.TIER1 },
    keys_given = { KEYS.CAVE, KEYS.TIER2 },
    room_choices = {
        ["LightPlantField"] = 2, --发光植物田
        ["WormPlantField"] = 1,  --虫植物田
        --["PitRoom"] = 1,
        ["RabbitTown"] = 1,
    },
    background_room = "WormPlantField",
    room_bg = WORLD_TILES.MUD,
    colour = { r = 0.7, g = 0.5, b = 0.0, a = 0.9 },
})
--大量蜗牛区
AddTask("m_MudPit", {
    locks={ LOCKS.CAVE, LOCKS.TIER1 },
    keys_given = { KEYS.CAVE, KEYS.TIER2 },
    room_choices = {
        ["SlurtlePlains"] = 1,
        --["PitRoom"] = 1,
    },
    background_room = "FernGully",
    room_bg = WORLD_TILES.MUD,
    colour = { r = 0.6, g = 0.4, b = 0.0, a = 0.9 },
})
--蛤蟆刷新区1
AddTask("m_ToadStoolTask1", {
    locks={ LOCKS.CAVE, LOCKS.TIER2 },
    keys_given = {},
    room_choices = {
        ["ToadstoolArenaBGMud"] = 1,
        ["ToadstoolArenaMud"] = 1,
    },
    background_room = "Blank",
    room_bg = WORLD_TILES.MUD,
    colour = { r = 1.0, g = 0.0, b = 0.0, a = 0.9 },
})
--蛤蟆刷新区2
AddTask("m_ToadStoolTask2", {
    locks={ LOCKS.CAVE, LOCKS.TIER3 },
    keys_given = {},
    room_choices = {
        ["ToadstoolArenaBGCave"] = 1,
        ["ToadstoolArenaCave"] = 1,
    },
    background_room = "Blank",
    room_bg = WORLD_TILES.CAVE,
    colour = { r = 1.0, g = 0.0, b = 0.0, a = 0.9 },
})
--蛤蟆刷新区3
AddTask("m_ToadStoolTask3", {
    locks={ LOCKS.CAVE, LOCKS.TIER3 },
    keys_given = {},
    room_choices = {
        ["ToadstoolArenaBGMud"] = 1,
        ["ToadstoolArenaMud"] = 1,
    },
    background_room = "Blank",
    room_bg = WORLD_TILES.MUD,
    colour = { r = 1.0, g = 0.0, b = 0.0, a = 0.9 },
})

------------------------------------------------------------
-- Main Caves Branches
--主要洞穴及分支
------------------------------------------------------------
-- Big Bat Cave
--蝙蝠矿区
AddTask("m_BigBatCave", {
    locks={ LOCKS.CAVE, LOCKS.TIER2 },
    keys_given = { KEYS.CAVE, KEYS.TIER3, KEYS.BATS },
    room_choices = {
        ["BatCave"] = 1,   --蝙蝠洞
        ["BattyCave"] = 1, --疯狂的蝙蝠洞
        --["FernyBatCave"] = 1, --蕨类蝙蝠洞
        --["PitRoom"] = 1,
    },
    background_room = "BGBatCaveRoom",
    room_bg = WORLD_TILES.CAVE,
    colour = { r = 0.8, g = 0.8, b = 0.8, a = 0.9 },
})

-- Rocky Land
--石虾矿区
AddTask("m_RockyLand", {
    locks={ LOCKS.CAVE, LOCKS.TIER2 },
    keys_given = { KEYS.CAVE, KEYS.TIER3, KEYS.ROCKY },
    room_choices = {
        --["SlurtleCanyon"] = 1,        --蜗牛峡谷
        --["BatsAndSlurtles"] = 1,--蝙蝠与蜗牛区
        ["RockyPlains"] = 1,          --岩石平原
        ["RockyHatchingGrounds"] = 2, --岩石孵化场,石虾
        --["BatsAndRocky"] = 1,--蝙蝠与岩石区
        --["PitRoom"] = 1,
    },
    background_room = "BGRockyCaveRoom",
    room_bg = WORLD_TILES.CAVE,
    colour = { r = 0.5, g = 0.5, b = 0.5, a = 0.9 },
})

-- Red Forest
--红蘑菇林区域
AddTask("m_RedForest", {
    locks={ LOCKS.CAVE, LOCKS.TIER2 },
    keys_given = { KEYS.CAVE, KEYS.TIER3, KEYS.RED, KEYS.ENTRANCE_INNER },
    room_choices = {
        ["RedMushForest"] = 1, --红蘑菇森林
        --["RedSpiderForest"] = 1,--红蜘蛛森林
        --["RedMushPillars"] = 1,   --红蘑菇柱子
        --["StalagmiteForest"] = 1, --石笋森林
        --["SpillagmiteMeadow"] = 1,
        -- ["PitRoom"] = 2,
    },
    background_room = "BGRedMush",
    room_bg = WORLD_TILES.FUNGUSRED,
    colour = { r = 1.0, g = 0.5, b = 0.5, a = 0.9 },
})

-- Green Forest
--绿蘑菇林区域
ReplaceTask("GreenForest", {
    locks={ LOCKS.CAVE, LOCKS.TIER2 },
    keys_given = { KEYS.CAVE, KEYS.TIER3, KEYS.GREEN, KEYS.ENTRANCE_INNER },
    room_choices = {
        ["GreenMushForest"] = 1, --绿蘑菇森林
        ["GreenMushPonds"] = 1,  --绿蘑菇池塘
        --["GreenMushSinkhole"] = 1,--绿蘑菇天窗
        --["GreenMushMeadow"] = 1, --绿蘑菇草地
        --["GreenMushRabbits"] = 1,--绿蘑菇兔子
        --["GreenMushNoise"] = 1,  --绿蘑菇密集地？
        -- ["PitRoom"] = 2,
    },
    background_room = "BGGreenMush",
    room_bg = WORLD_TILES.FUNGUSGREEN,
    colour = { r = 0.5, g = 1.0, b = 0.5, a = 0.9 },
})

-- Blue Forest
--蓝蘑菇林区域
AddTask("m_BlueForest", {
    locks={ LOCKS.CAVE, LOCKS.TIER2 },
    keys_given = { KEYS.TIER3, KEYS.MOONMUSH, KEYS.ENTRANCE_INNER },
    room_choices = {
        ["BlueMushForest"] = 1,
        ["BlueMushMeadow"] = 1,
        --["BlueSpiderForest"] = 1,
        --["DropperDesolation"] = 1, --掉落者荒地？？？
        -- ["PitRoom"] = 1,
    },
    entrance_room = { "PitRoom" },
    background_room = "BGBlueMush", -- same layout as BlueMushForest
    room_bg = WORLD_TILES.FUNGUS,
    colour = { r = 0.5, g = 0.5, b = 1.0, a = 0.9 },
})

--月亮蘑菇林？
AddTask("m_MoonCaveForest", {
    locks={ LOCKS.MOONMUSH },
    keys_given={ KEYS.ARCHIVE },
    room_tags = { "lunacyarea", "MushGnomeSpawnArea" },
    room_choices = {
        ["MoonMushForest"] = 1,
        ["MoonMushForest_entrance"] = 1,
    },
    background_room = "MoonMushForest",
    room_bg = WORLD_TILES.FUNGUSMOON,
    colour = { r = 0.3, g = 0.3, b = 0.3, a = 0.9 },
})

-- Spillagmite Caverns
--洞穴蜘蛛矿区
AddTask("m_SpillagmiteCaverns", {
    locks={ LOCKS.CAVE, LOCKS.TIER2 },
    keys_given={ KEYS.CAVE, KEYS.TIER3 },
    room_choices = {
        ["SpillagmiteForest"] = 1, --石笋森林
        --["DropperCanyon"] = 1,--有洞穴蜘蛛、裂缝、石笋、石柱的峡谷
        --["StalagmitesAndLights"] = 1, --石笋与光源
        ["SpidersAndBats"] = 1,
        ["ThuleciteDebris"] = 1, --有图勒合金的地方？
        --["PitRoom"] = 1,
    },
    background_room = "BGSpillagmiteRoom",
    room_bg = WORLD_TILES.UNDERROCK,
    colour = { r = 0.3, g = 0.3, b = 0.3, a = 0.9 },
})

------------------------------------------------------------
-- Minor Caves Branches
--小分支（可选分支）
------------------------------------------------------------
-- Swampy Sinkhole
--有光塌陷沼泽
AddTask("m_SwampySinkhole", {
    locks={ LOCKS.CAVE, LOCKS.TIER3 },
    keys_given={ KEYS.CAVE, KEYS.SWAMP, KEYS.TIER4 },
    room_choices = {
        ["SinkholeSwamp"] = 1,
        ["TentacleMud"] = 1,
        --["TentaclesAndTrees"] = 1,
        --["PitRoom"] = 2,
    },
    background_room = "BGSinkholeSwampRoom",
    room_bg = WORLD_TILES.SWAMP,
    colour = { r = 0.6, g = 0.1, b = 0.7, a = 0.9 },
})


-- Pleasant Sinkhole
--陷洞附近的富饶资源点
AddTask("m_PleasantSinkhole", {
    locks={ LOCKS.CAVE, LOCKS.TIER3 },
    keys_given={ KEYS.CAVE, KEYS.SINKHOLE, KEYS.TIER4, KEYS.ENTRANCE_OUTER },
    room_choices = {
        ["GrasslandSinkhole"] = 1,
        ["SinkholeOasis"] = 1,
        ["SparseSinkholes"] = 1,
        --["PitRoom"] = 2,
    },
    background_room = "BGSinkhole",
    room_bg = WORLD_TILES.SINKHOLE,
    colour = { r = 0.0, g = 0.5, b = 0.0, a = 0.9 },
})




-- Rabbit City
--大兔人村
AddTask("m_RabbitCity", {
    locks={ LOCKS.CAVE, LOCKS.TIER3 },
    keys_given={ KEYS.CAVE, KEYS.RABBIT, KEYS.TIER4, KEYS.ENTRANCE_OUTER },
    room_choices = {
        ["RabbitCity"] = 1,
        ["RabbitTown"] = 1,
        --["RabbitArea"] = 1,
        --["PitRoom"] = 2,
    },
    background_room = "BGSinkhole",
    room_bg = WORLD_TILES.SINKHOLE,
    colour = { r = 1.0, g = 0.8, b = 0.2, a = 0.9 },
})




-- Ancient Annex

------------------------------------------------------------
-- Bumps and one-offs
------------------------------------------------------------
-- Ancients Expedition
-- Bat Barrens
-- Wee Sinkhole
-- Wee Swamp
-- Rabbit Hamlet

------------------------------------------------------------
-- Starts
------------------------------------------------------------
-- 定义起始房间列表
local startrooms = {
    "RabbitArea",     -- 兔子区域
    "RabbitTown",     -- 兔子村庄
    "RabbitSinkhole", -- 兔子陷洞
    --"SpiderIncursion", -- 蜘蛛入侵区域
    --"SinkholeForest",  -- 陷洞森林
    --"SinkholeCopses", -- 陷洞小树林
    --"SinkholeOasis", -- 陷洞绿洲
    --"GrasslandSinkhole", -- 草原陷洞
    --"GreenMushSinkhole", -- 绿色蘑菇陷洞
    --"GreenMushRabbits", -- 绿色蘑菇兔子
}
for i = 1, 3 do
    AddTask("m_CaveExitTask" .. i, {
        locks={ (i <= 2 and LOCKS.ENTRANCE_INNER or LOCKS.ENTRANCE_OUTER) },
        -- locks = { LOCKS.NONE },
        keys_given = {},
        room_choices = {
            ["CaveExitRoom"] = 1,
            [startrooms[i]] = 1,
        },
        background_room = "BGSinkhole",
        room_bg = WORLD_TILES.SINKHOLE,
        colour = { r = 1, g = 0, b = 1, a = 1 },
    })
end


------------------------------------------------------------
-- Caves Ruins Level
-- 遗迹
------------------------------------------------------------

--

--苔藓区
AddTask("m_LichenLand", {
    locks={LOCKS.TIER1},
    keys_given = { KEYS.TIER2, KEYS.RUINS },
    room_tags = { "Nightmare" },
    room_choices = {
        ["WetWilds"] = 1,     --湿润荒野
        ["LichenMeadow"] = 1, --地衣草地
        ["LichenLand"] = 1,   --地衣之地
        --["PitRoom"] = 1,
    },
    room_bg = WORLD_TILES.MUD,
    background_room = "BGWilds",
    colour = { r = 0, g = 0, b = 0.0, a = 1 },
})

--住宅区1（雕像大厅）
AddTask("m_Residential", {
    locks={LOCKS.TIER2, LOCKS.RUINS},
    keys_given = { KEYS.TIER3, KEYS.RUINS },
    room_tags = { "Nightmare" },
    entrance_room = "RuinedCityEntrance",
    room_choices =
    {
        ["Vacant"] = 2, --1
        --["LightHut"] = 1,
        -- ["PitRoom"] = 1, --0
    },
    room_bg = WORLD_TILES.TILES,
    maze_tiles = {
        rooms = { "room_residential", "room_residential_two", "hallway_residential", "hallway_residential_two" },
        bosses = { "room_residential" }
    },
    background_room = "RuinedCity",
    colour = { r = 0.2, g = 0.2, b = 0.0, a = 1 },
})
--无的
-- AddTask("m_MilitaryPits", {
--     locks = { LOCKS.NONE },
--     keys_given= {KEYS.TIER4, KEYS.RUINS},
--     room_tags = {"Nightmare"},
--     entrance_room = "MilitaryEntrance",
--     room_choices =
--     {
--         ["MilitaryMaze"] = 2, --3
--         ["Barracks"] = 2,--3
--     },
--     room_bg = WORLD_TILES.TILES,
--     maze_tiles = {rooms = {"pit_room_armoury", "pit_hallway_armoury", "pit_room_armoury_two"}, bosses = {"pit_room_armoury_two"}},
--     background_room="MilitaryMaze",
--     colour={r=0.6,g=0.6,b=0.0,a=1},
-- })

--迷宫战车主教守卫区
AddTask("m_Military", {
    locks={LOCKS.TIER3, LOCKS.RUINS},
    keys_given = { KEYS.TIER4, KEYS.RUINS },
    room_tags = { "Nightmare" },
    entrance_room = "MilitaryEntrance",
    room_choices =
    {
        ["MilitaryMaze"] = 3, --2
        ["Barracks"] = 1, --0
    },
    room_bg = WORLD_TILES.TILES,
    maze_tiles = { rooms = { "room_armoury", "hallway_armoury", "room_armoury_two" }, bosses = { "room_armoury_two" } },
    background_room = "MilitaryMaze",
    colour = { r = 0.6, g = 0.6, b = 0.0, a = 1 },
})
--主教雕像区
AddTask("m_Sacred", {
    locks={LOCKS.TIER3, LOCKS.RUINS},
    keys_given = { KEYS.TIER4, KEYS.RUINS, KEYS.SACRED },
    room_tags = { "Nightmare" },
    entrance_room = "BridgeEntrance",
    room_choices =
    {
        ["SacredBarracks"] = 1,
        --以下都是0
        ["Bishops"] = 1,
        ["Spiral"] = 1,
        ["BrokenAltar"] = 1,
        ["PitRoom"] = 1,
    },
    room_bg = WORLD_TILES.TILES,
    background_room = "Blank",
    colour = { r = 0.6, g = 0.6, b = 0.0, a = 1 },
})
--犀牛迷宫区
AddTask("m_TheLabyrinth", {
    locks={LOCKS.TIER4, LOCKS.RUINS},
    keys_given = { KEYS.TIER5, KEYS.RUINS, KEYS.SACRED },
    room_tags = { "Nightmare" },
    entrance_room = "LabyrinthEntrance",
    room_choices = {
        ["Labyrinth"] = 2,
        ["RuinedGuarden"] = 1,
    },
    room_bg = WORLD_TILES.IMPASSABLE,
    background_room = "Labyrinth",
    colour = { r = 0.4, g = 0.4, b = 0.0, a = 1 },
})
--完好祭坛区
AddTask("m_SacredAltar", {
    locks = { LOCKS.TIER4, LOCKS.RUINS },
    keys_given = { KEYS.TIER5, KEYS.RUINS, KEYS.SACRED },
    room_tags = { "Nightmare" },
    room_choices =
    {
        ["Altar"] = 1,
        --["PitRoom"] = 1,
    },
    room_bg = WORLD_TILES.TILES,
    entrance_room = "BridgeEntrance",
    background_room = "Blank",
    colour = { r = 0.6, g = 0.3, b = 0.0, a = 1 },
})

-- Centipede Cave
ReplaceTask("CentipedeCaveTask", {
    locks={ LOCKS.CAVE, LOCKS.TIER4, },
    keys_given={ KEYS.CAVE, KEYS.TIER5, KEYS.CENTIPEDE },
    room_choices={
        ["VentsRoom"] = 2,
        ["RockTreeRoom"] = 1,
        ["VentsRoom_exit"] = 2,
        ["CentipedeNest"] = 1,
    },
    --entrance_room = "MilitaryEntrance",
    background_room="BGVentsRoom", --BGVentsRoom
    room_bg=WORLD_TILES.VENT,
    colour={r=0.8,g=0.8,b=0.8,a=0.9},

    --Trying out a large amount of coves to really make the generation interesting.
	cove_room_name = "Blank",
    make_loop = true,
	cove_room_chance = 1,
	cove_room_max_edges = 50,
})

--远古档案馆迷宫区
AddTask("m_AtriumMaze", {
    locks = { LOCKS.NONE },
    keys_given = {},
    room_tags = { "Atrium", "Nightmare" },
    required_prefabs = { "atrium_gate" },
    entrance_room = "AtriumMazeEntrance",
    room_choices =
    {
        ["AtriumMazeRooms"] = function() return math.random(4, 6) end,
    },
    room_bg = WORLD_TILES.TILES,
    maze_tiles = {
        rooms = { "atrium_hallway", "atrium_hallway_two", "atrium_hallway_three" },
        bosses = { "atrium_hallway_three" },
        special = { start = { "atrium_start" }, finish = { "atrium_end" } },
        bridge_ground = WORLD_TILES.FAKE_GROUND
    },
    background_room = "AtriumMazeRooms",
    make_loop = true,
    colour = { r = 0.6, g = 0.6, b = 0.0, a = 1 },
})
--织影者迷宫区
AddTask("m_ArchiveMaze", {
    locks={LOCKS.ARCHIVE},
    keys_given = {},
    room_tags = { "nocavein" },
    required_prefabs = { "archive_orchestrina_main", "archive_lockbox_dispencer", "archive_lockbox_dispencer",
        "archive_lockbox_dispencer" },
    entrance_room = "ArchiveMazeEntrance",
    room_choices =
    {
        ["ArchiveMazeRooms"] = 2,
    },
    room_bg = WORLD_TILES.ARCHIVE,
    --    maze_tiles = {rooms = {"archive_hallway"}, bosses = {"archive_hallway"}, keyroom = {"archive_keyroom"}, archive = {start={"archive_start"}, finish={"archive_end"}}, bridge_ground=WORLD_TILES.FAKE_GROUND},
    maze_tiles = {
        rooms = { "archive_hallway", "archive_hallway_two" },
        bosses = { "archive_hallway" },
        archive = { keyroom = { "archive_keyroom" } },
        special = { finish = { "archive_end" }, start = { "archive_start" } },
        bridge_ground = WORLD_TILES.FAKE_GROUND
    },
    background_room = "ArchiveMazeRooms",
    cove_room_chance = 0,
    cove_room_max_edges = 0,
    make_loop = true,
    colour = { r = 1, g = 0, b = 0.0, a = 1 },
})
