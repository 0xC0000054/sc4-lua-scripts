---------------------------------------------------
-- Driving tutorials Missions - Car-Road Vehicle Training Mission
----------------------------------------------------
s = create_advice_citysituation('8c151efd')
s.title = "text@6C15441E"
--
s.message = [[text@EBBE5283]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.civilian_cars -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.RESIDENTIAL
}
--
s.condition = sit_conditions.REACH_TARGET
s.create_target = false
s.success_distance =  sit_constants.SUCCESS_DISTANCE_MEDIUM
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_SHORT
s.use_lot_boundary = true
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.service_mission = true
--s.evade_list = { automata_groups.getaway_van }
--s.evade_distance = sit_constants.EVADE_DISTANCE_SHORT
--s.evade_timeout = sit_constants.EVADE_TIMEOUT_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_LONG
--
s.success_text = [[text@EC154520]]
s.failure_text = [[text@2C154529]]
--
s.frequency = sit_constants.FREQUENCY_FIRST
s.trigger="(sc4game.sitmgr.get_success_count('8c151efd') == 0) and game.g_city_r_population > 0" -- adv_game_data.lua
s.training_mission = true
s.image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.success_image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.failure_image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.mood = advice_moods.NEUTRAL
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
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
---------------------------------------------------
-- Driving tutorials Missions - Tank-Tank Training Mission
----------------------------------------------------
s = create_advice_citysituation('0c151f05')
s.title = "text@6C154430"
--
s.message = [[text@06C15416]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.army_tank -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.RESIDENTIAL
}
--
s.condition = sit_conditions.TARGET_DESTROYED
s.create_target = false
s.success_distance =  sit_constants.SUCCESS_DISTANCE_SHORT
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_SHORT
--s.use_lot_boundary = true
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.service_mission = true
--s.evade_list = { automata_groups.getaway_van }
--s.evade_distance = sit_constants.EVADE_DISTANCE_SHORT
--s.evade_timeout = sit_constants.EVADE_TIMEOUT_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_LONG
--
s.success_text = [[text@EC154532]]
s.failure_text = [[text@2C15453B]]
--
s.frequency = sit_constants.FREQUENCY_FIRST
s.trigger="(sc4game.sitmgr.get_success_count('0c151f05') == 0) and game.g_city_r_population > 0 and game.reward_instance_count(special_buildings.ArmyBase) > 0" -- adv_game_data.lua
s.training_mission = true
s.image = sit_constants.SITUATION_IMAGE_SAFETY
s.success_image = sit_constants.SITUATION_IMAGE_SAFETY
s.failure_image = sit_constants.SITUATION_IMAGE_SAFETY
s.mood = advice_moods.NEUTRAL
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
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
---------------------------------------------------
-- Driving tutorials Missions - Freight-Train Training Mission
----------------------------------------------------
s = create_advice_citysituation('2c1725c1')
s.title = "text@6C15443B"
--
s.message = [[text@06C15421]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = { automata_groups.freight_train_engine } -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.FreightRail
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
--s.time_limit = sit_constants.TIME_LIMIT_LONG
--
s.success_text = [[text@EC15453D]]
s.failure_text = [[text@2C154546]]
--
s.frequency = sit_constants.FREQUENCY_FIRST
s.trigger="(sc4game.sitmgr.get_success_count('2c1725c1') == 0) and (sc4game.sitmgr.get_success_count('4c4694f6') == 0) and (sc4game.automata.get_source_building_count(building_groups.FreightRail) > 0) and game.g_rail_tile_count > 20" -- adv_game_data.lua
s.training_mission = true
s.image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.success_image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.failure_image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.mood = advice_moods.NEUTRAL
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
--
function s:get_time_limit(distToTarget, maxSpeed)
   return 600 -- ten minutes
end
--


---------------------------------------------------
-- Driving tutorials Missions - Passenger-Train Training Mission
----------------------------------------------------
s = create_advice_citysituation('4c4694f6')
s.title = "text@6C15443B"
--
s.message = [[text@06C15421]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = { automata_groups.commute_train_engine } -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.PassengerRail
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
--s.time_limit = sit_constants.TIME_LIMIT_LONG
--
s.success_text = [[text@EC15453D]]
s.failure_text = [[text@2C154546]]
--
s.frequency = sit_constants.FREQUENCY_FIRST
s.trigger="(sc4game.sitmgr.get_success_count('2c1725c1') == 0) and (sc4game.sitmgr.get_success_count('4c4694f6') == 0) and (sc4game.automata.get_source_building_count(building_groups.PassengerRail) > 0) and game.g_rail_tile_count > 20" -- adv_game_data.lua
s.training_mission = true
s.image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.success_image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.failure_image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.mood = advice_moods.NEUTRAL
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
--
function s:get_time_limit(distToTarget, maxSpeed)
   return 600 -- ten minutes
end
--

---------------------------------------------------
-- Driving tutorials Missions - Aircraft Training Mission
----------------------------------------------------
s = create_advice_citysituation('ac1726c8')
s.title = "text@4c336489"
--
s.message = [[text@06C15434]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = { automata_groups.police_helicopter, automata_groups.military_helicopter, automata_groups.medical_helicopter, automata_groups.news_helicopter, automata_groups.sky_writer, automata_groups.crop_duster, automata_groups.sky_diver} -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.RESIDENTIAL
}
--
s.condition = sit_conditions.REACH_TARGET
s.create_target = false
s.success_distance =  sit_constants.SUCCESS_DISTANCE_MEDIUM
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_AIR
--s.use_lot_boundary = true
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.service_mission = true
--s.evade_list = { automata_groups.getaway_van }
--s.evade_distance = sit_constants.EVADE_DISTANCE_SHORT
--s.evade_timeout = sit_constants.EVADE_TIMEOUT_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_LONG
s.active_radius = 32
--
s.success_text = [[text@EC154550]]
s.failure_text = [[text@2C154559]]
--
s.frequency = sit_constants.FREQUENCY_FIRST
s.trigger="(sc4game.sitmgr.get_success_count('ac1726c8') == 0) and game.g_city_r_population > 0" -- adv_game_data.lua
s.training_mission = true
s.image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.success_image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.failure_image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.mood = advice_moods.NEUTRAL
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
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

   return result
end
--
--------------------------------------
-- Driving tutorials Missions - Boat Training Mission-good
----------------------------------------------------
s = create_advice_citysituation('cc1730cf')
s.title = "text@6C154463"
--
s.message = [[text@06C15449]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = { automata_groups.tug_boat, automata_groups.fishing_boat, automata_groups.off_shore, automata_groups.motor_boat, automata_groups.yacht, automata_groups.speed_boat,automata_groups.ferry_boat,automata_groups.passengerferry_boat } -- sit_constants.lua
s.condition = sit_conditions.CELL_COVERAGE
--s.service_mission = true
--
s.success_text = [[text@EC154565]]
s.failure_text = [[text@2C15456E]]
--
s.frequency = sit_constants.FREQUENCY_FIRST
--s.time_limit = sit_constants.TIME_LIMIT_LONG
s.trigger="(sc4game.sitmgr.get_success_count('cc1730cf') == 0) and ((game.reward_instance_count(special_buildings.Marina) > 0) or game.g_car_ferry_count	> 0 or game.g_passenger_ferry_count > 0)" -- adv_game_data.lua
s.training_mission = true
s.coverage_success_count = 1
s.image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.success_image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.failure_image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.mood = advice_moods.NEUTRAL
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
s.coverage_cells_min   = 1
s.coverage_cells_max   = 1
s.coverage_type = sit_coverage_type.UNZONED_WATER
s.min_target_distance = MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = MAX_TARGET_DISTANCE_SHORT
--s.coverage_lot = building_groups.CEMETARY
--s.coverage_zone = zone_tool_types.INDUSTRIAL_RES     
--s.coverage_network = network_types.OVER_GROUND
--s.coverage_rect = { 30, 30, 35, 35, }
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