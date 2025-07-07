--------------------------------------
-- Off-Shore Boat Missions - Jet Ski - good
----------------------------------------------------
s = create_advice_citysituation('8c1d3812')
s.title = "text@8c196749"
--
s.message = [[text@ec196760]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.off_shore -- sit_constants.lua
s.condition = sit_conditions.CELL_COVERAGE
s.service_mission = true
--
s.success_text = [[text@EC15456E]]
s.failure_text = [[text@ac1d3537]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="game.reward_instance_count(special_buildings.Marina) > 0 and (sc4game.sitmgr.get_success_count('cc1730cf') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_CITY_PLANNING
s.success_image = sit_constants.SITUATION_IMAGE_CITY_PLANNING
s.failure_image = sit_constants.SITUATION_IMAGE_CITY_PLANNING
s.mood = advice_moods.NEUTRAL
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
s.coverage_cells_min   = 200
s.coverage_cells_max   = 200
s.coverage_type = sit_coverage_type.UNZONED_WATER
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_BOAT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
s.active_radius = 2
--s.coverage_lot = building_groups.CEMETARY
--s.coverage_zone = zone_tool_types.INDUSTRIAL_RES     
--s.coverage_network = network_types.OVER_GROUND
--s.coverage_rect = { 30, 30, 35, 35, }
--s.evil_twin = hex2dec('0c173438')
--easy
s.success_aura_radius  = sit_constants.GOOD_SUCCESS_AURA_RADIUS
s.success_aura_magnitude = sit_constants.GOOD_SUCCESS_AURA_MAG
s.failure_aura_radius = sit_constants.GOOD_FAILURE_AURA_RADIUS
s.failure_aura_magnitude = sit_constants.GOOD_FAILURE_AURA_MAG
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

   result = 15 + (distToTarget / maxSpeed) * 5

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return 300
end
--

