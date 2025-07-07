---------------------------------------------------
-- Fire Plane Missions -Fire (good)
----------------------------------------------------
s = create_advice_citysituation('2c328ecb')
s.title = "text@6C154459"
--
s.message = [[text@06C1543F]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_MEDIUM
s.automata_list = automata_groups.fire_plane -- sit_constants.lua
s.target_list = building_groups.FIRE_OCCUPANT
s.min_target_distance = 0        -- DO NOT CHANGE THIS TO non-0!
s.max_target_distance = 0
--
s.condition = sit_conditions.DESTROY_TARGET
s.create_target = false
--s.time_limit = 15 * 60
--
s.success_text = [[text@EC15455B]]
s.reward_unlocked_text    = [[text@EC193CF7]]
s.reward_guid  = hex2dec('03390000') --city zoo
s.failure_text = [[text@2C154564]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.event = game_events.DISASTER_STARTED_FIRE
s.trigger="(game.reward_instance_count(special_buildings.AerialFireFightingStrip) > 0) and (sc4game.sitmgr.get_success_count('ac1726c8') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_SAFETY
s.mood = advice_moods.ALARM 
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
--
s.evil_twin = hex2dec('0c329055') -- fire (evil)
--hard
s.success_aura_radius  = sit_constants.HAR_GOOD_SUCCESS_AURA_RADIUS
s.success_aura_magnitude = sit_constants.HAR_GOOD_SUCCESS_AURA_MAG
s.failure_aura_radius = sit_constants.HAR_GOOD_FAILURE_AURA_RADIUS
s.failure_aura_magnitude = sit_constants.HAR_GOOD_FAILURE_AURA_MAG
--s.success_money = sit_constants.HAR_GOOD_SUCCESS_MONEY
--s.failure_money = sit_constants.HAR_GOOD_FAILURE_MONEY
s.success_effect = sit_constants.SUCCESS_EFFECTMAYRAT
--s.success_effect = sit_constants.SUCCESS_EFFECTMONEY
--s.success_effect = sit_constants.SUCCESS_EFFECTMAYRAT_MONEY
s.failure_effect = sit_constants.FAILURE_EFFECT
--s.failure_effect = sit_constants.FAILURE_EFFECTMONEY
--
function s:get_time_limit(distToTarget, maxSpeed)
   return 0    -- no time limit for fire missions
end
--
function s:check_success()
   if (game.g_disasters_fire_ended ~= 0) then
      if (game.g_disasters_damage_building_count < 5) then
         return sit_constants.RESULT_SUCCESS
      else
         return sit_constants.RESULT_FAILURE
      end
   else
      return sit_constants.RESULT_IN_PROGRESS
   end
end


---------------------------------------------------
-- Fire Plane Missions - Fire (evil)
----------------------------------------------------
s = create_advice_citysituation('0c329055')
s.title = "text@6C15445A"
--
s.message = [[text@06C15440]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_MEDIUM
s.automata_list = automata_groups.fire_plane -- sit_constants.lua
--
s.condition = sit_conditions.CELL_COVERAGE
s.coverage_type = sit_coverage_type.UNZONED_LAND
--s.coverage_lot = building_groups.FIRE_OCCUPANT
s.coverage_cells_min = 30
s.coverage_cells_max = 30
s.coverage_success_count = 15
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_LONG
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.time_limit = 15 * 60
--
s.success_text = [[text@EC15455C]]
s.failure_text = [[text@2C154565]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.event = game_events.DISASTER_STARTED_FIRE
s.trigger="(game.reward_instance_count(special_buildings.AerialFireFightingStrip) > 0) and (sc4game.sitmgr.get_success_count('ac1726c8') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.mood = advice_moods.NEUTRAL 
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
s.time_limit = sit_constants.TIME_LIMIT_SHORT
s.service_mission = true
s.active_radius = 4
--
s.evil_twin = hex2dec('2c328ecb')   -- fire (good)
--hard
s.success_aura_radius  = sit_constants.HAR_EVIL_SUCCESS_AURA_RADIUS
s.success_aura_magnitude = sit_constants.HAR_EVIL_SUCCESS_AURA_MAG
s.failure_aura_radius = sit_constants.HAR_EVIL_FAILURE_AURA_RADIUS
s.failure_aura_magnitude = sit_constants.HAR_EVIL_FAILURE_AURA_MAG
s.success_money = sit_constants.HAR_EVIL_SUCCESS_MONEY
s.failure_money = sit_constants.HAR_EVIL_FAILURE_MONEY
s.success_effect = sit_constants.SUCCESS_EFFECTMONEY
s.failure_effect = sit_constants.FAILURE_EFFECTDARKMONEY
--
function s:get_time_limit(distToTarget, maxSpeed)
   local result

   result = 15 + (distToTarget / maxSpeed) * 10

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return 300
end
--



---------------------------------------------------
-- Fire Plane Missions - Player-created Fire (good)
----------------------------------------------------
s = create_advice_citysituation('cc3296c5')
s.title = "text@6C154459"
--
s.message = [[text@06C1543F]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_MEDIUM
s.automata_list = automata_groups.fire_plane -- sit_constants.lua
s.target_list = building_groups.FIRE_OCCUPANT
s.min_target_distance = 0        -- DO NOT CHANGE THIS TO non-0!
s.max_target_distance = 0
--
s.condition = sit_conditions.DESTROY_TARGET
s.create_target = false
s.time_limit = 15 * 60
--
s.success_text = [[text@EC15455B]]
s.reward_unlocked_text    = [[text@EC193CF7]]
s.reward_guid  = hex2dec('03390000') --city zoo
s.failure_text = [[text@2C154564]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.event = game_events.DISASTER_STARTED_PLAYER_FIRE
s.trigger="(game.reward_instance_count(special_buildings.AerialFireFightingStrip) > 0) and (sc4game.sitmgr.get_success_count('ac1726c8') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_SAFETY
s.mood = advice_moods.ALARM 
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
--
s.evil_twin = hex2dec('ec3296d6') -- player-created fire (evil)
--hard
s.success_aura_radius  = sit_constants.HAR_GOOD_SUCCESS_AURA_RADIUS
s.success_aura_magnitude = sit_constants.HAR_GOOD_SUCCESS_AURA_MAG
s.failure_aura_radius = sit_constants.HAR_GOOD_FAILURE_AURA_RADIUS
s.failure_aura_magnitude = sit_constants.HAR_GOOD_FAILURE_AURA_MAG
--s.success_money = sit_constants.HAR_GOOD_SUCCESS_MONEY
--s.failure_money = sit_constants.HAR_GOOD_FAILURE_MONEY
s.success_effect = sit_constants.SUCCESS_EFFECTMAYRAT
--s.success_effect = sit_constants.SUCCESS_EFFECTMONEY
--s.success_effect = sit_constants.SUCCESS_EFFECTMAYRAT_MONEY
s.failure_effect = sit_constants.FAILURE_EFFECT
--s.failure_effect = sit_constants.FAILURE_EFFECTMONEY
--
function s:get_time_limit(distToTarget, maxSpeed)
   return 0       -- no time limit for fire missions
end
--
function s:check_success()
   if (game.g_disasters_fire_ended ~= 0) then
      if (game.g_disasters_damage_building_count < 5) then
         return sit_constants.RESULT_SUCCESS
      else
         return sit_constants.RESULT_FAILURE
      end
   else
      return sit_constants.RESULT_IN_PROGRESS
   end
end


---------------------------------------------------
-- Fire Plane Missions - Player- created Fire (evil)
----------------------------------------------------
s = create_advice_citysituation('ec3296d6')
s.title = "text@6C15445A"
--
s.message = [[text@06C15440]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_MEDIUM
s.automata_list = automata_groups.fire_plane -- sit_constants.lua
--
s.condition = sit_conditions.CELL_COVERAGE
s.coverage_type = sit_coverage_type.UNZONED_LAND
--s.coverage_lot = building_groups.FIRE_OCCUPANT
s.coverage_cells_min = 30
s.coverage_cells_max = 30
s.coverage_success_count = 15
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_LONG
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
s.service_mission = true
--s.time_limit = 15 * 60
--
s.success_text = [[text@EC15455C]]
s.failure_text = [[text@2C154565]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.event = game_events.DISASTER_STARTED_PLAYER_FIRE
s.trigger="(game.reward_instance_count(special_buildings.AerialFireFightingStrip) > 0) and (sc4game.sitmgr.get_success_count('ac1726c8') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.mood = advice_moods.NEUTRAL 
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
s.active_radius = 4
--
s.evil_twin = hex2dec('cc3296c5')   -- player-created fire (good)
s.success_aura_radius  = sit_constants.EVIL_SUCCESS_AURA_RADIUS
s.success_aura_magnitude = sit_constants.EVIL_SUCCESS_AURA_MAG
s.success_money = sit_constants.EVIL_SUCCESS_MONEY
s.failure_aura_radius = sit_constants.EVIL_FAILURE_AURA_RADIUS
s.failure_aura_magnitude = sit_constants.EVIL_FAILURE_AURA_MAG
s.success_money = sit_constants.HAR_EVIL_SUCCESS_MONEY
s.failure_money = sit_constants.HAR_EVIL_FAILURE_MONEY
s.success_effect = sit_constants.SUCCESS_EFFECTMONEY
s.failure_effect = sit_constants.FAILURE_EFFECTDARKMONEY
--
function s:get_time_limit(distToTarget, maxSpeed)
   local result

   result = 15 + (distToTarget / maxSpeed) * 10

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return 300
end
--