-------------------------------------
--Toxic Waste Truck mission - Spread the Mutation -evil
---------------------------------------
s = create_advice_citysituation('2c2545a3')
s.title = "text@2c22b831"
--
s.message = [[text@8c22c8f7]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_MEDIUM
s.automata_list = automata_groups.toxic_carrier -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.RESIDENTIAL,
   building_groups.RESIDENTIAL,
   building_groups.RESIDENTIAL
}
s.progress_text = { 
[[text@4c22cb62]],
[[text@cc27db23]]
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
s.active_radius = 16
--
s.success_text = [[text@2c22cb93]]
s.reward_unlocked_text    = [[text@ec22cbd3]]
s.reward_guid  = hex2dec('03470000') --cemetary (not in adv_const)
s.failure_text = [[text@ec22cbf0]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="(game.reward_instance_count(special_buildings.ToxicWasteDunp) > 0) and game.g_city_r_population > 100 and (sc4game.sitmgr.get_success_count('8c151efd') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.success_image = sit_constants.SITUATION_Reward_Cemetery
s.failure_image = sit_constants.SITUATION_IMAGE_DR_VU
s.mood = advice_moods.NEUTRAL --was great_job
s.failure_mood = advice_moods.BAD_JOB --was bad job
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