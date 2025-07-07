--------------------------------------
-- Ferryboat Missions - Whale Watching Tour Mission-good
----------------------------------------------------
s = create_advice_citysituation('4c17326e')
s.title = "text@6C154464"
--
s.message = [[text@06C1544A]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.ferry_boat -- sit_constants.lua
s.condition = sit_conditions.CELL_COVERAGE
--s.service_mission = true
--
s.success_text = [[text@EC154566]]
s.reward_unlocked_text    = [[text@EC193CFD]]
s.reward_guid  = hex2dec('03970000') --marina
s.failure_text = [[text@2C15456F]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="sc4game.automata.get_source_building_count(building_groups.CarFerry) > 0 and (sc4game.sitmgr.get_success_count('cc1730cf') > 0)" -- adv_game_data.lua
s.image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.success_image = sit_constants.SITUATION_Reward_Marina
s.failure_image = sit_constants.SITUATION_IMAGE_TRANSPORTATION
s.mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.BAD_JOB
s.coverage_cells_min   = 100
s.coverage_cells_max   = 100
s.coverage_type = sit_coverage_type.UNZONED_WATER
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
s.active_radius = 4
--s.coverage_lot = building_groups.CEMETARY
--s.coverage_zone = zone_tool_types.INDUSTRIAL_RES     
--s.coverage_network = network_types.OVER_GROUND
--s.coverage_rect = { 30, 30, 35, 35, }
s.evil_twin = hex2dec('cc173268') --3 Hour Tour
--easy
s.success_aura_radius  = sit_constants.GOOD_SUCCESS_AURA_RADIUS
s.success_aura_magnitude = sit_constants.GOOD_SUCCESS_AURA_MAG
s.failure_aura_radius = sit_constants.GOOD_FAILURE_AURA_RADIUS
s.failure_aura_magnitude = sit_constants.GOOD_FAILURE_AURA_MAG
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

   return 300
end
--
-------------------------------------------------------------------
-- Ferryboat Missions - 3 Hour Tour- Evil
--------------------------------------------
s = create_advice_citysituation('cc173268')
s.title = "text@6C154465"
--
s.message = [[text@06C1544B]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.ferry_boat
s.target_list = { automata_groups.tug_boat, automata_groups.fishing_boat, automata_groups.off_shore, automata_groups.motor_boat, automata_groups.yacht, automata_groups.speed_boat } 
--
s.condition = sit_conditions.REACH_TARGET
s.create_target = true
s.always_create_target = true
s.success_distance = 24
s.active_radius = 48 -- must be at least as long as the ferry's radius
s.success_timeout = 1 -- must be extremely short to catch it before the crash
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--
s.success_text = [[text@EC154567]]
s.failure_text = [[text@2C154570]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="sc4game.automata.get_source_building_count(building_groups.CarFerry) > 0 and (sc4game.sitmgr.get_success_count('cc1730cf') > 0)"
s.image = sit_constants.SITUATION_IMAGE_DR_VU
s.success_image = sit_constants.SITUATION_IMAGE_DR_VU
s.failure_image = sit_constants.SITUATION_IMAGE_DR_VU
s.mood = advice_moods.NEUTRAL
s.success_mood = advice_moods.GREAT_JOB
s.failure_mood = advice_moods.BAD_JOB
s.evil_twin = hex2dec('4c17326e') --Whale Watching Tour Mission
--s.time_limit = sit_constants.TIME_LIMIT_SHORT
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

   result = 40 + (distToTarget / maxSpeed) * 5

   -- limit to min/max
   if (result < 15) then
      result = 15
   --elseif (result > 600) then       -- 600 seconds == ten minutes
      --result = 600
   end 

   return 150
end
--
function s:init()
   local target
   target = sc4game.sitmgr.get_current_target()
   target.push_state(automata_states.IDLE)      -- can't catch up to moving boat with slow ferry
end
--
function s:on_success()
   local auto
   local target
   auto = sc4game.sitmgr.get_active_auto()
   target = sc4game.sitmgr.get_current_target()
   auto.push_state(automata_states.CRASH_SINK)
   target.push_state(automata_states.CRASH_SINK)
   auto.fade_out()
   target.fade_out()
end