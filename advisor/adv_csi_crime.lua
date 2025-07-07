
--------------------------------------------
-- CRIME Missions - Carjacking - evil
--------------------------------------------
s = create_advice_citysituation('4bb154d3')
s.title = "text@0bb5bbd3"
--
s.message = [[text@6bb5bbfc]]
--
s.priority= tuning_constants.ADVICE_PRIORITY_LOW 
s.automata_list = automata_groups.cheap_cars -- sit_constants.lua
--
s.condition = sit_conditions.ESCAPE_CITY -- sit_constants.lua
s.create_target = true -- always set true for automata, and false for buildings
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
s.evade_list = automata_groups.patrol_car -- sit_constants.lua
s.evade_distance = sit_constants.EVADE_DISTANCE_SHORT
s.evade_timeout = 10
--s.time_limit = sit_constants.TIME_LIMIT_LONG
--
s.success_text = [[text@0bb5bc1c]]
s.failure_text = [[text@6bb5bc34]]
--
s.trigger="(game.g_police_station_count > 0) and (game.g_city_c_population > 50) and (sc4game.sitmgr.get_success_count('8c151efd') > 0)"-- adv_game_data.lua
s.frequency = sit_constants.FREQUENCY_SHORT
s.evil_twin = hex2dec('8bb154fb') -- Carjacking
--
s.image = sit_constants.SITUATION_IMAGE_SAFETY
s.success_image = sit_constants.SITUATION_IMAGE_SAFETY
s.failure_image = sit_constants.SITUATION_IMAGE_SAFETY
s.mood = advice_moods.ALARM
s.success_mood = advice_moods.ALARM
s.failure_mood = advice_moods.NEUTRAL
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
   return 0
end
--
-------------------------------------------------------------------
-- CRIME Mission -  Bank robbery - evil
--------------------------------------------
s = create_advice_citysituation('abb15508')
s.title = "text@6c154434"
--
s.message = [[text@4bbe528d]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.getaway_van
--
s.condition = sit_conditions.ESCAPE_CITY
s.create_target = true
s.evade_list = { automata_groups.police_helicopter, automata_groups.patrol_car }
s.evade_distance = sit_constants.EVADE_DISTANCE_LONG
s.evade_timeout = 10
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_LONG
--
s.success_text = [[text@abbd380b]]
s.failure_text = [[text@4bbd37e6]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="(game.reward_instance_count(special_buildings.DeluxePoliceStation) > 0) and (game.g_city_c_population > 50) and (sc4game.sitmgr.get_success_count('8c151efd') > 0)"
s.image = sit_constants.SITUATION_IMAGE_BANK_ROBBERY
s.success_image = sit_constants.SITUATION_SUCCESSFUL_ROBBERY
s.failure_image = sit_constants.SITUATION_IMAGE_POLICE_ARREST
s.failure_mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('0bb15510')
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
   return 0
end
--
function s:on_failure()
   -- play bust animation on the getaway van
   local auto
   auto = sc4game.sitmgr.get_active_auto()
   auto.automata_attach_anim(automata.MODEL_TYPE_ID, automata.MODEL_GROUP_ID, hex2dec('0x117B0000'))
end


-------------------------------------------------------------------


