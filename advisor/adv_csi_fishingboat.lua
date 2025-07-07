--------------------------------------
-- Fishing boat Missions - Fish-good
----------------------------------------------------
s = create_advice_citysituation('6c1734d5')
s.title = "text@6C154468"
--
s.message = [[text@06C1544E]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.fishing_boat -- sit_constants.lua
s.condition = sit_conditions.CELL_COVERAGE
s.service_mission = true
s.active_radius = 4
--
s.success_text = [[text@EC15456A]]
s.reward_unlocked_text    = [[text@EC193D01]]
s.reward_guid  = hex2dec('03950000') --lighthouse - not in adv_const
s.failure_text = [[text@2C154573]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="(game.reward_instance_count(special_buildings.Marina) > 0) and (sc4game.sitmgr.get_success_count('cc1730cf') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.success_image = sit_constants.SITUATION_Reward_Lighthouse
s.failure_image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
s.coverage_cells_min   = 25
s.coverage_cells_max   = 25
s.coverage_type = sit_coverage_type.UNZONED_WATER
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_BOAT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
--s.coverage_lot = building_groups.CEMETARY
--s.coverage_zone = zone_tool_types.INDUSTRIAL_RES     
--s.coverage_network = network_types.OVER_GROUND
--s.coverage_rect = { 30, 30, 35, 35, }
s.evil_twin = hex2dec('0c17354b') --Mmm.. Endangered Dinner
--easy
s.success_aura_radius  = sit_constants.GOOD_SUCCESS_AURA_RADIUS
s.success_aura_magnitude = sit_constants.GOOD_SUCCESS_AURA_MAG
s.failure_aura_radius = sit_constants.GOOD_FAILURE_AURA_RADIUS
s.failure_aura_magnitude = sit_constants.GOOD_FAILURE_AURA_MAG
--s.success_money = sit_constants.MED_GOOD_SUCCESS_MONEY
--s.failure_money = sit_constants.MED_GOOD_FAILURE_MONEY
s.success_effect = sit_constants.SUCCESS_EFFECTMAYRAT
--s.success_effect = sit_constants.SUCCESS_EFFECTMONEY
--s.success_effect = sit_constants.SUCCESS_EFFECTMAYRAT_MONEY
s.failure_effect = sit_constants.FAILURE_EFFECT
--s.failure_effect = sit_constants.FAILURE_EFFECTMONEY
--
function s:get_time_limit(distToTarget, maxSpeed)
   local result

   result = 15 + (distToTarget / maxSpeed) * 5

   -- limit to min/max
   if (result < 15) then
      result = 15
  -- elseif (result > 600) then       -- 600 seconds == ten minutes
     -- result = 600
   end

   return 300
end
--
--------------------------------------
-- Fishing boat Missions - Mmm.. Endangered Dinner-evil
----------------------------------------------------
s = create_advice_citysituation('0c17354b')
s.title = "text@6C154469"
--
s.message = [[text@06C1544F]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.fishing_boat -- sit_constants.lua
s.condition = sit_conditions.CELL_COVERAGE
s.service_mission = true
--
s.success_text = [[text@EC15456B]]
s.reward_unlocked_text    = [[text@EC193D02]]
s.reward_guid  = hex2dec('03320000') --stock exchange
s.failure_text = [[text@2C154574]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="(game.reward_instance_count(special_buildings.Marina) > 0) and (sc4game.sitmgr.get_success_count('cc1730cf') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.success_image = sit_constants.SITUATION_Reward_Stock_Exchange
s.failure_image = sit_constants.SITUATION_IMAGE_DR_VU
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
s.coverage_cells_min   = 25
s.coverage_cells_max   = 25
s.coverage_type = sit_coverage_type.UNZONED_WATER
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_BOAT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
s.active_radius = 4
--s.coverage_lot = building_groups.CEMETARY
--s.coverage_zone = zone_tool_types.INDUSTRIAL_RES     
--s.coverage_network = network_types.OVER_GROUND
--s.coverage_rect = { 30, 30, 35, 35, }
s.evil_twin = hex2dec('6c1734d5') --Fish
--easy
s.success_aura_radius  = sit_constants.EVIL_SUCCESS_AURA_RADIUS
s.success_aura_magnitude = sit_constants.EVIL_SUCCESS_AURA_MAG
s.failure_aura_radius = sit_constants.EVIL_FAILURE_AURA_RADIUS
s.failure_aura_magnitude = sit_constants.EVIL_FAILURE_AURA_MAG
s.success_money = sit_constants.EVIL_SUCCESS_MONEY
s.failure_money = sit_constants.EVIL_FAILURE_MONEY
s.success_effect = sit_constants.SUCCESS_EFFECTMONEY
s.failure_effect = sit_constants.FAILURE_EFFECTDARKMONEY
--
function s:get_time_limit(distToTarget, maxSpeed)
   local result

   result = 15 + (distToTarget / maxSpeed) * 5

   -- limit to min/max
   if (result < 15) then
      result = 15
  -- elseif (result > 600) then       -- 600 seconds == ten minutes
     -- result = 600
   end

   return 300
end
--