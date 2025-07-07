-----------------------------------------------------------------
-- Passenger Train missions - Whistle Stop Tour-good
------------------------------------------------
s = create_advice_citysituation('ec143370')
s.title = "text@6C15443D"
--
s.message = [[text@06C15423]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.commute_train_engine -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.PassengerRail,
   building_groups.PassengerRail,
   building_groups.PassengerRail

}
s.progress_text = { 
[[text@4C158305]],
[[text@0C154536]]
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
s.success_text = [[text@EC15453F]]
s.reward_unlocked_text    = [[text@EC193CEA]]
s.reward_guid  = hex2dec('032D0000') --tourist trap
s.failure_text = [[text@2C154548]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="sc4game.automata.get_source_building_count(building_groups.PassengerRail) > 3 and (sc4game.sitmgr.get_success_count('2c1725c1') > 0 or sc4game.sitmgr.get_success_count('4c4694f6') > 0) and game.g_rail_tile_count > 20" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_CITY_PLANNING
s.success_image = sit_constants.SITUATION_Reward_Tourist_Trap
s.failure_image = sit_constants.SITUATION_IMAGE_CITY_PLANNING
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('6c143375') --Hijack the Train
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

   result = 15 + (distToTarget / maxSpeed) * 12

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return result
end
--
-------------------------------------------
-- Passenger Train missions - Hijack the Train-evil
------------------------------------------------
s = create_advice_citysituation('6c143375')
s.title = "text@6C15443E"
--
s.message = [[text@06C15424]]
--
s.priority= tuning_constants.ADVICE_PRIORITY_LOW 
s.automata_list = automata_groups.commute_train_engine -- sit_constants.lua
--
s.condition = sit_conditions.ESCAPE_CITY -- sit_constants.lua
s.create_target = true -- always set true for automata, and false for buildings
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
s.evade_list = automata_groups.police_helicopter -- sit_constants.lua
s.evade_distance = sit_constants.EVADE_DISTANCE_LONG
s.evade_timeout = 10
--
s.success_text = [[text@EC154540]]
s.failure_text = [[text@2C154549]]
--
s.trigger="(game.reward_instance_count(special_buildings.DeluxePoliceStation) > 0) and sc4game.automata.get_source_building_count(building_groups.PassengerRail) > 0 and (sc4game.sitmgr.get_success_count('2c1725c1') > 0 or sc4game.sitmgr.get_success_count('4c4694f6') > 0) and game.g_rail_tile_count > 20"-- adv_game_data.lua
s.frequency = sit_constants.FREQUENCY_SHORT
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.success_image = sit_constants.SITUATION_IMAGE_DR_VU
s.failure_image = sit_constants.SITUATION_IMAGE_DR_VU
s.mood = advice_moods.NEUTRAL
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('ec143370') --Whistle Stop Tour
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
   return 0
end
--