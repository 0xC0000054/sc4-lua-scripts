----------------------------------
--Police Helicopter Missions-Nab the Crook from the Air - good
-----------------------------------
s = create_advice_citysituation('cc1435a1')
s.title = "text@6C154456"
--
s.message = [[text@06C1543C]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.police_helicopter
s.target_list = automata_groups.getaway_van
s.pursuit_mission = true
s.evade_list = { automata_groups.police_helicopter }
--
s.condition = sit_conditions.REACH_TARGET
s.create_target = true
s.always_create_target = true
s.success_distance = sit_constants.SUCCESS_DISTANCE_SHORT
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_SHORT
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
s.service_mission = true
s.time_limit = TIME_LIMIT_SHORT
s.active_radius = 8
--
s.success_text = [[text@EC154558]]
s.reward_unlocked_text    = [[text@EC193CF6]]
s.reward_guid  = hex2dec('03340000') --TV station
s.failure_text = [[text@2C154561]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="game.reward_instance_count(special_buildings.DeluxePoliceStation) > 0 and (game.g_city_c_population > 50) and (sc4game.sitmgr.get_success_count('ac1726c8') > 0)"
s.image = sit_constants.SITUATION_IMAGE_SAFETY
s.success_image = sit_constants.SITUATION_Reward_TV_Station
s.failure_image = sit_constants.SITUATION_IMAGE_SAFETY
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('2c1435a8') --Disrupt the Peace
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
   local result

   result = 15 + (distToTarget / maxSpeed) * 15

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return 600
end

function s:on_success()
   local target
   target = sc4game.sitmgr.get_current_target()
   target.fade_out()
end
--

--------------------------------------
--Police Helicopter Missions-Disrupt the Peace - evil
----------------------------------------------------
s = create_advice_citysituation('2c1435a8')
s.title = "text@6C154457"
--
s.message = [[text@06C1543D]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.police_helicopter -- sit_constants.lua
s.condition = sit_conditions.CELL_COVERAGE
s.service_mission = true
s.active_radius = 1
--
s.success_text = [[text@EC154559]]
s.failure_text = [[text@2C154562]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="(game.g_num_rzone_ld_tiles >= 100) and (game.reward_instance_count(special_buildings.DeluxePoliceStation) > 0) and (sc4game.sitmgr.get_success_count('ac1726c8') > 0)"  -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.success_image = sit_constants.SITUATION_IMAGE_DR_VU
s.failure_image = sit_constants.SITUATION_IMAGE_DR_VU
s.mood = advice_moods.NEUTRAL
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('cc1435a1') --Nab the Crook from the Air
--
s.coverage_cells_min   = 20
s.coverage_cells_max   = 20
s.coverage_type = sit_coverage_type.ZONE
s.coverage_zone = zone_tool_types.RESIDENTIAL_LD 
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
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

   result = 15 + (distToTarget / maxSpeed) * 8

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return result
end
--

