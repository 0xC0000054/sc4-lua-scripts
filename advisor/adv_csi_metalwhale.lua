----------------------------------
--Metal Whale Missions -- Robotic Whale Destruction - evil
-----------------------------------
s = create_advice_citysituation('2c17361d')
s.title = "text@6C15446A"
--
s.message = [[text@06C15450]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.metal_whale-- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.Marina,
   building_groups.SEAPORT
}
--
s.progress_text = { 
[[text@CC1026A6]]
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
s.success_text = [[text@EC15456C]]
s.failure_text = [[text@2C154575]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="game.reward_instance_count(special_buildings.Marina ) > 0  and game.g_seaport_count > 0 and game.reward_instance_count(special_buildings.Area51 ) > 0 and (sc4game.sitmgr.get_success_count('cc1730cf') > 0)" -- adv_game_data.lua
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

   result = 15 + (distToTarget / maxSpeed) * 6

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return 600
end
--