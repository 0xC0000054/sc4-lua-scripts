--------------------------------------
-- Crop Dusting Missions - Farmers Got Vermin-good
----------------------------------------------------
s = create_advice_citysituation('0c172d78')
s.title = "text@6C15445D"
--
s.message = [[text@06C15443]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.crop_duster -- sit_constants.lua
s.condition = sit_conditions.CELL_COVERAGE
s.service_mission = true
s.active_radius = 16
--
s.success_text = [[text@EC15455F]]
s.reward_unlocked_text    = [[text@2c238a24]]
s.reward_guid  = hex2dec('032C0000') --farmer's market
s.failure_text = [[text@2C154568]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="(game.g_small_airport_count > 0) and (game.g_num_izone_r_tiles >= 50) and (sc4game.sitmgr.get_success_count('ac1726c8') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_SAFETY
s.success_image = sit_constants.SITUATION_Reward_Farmers_Market
s.failure_image = sit_constants.SITUATION_IMAGE_SAFETY
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
s.coverage_cells_min   = 50
s.coverage_cells_max   = 50
s.coverage_type = sit_coverage_type.ZONE
s.coverage_zone = zone_tool_types.INDUSTRIAL_RES
s.evil_twin = hex2dec('4c172d73') --Spread Zombie Dust
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
--med
s.success_aura_radius  = sit_constants.MED_GOOD_SUCCESS_AURA_RADIUS
s.success_aura_magnitude = sit_constants.MED_GOOD_SUCCESS_AURA_MAG
s.failure_aura_radius = sit_constants.MED_GOOD_FAILURE_AURA_RADIUS
s.failure_aura_magnitude = sit_constants.MED_GOOD_FAILURE_AURA_MAG
--s.success_money = sit_constants.HAR_GOOD_SUCCESS_MONEY
--s.failure_money = sit_constants.HAR_GOOD_FAILURE_MONEY
s.success_effect = sit_constants.SUCCESS_EFFECTMAYRAT
--s.success_effect = sit_constants.SUCCESS_EFFECTMONEY
--s.success_effect = sit_constants.SUCCESS_EFFECTMAYRAT_MONEY
s.failure_effect = sit_constants.FAILURE_EFFECT
--s.failure_effect = sit_constants.FAILURE_EFFECTMONEY
--
function s:get_time_limit(distToTarget, maxSpeed)
   local result

   result = 15 + (distToTarget / maxSpeed) * 8
   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return 500
end
--


--------------------------------------
-- Crop Dusting Missions - Spread Zombie Dust-evil
----------------------------------------------------
s = create_advice_citysituation('4c172d73')
s.title = "text@6C15445E"
--
s.message = [[text@06C15444]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.crop_duster -- sit_constants.lua
s.condition = sit_conditions.CELL_COVERAGE
s.service_mission = true
s.active_radius = 16
--
s.success_text = [[text@EC154560]]
s.reward_unlocked_text    = [[text@EC193CFA]]
s.reward_progress_text = [[text@4C193E85]]
s.reward_guid  = hex2dec('03960000') --area 5.1
s.failure_text = [[text@2C154569]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="(game.g_small_airport_count > 0) and sc4game.automata.get_source_building_count(building_groups.CEMETARY) > 0 and (sc4game.sitmgr.get_success_count('ac1726c8') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.success_image = sit_constants.SITUATION_Reward_Area_Control_Tower
s.failure_image = sit_constants.SITUATION_IMAGE_DR_VU
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
s.coverage_cells_min   = 10
s.coverage_cells_max   = 10
s.coverage_type = sit_coverage_type.LOT
s.coverage_lot = building_groups.CEMETARY
s.evil_twin = hex2dec('0c172d78') --Farmers Got Vermin
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
--med
s.success_aura_radius  = sit_constants.MED_EVIL_SUCCESS_AURA_RADIUS
s.success_aura_magnitude = sit_constants.MED_EVIL_SUCCESS_AURA_MAG
s.failure_aura_radius = sit_constants.MED_EVIL_FAILURE_AURA_RADIUS
s.failure_aura_magnitude = sit_constants.MED_EVIL_FAILURE_AURA_MAG
s.success_money = sit_constants.MED_EVIL_SUCCESS_MONEY
s.failure_money = sit_constants.MED_EVIL_FAILURE_MONEY
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

   return result
end
--
