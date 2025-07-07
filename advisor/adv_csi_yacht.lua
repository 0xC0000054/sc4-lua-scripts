--------------------------------------
-- Yacht boat Missions - Rare fish-bad
----------------------------------------------------
s = create_advice_citysituation('6c1e52d7')
s.title = "text@6c196752"
--
s.message = [[text@2c196769]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.yacht -- sit_constants.lua
s.condition = sit_conditions.CELL_COVERAGE
--s.service_mission = true
--
s.success_text = [[text@EC154570]]
s.reward_unlocked_text    = [[text@EC193D07]]
s.reward_guid  = hex2dec('03270000') --country club
s.failure_text = [[text@ac1d3653]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="(game.reward_instance_count(special_buildings.Marina) > 0) and (sc4game.sitmgr.get_success_count('cc1730cf') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.success_image = sit_constants.SITUATION_Reward_Country_Club
s.failure_image = sit_constants.SITUATION_IMAGE_DR_VU
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
s.coverage_cells_min   = 200
s.coverage_cells_max   = 200
s.coverage_type = sit_coverage_type.UNZONED_WATER
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_BOAT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
s.active_radius = 2
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

   result = 15 + (distToTarget / maxSpeed) * 6

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return 300
end
--