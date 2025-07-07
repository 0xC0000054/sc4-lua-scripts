----------------------------------
--Tank Missions -- Dr. Vu Gets A Tank - evil
-----------------------------------
s = create_advice_citysituation('2c01b4b1')
s.title = "text@CC1026A1"
--
s.message = [[text@CC1026A2]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.army_tank -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.RESIDENTIAL,
   building_groups.POLICE,
   building_groups.MAYOR_HOUSE
}
s.progress_text = { 
[[text@CC1026A6]],
[[text@CC1026A7]]
}
--
s.condition = sit_conditions.TARGET_DESTROYED
s.create_target = false
s.success_distance = sit_constants.SUCCESS_DISTANCE_SHORT
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_SHORT
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
--
s.success_text = [[text@CC1026A4]]
s.reward_unlocked_text    = [[text@CC1026A3]]
s.reward_guid  = hex2dec('033E0000') --movie studio
s.failure_text = [[text@CC1026A5]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="game.g_police_station_count > 0 and game.g_city_r_population > 50 and game.reward_instance_count(special_buildings.MayorHouse) > 0 and game.reward_instance_count(special_buildings.ArmyBase) > 0 and (sc4game.sitmgr.get_success_count('0c151f05') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.success_image = sit_constants.SITUATION_Reward_Movie_Studio
s.failure_image = sit_constants.SITUATION_IMAGE_DR_VU
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('ec151d87') -- New Missle Testing
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

   result = 15 + (distToTarget / maxSpeed) * 4

   -- limit to min/max
   if (result < 15) then
      result = 15
  -- elseif (result > 600) then       -- 600 seconds == ten minutes
     -- result = 600
   end

   return result
end
--
--------------------------------------
-- Tank Missions - New Missle Testing-good
----------------------------------------------------
s = create_advice_citysituation('ec151d87')
s.title = "text@6C154431"
--
s.message = [[text@06C15417]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.army_tank -- sit_constants.lua
s.condition = sit_conditions.CELL_COVERAGE
s.service_mission = true
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
s.active_radius = 8
--
s.success_text = [[text@EC154533]]
s.reward_unlocked_text    = [[text@8c2389dd]]
s.reward_guid  = hex2dec('03420000') --missile testing range
s.failure_text = [[text@2C15453C]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="game.reward_instance_count(special_buildings.ArmyBase) > 0 and (sc4game.sitmgr.get_success_count('0c151f05') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_SAFETY
s.success_image = sit_constants.SITUATION_Reward_Missile_Base
s.failure_image = sit_constants.SITUATION_IMAGE_SAFETY
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
s.coverage_cells_min   = 7
s.coverage_cells_max   = 7
s.coverage_type = sit_coverage_type.UNZONED_LAND
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.coverage_lot = building_groups.CEMETARY
--s.coverage_zone = zone_tool_types.INDUSTRIAL_RES     
--s.coverage_network = network_types.OVER_GROUND
--s.coverage_rect = { 30, 30, 35, 35, }
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

   result = 15 + (distToTarget / maxSpeed) * 6

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
     -- result = 600
   end

   return result
end
--
------------------------------------------------------------
-- Tank Missions - Tank Joy Ride - evil
----------------------------------------------------
s = create_advice_citysituation('6c171769')
s.title = "text@ac168bc0"
--
s.message = [[text@cc168bc7]]
--
s.priority= tuning_constants.ADVICE_PRIORITY_LOW 
s.automata_list = automata_groups.army_tank -- sit_constants.lua
--
s.condition = sit_conditions.ESCAPE_CITY -- sit_constants.lua
s.create_target = true -- always set true for automata, and false for buildings
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
s.evade_list = { automata_groups.police_helicopter, automata_groups.patrol_car } -- sit_constants.lua
s.evade_distance = sit_constants.EVADE_DISTANCE_LONG
s.evade_timeout = 10
--
s.success_text = [[text@2c168bd2]]
s.failure_text = [[text@ec168bdd]]
--
s.trigger="(game.reward_instance_count(special_buildings.DeluxePoliceStation) > 0) and (game.reward_instance_count(special_buildings.ArmyBase) > 0) and (sc4game.sitmgr.get_success_count('0c151f05') > 0)"-- adv_game_data.lua
s.frequency = sit_constants.FREQUENCY_SHORT
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.success_image = sit_constants.SITUATION_IMAGE_DR_VU
s.failure_image = sit_constants.SITUATION_IMAGE_SAFETY
s.mood = advice_moods.NEUTRAL
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
--s.evil_twin = hex2dec('8bb154fb')
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
   return 0
end
--
-------------------------------------------
--Tank mission - Teach the Strikers A Lesson -evil
---------------------------------------
s = create_advice_citysituation('ac0f0c7f')
s.title = "text@6C154432"
--
s.message = [[text@06C15418]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.army_tank -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.COMMERCIAL
}
--
s.condition = sit_conditions.TARGET_DESTROYED
s.create_target = false
s.success_distance =  sit_constants.SUCCESS_DISTANCE_SHORT
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.service_mission = true
--s.evade_list = { automata_groups.getaway_van }
--s.evade_distance = sit_constants.EVADE_DISTANCE_SHORT
--s.evade_timeout = sit_constants.EVADE_TIMEOUT_SHORT
--
s.success_text = [[text@EC154534]]
s.failure_text = [[text@2C15453D]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="(game.reward_instance_count(special_buildings.ArmyBase) > 0) and game.g_city_c_population > 50 and (sc4game.sitmgr.get_success_count('0c151f05') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.success_image = sit_constants.SITUATION_IMAGE_DR_VU
s.failure_image = sit_constants.SITUATION_IMAGE_DR_VU
s.mood = advice_moods.NEUTRAL
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('cc0f0c82') --You CAN throw money at it
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

   result = 15 + (distToTarget / maxSpeed) * 4

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return result
end
--
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
