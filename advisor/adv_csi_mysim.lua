-------------------------------------
--MySim mission - Run Some Errands CS$-good
---------------------------------------
s = create_advice_citysituation('ac1433fa')
s.title = "text@6C154446"
--
s.message = [[text@06C1542C]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.mysim_vehicle -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.CS1, --CS$!!!
   building_groups.CS1, --CS$!!!
   building_groups.MYSIM_RESIDENCE
}
s.progress_text = { 
[[text@4C15830E]],
[[text@0C15453F]]
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
s.success_text = [[text@EC154548]]
s.failure_text = [[text@2C154551]]
--
s.frequency = sit_constants.FREQUENCY_MYSIM_SHORT
s.trigger="sc4game.automata.get_source_building_count(building_groups.CS1) >= 2 and mysim.wealth == 1 and mysim.home_building ~= 0 and game.g_city_cs1_population	> 50 and (sc4game.sitmgr.get_success_count('8c151efd') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_Reward_My_Sim_Green
s.success_image = sit_constants.SITUATION_Reward_My_Sim
s.failure_image = sit_constants.SITUATION_Reward_My_Sim_Red
s.evil_twin = hex2dec('0c143400') --Knock Over #getnameofCS$#
s.mysim_mission = true
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

   result = 15 + (distToTarget / maxSpeed) * 4.5

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
     -- result = 600
   end

   return result
end
--
-------------------------------------------
--MySim mission - Knock Over #getnameofCS$# -evil
---------------------------------------
s = create_advice_citysituation('0c143400')
s.title = "text@6C154447"
--
s.message = [[text@06C1542D]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.mysim_vehicle -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.CS1, ---CS$!!!
   building_groups.MYSIM_RESIDENCE,
}
s.progress_text = { 
[[text@4C15830F]],
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
s.evade_list = { automata_groups.police_vehicle }
s.evade_distance = sit_constants.EVADE_DISTANCE_LONG
s.evade_timeout = 15
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
--
s.success_text = [[text@EC154549]]
s.failure_text = [[text@2C154552]]
--
s.frequency = sit_constants.FREQUENCY_MYSIM_SHORT
s.trigger="game.g_police_station_count > 0 and game.g_city_r_population > 100 and mysim.wealth == 1 and mysim.home_building ~= 0 and sc4game.automata.get_source_building_count(building_groups.CS1) > 2 and (sc4game.sitmgr.get_success_count('8c151efd') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_Reward_My_Sim_Green
s.success_image = sit_constants.SITUATION_Reward_My_Sim
s.failure_image = sit_constants.SITUATION_Reward_My_Sim_Red
s.mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('ac1433fa') -- Run Some Errands CS$
s.mysim_mission = true
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

   result = 15 + (distToTarget / maxSpeed) * 4.5

   -- limit to min/max
   if (result < 15) then
      result = 15
  -- elseif (result > 600) then       -- 600 seconds == ten minutes
     -- result = 600
   end

   return result
end
--
-----------------------------------------
--MySim mission - #mysim.name# Goes Shopping -good
---------------------------------------
s = create_advice_citysituation('ac143406')
s.title = "text@6C154448"
--
s.message = [[text@06C1542E]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.mysim_vehicle -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.CS2, --CS$$!!!
   building_groups.CS2, --CS$$!!!
   building_groups.MYSIM_RESIDENCE
}
s.progress_text = { 
[[text@4C158310]],
[[text@4C158310]]
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
s.success_text = [[text@EC15454A]]
s.failure_text = [[text@2C154553]]
--
s.frequency = sit_constants.FREQUENCY_MYSIM_SHORT
s.trigger="game.g_city_r_population > 100 and mysim.wealth == 2 and mysim.home_building ~= 0 and sc4game.automata.get_source_building_count(building_groups.CS2) > 2 and (sc4game.sitmgr.get_success_count('8c151efd') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_Reward_My_Sim_Green
s.success_image = sit_constants.SITUATION_Reward_My_Sim
s.failure_image = sit_constants.SITUATION_Reward_My_Sim_Red
s.evil_twin = hex2dec('ac143409') --White Collar Crime
s.mysim_mission = true
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

   result = 15 + (distToTarget / maxSpeed) * 4.5

   -- limit to min/max
   if (result < 15) then
      result = 15
 --  elseif (result > 600) then       -- 600 seconds == ten minutes
     -- result = 600
   end

   return result
end
--
--------------------------------------------
--MySim mission - White Collar Crime -evil
---------------------------------------
s = create_advice_citysituation('ac143409')
s.title = "text@6C154449"
--
s.message = [[text@06C1542F]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.mysim_vehicle -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.CS2 --CS$$!!!
}

s.condition = sit_conditions.REACH_TARGET
s.create_target = false
s.success_distance =  sit_constants.SUCCESS_DISTANCE_SHORT
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_SHORT
s.use_lot_boundary = true
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.service_mission = true
--s.evade_list = { automata_groups.police_vehicle }
--s.evade_distance = sit_constants.EVADE_DISTANCE_SHORT
--s.evade_timeout = sit_constants.EVADE_TIMEOUT_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
--
s.success_text = [[text@EC15454B]]
s.failure_text = [[text@2C154554]]
--
s.frequency = sit_constants.FREQUENCY_MYSIM_SHORT
s.trigger="game.g_city_r_population > 1 and mysim.wealth == 2 and mysim.home_building ~= 0 and sc4game.automata.get_source_building_count(building_groups.CS2) > 2 and (sc4game.sitmgr.get_success_count('8c151efd') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_Reward_My_Sim_Green
s.success_image = sit_constants.SITUATION_Reward_My_Sim
s.failure_image = sit_constants.SITUATION_Reward_My_Sim_Red
s.evil_twin = hex2dec('ac143406') -- #mysim.name# Goes Shopping
s.mysim_mission = true
--easy
s.success_aura_radius  = sit_constants.EVIL_SUCCESS_AURA_RADIUS
s.success_aura_magnitude = sit_constants.EVIL_SUCCESS_AURA_MAG
s.failure_aura_radius = sit_constants.EVIL_FAILURE_AURA_RADIUS
s.failure_aura_magnitude = sit_constants.EVIL_FAILURE_AURA_MAG
s.success_money = sit_constants.EVIL_SUCCESS_MONEY
s.failure_money = sit_constants.EVIL_FAILURE_MONEY
s.success_effect = sit_constants.SUCCESS_EFFECTMONEY
s.failure_effect = sit_constants.FAILURE_EFFECTDARKMONEY
--
function s:get_time_limit(distToTarget, maxSpeed)
   local result

   result = 15 + (distToTarget / maxSpeed) * 4.5

   -- limit to min/max
   if (result < 15) then
      result = 15
  -- elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end

   return result
end
--
-----------------------------------------------
--MySim mission - Take a Break at the Casino -good
---------------------------------------
s = create_advice_citysituation('4c14340f')
s.title = "text@6C15444A"
--
s.message = [[text@06C15430]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.mysim_vehicle -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.Casino
}

s.condition = sit_conditions.REACH_TARGET
s.create_target = false
s.success_distance =  sit_constants.SUCCESS_DISTANCE_SHORT
s.success_timeout = sit_constants.SUCCESS_TIMEOUT_SHORT
s.use_lot_boundary = true
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.service_mission = true
--s.evade_list = { automata_groups.police_vehicle }
--s.evade_distance = sit_constants.EVADE_DISTANCE_SHORT
--s.evade_timeout = sit_constants.EVADE_TIMEOUT_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
--
s.success_text = [[text@EC15454C]]
s.failure_text = [[text@2C154555]]
--
s.frequency = sit_constants.FREQUENCY_MYSIM_SHORT
s.trigger="game.g_city_r_population > 1 and mysim.wealth == 3 and mysim.home_building ~= 0 and (game.reward_instance_count(special_buildings.Casino) > 0) and (sc4game.sitmgr.get_success_count('8c151efd') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_Reward_My_Sim_Green
s.success_image = sit_constants.SITUATION_Reward_My_Sim
s.failure_image = sit_constants.SITUATION_Reward_My_Sim_Red
s.evil_twin = hex2dec('4c143419') --Took the Casino For A Bundle
s.mysim_mission = true
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

   result = 15 + (distToTarget / maxSpeed) * 4.5

   -- limit to min/max
   if (result < 15) then
      result = 15
  -- elseif (result > 600) then       -- 600 seconds == ten minutes
     -- result = 600
   end

   return result
end
--
---------------------------------------
--MySim mission -Took the Casino For A Bundle -evil
-------------------------------------------
s = create_advice_citysituation('4c143419')
s.title = "text@6C15444B"
--
s.message = [[text@06C15431]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW 
s.automata_list = automata_groups.mysim_vehicle -- sit_constants.lua
--
s.condition = sit_conditions.ESCAPE_CITY -- sit_constants.lua
s.create_target = true -- always set true for automata, and false for buildings
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
s.evade_list = { automata_groups.police_helicopter, automata_groups.patrol_car } -- sit_constants.lua
s.evade_distance = sit_constants.EVADE_DISTANCE_LONG
s.evade_timeout = 10
--
s.success_text = [[text@EC15454D]]
s.failure_text = [[text@2C154556]]
--
s.frequency = sit_constants.FREQUENCY_MYSIM_SHORT
s.trigger="(game.reward_instance_count(special_buildings.Casino) > 0) and game.g_city_r_population > 1 and mysim.wealth == 3 and mysim.home_building ~= 0 and (sc4game.sitmgr.get_success_count('8c151efd') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_Reward_My_Sim_Green
s.success_image = sit_constants.SITUATION_Reward_My_Sim
s.failure_image = sit_constants.SITUATION_Reward_My_Sim_Red
s.evil_twin = hex2dec('4c14340f') --Take a Break at the Casino
s.mysim_mission = true
--easy
s.success_aura_radius  = sit_constants.EVIL_SUCCESS_AURA_RADIUS
s.success_aura_magnitude = sit_constants.EVIL_SUCCESS_AURA_MAG
s.failure_aura_radius = sit_constants.EVIL_FAILURE_AURA_RADIUS
s.failure_aura_magnitude = sit_constants.EVIL_FAILURE_AURA_MAG
s.success_money = sit_constants.EVIL_SUCCESS_MONEY
s.failure_money = sit_constants.EVIL_FAILURE_MONEY
s.success_effect = sit_constants.SUCCESS_EFFECTMONEY
s.failure_effect = sit_constants.FAILURE_EFFECTDARKMONEY
--
function s:get_time_limit(distToTarget, maxSpeed)
   return 0
end
--
-----------------------------------------
--MySim mission - #mysim.name# Wants to See #mission_target# -good
---------------------------------------
s = create_advice_citysituation('6c25478b')
s.title = "text@4c2265b0"
--
s.message = [[text@2c2265c6]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.mysim_vehicle -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.LANDMARK
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
s.success_text = [[text@6c201199]]
s.failure_text = [[text@cc20119f]]
--
s.frequency = sit_constants.FREQUENCY_MYSIM_SHORT
s.trigger="game.g_city_r_population > 1 and mysim.home_building ~= 0 and sc4game.automata.get_source_building_count(building_groups.LANDMARK) > 0 and (sc4game.sitmgr.get_success_count('8c151efd') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_Reward_My_Sim_Green
s.success_image = sit_constants.SITUATION_Reward_My_Sim
s.failure_image = sit_constants.SITUATION_Reward_My_Sim_Red
s.mysim_mission = true
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

   result = 15 + (distToTarget / maxSpeed) * 4.5

   -- limit to min/max
   if (result < 15) then
      result = 15
  -- elseif (result > 600) then       -- 600 seconds == ten minutes
     -- result = 600
   end

   return result
end
--
-----------------------------------------
--MySim mission - #mysim.name# Goes Gift-Shopping -good
---------------------------------------
s = create_advice_citysituation('8c27c554')
s.title = "text@4c2389fb"
--
s.message = [[text@8c2389f0]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.mysim_vehicle -- sit_constants.lua
s.target_sequence = {    -- adv_const.lua
   building_groups.CS3,
   building_groups.CS3,
   building_groups.CS3
}
s.progress_text = { 
[[text@6c27c434]],
[[text@4c27d5fd]]
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
s.success_text = [[text@cc2389f5]]
s.failure_text = [[text@4c238bd8]]
--
s.frequency = sit_constants.FREQUENCY_MYSIM_SHORT
s.trigger="game.g_city_r_population > 500 and mysim.wealth == 3 and mysim.home_building ~= 0 and sc4game.automata.get_source_building_count(building_groups.CS3) > 2  and (sc4game.sitmgr.get_success_count('8c151efd') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_Reward_My_Sim_Green
s.success_image = sit_constants.SITUATION_Reward_My_Sim
s.failure_image = sit_constants.SITUATION_Reward_My_Sim_Red
s.mysim_mission = true
--med
s.success_aura_radius  = sit_constants.MED_GOOD_SUCCESS_AURA_RADIUS
s.success_aura_magnitude = sit_constants.MED_GOOD_SUCCESS_AURA_MAG
s.failure_aura_radius = sit_constants.MED_GOOD_FAILURE_AURA_RADIUS
s.failure_aura_magnitude = sit_constants.MED_GOOD_FAILURE_AURA_MAG
--s.success_money = sit_constants.MED_GOOD_SUCCESS_MONEY
s.failure_money = sit_constants.MED_GOOD_FAILURE_MONEY
s.success_effect = sit_constants.SUCCESS_EFFECTMAYRAT
--s.success_effect = sit_constants.SUCCESS_EFFECTMONEY
--s.success_effect = sit_constants.SUCCESS_EFFECTMAYRAT_MONEY
s.failure_effect = sit_constants.FAILURE_EFFECT
--s.failure_effect = sit_constants.FAILURE_EFFECTMONEY
--
function s:get_time_limit(distToTarget, maxSpeed)
   local result

   result = 15 + (distToTarget / maxSpeed) * 4.5

   -- limit to min/max
   if (result < 15) then
      result = 15
  -- elseif (result > 600) then       -- 600 seconds == ten minutes
    --  result = 600
   end

   return result
end
--
