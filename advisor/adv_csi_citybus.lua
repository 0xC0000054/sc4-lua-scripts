------------------------------------------------------
--City Bus- Sick Driver-good
-------------------------------------------
s = create_advice_citysituation('8c0adc22')
s.title = "text@6C15442C"
--
s.message = [[text@06C15412]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.bus -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.BUS,
   building_groups.BUS,
   building_groups.BUS,
   building_groups.BUS
}
s.progress_text = { 
[[text@4C1580EC]],
[[text@4C1580EC]],
[[text@0C154525]]
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
s.success_text = [[text@EC15452E]]
s.reward_unlocked_text    = [[text@EC193CDD]]
s.reward_guid  = hex2dec('03430000') --convention center
s.failure_text = [[text@2C154537]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="game.g_bus_station_count > 3 and (sc4game.sitmgr.get_success_count('8c151efd') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.success_image = sit_constants.SITUATION_Reward_Convention_Center
s.failure_image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.mood = advice_moods.NEUTRAL --was great_job
s.failure_mood = advice_moods.BAD_JOB --was bad job
s.evil_twin = hex2dec('8c0adce2') --Speedy Bus
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

   result = 15 + (distToTarget / maxSpeed) * 5

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return result
end
--
----------------------------------------
--City Bus- Speedy Bus-evil
-------------------------------------------
s = create_advice_citysituation('8c0adce2')
s.title = "text@6C15442D"
--
s.message = [[text@06C15413]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.bus -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.RESIDENTIAL,
   building_groups.BUS
}
s.progress_text = { 
[[text@4C1580ED]]
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
s.evade_list = { automata_groups.patrol_car, automata_groups.police_helicopter }
s.evade_distance = sit_constants.EVADE_DISTANCE_LONG
s.evade_timeout = 10
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
--
s.success_text = [[text@EC15452F]]
s.failure_text = [[text@2C154538]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="game.g_bus_station_count > 1 and game.g_city_r_population > 50 and (sc4game.sitmgr.get_success_count('8c151efd') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.success_image = sit_constants.SITUATION_IMAGE_DR_VU
s.failure_image = sit_constants.SITUATION_IMAGE_DR_VU
s.mood = advice_moods.NEUTRAL
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('8c0adc22') --Sick Driver
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

   result = 15 + (distToTarget / maxSpeed) * 5

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return result
end
--