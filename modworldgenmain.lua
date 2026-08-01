GLOBAL.setmetatable(GLOBAL.getfenv(1), { __index = function(self, index) return GLOBAL.rawget(GLOBAL, index) end })
--languages
modimport("scripts/languages/strings")
-- forest
modimport("scripts/worldgenpreset/levels/forest")
-- cave
modimport("scripts/worldgenpreset/levels/cave")
-- ocean
AddRoomPreInit("OceanRough", function(room) -- 猴岛 生成
    room.contents.countstaticlayouts["MonkeyIsland"]= 0
    room.contents.countstaticlayouts["MonkeyIslandSmall"]= 1
end)

---------------------------------------------------------------------------------------------
                                        -- mod --
---------------------------------------------------------------------------------------------
if GLOBAL.KnownModIndex:IsModEnabled("workshop-2039181790") or GLOBAL.KnownModIndex:IsModEnabled("workshop-3193922031") then -- 永不妥协兼容
    AddTaskPreInit("GiantTrees", function(task)
        task.room_choices["GiantTrees"] = nil
        
        task.room_choices["AphidLand"] =  nil
        task.room_choices["ShroomInfestedGiantTrees"] =  nil
        task.room_choices["HoodedTown"] =  nil
        task.room_choices["HFHolidays"] =  nil
        task.room_choices["RoseGarden"] =  nil
    end)

    if GLOBAL.KnownModIndex:IsModEnabled("workshop-3193922031")  then
        AddTaskSetPreInitAny(function(tasksetdata)
            if tasksetdata.location ~= "forest" then
                return
            end
            print("mod_workshop-3193922031: 移除任务关联")
        
            -- 移除之前添加的任务关联
            if table.contains(tasksetdata.tasks, "Lightning Bluff") then
                -- 从 ResurrectionStone 中移除 "Lightning Bluff"
                local tasks = tasksetdata.set_pieces["ResurrectionStone"].tasks
                for i = #tasks, 1, -1 do
                    if tasks[i] == "Lightning Bluff" then
                        print("移除任务关联1:", tasks[i])
                        table.remove(tasks, i)
                    end
                end
                
                -- 从 WormholeGrass 中移除 "Lightning Bluff"
                tasks = tasksetdata.set_pieces["WormholeGrass"].tasks
                for i = #tasks, 1, -1 do
                    if tasks[i] == "Lightning Bluff" then
                        print("移除任务关联2:", tasks[i])
                        table.remove(tasks, i)
                    end
                end
                
                -- 从 CaveEntrance 中移除 "Lightning Bluff"
                tasks = tasksetdata.set_pieces["CaveEntrance"].tasks
                for i = #tasks, 1, -1 do
                    if tasks[i] == "Lightning Bluff" then
                        print("移除任务关联3:", tasks[i])
                        table.remove(tasks, i)
                    end
                end
            end
        end)

        
        -- AddLevelPreInitAny(function(level)
        --     if level.location == "cave" and (level.id == "MINICAVE" or string.find(level.id, "MINI")) then
        --         AddComponentPostInit("retrofitcavemap_anr", function(self)
        --             local old_onpostinit = self.OnPostInit
        --             function self:OnPostInit(...)
        --                 if TheWorld.topology and TheWorld.topology.nodes then
        --                     local has_maze_entrance = false
        --                     local has_maze_grotto = false
                            
        --                     for i, node in ipairs(TheWorld.topology.nodes) do
        --                         if node.tags then
        --                             if table.contains(node.tags, "UMMazeEntranceGrotto") then
        --                                 has_maze_entrance = true
        --                             end
        --                             if table.contains(node.tags, "UMMazeGrotto") then
        --                                 has_maze_grotto = true
        --                             end
        --                         end
        --                     end
                            
        --                     if not has_maze_entrance or not has_maze_grotto then
        --                         print("Smaller World compatibility: Skipping retrofitcavemap_anr due to missing maze nodes")
        --                         return
        --                     end
        --                 end
                        
        --                 return old_onpostinit(self, ...)
        --             end
        --         end)
        --     end
        -- end)
    end
end

if GLOBAL.KnownModIndex:IsModEnabled("workshop-1392778117") then -- 棱镜兼容
    local task_type1 = { "Make a pick", "Dig that rock", "Greater Plains", "Squeltch", "Beeeees!", "Speak to the king",
        "For a nice walk", "Badlands", "Lightning Bluff", "Forest hunters", "Tiny_MoonIsland_Mine", }

    AddTaskSetPreInit("tiny_forest_set", function(taskset)
        local task_type1 = {"Make a pick", "Dig that rock", "Great Plains", "Squeltch", "Beeeees!", "Speak to the king",
            "Forest hunters", "Befriend the pigs", "For a nice walk", "Kill the spiders", "Killer bees!", "Make a Beehat",
            "The hunters", "Magic meadow", "Frogs and bugs", "Badlands"
        }
        taskset.set_pieces["RoseGarden"] = { count = 1, tasks = task_type1 }
        taskset.set_pieces["OrchidGrave"] = { count = 1, tasks = task_type1 }
        taskset.set_pieces["LilyPond"] = { count = 1, tasks = task_type1 }
        taskset.set_pieces["OrchidForest"] = { count = 1, tasks = task_type1 }

        table.insert(taskset.tasks, "L_RainIsland_Main")
    end)
    --
    AddTaskSetPreInit("tiny_forest_set_sep", function(taskset)
        taskset.set_pieces["RoseGarden"] = { count = 1, tasks = task_type1 }
        taskset.set_pieces["OrchidGrave"] = { count = 1, tasks = task_type1 }
        taskset.set_pieces["LilyPond"] = { count = 1, tasks = task_type1 }
        taskset.set_pieces["OrchidForest"] = { count = 1, tasks = task_type1 }

        table.insert(taskset.tasks, "L_RainIsland_Main")
    end)
end

---------------------------------------------------------------------------------------------
-- ============================================
-- 修复 Level:ChooseSetPieces nil reference 崩溃
-- 必须在 modworldgenmain.lua 中执行（世界生成期间），
-- 不能放在 modmain.lua 的 AddSimPostInit 中（模拟启动后太迟）
-- ============================================
if GLOBAL.Level and GLOBAL.Level.ChooseSetPieces then
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

                -- nil 检查：防止 set_piece 的 task 不在 chosen_tasks 中时崩溃
                if choice ~= nil and self.chosen_tasks[choice] ~= nil then
                    if self.chosen_tasks[choice].set_pieces == nil then
                        self.chosen_tasks[choice].set_pieces = {}
                    end
                    table.insert(self.chosen_tasks[choice].set_pieces, {name=name, restrict_to=choicedata.restrict_to})

                    idx[choices[idx_choice]] = nil
                    table.remove(choices, idx_choice)
                    count = count - 1
                else
                    -- 无效选择，跳过并继续
                    print("[Smaller World] Skipping invalid set piece choice for: "..name)
                    table.remove(choices, idx_choice)
                end
            end
        end
    end

    print("[Smaller World Mod] Patched Level:ChooseSetPieces - nil reference bug fixed in worldgen")
else
    print("[Smaller World Mod] WARNING: Level.ChooseSetPieces not available for patching")
end
-- ============================================
