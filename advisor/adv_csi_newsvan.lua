-----------------------------------------------------------------
-- News Van missions - Mayor's Got New Socks!-good
------------------------------------------------
s = create_advice_citysituation('cc14331d')
s.title = "text@6C154439"
--
s.message = [[text@06C1541F]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.tv_reporter -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.MAYOR_HOUSE
}
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
s.success_text = [[text@EC15453B]]
s.reward_unlocked_text    = [[text@cc195c10]]
s.reward_guid  = hex2dec('03310000') --bureau
s.failure_text = [[text@2C154544]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="(game.reward_instance_count(special_buildings.MayorHouse) > 0) and (game.reward_instance_count(special_buildings.TV_Station) > 0) and (sc4game.sitmgr.get_success_count('8c151efd') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_SAFETY
s.success_image = sit_constants.SITUATION_Reward_Bureau_Of_Bureaucracy
s.failure_image = sit_constants.SITUATION_IMAGE_SAFETY
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
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
-------------------------------------------
-- News Van missions - Paparazzi!-evil
------------------------------------------------
s = create_advice_citysituation('8c143321')
s.title = "text@6C15443A"
--
s.message = [[text@06C15420]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = { automata_groups.tv_reporter }
s.target_list = automata_groups.mayor_limo
--
s.condition = sit_conditions.REACH_TARGET
s.create_target = true
s.success_distance = sit_constants.SUCCESS_DISTANCE_SHORT
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_SHORT
s.min_target_distance = 96
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
--
s.success_text = [[text@EC15453C]]
s.failure_text = [[text@2C154545]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="(game.reward_instance_count(special_buildings.MayorHouse) > 0) and (game.reward_instance_count(special_buildings.TV_Station) > 0) and (sc4game.sitmgr.get_success_count('8c151efd') > 0)"
s.image = sit_constants.SITUATION_IMAGE_SAFETY
s.success_image = sit_constants.SITUATION_IMAGE_SAFETY
s.failure_image = sit_constants.SITUATION_IMAGE_SAFETY
s.mood = advice_moods.NEUTRAL
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.GREAT_JOB
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

   result = 15 + (distToTarget / maxSpeed) * 15

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
     -- result = 600
   end

   return result
end
--