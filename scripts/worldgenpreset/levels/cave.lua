modimport("scripts/worldgenpreset/tasksets/cave")
--洞穴部分
--自定义自己的世界风格
AddLevel(LEVELTYPE.SURVIVAL, {
    id = "MINICAVE",
    name = STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELS.MINICAVE,
    -- print("测试22222222222",STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELS.MINICAVE),
    desc = STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELDESC.MINICAVE,
    location = "cave",
    version = 4,
    overrides = {
        task_set = "m_cave_default", --使用自定义的任务集
        world_size = "small",
    },
    required_setpieces = {},
    numrandom_set_pieces = 0,
    random_set_pieces = {},
    required_prefabs = {},
})