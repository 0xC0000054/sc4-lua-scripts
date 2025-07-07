--------------------------------------------
--Steam Train missions -Train Ride for Rocket Formula -good
-------------------------------------------
s = create_advice_citysituation('8c01d0b7')
s.title = "text@6C15443F"
--
s.message = [[text@06C15425]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW 
s.automata_list = automata_groups.steam_train -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.FreightRail
}
--
s.condition = sit_conditions.REACH_TARGET
s.create_target = false
s.success_distance = sit_constants.SUCCESS_DISTANCE_SHORT
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_SHORT
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
s.use_lot_boundary = true
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
--
s.success_text = [[text@EC154541]]
s.reward_unlocked_text    = [[text@ec195bb1]]
s.reward_progress_text    = [[text@4C193E67]]
s.reward_guid  = hex2dec('03840000') --shuttle launch pad
s.failure_text = [[text@2C15454A]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="sc4game.automata.get_source_building_count(building_groups.FreightRail) > 1 and (sc4game.sitmgr.get_success_count('2c1725c1') > 0 or sc4game.sitmgr.get_success_count('4c4694f6') > 0) and game.g_rail_tile_count > 20" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_CITY_PLANNING
s.success_image = sit_constants.SITUATION_Reward_Shuttle_Launch_Pad
s.failure_image = sit_constants.SITUATION_IMAGE_CITY_PLANNING
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('6c1430d1') --Sell Secret Rocket Formula
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

   result = 15 + (distToTarget / maxSpeed) * 12

   -- limit to min/max
   if (result < 15) then
      result = 15
  -- elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return result
end

--------------------------------------------
--Steam Train missions -Sell Secret Rocket Formula -evil
-------------------------------------------
s = create_advice_citysituation('6c1430d1')
s.title = "text@6C154440"
--
s.message = [[text@06C15426]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW 
s.automata_list = automata_groups.steam_train -- sit_constants.lua
--
s.target_sequence = {    -- adv_const.lua
   building_groups.FreightRail
}
--
s.condition = sit_conditions.REACH_TARGET
s.create_target = false
s.success_distance = sit_constants.SUCCESS_DISTANCE_SHORT
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_SHORT
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
s.use_lot_boundary = true
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
s.evade_list = automata_groups.police_helicopter -- sit_constants.lua
s.evade_distance = sit_constants.EVADE_DISTANCE_LONG
s.evade_timeout = 10
--
s.success_text = [[text@EC154542]]
s.reward_unlocked_text    = [[text@EC193CEB]]
s.reward_progress_text = [[text@4C193E68]]
s.reward_guid  = hex2dec('03960000') --Area 5.1
s.failure_text = [[text@CC1026A5]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="sc4game.automata.get_source_building_count(building_groups.FreightRail) > 1 and (sc4game.sitmgr.get_success_count('2c1725c1') > 0 or sc4game.sitmgr.get_success_count('4c4694f6') > 0) and game.g_num_rail_neighbors > 0 and game.g_rail_tile_count > 20 and (game.reward_instance_count(special_buildings.DeluxePoliceStation) > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.success_image = sit_constants.SITUATION_Reward_Area_Control_Tower
s.failure_image = sit_constants.SITUATION_IMAGE_DR_VU
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('8c01d0b7') --Train Ride for Rocket Formula
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

   result = 15 + (distToTarget / maxSpeed) * 12

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return result
end
