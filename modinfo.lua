local L = locale ~= "zh" and locale ~= "zhr"
name = L and "Smaller World[Tiny World]" or "更小的世界[迷你世界]"
description = L and [[
how to use?

enable the mod - Forest/Cave - World Generation - Select a preset style - Select "Smaller World/Smaller Cave" to start the game.

【Notice】
After completing the above steps - do not MODIFY THE BIOME, WORLD SIZE options.
]] or[[
如何使用？

开启模组——森林/洞穴——世界生成——选择预设风格——选择“迷你世界/迷你地下世界”，即可开始游戏。

【注意】
完成以上步骤之后，请切记-不要修改生物群落、世界大小选项。
]] 

author = "去码头整点薯条、不笑猫"
version = "20260530"

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