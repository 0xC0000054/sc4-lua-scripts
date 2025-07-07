
-------------------------------------
--IceCream mission - Ice Cream Delivery -good
---------------------------------------
s = create_advice_citysituation('cc1432c8')
s.title = "text@6C154444"
--
s.message = [[text@06C1542A]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.ice_cream -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.SCHOOL_K6,
   building_groups.SCHOOL_K6,
   building_groups.SCHOOL_K6,
}
s.progress_text = { 
[[text@4C15830C]],
[[text@0C15453D]]
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
s.success_text = [[text@EC154546]]
s.reward_unlocked_text    = [[text@EC193CED]]
s.reward_guid  = hex2dec('03360000') --state fair
s.failure_text = [[text@2C15454F]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="sc4game.automata.get_source_building_count(building_groups.SCHOOL_K6) > 2  and (sc4game.sitmgr.get_success_count('8c151efd') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_HEALTH_EDUCATION
s.success_image = sit_constants.SITUATION_Reward_State_Fair
s.failure_image = sit_constants.SITUATION_IMAGE_HEALTH_EDUCATION
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('0c1432d0') --Pure Evil Ice Cream
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
-------------------------------------------
--IceCream mission - Pure Evil Ice Cream -evil
---------------------------------------
s = create_advice_citysituation('0c1432d0')
s.title = "text@6C154445"
--
s.message = [[text@06C1542B]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.ice_cream -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.SCHOOL_K6,
   building_groups.SCHOOL_K6,
   building_groups.SCHOOL_K6
}
s.progress_text = { 
[[text@4C15830D]],
[[text@4C15830D]],
[[text@0C15453D]]
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
s.success_text = [[text@EC154547]]
s.reward_unlocked_text    = [[text@EC193CEB]]
s.reward_progress_text = [[text@4C193E6D]]
s.reward_guid  = hex2dec('03960000') --Area 5.1
s.failure_text = [[text@2C154550]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="sc4game.automata.get_source_building_count(building_groups.SCHOOL_K6) > 2 and  (sc4game.sitmgr.get_success_count('8c151efd') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.success_image = sit_constants.SITUATION_Reward_Area_Control_Tower
s.failure_image = sit_constants.SITUATION_IMAGE_DR_VU
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('cc1432c8') --Ice Cream Delivery
--
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