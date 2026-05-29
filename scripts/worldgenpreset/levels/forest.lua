modimport("scripts/worldgenpreset/tasksets/forest")
--地面部分1
--自定义自己的世界风格
AddLevel(LEVELTYPE.SURVIVAL, {
    id = "MINIWORLD",
    name = STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELS.MINIWORLD,
    -- print("测试22222222222",STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELS.MINIWORLD),
    desc = STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELDESC.MINIWORLD,
    location = "forest",
    version = 4,
    overrides = {
        task_set = "tiny_forest_set", --使用自定义的任务集
        world_size = "small",
    },
    required_setpieces = {"Sculptures_1", "Maxwell5"},
    numrandom_set_pieces = 0,
	random_set_pieces = {},
    required_prefabs = {},
})

AddLevel(LEVELTYPE.SURVIVAL, {
    id = "MINISEPWORLD",
    name = STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELS.MINISEPWORLD,
    desc = STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELDESC.MINISEPWORLD,
    location = "forest",
    version = 4,
    overrides = {
        task_set = "tiny_forest_set_sep", --使用自定义的任务集
        world_size = "small",
    },
    required_setpieces = {"Sculptures_1", "Maxwell5"},
    numrandom_set_pieces = 0,
	random_set_pieces = {},
    required_prefabs = {},
})