----------------------------------
--News Helicopter Missions-Cover the Hostage Crisis - good
-----------------------------------
s = create_advice_citysituation('8c03ec4a')
s.title = "text@6C154454"
--
s.message = [[text@06C1543A]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW 
s.automata_list = automata_groups.news_helicopter -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.COMMERCIAL, --CO$$$ HD
   building_groups.RESIDENTIAL,
}
s.progress_text = { 
[[text@4C15831C]]
}
--
s.condition = sit_conditions.REACH_TARGET
s.create_target = false
s.success_distance =  sit_constants.SUCCESS_DISTANCE_MEDIUM
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_AIR
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
--s.use_lot_boundary = true
s.active_radius = 16
--
s.success_text = [[text@EC154556]]
s.reward_unlocked_text    = [[text@ec1965de]]
s.reward_guid  = hex2dec('03330000') --radio station
s.failure_text = [[text@2C15455F]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="game.g_city_r_population > 50 and game.g_city_c_population > 50 and (sc4game.sitmgr.get_success_count('ac1726c8') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_SAFETY 
s.success_image = sit_constants.SITUATION_Reward_Radio_Station
s.failure_image = sit_constants.SITUATION_IMAGE_SAFETY 
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('4c142f8a') --Get the Perp's Story
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

   result = 15 + (distToTarget / maxSpeed) * 6

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
--News Helicopter Missions-Get the Perp's Story - evil
-----------------------------------
s = create_advice_citysituation('4c142f8a')
s.title = "text@6C154455"
--
s.message = [[text@06C1543B]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW 
s.automata_list = automata_groups.news_helicopter -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.COMMERCIAL,
   building_groups.TV_STATION
}
s.progress_text = { 
[[text@4C15831D]]
}
--
s.condition = sit_conditions.REACH_TARGET
s.create_target = false
s.success_distance =  sit_constants.SUCCESS_DISTANCE_MEDIUM
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_AIR
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
--s.use_lot_boundary = true
s.active_radius = 16
--
s.success_text = [[text@EC154557]]
s.failure_text = [[text@2C154560]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="game.g_city_c_population > 50 and (game.reward_instance_count(special_buildings.TV_Station) > 0) and (sc4game.sitmgr.get_success_count('ac1726c8') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_HEALTH_EDUCATION
s.success_image = sit_constants.SITUATION_IMAGE_HEALTH_EDUCATION
s.failure_image = sit_constants.SITUATION_IMAGE_HEALTH_EDUCATION
s.mood = advice_moods.NEUTRAL
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.GREAT_JOB
s.evil_twin = hex2dec('8c03ec4a') --Cover the Hostage Crisis 
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

   result = 15 + (distToTarget / maxSpeed) * 6

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return result
end
--