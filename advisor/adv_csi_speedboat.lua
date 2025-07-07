---------------------------------------------------
-- Speed Boat Missions - Rx Pick-up & Delivery - good
----------------------------------------------------
s = create_advice_citysituation('0c173377')
s.title = "text@6C154466"
--
s.message = [[text@06C1544C]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.speed_boat -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.SEAPORT,
   building_groups.Marina
}
--
s.progress_text = { 
[[text@6c3d3892]]
}
--
s.condition = sit_conditions.REACH_TARGET
s.create_target = false
s.success_distance =  sit_constants.SUCCESS_DISTANCE_BOAT
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_BOAT
s.use_lot_boundary = true
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.service_mission = true
--s.evade_list = { automata_groups.getaway_van }
--s.evade_distance = sit_constants.EVADE_DISTANCE_SHORT
--s.evade_timeout = sit_constants.EVADE_TIMEOUT_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
--
s.success_text = [[text@EC154568]]
s.reward_unlocked_text    = [[text@EC193CFF]]
s.reward_guid  = hex2dec('03810000') --resort hotel
s.failure_text = [[text@2C154571]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="(game.reward_instance_count(special_buildings.Marina) > 0) and game.g_seaport_count > 0 and (sc4game.sitmgr.get_success_count('cc1730cf') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_HEALTH_EDUCATION
s.success_image = sit_constants.SITUATION_Reward_Resort_Hotel
s.failure_image = sit_constants.SITUATION_IMAGE_HEALTH_EDUCATION
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('0c173438') --Dr. Vu's Watery Evil
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
-- Speed Boat Missions - Dr. Vu's Watery Evil - evil
----------------------------------------------------
s = create_advice_citysituation('0c173438')
s.title = "text@6C154467"
--
s.message = [[text@06C1544D]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.speed_boat -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.SEAPORT,
   building_groups.Marina
}
--
s.progress_text = { 
[[text@ec3d38e0]]
}
--
s.condition = sit_conditions.REACH_TARGET
s.create_target = false
s.success_distance =  sit_constants.SUCCESS_DISTANCE_BOAT
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_BOAT
s.use_lot_boundary = true
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.service_mission = true
--s.evade_list = { automata_groups.getaway_van }
--s.evade_distance = sit_constants.EVADE_DISTANCE_SHORT
--s.evade_timeout = sit_constants.EVADE_TIMEOUT_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
--
s.success_text = [[text@EC154569]]
s.reward_unlocked_text    = [[text@EC193D00]]
s.reward_guid  = hex2dec('03BC0000') --cruise ship pier
s.failure_text = [[text@2C154572]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="(game.reward_instance_count(special_buildings.Marina) > 0) and game.g_seaport_count > 0 and (sc4game.sitmgr.get_success_count('cc1730cf') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.success_image = sit_constants.SITUATION_Reward_Cruise_Ship_Pier
s.failure_image = sit_constants.SITUATION_IMAGE_DR_VU
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('0c173377') --Rx Pick-up & Delivery
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