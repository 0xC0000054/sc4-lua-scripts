-----------------------------------------------------------------------------------------
-- This file defines advices for the CITY SITUATIONS
-- City Situations are mini-scenarios involving player-driven automata
-- 
dofile("_adv_sys.lua") 
dofile("_adv_advice.lua") 
dofile("adv_game_data.lua") 
dofile("sit_constants.lua")
dofile("adv_mysim_data.lua")

-- city situations table
-- contains additional references to city situation advice entries, keyed by GUID
city_situations = {}

----------------------------------------------------------------------
-- Advice fields 

--type      = advice_types . CITY_SITUATIONS,
--mood      = advice_moods . NEUTRAL,
--priority  = 100,
--title        = "UNDEFINED title : from base advice structure",
--message = "UNDEFINED message : from base advice structure",
--frequency   = 35, -- in days
--timeout   = 45, -- in days
--trigger   = "1",
--once   = 1, -- trigger the advice only once
--event = 0, -- this has to be a valid event ID (see const file for the event table.)


-- Additional fields for city situations

--automata_list = {},                          -- allowable automaton group(s) for the single drivable automaton
--target_list = {},                            -- automata or occupant group(s) for target in the situation
--target_sequence = {},                        -- use instead of target_list to specify a sequence of targets that must be handled in order
--condition = sit_conditions.REACH_TARGET,     -- determines success/failure of situation
--time_limit = 0,                              -- time limit for entire situation in real time, 0 == indefinite
--success_distance = 0,                        -- for some conditions, must be within this many meters of target to succeed
--success_timeout = 0,                         -- for some conditions, sit succeeds if within success_distance of target for more than this many seconds
--min_target_distance = 32,                    -- targets chosen by sit must be at least this many meters away from the active automaton
--max_target_distance = 0,                     -- targets chosen by sit must be within this distance from active automaton (0 == no limit)
--evade_list = {},                             -- automata or occupant groups you have to evade to succeed the mission
--evade_distance = 32,                         -- if evade_list is filled, mission will fail if within this distance of any of the evade occupants
--evade_timeout = 2,                           -- if evade_list is filled, mission will fail if within evade_distance of evade occupants for more than evade_timeout seconds
--create_target = false,                       -- situation can create a target if none exists?
--success_text = "",                           -- text of message box on success
--failure_text = "",                           -- text of message box on failure
--progress_text = "",                          -- can be a single string to display in between targets if target_sequence is set up, or a table of strings for each target
--image=sit_constants.SITUATION_IMAGE_DEFAULT, -- determines icon or advisor head that shows up in messages
--success_image=sit_constants.SITUATION_IMAGE_DEFAULT,     -- icon or advisor head to display in success message
--success_mood=advice_moods.GREAT_JOB,                     -- mood of advisor head during success dialog
--failure_image=sit_constants.SITUATION_IMAGE_DEFAULT,     -- icon or advisor head to display in failure message
--failure_mood=advice_moods.BAD_JOB,                       -- mood of advisor head during failure dialog
--delay_after_disabled=5.0,                                -- how long (in seconds) to pause after active auto or target
--service_mission = false,            -- sets whether the player has to play an effect to win the mission
-- evil_twin = hex2dec('guid'),                            -- guid of mission to suggest as an evil/good alternative to this mission
-- coverage_type = sit_coverage_type.ZONE,             -- tells the engine which of the following "coverage" properties to use
-- coverage_zone = zone_tool_types.INDUSTRIAL_RES,     -- for cell_coverage missions, choose an entire zone of this type
-- coverage_lot = building_groups.CEMETARY,            -- for cell_coverage missions, choose a lot that has a building of this type
-- coverage_network = network_types.OVER_GROUND,      -- for cell_coverage missions, choose "coverage_count" connected network cells of this type
-- coverage_rect = { left, top, right, bottom },      -- for cell_coverage missions, specify an explicit cell rectangle in x and z
-- coverage_cells = { {x,z}, {x,z}, {x,z} },       -- explicit list of cells to cover for cell_coverage missions, where (0,0) is the CITY CENTER
-- coverage_cells_min = 0,                    -- minimum # of cells you need to cover to succeed, 0 == all of them in the zone or lot
-- coverage_cells_max = 0,                    -- maximum # of cells you need to cover to succeed, 0 == all of them in the zone or lot
-- coverage_success_count = 0,                -- # of cells out of total chosen you need to cover to succeed, 0 = all of them in the coverage area
-- coverage_success_pct = 100,               -- like coverage_success_count, but expressed as a percentage (from 0 - 100) of the total.
-- success_aura_radius  = 0,                 -- radius (meters) around the active auto to add a desirability boost on success
-- success_aura_magnitude = 0,               -- magnitude of aura boost around active auto on success
-- success_effect = "missionsuccess",        -- name of visual effect to play at active auto on success
-- success_money = 0,                        -- amt of money to give to treasury on success
-- failure_aura_radius  = 0,                 -- radius (meters) around the active auto to add a desirability boost on failure
-- failure_aura_magnitude = 0,               -- magnitude of aura boost around active auto on failure
-- failure_effect = "missionfailure",        -- name of visual effect to play at active auto on failure
-- failure_money = 0,                        -- amt of money to give to treasury on failure
-- reward_guid = 0,                          -- GUID of a reward advice (adv_rewards.lua) that will eventually be unlocked by this mission
-- reward_progress_text = "",                -- if reward_guid is set, and the reward is still not yet available, the text that will display at the end of the success message (e.g. "You're one step closer to unlocking the secret base!")
-- reward_unlocked_text = "",                -- if reward_guid is set, and the reward is available, the text that will display at the end of the success message (e.g. "You've unlocked the secret base!")
-- active_radius = 0,                        -- meters around the active automaton (or the effect if service_mission is true) that will count as a "hit"
-- mysim_mission = false,                    -- indicates whether this is a mission for mysim vehicles
-- training_mission = false,                 -- marks the mission as a training mission, once completed it will never be offered again
-- pursuit_mission = false,                  -- if true, groups in the evade_list will help the active auto chase the target
-- always_create_target = false,             -- if true, will never use a target that already exists (only valid for automata targets)

base_citysituation_advice = 
{
   _base       = base_advice,
   type        = advice_types . CITY_SITUATIONS,
   mood        = advice_moods . NEUTRAL,
   priority    = tuning_constants.ADVICE_PRIORITY_LOW,
   frequency   = 10,
   no_timeout  = 1,     -- stay current until untriggered
   trigger     = "0",
   once        = 0,
   event       = 0,
   automata_list        = {},
   target_list          = {},
   condition            = sit_conditions.REACH_TARGET,
   time_limit           = 0,
   success_distance     = 24,
   success_timeout      = 0,
   min_target_distance  = 32,
   max_target_distance  = 0,
   evade_list           = {},
   evade_distance       = 32,
   evade_timeout        = 2,
   create_target        = false,
   success_text         = "",
   failure_text         = "",
   progress_text        = "",
   image                = sit_constants.SITUATION_IMAGE_DEFAULT,
   success_image        = sit_constants.SITUATION_IMAGE_DEFAULT,
   success_mood         = advice_moods.GREAT_JOB,
   failure_image        = sit_constants.SITUATION_IMAGE_DEFAULT,
   failure_mood         = advice_moods.BAD_JOB,
   delay_after_disabled = 5.0,
   service_mission      = false,
   evil_twin            = 0,
   coverage_cells_min   = 0,
   coverage_cells_max   = 0,
   coverage_type        = sit_coverage_type.ZONE,             
   coverage_zone        = zone_tool_types.INDUSTRIAL_RES,     
   coverage_lot         = building_groups.CEMETARY,            
   coverage_network     = network_types.OVER_GROUND,      
   coverage_rect        = { 0, 0, 0, 0 },
   coverage_cells       = { },
   coverage_success_count  = 0,
   coverage_success_pct    = 100,
   success_aura_radius     = 0,
   success_aura_magnitude  = 0,
   success_effect          = "",
   success_money           = 0,
   failure_aura_radius     = 0,
   failure_aura_magnitude  = 0,
   failure_effect          = "",
   failure_money           = 0,
   reward_guid             = 0,
   reward_progress_text    = "",
   reward_unlocked_text    = "",
   active_radius           = 0,
   mysim_mission           = false,
   training_mission        = false,
   pursuit_mission         = false,
   always_create_target    = false
}   

-- called every time the target changes, expected to return the new time limit IN SECONDS
-- return 0 if there's no time limit for this mission
-- distToTarget is METERS away from the current target position, or to the edge of the city,
--    may be very large if there's not a valid target
-- maxSpeed is in METERS PER SECOND, but is OPTIONAL and MAY BE ZERO
function base_citysituation_advice:get_time_limit(distToTarget, maxSpeed)
   local result

   if (maxSpeed < 1) then
      maxSpeed = 22.2      -- 80 kph ~= 22.2 meters per second
   end
   result = 15 + (distToTarget / maxSpeed) * 2

   -- limit to min/max
   if (result < 15) then
      result = 15
   elseif (result > 600) then       -- 600 seconds == ten minutes
      result = 600
   end

   return result
end

settag(base_citysituation_advice, TAG_ADVICE)

-- helper function
function create_advice_citysituation_with_base(guid_string, base_advice)
   local a =  advices : create_advice(tonumber(guid_string, 16), base_advice)
   a.type   = advice_types . CITY_SITUATIONS
   a.class_id = hex2dec('8be3753b')       -- cSC4CitySituationAdvice
   settag(a, TAG_ADVICE)
   city_situations[guid_string] = a       -- save entry in master city_situations table
   return a
end

-- helper function
function create_advice_citysituation(guid_string)
   local a =  create_advice_citysituation_with_base(guid_string, base_citysituation_advice)
   return a
end
--
--
dofile ("adv_csi_ambulance.lua")
dofile ("adv_csi_armytruck.lua")
dofile ("adv_csi_attackhelicopter.lua")
dofile ("adv_csi_attackjet.lua")
dofile ("adv_csi_citybus.lua")
dofile ("adv_csi_crime.lua")
dofile ("adv_csi_drivingtutorials.lua")
dofile ("adv_csi_fireplane.lua")
dofile ("adv_csi_firetruck.lua")
dofile ("adv_csi_freighttrain.lua")
dofile ("adv_csi_garbagetruck.lua")
dofile ("adv_csi_hearse.lua")
dofile ("adv_csi_icecream.lua")
dofile ("adv_csi_mayor.lua")
dofile ("adv_csi_medicalshelicopter.lua")
dofile ("adv_csi_mysim.lua")
dofile ("adv_csi_newshelicopter.lua")
dofile ("adv_csi_newsvan.lua")
dofile ("adv_csi_passengertrain.lua")
dofile ("adv_csi_policecar.lua")
dofile ("adv_csi_policehelicopter.lua")
dofile ("adv_csi_schoolbus.lua")
dofile ("adv_csi_steamtrain.lua")
dofile ("adv_csi_tank.lua")
dofile ("adv_csi_taxicab.lua")
dofile ("adv_csi_ufo.lua")
dofile ("adv_csi_cropdusting.lua")
dofile ("adv_csi_ferryboat.lua")
dofile ("adv_csi_fishingboat.lua")
dofile ("adv_csi_metalwhale.lua")
dofile ("adv_csi_skywriter.lua")
dofile ("adv_csi_speedboat.lua")
dofile ("adv_csi_offshore.lua")
dofile ("adv_csi_yacht.lua")
dofile ("adv_csi_tugboat.lua")
dofile ("adv_csi_motorboat.lua")
dofile ("adv_csi_monorail.lua")
dofile ("adv_csi_toxicwaste.lua")
dofile ("adv_csi_skydiver.lua")


-- TEST CELL COVERAGE MISSION
--~ s = create_advice_citysituation('ec02ec02')
--~ s.title = "Buzz the Undead"
--~ s.message = [[Use a stunt plane to fly over a plot of unzoned land.  This is just a test mission to verify that cell coverage missions work.]]
--~ s.priority=tuning_constants.ADVICE_PRIORITY_MED_HIGH
--~ s.automata_list = hex2dec('0x4311')    -- automata_groups.stunt_plane
--~ s.condition = sit_conditions.CELL_COVERAGE
--~ s.success_text = [[You win.]]
--~ s.failure_text = [[You lose.]]
--~ s.frequency = 2
--~ s.trigger="(game.g_small_airport_count > 0)" -- adv_game_data.lua
--~ s.image = sit_constants.SITUATION_IMAGE_SAFETY
--~ s.mood = advice_moods.GREAT_JOB
--~ s.coverage_cells_min   = 25
--~ s.coverage_cells_max   = 40
--~ s.coverage_type = sit_coverage_type.UNZONED_LAND
--~ s.min_target_distance = 200
--~ s.max_target_distance = 0
--~ --s.coverage_lot = building_groups.CEMETARY
--~ --s.coverage_zone = zone_tool_types.INDUSTRIAL_RES     
--~ --s.coverage_network = network_types.OVER_GROUND
--~ --s.coverage_rect = { 30, 30, 35, 35, }


-- This will try to execute triggers for all registerd advices 
-- to make sure they don't have any syntactic errors.

if (_sys.config_run == 0)
then
   advices : run_triggers()
end




