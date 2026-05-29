local STRINGS = GLOBAL.STRINGS
local LOC = require("languages/loc")
local lang_id = LOC:GetLanguage()
-- print(lang_id,"----------------------")
if lang_id == 22 or lang_id == 21 then
    STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELS.MINIWORLD = "迷你世界"
    STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELDESC.MINIWORLD = "比标准《饥荒》地图尺寸更小的完整生态体验，月岛地区与大陆地形相连。"

    STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELS.MINISEPWORLD = "迷你世界"
    STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELDESC.MINISEPWORLD = "比标准《饥荒》地图尺寸更小的完整生态体验。"


    STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELS.MINICAVE = "迷你洞穴"
    STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELDESC.MINICAVE = "更小、资源更加集中的洞穴体验。"
else
    STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELS.MINIWORLD = "Smaller World"
    STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELDESC.MINIWORLD = "A full ecological experience on a smaller scale than the standard Don't Starve,the lunar island connected with the continent."

    STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELS.MINISEPWORLD = "Smaller World"
    STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELDESC.MINISEPWORLD = "A full ecological experience on a smaller scale than the standard Don't Starve."

    STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELS.MINICAVE = "Smaller Cave"
    STRINGS.UI.CUSTOMIZATIONSCREEN.PRESETLEVELDESC.MINICAVE = "A smaller, more resource-focused cave experience."
end