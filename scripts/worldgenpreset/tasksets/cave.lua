modimport("scripts/worldgenpreset/tasks/cave")

--自定义自己的任务集
AddTaskSet("m_cave_default", {
    name = STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELS.MINICAVE,
    location = "cave",
    tasks = {
        "m_MudWorld",
        "m_MudCave",
        "m_MudLights",
        "m_MudPit",

        "m_BigBatCave",
        "m_RockyLand",
        "m_RedForest",
        "GreenForest",
        "m_BlueForest",
        "m_SpillagmiteCaverns",

        "m_MoonCaveForest",
        "m_ArchiveMaze",

        "m_CaveExitTask1",
        "m_CaveExitTask2",
        "m_CaveExitTask3",
        
        "CentipedeCaveTask",

        "m_ToadStoolTask1",
        "m_ToadStoolTask2",
        "m_ToadStoolTask3",

        -- ruins
        "m_LichenLand",
        "m_Residential",
        -- "m_MilitaryPits",
        "m_Military",
        "m_Sacred",
        "m_TheLabyrinth",
        "m_SacredAltar",
        "m_AtriumMaze",
    },
    numoptionaltasks = 1,
    optionaltasks = {
        "m_SwampySinkhole",
        "m_PleasantSinkhole",
        "m_RabbitCity",

    },
    valid_start_tasks = {
        "m_CaveExitTask1",
        "m_CaveExitTask2",
        "m_CaveExitTask3",
        
    },
    required_prefabs = {
        "tentacle_pillar_atrium",
        "tentacle_pillar_atrium",
    },
    set_pieces = {
        -- if you add or remove tasks, don't forget to update this list!
        ["TentaclePillar"] = { count = 6, tasks = {
            "m_MudWorld", "m_MudCave", "m_MudLights", "m_MudPit", "m_BigBatCave", "m_RockyLand", "m_RedForest", "GreenForest", "m_BlueForest", "m_SpillagmiteCaverns", "m_SwampySinkhole", "m_PleasantSinkhole", "m_RabbitCity",  "CentipedeCaveTask",
        } },
        ["ResurrectionStone"] = { count = 2, tasks = {
            "m_MudWorld", "m_MudCave", "m_MudLights", "m_MudPit", "m_BigBatCave", "m_RockyLand", "m_RedForest", "GreenForest", "m_BlueForest", "m_SpillagmiteCaverns", "m_SwampySinkhole", "m_PleasantSinkhole", "m_RabbitCity",  "CentipedeCaveTask",
        } },
        ["skeleton_notplayer"] = { count = 1, tasks={            
            "m_MudWorld", "m_MudCave", "m_MudLights", "m_MudPit", "m_BigBatCave", "m_RockyLand", "m_RedForest", "GreenForest", "m_BlueForest", "m_SpillagmiteCaverns", "m_SwampySinkhole", "m_PleasantSinkhole", "m_RabbitCity",  "CentipedeCaveTask",
        } },
        ["TentaclePillarToAtrium"] = { count = 1, tasks={ "m_BigBatCave", "GreenForest", "CentipedeCaveTask", } }, -- This set piece data connects it to the atrium_start set piece.
    },
})
