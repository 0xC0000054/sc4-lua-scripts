----------------------------------------
--UFO Missions-Abduct Sims - evil
-----------------------------------
s = create_advice_citysituation('cc143635')
s.title = "text@6C15445F"
--
s.message = [[text@06C15445]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW 
s.automata_list = automata_groups.ufo -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.RESIDENTIAL,
   building_groups.COMMERCIAL,
   building_groups.INDUSTRIAL
}
s.progress_text = { 
[[text@4C158327]],
[[text@0C154558]]
}
--
s.condition = sit_conditions.REACH_TARGET
s.create_target = false
s.success_distance = sit_constants.SUCCESS_DISTANCE_SHORT
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_SHORT
s.service_mission = true
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
s.use_lot_boundary = true
s.active_radius = 16
--
s.success_text = [[text@EC154561]]
s.failure_text = [[text@2C15456A]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="game.g_city_r_population > 50 and game.g_city_c_population > 50 and game.g_city_i_population > 50 and game.reward_instance_count(special_buildings.Area51) > 0 and (sc4game.sitmgr.get_success_count('ac1726c8') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.success_image = sit_constants.SITUATION_IMAGE_DR_VU
s.failure_image = sit_constants.SITUATION_IMAGE_DR_VU
s.mood = advice_moods.NEUTRAL
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
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
   elseif (result > 600) then       -- 600 seconds == ten minutes
      result = 600
   end

   return result
end
--
----------------------------------
--UFO Missions -- Blast-O-Ray - evil
-----------------------------------
s = create_advice_citysituation('0c14363b')
s.title = "text@6C154460"
--
s.message = [[text@06C15446]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW 
s.automata_list = automata_groups.ufo  -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.RESIDENTIAL,
   building_groups.COMMERCIAL,
   building_groups.INDUSTRIAL
}
s.progress_text = { 
[[text@4C158328]],
[[text@0C154559]]
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
s.success_text = [[text@EC154562]]
s.failure_text = [[text@2C15456B]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="game.g_city_r_population > 50 and game.g_city_c_population > 50 and game.g_city_i_population > 50 and game.reward_instance_count(special_buildings.Area51) > 0 and (sc4game.sitmgr.get_success_count('ac1726c8') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.success_image = sit_constants.SITUATION_IMAGE_DR_VU
s.failure_image = sit_constants.SITUATION_IMAGE_DR_VU
s.mood = advice_moods.NEUTRAL
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
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
   local result

   result = 15 + (distToTarget / maxSpeed) * 10

   -- limit to min/max
   if (result < 15) then
      result = 15
   elseif (result > 600) then       -- 600 seconds == ten minutes
      result = 600
   end

   return result
end
--
