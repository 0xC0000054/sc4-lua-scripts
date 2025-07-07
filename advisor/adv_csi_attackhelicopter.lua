----------------------------------
--Attack Helicopter Missions -- Take Out Dr. Vu's "Secret" Lair - good
-----------------------------------
s = create_advice_citysituation('2c14348d')
s.title = "text@6C154452"
--
s.message = [[text@06C15438]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW 
s.automata_list = automata_groups.military_helicopter -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.INDUSTRIAL
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
s.success_text = [[text@EC154554]]
s.reward_unlocked_text    = [[text@EC193CF4]]
s.reward_guid  = hex2dec('032F0000') --advance research center
s.failure_text = [[text@2C15455D]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="game.g_city_i_population	> 100 and game.reward_instance_count(special_buildings.ArmyBase) > 0 and (sc4game.sitmgr.get_success_count('ac1726c8') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_SAFETY 
s.success_image = sit_constants.SITUATION_Reward_Advanced_Research_Center
s.failure_image = sit_constants.SITUATION_IMAGE_SAFETY 
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('6c143492') -- Raid on #city#
--hard
s.success_aura_radius  = sit_constants.HAR_GOOD_SUCCESS_AURA_RADIUS
s.success_aura_magnitude = sit_constants.HAR_GOOD_SUCCESS_AURA_MAG
s.failure_aura_radius = sit_constants.HAR_GOOD_FAILURE_AURA_RADIUS
s.failure_aura_magnitude = sit_constants.HAR_GOOD_FAILURE_AURA_MAG
--s.success_money = sit_constants.HAR_GOOD_SUCCESS_MONEY
--s.failure_money = sit_constants.HAR_GOOD_FAILURE_MONEY
s.success_effect = sit_constants.SUCCESS_EFFECTMAYRAT
--s.success_effect = sit_constants.SUCCESS_EFFECTMONEY
--s.success_effect = sit_constants.SUCCESS_EFFECTMAYRAT_MONEY
s.failure_effect = sit_constants.FAILURE_EFFECT
--s.failure_effect = sit_constants.FAILURE_EFFECTMONEY
--
function s:get_time_limit(distToTarget, maxSpeed)
   local result

   result = 15 + (distToTarget / maxSpeed) * 8

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return result
end
--
----------------------------------
--Attack Helicopter Missions -- Raid on #city# [can name your city Bungling Bay for PR screen shot] - evil
-----------------------------------
s = create_advice_citysituation('6c143492')
s.title = "text@6C154453"
--
s.message = [[text@06C15439]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW 
s.automata_list = automata_groups.military_helicopter -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.WATER,
   building_groups.MAYOR_HOUSE,
   building_groups.RAIL
}
s.progress_text = { 
[[text@4C15831B]],
[[text@0C15454C]],
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
s.success_text = [[text@EC154555]]
s.failure_text = [[text@2C15455E]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="game.g_train_station_count > 0 and game.g_water_source_count > 0 and game.reward_instance_count(special_buildings.ArmyBase) > 0 and game.reward_instance_count(special_buildings.MayorHouse) > 0 and (sc4game.sitmgr.get_success_count('ac1726c8') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.success_image = sit_constants.SITUATION_IMAGE_DR_VU
s.failure_image = sit_constants.SITUATION_IMAGE_DR_VU
s.mood = advice_moods.NEUTRAL
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('2c14348d') --Take Out Dr. Vu's "Secret" Lair
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

   result = 15 + (distToTarget / maxSpeed) * 8

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return result
end
--
