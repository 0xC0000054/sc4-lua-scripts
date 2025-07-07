-------------------------------------
--Mayor mission - You CAN throw money at it -good
---------------------------------------
s = create_advice_citysituation('cc0f0c82')
s.title = "text@6C15442A"
--
s.message = [[text@06C15410]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.mayor_limo -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.COMMERCIAL
}
--
s.condition = sit_conditions.REACH_TARGET
s.create_target = false
s.success_distance =  sit_constants.SUCCESS_DISTANCE_SHORT
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_SHORT
s.use_lot_boundary = true
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
s.service_mission = true
--s.evade_list = { automata_groups.getaway_van }
--s.evade_distance = sit_constants.EVADE_DISTANCE_SHORT
--s.evade_timeout = sit_constants.EVADE_TIMEOUT_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
--
s.success_text = [[text@EC15452C]]
s.reward_unlocked_text    = [[text@2c2389d2]]
s.reward_guid  = hex2dec('03C00000') --cityhall phase 1
s.failure_text = [[text@2C154535]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="(game.reward_instance_count(special_buildings.MayorHouse) > 0) and game.g_city_c_population > 50 and (sc4game.sitmgr.get_success_count('8c151efd') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_CITY_PLANNING 
s.success_image = sit_constants.SITUATION_Reward_City_Hall_1
s.failure_image = sit_constants.SITUATION_IMAGE_CITY_PLANNING 
s.mood = advice_moods.ALARM --was great_job
s.failure_mood = advice_moods.BAD_JOB --was bad job
s.evil_twin = hex2dec('ac0f0c7f') --Teach the Strikers A Lesson
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
--
function s:get_time_limit(distToTarget, maxSpeed)
   local result

   result = 15 + (distToTarget / maxSpeed) * 4

   -- limit to min/max
   if (result < 15) then
      result = 15
  -- elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return result
end
--
function s:init()
   local target
   target = sc4game.sitmgr.get_current_target()
   sc4game.automata.attach_controller_group("striking_education", target);
end
--
function s:on_success()
   local target
   target = sc4game.sitmgr.get_current_target()
   sc4game.automata.detach_controller_group("striking_education", target);
end
--
function s:on_failure()
   local target
   target = sc4game.sitmgr.get_current_target()
   sc4game.automata.detach_controller_group("striking_education", target);
end
-------------------------------------------------
--Mayor mission - High Roller in Town -evil
-------------------------------------------------
s = create_advice_citysituation('ac1715fa')
s.title = "text@6C15442B"
--
s.message = [[text@06C15411]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.mayor_limo -- sit_constants.lua
s.condition = sit_conditions.CELL_COVERAGE
--s.service_mission = true
--
s.success_text = [[text@EC15452D]]
s.reward_unlocked_text    = [[text@EC193CDC]]
s.reward_guid  = hex2dec('033A0000') --casino
s.failure_text = [[text@2C154536]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="(game.reward_instance_count(special_buildings.MayorHouse) > 0) and (sc4game.sitmgr.get_success_count('8c151efd') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_CITY_PLANNING 
s.success_image = sit_constants.SITUATION_Reward_Casino
s.failure_image = sit_constants.SITUATION_IMAGE_CITY_PLANNING 
s.mood = advice_moods.NEUTRAL --was great_job
s.failure_mood = advice_moods.BAD_JOB --was bad job
s.coverage_cells_min   = 10
s.coverage_cells_max   = 10
s.coverage_type = sit_coverage_type.UNZONED_LAND
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
s.active_radius = 4
--s.coverage_lot = building_groups.CEMETARY
--s.coverage_zone = zone_tool_types.INDUSTRIAL_RES     
--s.coverage_network = network_types.OVER_GROUND
--s.coverage_rect = { 30, 30, 35, 35, }
s.evil_twin = hex2dec('4c224c4a') --Mayor #mayor# Visits Landmark
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

   result = 15 + (distToTarget / maxSpeed) * 4.5

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return result
end
--
---------------------------------
--Mayor mission - Mayor #mayor# Visits Landmark -good
-------------------------------------------------
s = create_advice_citysituation('4c224c4a')
s.title = "text@4c1fe933"
--
s.message = [[text@ec224c63]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.mayor_limo -- sit_constants.lua
s.target_list = {    -- adv_const.lua
   building_groups.LANDMARK
}
--
s.condition = sit_conditions.REACH_TARGET
s.create_target = false
s.success_distance =  sit_constants.SUCCESS_DISTANCE_SHORT
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_SHORT
s.use_lot_boundary = true
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.service_mission = true
--s.evade_list = { automata_groups.getaway_van }
--s.evade_distance = sit_constants.EVADE_DISTANCE_SHORT
--s.evade_timeout = sit_constants.EVADE_TIMEOUT_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
--
s.success_text = [[text@0c1fe939]]
s.failure_text = [[text@8c1fe949]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="(sc4game.automata.get_source_building_count(building_groups.LANDMARK) > 0) and (game.reward_instance_count(special_buildings.MayorHouse) > 0) and (sc4game.sitmgr.get_success_count('8c151efd') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_CITY_PLANNING
s.success_image = sit_constants.SITUATION_Reward_Mayors_Statue
s.failure_image = sit_constants.SITUATION_IMAGE_CITY_PLANNING
s.mood = advice_moods.NEUTRAL --was great_job
s.failure_mood = advice_moods.BAD_JOB --was bad job
s.evil_twin = hex2dec('ac1715fa') --High Roller in Town
--easy
s.success_aura_radius  = sit_constants.GOOD_SUCCESS_AURA_RADIUS
s.success_aura_magnitude = sit_constants.GOOD_SUCCESS_AURA_MAG
s.failure_aura_radius = sit_constants.GOOD_FAILURE_AURA_RADIUS
s.failure_aura_magnitude = sit_constants.GOOD_FAILURE_AURA_MAG
--s.success_money = sit_constants.GOOD_SUCCESS_MONEY
--s.failure_money = sit_constants.GOOD_FAILURE_MONEY
s.success_effect = sit_constants.SUCCESS_EFFECTMAYRAT
--s.success_effect = sit_constants.SUCCESS_EFFECTMONEY
--s.success_effect = sit_constants.SUCCESS_EFFECTMAYRAT_MONEY
s.failure_effect = sit_constants.FAILURE_EFFECT
--s.failure_effect = sit_constants.FAILURE_EFFECTMONEY
--
function s:get_time_limit(distToTarget, maxSpeed)
   local result

   result = 15 + (distToTarget / maxSpeed) * 4.5

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return result
end
--
---------------------------------
--Mayor mission - Ribbon Cutting for #mayor# -good
-------------------------------------------------
s = create_advice_citysituation('2c27a845')
s.title = "text@4c23c02a"
--
s.message = [[text@4c23c043]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.mayor_limo -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.COMMERCIAL,
   building_groups.COMMERCIAL,
   building_groups.COMMERCIAL,
   building_groups.COMMERCIAL,
}
s.progress_text = { 
[[text@ec27a8c8]],
[[text@ec27a8c8]],
[[text@ec27a8c8]]
}
--
s.condition = sit_conditions.REACH_TARGET
s.create_target = false
s.success_distance =  sit_constants.SUCCESS_DISTANCE_SHORT
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_SHORT
s.use_lot_boundary = true
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.service_mission = true
--s.evade_list = { automata_groups.getaway_van }
--s.evade_distance = sit_constants.EVADE_DISTANCE_SHORT
--s.evade_timeout = sit_constants.EVADE_TIMEOUT_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
--
s.success_text = [[text@8c23c049]]
s.failure_text = [[text@cc23c051]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="game.g_city_c_population > 200 and (game.reward_instance_count(special_buildings.MayorHouse) > 0) and (sc4game.sitmgr.get_success_count('8c151efd') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_CITY_PLANNING
s.success_image = sit_constants.SITUATION_IMAGE_CITY_PLANNING
s.failure_image = sit_constants.SITUATION_IMAGE_CITY_PLANNING
s.mood = advice_moods.NEUTRAL 
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB 
--med
s.success_aura_radius  = sit_constants.MED_GOOD_SUCCESS_AURA_RADIUS
s.success_aura_magnitude = sit_constants.MED_GOOD_SUCCESS_AURA_MAG
s.failure_aura_radius = sit_constants.MED_GOOD_FAILURE_AURA_RADIUS
s.failure_aura_magnitude = sit_constants.MED_GOOD_FAILURE_AURA_MAG
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

   result = 15 + (distToTarget / maxSpeed) * 4.5

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return result
end
--