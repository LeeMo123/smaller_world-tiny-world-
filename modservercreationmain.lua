-- ============================================
-- modservercreationmain.lua
-- 功能：勾选 mod 后自动切换到对应的世界预设，
--       无需玩家在世界生成界面手动选择。
-- 参考：Island Adventures mod 的同类实现
-- ============================================

-- 保存 frontend_env 引用，然后切换到全局环境
local MODENV = env
GLOBAL.setfenv(1, GLOBAL)

-- 获取 mod 配置：森林世界类型（默认 MINIWORLD）
local forest_preset = MODENV.GetModConfigData("forest_preset") or "MINISEPWORLD"

-- 延迟 2 帧执行，确保 ServerCreationScreen 已完全初始化
scheduler:ExecuteInTime(2 * FRAMES, function()
    local screen = TheFrontEnd:GetOpenScreenOfType("ServerCreationScreen")
    if not screen or not screen.world_tabs then
        return
    end

    -- 处理森林分片（第 1 个 tab）
    local forest_tab = screen.world_tabs[1]
    if forest_tab and forest_tab:IsNewShard() then
        local location = forest_tab:GetCurrentLocation()
        -- 仅在 location 为 "forest" 时自动切换，避免干扰其他 mod
        if location == "forest" then
            forest_tab.worldgen_widget:LoadPreset(forest_preset)
            forest_tab.settings_widget:LoadPreset(forest_preset)
            forest_tab:Refresh()
            print("[Smaller World] Auto-selected forest preset: " .. forest_preset)
        end
    end

    -- 处理洞穴分片（第 2 个 tab）
    local cave_tab = screen.world_tabs[2]
    if cave_tab and cave_tab:IsNewShard() then
        local location = cave_tab:GetCurrentLocation()
        -- 仅在 location 为 "cave" 时自动切换
        if location == "cave" then
            cave_tab.worldgen_widget:LoadPreset("MINICAVE")
            cave_tab.settings_widget:LoadPreset("MINICAVE")
            cave_tab:Refresh()
            print("[Smaller World] Auto-selected cave preset: MINICAVE")
        end
    end
end)
