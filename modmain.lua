-- GLOBAL.setmetatable(GLOBAL.getfenv(1), { __index = function(self, index) return GLOBAL.rawget(GLOBAL, index) end })
-- modmain.lua for workshop-2987796038 (Smaller World mod)

-- ============================================
-- 修复世界生成错误：防止 ChooseSetPieces 崩溃
-- 注意：主修复已移至 modworldgenmain.lua（世界生成期间立即执行）
-- 此处的 AddSimPostInit 版本仅作为服务端备用保护
-- ============================================
local level_class_loaded = false

AddSimPostInit(function()
    if level_class_loaded then
        return
    end
    level_class_loaded = true
    
    -- Level 是全局类，不需要 require
    if not GLOBAL.Level or not GLOBAL.Level.ChooseSetPieces then
        print("[Smaller World Mod] Warning: Level class not available, skipping patch")
        return
    end
    
    local original_ChooseSetPieces = GLOBAL.Level.ChooseSetPieces
    
    function GLOBAL.Level:ChooseSetPieces()
        assert(self.chosen_tasks ~= nil, "Must call ChooseTasks before ChooseSetPieces")

        local tasks = self:GetTasksForLevelSetPieces()
        if #tasks > 0 then
            local set_pieces = {}
            if self.required_setpieces ~= nil then
                set_pieces = deepcopy(self.required_setpieces)
                for i = 1, self.numrandom_set_pieces do
                    table.insert(set_pieces, self.random_set_pieces[math.random(#self.random_set_pieces)])
                end
            end

            for _, set_piece in ipairs(set_pieces) do
                local idx = math.random(#tasks)

                if tasks[idx].random_set_pieces == nil then
                    tasks[idx].random_set_pieces = {}
                end
                print(set_piece .. " added to task " .. tasks[idx].id)
                table.insert(tasks[idx].random_set_pieces, set_piece)
            end
        end
        
        for name, choicedata in pairs(self.set_pieces or {}) do
            local found = false
            local idx = {}
            for i, task in ipairs(self.chosen_tasks) do
                idx[task.id] = i
            end
            local availabletasks = table.invert(idx)

            local choices = ArrayIntersection(choicedata.tasks, availabletasks)
            local count = choicedata.count or 1

            assert(choices and #choices > 0, "Trying to add set piece '"..name.."' but no choices given.")

            while count > 0 and #choices > 0 do
                local idx_choice = math.random(#choices)
                local choice = idx[choices[idx_choice]]
                
                -- 添加空值检查，防止崩溃
                if choice ~= nil and self.chosen_tasks[choice] ~= nil then
                    if self.chosen_tasks[choice].set_pieces == nil then
                        self.chosen_tasks[choice].set_pieces = {}
                    end
                    table.insert(self.chosen_tasks[choice].set_pieces, {name=name, restrict_to=choicedata.restrict_to})

                    idx[choices[idx_choice]] = nil
                    table.remove(choices, idx_choice)
                    count = count - 1
                else
                    -- 移除无效选择，继续尝试
                    table.remove(choices, idx_choice)
                end
            end
        end
    end
    
    print("[Smaller World Mod] Fixed Level:ChooseSetPieces nil reference bug")
end)


-- ============================================

if GLOBAL.KnownModIndex:IsModEnabled("workshop-3193922031")  then
    AddComponentPostInit("retrofitcavemap_anr", function(self)
        local old_onpostinit = self.OnPostInit
        function self:OnPostInit(...)
            if TheWorld.topology and TheWorld.topology.nodes then
                local has_maze_entrance = false
                local has_maze_grotto = false
                
                for i, node in ipairs(TheWorld.topology.nodes) do
                    if node.tags then
                        if table.contains(node.tags, "UMMazeEntranceGrotto") then
                            has_maze_entrance = true
                        end
                        if table.contains(node.tags, "UMMazeGrotto") then
                            has_maze_grotto = true
                        end
                    end
                end
                
                if not has_maze_entrance or not has_maze_grotto then
                    print("Smaller World compatibility: Skipping retrofitcavemap_anr due to missing maze nodes")
                    return
                end
            end
            
            return old_onpostinit(self, ...)
        end
    end)
end