local L = locale ~= "zh" and locale ~= "zhr"
name = L and "Smaller World[Tiny World]" or "更小的世界[迷你世界]"
description = L and [[
【Notice】
Do not modify BIOME or WORLD SIZE options after enabling.
]] or[[
【注意】
开启后请勿修改生物群落、世界大小选项。
]] 

author = "去码头整点薯条、不笑猫"
version = "202605802"

api_version = 10
priority = -100

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false
client_only_mod = false
all_clients_require_mod = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

configuration_options =
{
    {
        name = "forest_preset",
        label = L and "Forest World Type" or "森林世界类型",
        hover = L and "Choose which Smaller World preset to use for the forest world." or "选择森林世界使用的迷你世界预设。",
        options =
        {
            {description = L and "Connected Moon Island" or "月岛相连", data = "MINIWORLD"},
            {description = L and "Separate Moon Island" or "月岛分离", data = "MINISEPWORLD"},
        },
        default = "MINISEPWORLD",
    },
}