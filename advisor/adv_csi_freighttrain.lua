--------------------------------------------
--Freight Train missions -Super Seat Belt Fabric For Space Ships! -good
-------------------------------------------
s = create_advice_citysituation('0c1431f8')
s.title = "text@6C154441"
--
s.message = [[text@06C15427]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW 
s.automata_list = automata_groups.standard_freight_engine -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.FreightRail
}
--
s.condition = sit_conditions.REACH_TARGET
s.create_target = false
s.success_distance = sit_constants.SUCCESS_DISTANCE_SHORT
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_SHORT
s.use_lot_boundary = true
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
--
s.success_text = [[text@EC154543]]
s.reward_unlocked_text    = [[text@ec195bb1]]
s.reward_progress_text = [[text@4C193E67]]
s.reward_guid  = hex2dec('03840000') --shuttle launch pad
s.failure_text = [[text@2C15454C]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="sc4game.automata.get_source_building_count(building_groups.FreightRail) > 1 and (sc4game.sitmgr.get_success_count('2c1725c1') > 0 or sc4game.sitmgr.get_success_count('4c4694f6') > 0) and game.g_rail_tile_count > 20" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.success_image = sit_constants.SITUATION_Reward_Shuttle_Launch_Pad
s.failure_image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
--s.evil_twin = hex2dec('4c1431fe') --Destroy Super Seat Belt Fabric Shipment ; removed
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

   result = 15 + (distToTarget / maxSpeed) * 15

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
--Freight Train missions -Freight Train Station Tour -good
-------------------------------------------
s = create_advice_citysituation('cc14320d')
s.title = "text@6C154443"
--
s.message = [[text@06C15429]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.standard_freight_engine -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.FreightRail,
   building_groups.FreightRail,
   building_groups.FreightRail


}
s.progress_text = { 
[[text@4C15830B]],
[[text@4C15830B]]
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
s.success_text = [[text@EC154545]]
s.reward_unlocked_text    = [[text@EC193CEC]]
s.reward_guid  = hex2dec('03980000') --Grand rail station
s.failure_text = [[text@2C15454E]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="sc4game.automata.get_source_building_count(building_groups.FreightRail) > 3 and (sc4game.sitmgr.get_success_count('2c1725c1') > 0 or sc4game.sitmgr.get_success_count('4c4694f6') > 0) and game.g_rail_tile_count > 20" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.success_image = sit_constants.SITUATION_Reward_Grand_Railroad_Station
s.failure_image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
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

   result = 15 + (distToTarget / maxSpeed) * 15

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return result
end
--

