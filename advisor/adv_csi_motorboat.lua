-------------------------------------------------------------------
-- Motor Boat Mission -  Escape with the loot on water. - evil
--------------------------------------------
s = create_advice_citysituation('cc1d3cfe')
s.title = "text@2c196742"
--
s.message = [[text@6c19675a]]
--
s.priority=tuning_constants.ADVICE_PRIORITY_LOW
s.automata_list = automata_groups.motor_boat
--
s.condition = sit_conditions.ESCAPE_CITY
s.create_target = true
s.evade_list = automata_groups.police_helicopter
s.evade_distance = sit_constants.EVADE_DISTANCE_LONG
s.evade_timeout = 3
s.min_target_distance = sit_constants.MIN_TARGET_DISTANCE_SHORT 
s.max_target_distance = sit_constants.MAX_TARGET_DISTANCE_SHORT
--
s.success_text = [[text@EC15456D]]
s.failure_text = [[text@ec1d3468]]
--
s.frequency = sit_constants.FREQUENCY_SHORT
s.trigger="(game.reward_instance_count(special_buildings.DeluxePoliceStation) > 0) and (game.reward_instance_count(special_buildings.Marina) > 0) and (sc4game.sitmgr.get_success_count('cc1730cf') > 0)"
s.image = sit_constants.SITUATION_IMAGE_SAFETY
s.success_image = sit_constants.SITUATION_IMAGE_SAFETY
s.failure_image = sit_constants.SITUATION_IMAGE_SAFETY
s.mood = advice_moods.BAD_JOB
s.success_mood = advice_moods.NEUTRAL
s.failure_mood = advice_moods.NEUTRAL
--s.evil_twin = hex2dec('0bb15510')
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

