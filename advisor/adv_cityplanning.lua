-----------------------------------------------------------------------------------------
-- This file defines advices for the the CITY PLANNING
dofile("_adv_sys.lua") 
dofile("_adv_advice.lua") 
dofile("adv_game_data.lua") 

-- helper funcition
function create_advice_cityplanning_with_base(guid_string, base_advice)
   local a =  advices : create_advice(tonumber(guid_string, 16), base_advice)
   a.type   = advice_types . CITY_PLANNING
   return a
end

-- helper funcition
function create_advice_cityplanning(guid_string)
   local a =  create_advice_cityplanning_with_base(guid_string, nil)
   return a
end

-- function to create a 'reward' advice
function create_reward_cityplanning(guid_string)
   local a =  create_advice_cityplanning(guid_string, nil)
   a.class_id = hex2dec("aa371c32") -- cSC4RewardAdvice class ID
   a.once = 0
   return a
end

--
--

----------------------------------------------------------------------
-- Advice fields 

--type      = advice_types . cityplanning,
--mood      = advice_moods . NEUTRAL,
--priority  = 100,
--title        = "UNDEFINED title : from base advice structure",
--message = "UNDEFINED message : from base advice structure",
--frequency   = 35, -- in days
--timeout   = 45, -- in days
--trigger   = "1",
--once   = 1, -- trigger the advice only once
-- news_only = 0, -- set to 1 for news-flipper messages only 
-- event = 0, -- this has to be a valid event ID (see const file for the event table.)

--TEST MESSAGE
a = create_advice_cityplanning('cab8161c')
a.trigger  = "0"
a.timeout = 30
a.frequency = 30

a.title   = [[gambling ordinance is on]]
a.message   = [[gambling ordinance is on]]

a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.BAD_JOB

--'Roll Up Your Sleeves, Mayor!  #Advisor#, City Planner, At Your Service
------------ Advice record ----
--Roll up your sleeves  (introduction)
a = create_advice_cityplanning('aa355e8d')
a.trigger  = "1"
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.title = [[text@ea81d821]]
a.message   = [[text@aa81d826]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB
a.event = game_events.NEW_CITY


---------ADVICE RECORDS--------------------
------------ Advice record ----
--Sour Sims See Poor Prospects
a = create_advice_cityplanning ('aa5420a3')
a.trigger  = "game.ga_health < tuning_constants.HQ_LOW  and game.ga_education < tuning_constants.EQ_LOW  and game.g_city_r_population > tuning_constants.POPULATION_STEP_5 and  game.trend_slope(game_trends.GA_EQ,4) < 0 and game.trend_slope(game_trends.GA_HQ,4) < 0 and game.trend_value(game_trends.G_POPULATION_SCHOOL_COVERAGE) < 1 and game.trend_value(game_trends.G_POPULATION_HEALTH_COVERAGE) < 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@6a54077f]]
a.message   = [[text@ea540783]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--City Picture Brightening; Sims Find Glass Half-Full
a = create_advice_cityplanning ('0a74b8fb')
a.trigger  = "(game.g_city_r2_population > .3 * game.g_city_r1_population) and (.4 * game.g_city_workforce_population < game.g_city_c_population + game.g_city_i_population and game.g_city_c_population + game.g_city_i_population < .6 * game.g_city_workforce_population) and  game.g_city_r_population > tuning_constants.POPULATION_STEP_5 and game.trend_value(game_trends.G_RM_POPULATION,12) > .9 * game.g_city_r2_population"
a.once = 1
a.timeout =  tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6a540786]]
a.message   = [[text@aa54078a]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
--Middle Class Making Its Move
a = create_advice_cityplanning ('4a5421ef')
a.trigger  = "(game.g_city_r2_population > .6 * game.g_city_r1_population) and (.4 * game.g_city_workforce_population < game.g_city_c_population + game.g_city_i_population and game.g_city_c_population + game.g_city_i_population < .6 * game.g_city_workforce_population) and  game.g_city_r_population > tuning_constants.POPULATION_STEP_6 and game.trend_value(game_trends.G_RM_POPULATION,12) < .8 * game.g_city_r2_population"
a.once = 1
a.timeout =  tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea54078f]]
a.message   = [[text@aa540793]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL


------------ Advice record ----
--City Thumping Its Chest; Upper Class Showing Sass
a = create_advice_cityplanning ('8a542495')
a.trigger  = "(game.g_city_r3_population > .1 * (game.g_city_r1_population + game.g_city_r2_population)) and (.4 * game.g_city_workforce_population < game.g_city_c_population + game.g_city_i_population and game.g_city_c_population + game.g_city_i_population < .6 * game.g_city_workforce_population) and  game.g_city_r_population > tuning_constants.POPULATION_STEP_6 and game.trend_value(game_trends.G_RH_POPULATION,12) < .8 * game.g_city_r3_population"
a.once = 1
a.timeout =  tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a540798]]
a.message   = [[text@ea54079c]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

----------- Advice record ----
--#City# In The Clover
a = create_advice_cityplanning ('6a54250d')
a.trigger  = "game.g_city_r3_population > .35 * (game.g_city_r1_population + game.g_city_r2_population) and game.g_city_r_population > tuning_constants.POPULATION_STEP_4"
a.once = 1
a.timeout =  tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a5407a0]]
a.message   = [[text@8a5407a5]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

----------- Advice record ----
--Broad-Shouldered Sims Putting In Full Day
a = create_advice_cityplanning ('ea5425f4')
a.trigger  = "game.g_city_rci_population > tuning_constants.POPULATION_STEP_6 and game.g_city_id_population + game.g_city_im_population	> .55 * game.g_city_rci_population and game.trend_slope(game_trends.G_ID_POPULATION, 3) > 0 and game.trend_slope(game_trends.G_IM_POPULATION, 3) > 0"
a.once = 1  
a.timeout =  tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca5407a9]]
a.message   = [[text@4a5407ad]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

----------- Advice record ----
--#Ctiy#: Industrial Powerhouse
a = create_advice_cityplanning ('2a54267a')
a.trigger  ="0"
--a.trigger  = "game.g_city_rci_population > tuning_constants.POPULATION_STEP_7 and game.g_city_id_population + game.g_city_im_population	> .7 * game.g_city_rci_population"
a.once = 1  
a.timeout =  tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a5407b1]]
a.message   = [[text@ea5407b5]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

----------- Advice record ----
--Businesses in #City# Kicking Up Their Heels
a = create_advice_cityplanning ('8a5426f6')
a.trigger  = "game.g_city_rci_population > tuning_constants.POPULATION_STEP_8 and game.g_city_c_population > .4 * game.g_city_rci_population"
a.once = 1  
a.timeout =  tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea5407bb]]
a.message   = [[text@8a5407bf]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

----------- Advice record ----
--The Business of #City# is Business
a = create_advice_cityplanning ('2a54279d')
a.trigger  = "game.g_city_rci_population > tuning_constants.POPULATION_STEP_9 and game.g_city_c_population > .6 * game.g_city_rci_population"
a.once = 1  
a.timeout =  tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea5407c3]]
a.message   = [[text@8a5407c7]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

----------- Advice record ----
--ABCs Will Put Sims On Solid Ground
a = create_advice_cityplanning ('4a542808')
a.trigger  = [[game.g_city_r_population > tuning_constants.POPULATION_STEP_5 and (game.ga_school_grade < 50 or game.g_education_coverage_p < 10)]]
a.once = 1
a.timeout =  tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@aa5407cb]]
a.message   = [[text@aa5407d1]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL
a.frequency = tuning_constants.ADVICE_FREQUENCY_VERY_LOW

----------- Advice record ----
--Big Rewards For Connecting Big-Picture #City# Dots
a = create_advice_cityplanning ('ea5a5f80')
a.trigger  = "game.g_medium_airport_count + game.g_small_airport_count + game.g_large_airport_count + game.g_seaport_count + game.g_num_road_neighbors + game.g_num_avenue_neighbors + game.g_rail_neighbor_connection_count == 0 and game.g_city_rci_population > tuning_constants.POPULATION_STEP_5"
a.once = 1
a.timeout =  tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = [[text@ea5407d8 Big Rewards For Connecting Big-Picture #City# Dots]]
a.message   = [[text@4a5407dc]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--Wave The Low Tax Wand To See Sims Respond
a = create_advice_cityplanning ('ea5a6003')
a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_4 and game.g_tax_rate_r_low == 7 and game.g_tax_rate_r_med == 7 and game.g_tax_rate_r_high == 7 and game.g_tax_rate_cs_low == 7 and game.g_tax_rate_cs_med == 7 and game.g_tax_rate_cs_high == 7 and game.g_tax_rate_co_med == 7 and game.g_tax_rate_co_high == 7 and game.g_tax_rate_i_dirty == 7 and game.g_tax_rate_i_manufacturing == 7 and game.g_tax_rate_i_hightech == 7"
a.once = 1  
a.timeout =  tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = [[text@8a5407e0]]
a.message   = [[text@ea5407e5]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--Rapid expansion can result in unstable neighborhoods.
--a = create_advice_cityplanning ('4a5a608d')
--a.trigger  = "0"
--Need triggers for population=>500; R_tiles_undeveloped > 3*R_tiles_developed  NO VARIABLE FOR UNDEVELOPED TILES
--a.timeout = 60
--a.title   = [[text@ea5407e9']]
--a.message   = [[text@2a5407ed']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--Traffic Flow Makes A City Go--And Grow
a = create_advice_cityplanning ('0a5a60ac')
a.trigger  = "game.ga_road_congestion > tuning_constants.TRAFFIC_CONGESTION_MEDIUM and game.g_population > 800"
a.once = 1  
a.timeout =  tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = [[text@ca5407f2]]
a.message   = [[text@8a5407f6]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--The Rewards Of Being Neighborly
a = create_advice_cityplanning ('4a5a60ee')
a.trigger  = "game.g_num_cities_adjacent	== 0 and game.g_population > tuning_constants.POPULATION_STEP_5"
a.once = 1  
a.timeout =  tuning_constants.ADVICE_TIMEOUT_LONG
a.title = [[text@4a5407fb]]
a.message   = [[text@ea540800]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--Local Commercial Districts A Kick In The Property Pants
a = create_advice_cityplanning ('2a5a6144')
a.trigger  = "game.g_num_czone_ld_tiles	+ game.g_num_czone_md_tiles	+ game.g_num_czone_hd_tiles	> 60"
a.once = 1  
a.timeout = 60
a.title   = [[text@6a540803]]
a.message   = [[text@8a540808]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--#City# Slums Hold Meager Development Promise
a = create_advice_cityplanning ('aa5a6555')
a.trigger  = "game.g_city_rci_population > tuning_constants.POPULATION_STEP_6 and game.g_city_r1_population	> 9 * (game.g_city_r2_population	+ game.g_city_r3_population) and (game.ga_school_grade < 40 or game.g_education_coverage_p < 5)"
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout =  tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = [[text@aa54080c]]
a.message   = [[text@ea540811]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--Big-Buck Backers Looking To Park Some Pricey Properties
a = create_advice_cityplanning ('0a5a65d3')
a.trigger  = "game.g_co2_demand > tuning_constants.POPULATION_STEP_5 and game.g_co3_demand < tuning_constants.POPULATION_STEP_3"
a.timeout =  tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = [[text@6a540816]]
a.message   = [[text@4a54081b]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--The Utility of Being Neighborly
a = create_advice_cityplanning ('ca5a662f')
a.trigger  = "0"
--game.g_num_cities_adjacent > 0 and game.g_nd_can_buy_power < 1"
a.once = 1  
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a540820']]
a.message   = [[text@ea540824']]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.NEUTRAL
a.event = game_events.NEW_CITY 

----------- Advice record ----
--Local residents commute to #other_city#
--NO LONGER NEEDED
--a = create_advice_cityplanning ('4a5a6733')
--a.trigger  = "0"
--Need triggers for first instance of extrapolated R to #other_city#
--a.timeout = 60
--a.title   = [[text@ea540828']]
--a.message   = [[text@ea54082d']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--Local workers commute from #other_city#
--NO LONGER NEEDED
--a = create_advice_cityplanning ('6a5a677e')
--a.trigger  = "0"
--Need triggers for first instance of extrapolated C or I to #other_city#
--a.timeout = 60
--a.title   = [[text@ca540831']]
--a.message   = [[text@8a540835']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--#City# Workers Calling Elsewhere Home
a = create_advice_cityplanning ('2a5a686a')
a.trigger  = "game.trend_value(game_trends.G_R_EXTRAP_OUT,6) > tuning_constants.POPULATION_STEP_2"
a.frequency = 600  
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a54083c]]
a.message   = [[text@2a540840]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--Some #city# Residents Choose Long Commute
a = create_advice_cityplanning ('8a5a68ac')
a.trigger  = "game.trend_value(game_trends.G_C_EXTRAP_OUT, 6) + game.trend_value(game_trends.G_I_EXTRAP_OUT, 6) > tuning_constants.POPULATION_STEP_2"
a.frequency = 600  
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6a540845]]
a.message   = [[text@2a540849]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--Sims Holler For Housing
a = create_advice_cityplanning ('ea5a69a0')
a.trigger  = "game.g_r_demand_extrap > tuning_constants.POPULATION_STEP_3 and game.g_region_rci_population > tuning_constants.POPULATION_STEP_7"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.once = 1
a.title   = [[text@ca540855]]
a.message   = [[text@ea54085d]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--#City# Becoming Industrial Center
a = create_advice_cityplanning ('ca5a69df')
a.trigger  = "game.g_i_demand_extrap > tuning_constants.POPULATION_STEP_3 and game.g_region_r_population > tuning_constants.POPULATION_STEP_6"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.once = 1
a.title   = [[text@aa540860]]
a.message   = [[text@2a540864]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

----------- Advice record ----
--#City# Getting The Business
a = create_advice_cityplanning ('8a5a6a1a')
a.trigger  = "game.g_c_demand_extrap > tuning_constants.POPULATION_STEP_3 and game.g_region_r_population > tuning_constants.POPULATION_STEP_6"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.once = 1
a.title   = [[text@6a540868]]
a.message   = [[text@0a540884]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

----------- Advice record ----
--No Ship, No Trip, No Business Blip
a = create_advice_cityplanning ('0a5a6ae9')
a.trigger  = "game.g_city_id_population + game.g_city_im_population	> 1000 and game.g_medium_airport_count + game.g_small_airport_count + game.g_large_airport_count + game.g_seaport_count + game.g_num_rail_neighbors + game.g_num_road_neighbors + game.g_num_avenue_neighbors == 0"
a.timeout =  tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = [[text@aa54088c]]
a.message   = [[text@ea54088f]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--Industrial Markets Clogged, Wares Sit Warehoused
a = create_advice_cityplanning ('8a5a6a9c')
a.trigger  = "game.ga_freight_trip_length > 200 and game.g_medium_airport_count + game.g_small_airport_count + game.g_large_airport_count + game.g_seaport_count + game.g_num_rail_neighbors + game.g_num_road_neighbors > 0 and game.g_month == 9"
a.timeout =  tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = [[text@6a540893]]
a.message   = [[text@ca540897]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

----------- Advice record ----
--Plants Bring In Loot, But Always Pollute
--game.g_city_id_population > tuning_constants.POPULATION_STEP_4 and game.ga_air_pollution > tuning_constants.GA_POLLUTION_MEDIUM and game.g_tax_rate_i_dirty <= 9 and not game.ordinance_is_on(ordinance_ids.ORDINANCE_CLEANAIR)
a = create_advice_cityplanning ('ea5a6b17')
a.trigger  = "game.g_city_id_population > tuning_constants.POPULATION_STEP_3 and game.ga_air_pollution > tuning_constants.GA_POLLUTION_MEDIUM and game.g_tax_rate_i_dirty <= 9 and not game.ordinance_is_on(ordinance_ids.ORDINANCE_CLEANAIR)"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@4a54089c]]
a.message   = [[text@8a5408a1]]
a.priority = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW

----------- Advice record ----
--Manufacturers On The Make
a = create_advice_cityplanning ('2a5a6b51')
a.trigger  = "game.g_city_im_population > tuning_constants.POPULATION_STEP_5 and game.trend_slope(game_trends.G_IM_POPULATION, 12) > 0 and game.trend_slope(game_trends.G_ID_POPULATION, 12) < 0 and game.ordinance_is_on(ordinance_ids.ORDINANCE_INDPOLLUTEFEE)" 
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6a5408ab]]
a.message   = [[text@4a5408af]]
a.priority = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

----------- Advice record ----
--Sims Still Talking Through Stringed Cans; Wither High Tech?
a = create_advice_cityplanning ('0a5a6bcb')
a.trigger  = "0"
--game.g_city_im_population > tuning_constants.POPULATION_STEP_7 and game.ga_education < 60 and not game.ordinance_is_on(ordinance_ids.ORDINANCE_ELECTRONICSJOBFAIR)"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a5408b2']]
a.message   = [[text@0a5408b6']]
a.priority = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--High Technology Just The Ticket
a = create_advice_cityplanning ('6a5a6c09')
a.trigger  = "game.g_city_iht_population > tuning_constants.POPULATION_STEP_4 and game.trend_slope(game_trends.G_IHT_POPULATION, 3) > 0"
a.once = 1  
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a5408b9]]
a.message   = [[text@6a5408bd]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

----------- Advice record ----
--Industry Needs Some Leg Room
--a = create_advice_cityplanning ('0a5a6c4b')
--a.trigger  = "0"
--Need triggers for #all_I_pop#>60%[#I_zone_max_capacity#]  VARIABLE NOT AVAILABLE - NEED TO RETHINK
--a.timeout = 60
--a.title   = [[text@ca5408c1']]
--a.message   = [[text@0a5408c5']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--Industrial Tax Bite Chewing Up Expansion
a = create_advice_cityplanning ('aa5a6c89')
a.trigger  = "game.g_tax_rate_i_dirty >= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_HIGH and game.g_tax_rate_i_dirty < game.g_tax_rate_neutral * tuning_constants.TAX_RATE_VERY_HIGH and game.trend_value(game_trends.G_ID_POPULATION, 5) > .98 * game.g_city_id_population and game.g_city_id_population > tuning_constants.POPULATION_STEP_4"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aa5408c9]]
a.message   = [[text@4a5408cd]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--Industries Flee Tax Fleece
a = create_advice_cityplanning ('aa5a6cbd')
a.trigger  = "game.g_tax_rate_i_dirty >= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_VERY_HIGH and  game.trend_value(game_trends.G_ID_POPULATION, 5) > 1.1 * game.g_city_id_population and game.g_city_id_population > tuning_constants.POPULATION_STEP_3"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a5408d1]]
a.message   = [[text@ca5408d5]]   
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

----------- Advice record ----
--Manufacturers Not Tickled By Taxes
a = create_advice_cityplanning ('aa5a6d0c')
a.trigger  = "game.g_tax_rate_i_manufacturing >=  game.g_tax_rate_neutral * tuning_constants.TAX_RATE_HIGH and game.g_tax_rate_i_manufacturing < game.g_tax_rate_neutral * tuning_constants.TAX_RATE_VERY_HIGH and  game.trend_value(game_trends.G_IM_POPULATION, 5) > .98 * game.g_city_im_population and game.g_city_im_population > tuning_constants.POPULATION_STEP_3"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a5408d9]]
a.message   = [[text@2a5408dd]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--Manufacturers Massing For Tax Exodus
a = create_advice_cityplanning ('0a5a6d49')
a.trigger  = "game.g_tax_rate_i_manufacturing >= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_VERY_HIGH and  game.trend_value(game_trends.G_IM_POPULATION, 5) > 1.1 * game.g_city_im_population and game.g_city_im_population > tuning_constants.POPULATION_STEP_3"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a5408e6]]
a.message   = [[text@6a5408ec]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

----------- Advice record ----
--Tech Touchy About Tax
a = create_advice_cityplanning ('0a5a6d97')
a.trigger  =  "game.g_tax_rate_i_hightech >= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_HIGH and game.g_tax_rate_i_hightech < game.g_tax_rate_neutral * tuning_constants.TAX_RATE_VERY_HIGH and  game.trend_value(game_trends.G_IHT_POPULATION, 5) > .98 * game.g_city_iht_population and game.g_city_iht_population > tuning_constants.POPULATION_STEP_2"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea5408f0]]
a.message   = [[text@ea5408f4]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--#City# Taxes Torture Technology Industry
a = create_advice_cityplanning ('0a5a6dd6')
a.trigger  = "game.g_tax_rate_i_hightech >= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_VERY_HIGH and  game.trend_value(game_trends.G_IHT_POPULATION, 5) > 1.1 * game.g_city_iht_population and game.g_city_iht_population > tuning_constants.POPULATION_STEP_2"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a5408f8]]
a.message   = [[text@2a5408fc]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

----------- Advice record ----
--Low Taxes Raise Industries High
a = create_advice_cityplanning ('2a5a6e1a')
a.trigger  = "game.g_tax_rate_i_dirty <= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_LOW and  game.trend_value(game_trends.G_ID_POPULATION, 5) < 1.1 * game.g_city_id_population and game.g_city_id_population > tuning_constants.POPULATION_STEP_4"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a540900]]
a.message   = [[text@0a540904]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--Manufacturing Moguls Cheer Tipping Taxes
a = create_advice_cityplanning ('0a5a6e5f')
a.trigger  = "game.g_tax_rate_i_manufacturing <= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_LOW and  game.trend_slope(game_trends.G_IM_POPULATION, 5) < 1.1 * game.g_city_im_population and game.g_city_im_population > tuning_constants.POPULATION_STEP_4"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a540909]]
a.message   = [[text@aa54090c]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

----------- Advice record ----
--Untaxed Tech Kicking Up Its Heels
a = create_advice_cityplanning ('4a5a6eb2')
a.trigger  = "game.g_tax_rate_i_hightech <= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_LOW and  game.trend_slope(game_trends.G_IHT_POPULATION,5) < 1.1 * game.g_city_iht_population and game.g_city_iht_population > tuning_constants.POPULATION_STEP_3"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a540910]]
a.message   = [[text@2a540915]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

----------- Advice record ----
--Four Walls and A Roof Rare In #City#
a = create_advice_cityplanning ('4a5a6ef1')
a.trigger  = "game.g_r1_active_demand > 370 and game.g_num_rzone_ld_tiles + game.g_num_rzone_md_tiles	+ game.g_num_rzone_hd_tiles	== 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = [[text@4a540918]]
a.message   = [[text@8a54091c]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL


----------- Advice record ----
--High land values keeping workers away IF R$ ISN'T DEVELOPING BECAUSE OF HIGH LAND VALUE - MAY NOT BE NECESSARY
--a = create_advice_cityplanning ('2a5a6f33')
--a.trigger  = "0"
--Need triggers for minimum_LV[#all_undev_Rzone_tiles#]>#R$_Lvmax#  TRIGGER VARIABLES NOT AVAILABLE
--a.timeout = 60
--a.title   = [[text@2a540921']]
--a.message   = [[text@ea540927']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--Middle class families want a piece of the pie. IF R$$ ISN'T DEVELOPING BECAUSE OF LOW DESIRABILITY - MAY NOT BE NECESSARY
--a = create_advice_cityplanning ('4a5a6f6d')
--a.trigger  = "0"
--Need triggers for #R$$_demand#>2K AND maximum_LV[#all_undev_Rzone_tiles#] < #R$$_Lvmin#  TRIGGER VARIABLES NOT AVAILABLE
--a.timeout = 60
--a.title   = [[text@4a54092b']]
--a.message   = [[text@ea54092e']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--Rich folks demand prime property on edge of city.  IF R$$$ ISN'T DEVELOPING BECAUSE OF LOW DESIRABILITY - MAY NOT BE NECESSARY
--a = create_advice_cityplanning ('2a5a6fa4')
--a.trigger  = "0"
--Need triggers for #R$$$_demand#>200 AND maximum_LV[#all_undev_Rzone_tiles#] < #R$$$_Lvmin#  TRIGGER VARIABLES NOT AVAILABLE
--a.timeout = 60
--a.title   = [[text@ea540932']]
--a.message   = [[text@ea540936']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--City Spread Means Trouble Ahead
a = create_advice_cityplanning ('2a5cbcda')
a.trigger  = "game.g_num_rzone_md_tiles	+ game.g_num_rzone_hd_tiles	+ game.g_num_czone_md_tiles + game.g_num_czone_hd_tiles < .1 * (game.g_num_rzone_ld_tiles + game.g_num_czone_ld_tiles) and game.g_city_rci_population > tuning_constants.POPULATION_STEP_6"
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = [[text@6a540947]]
a.message   = [[text@ca54094d]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--Small City has No Use for Big Density
a = create_advice_cityplanning ('ca5cbd25')
a.trigger  = "game.g_city_rci_population < tuning_constants.POPULATION_STEP_5 and game.g_num_rzone_ld_tiles + game.g_num_czone_ld_tiles < 2*(game.g_num_rzone_md_tiles	+ game.g_num_rzone_hd_tiles	+ game.g_num_czone_md_tiles	+ game.g_num_czone_hd_tiles)"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a540951]]
a.message   = [[text@8a540956]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--Low-Dough Sims Ponying up to City
a.trigger  = "game.g_tax_rate_r_low >= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_HIGH and game.g_tax_rate_r_low < game.g_tax_rate_neutral * tuning_constants.TAX_RATE_VERY_HIGH and game.trend_delta(game_trends.G_RL_POPULATION,6) < 2 and game.g_city_r1_population > 1200"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a5409cd]]
a.message   = [[text@2a5409db]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.mood = advice_moods.NEUTRAL

----------- Advice record ----
--Shirt Off The Back Not Enough; Shoes Taken Too
a = create_advice_cityplanning ('2a5cc64e')
a.trigger  = "game.g_tax_rate_r_low >= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_VERY_HIGH and  game.trend_delta(game_trends.G_RL_POPULATION,6) < -5 and game.g_city_r1_population > 1200"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea5409df]]
a.message   = [[text@aa5409e3]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

---------- Advice record ----
--Middle Class Avoiding Tax Morass
a = create_advice_cityplanning ('0a5cc6c1')
a.trigger  = "game.g_tax_rate_r_med >= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_HIGH and game.g_tax_rate_r_med < game.g_tax_rate_neutral * tuning_constants.TAX_RATE_VERY_HIGH and game.trend_delta(game_trends.G_RM_POPULATION,6) < 2 and game.g_city_r2_population > 1200"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a5409e6]]
a.message   = [[text@ea5409ea]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Tax Rate Lacks Class--Particularly The Middle
a = create_advice_cityplanning ('0a5cc735')
a.trigger  = "game.g_tax_rate_r_med >= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_VERY_HIGH and game.trend_delta(game_trends.G_RM_POPULATION,6) < -5 and game.g_city_r2_population > 800"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a5409ef]]
a.message   = [[text@6a5409f3]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB


---------- Advice record ----
--Upper Crusters Not Toasting Taxes
a = create_advice_cityplanning ('8a5cc76b')
a.trigger  = "game.g_tax_rate_r_high >= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_HIGH and game.g_tax_rate_r_high < game.g_tax_rate_neutral * tuning_constants.TAX_RATE_VERY_HIGH and game.trend_delta(game_trends.G_RH_POPULATION,6) < 2 and game.g_city_r_population > 6000"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aa5409f7]]
a.message   = [[text@8a540a05]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Blue Bloods Fleeing; Bleeding Tax Money
a = create_advice_cityplanning ('4a5cc7a7')
a.trigger  = "game.g_tax_rate_r_high >= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_VERY_HIGH and game.trend_delta(game_trends.G_RH_POPULATION,6) < -5 and game.g_city_r3_population > 800"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aa540a09]]
a.message   = [[text@ca540a0c]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

---------- Advice record ----
--Light Levies Encourage Cash-Strapped Citizens
a = create_advice_cityplanning ('4a5cc82e')
a.trigger  = "game.g_tax_rate_r_low <= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_LOW and game.trend_delta(game_trends.G_RL_POPULATION,6) > 5 and game.g_city_r_population > 2000"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea540a10]]
a.message   = [[text@ea540a14]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

---------- Advice record ----
--Low Tax Brings Middle Class To The Max
a = create_advice_cityplanning ('8a5cc86a')
a.trigger  = "game.g_tax_rate_r_med <= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_LOW and game.trend_delta(game_trends.G_RM_POPULATION,6) > 5 and game.g_city_r2_population > 1200"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea540a17]]
a.message   = [[text@4a540a1b]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

---------- Advice record ----
--Tax The Rich? Not In #City#
a = create_advice_cityplanning ('ca5cc89e')
a.trigger  = "game.g_tax_rate_r_high <= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_LOW and game.trend_delta(game_trends.G_RH_POPULATION,6) > 5 and game.g_city_r3_population > 600"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a540a20]]
a.message   = [[text@2a540a24]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

---------- Advice record ----
--Sims Scout For Office Advantages 
a = create_advice_cityplanning ('2a6242e1')
a.trigger  = "(game.trend_delta(game_trends.G_COOH_POPULATION,6)< 2 and game.g_co3_active_demand	> 600) or (game.trend_delta(game_trends.G_COOM_POPULATION,6)< 2 and game.g_co2_active_demand	> 600)" 
-- POSITIVE CO DEMAND BUT NO PLACE TO DEVELOP
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a540a38 SC_Adv_CP085_hdl Sims Scout For Office Advantages]]
a.message   = [[text@2a540a3b SC_Adv_CP085_msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Merchants Miffed Over Tax Jab
a = create_advice_cityplanning ('4a5cc8ff')
a.trigger  = "game.g_tax_rate_cs_low >= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_HIGH and game.g_tax_rate_cs_low < game.g_tax_rate_neutral * tuning_constants.TAX_RATE_VERY_HIGH and game.trend_delta(game_trends.G_COSL_POPULATION,6) < 2 and game.g_city_c_population > 600"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aa540a66]]
a.message   = [[text@ea540a6a]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Tax Trouble: Small Stores Closing Doors
a = create_advice_cityplanning ('ca5cc938')
a.trigger  = "game.g_tax_rate_cs_low >= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_VERY_HIGH and game.trend_delta(game_trends.G_COSL_POPULATION,6) < -5 and game.g_city_c_population > 600"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea540a6e]]
a.message   = [[text@6a540a75]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB


---------- Advice record ----
--Small Shops Kicking Up Low-Tax Heels
a = create_advice_cityplanning ('6a5cc97a')
a.trigger  = "game.g_tax_rate_cs_low <= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_LOW and game.trend_delta(game_trends.G_COSL_POPULATION,6) > 5 and game.g_city_c_population > 600"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca540a79]]
a.message   = [[text@6a540a7d]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

---------- Advice record ----
--High taxes on retail sales bad for retail chains - NO LONGER NEEDED (CS and CO COMBINED)
--a = create_advice_cityplanning ('6a5cc9bc')
--a.trigger  = "0"
--Need triggers for #C$$_tax# > #Cs$$_demand_threshold_curve_1#
--a.timeout = 60
--a.title   = [[text@8a540a81']]
--a.message   = [[text@2a540a85']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL


---------- Advice record ----
--High retail taxes drive retail chains out of the city. - NO LONGER NEEDED (CS and CO COMBINED)
--a = create_advice_cityplanning ('0a5cc9f2')
--a.trigger  = "0"
--Need triggers for #C$$_tax# > #Cs$$_demand_threshold_curve_2#AND #Cs$$_active_demand# < 0AND #Cs$$_pop#>200
--a.timeout = 60
--a.title   = [[text@aa540a88']]
--a.message   = [[text@2a540a8c']]
--a.priority  = 60
---a.mood = advice_moods.BAD_JOB


---------- Advice record ----
--Low retail taxes a boon for shoppers - NO LONGER NEEDED (CS and CO COMBINED)
--a = create_advice_cityplanning ('0a5cc9f2')
--a.trigger  = "0"
--Need triggers for #C$$_tax# < #Cs$$_demand_threshold_curve_3#AND #Cs$$_active_demand# < 0AND #Cs$$_pop#>200
--a.timeout = 60
--a.title   = [[text@ca540a91']]
--a.message   = [[text@ea540a96']]
--a.priority  = 60
--a.mood = advice_moods.GREAT_JOB


---------- Advice record ----
--High taxes on luxury items bad for city boutiques. - NO LONGER NEEDED (CS and CO COMBINED)
--a = create_advice_cityplanning ('4a5ccabd')
--a.trigger  = "0"
--Need triggers for #C$$$_tax# > #Cs$$$_demand_threshold_curve_1#
--a.timeout = 60
--a.title   = [[text@4a540a9a']]
--a.message   = [[text@8a540a9d']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--High luxury retail taxes drive boutiques out of business - NO LONGER NEEDED (CS and CO COMBINED)
--a = create_advice_cityplanning ('6a5ccaf0')
--a.trigger  = "0"
--Need triggers for #C$$$_tax# > #Cs$$$_demand_threshold_curve_2# AND #Cs$$$_active_demand# < 0 AND #Cs$$$_pop#>200
--a.timeout = 60
--a.title   = [[text@8a540aa1']]
--a.message   = [[text@4a540aa5']]
--a.priority  = 60
--a.mood = advice_moods.BAD_JOB


---------- Advice record ----
--Low retail taxes a boon for high end shoppers. - NO LONGER NEEDED (CS and CO COMBINED)
--a = create_advice_cityplanning ('6a5ccb33')
--a.trigger  = "0"
--Need triggers for #C$$$_tax# < #Cs$$$_demand_threshold_curve_3# AND #Cs$$$_active_demand# < 0 AND #Cs$$$_pop#>200
--a.timeout = 60
--a.title   = [[text@ea540aa9']]
--a.message   = [[text@4a540aae']]
--a.priority  = 60
--a.mood = advice_moods.GREAT_JOB


---------- Advice record ----
--Businesses Buckling Under Bad Tax Tickers
a = create_advice_cityplanning ('0a5ccb78')
a.trigger  = "game.g_tax_rate_co_med > game.g_tax_rate_neutral * tuning_constants.TAX_RATE_HIGH and game.g_tax_rate_co_med < game.g_tax_rate_neutral * tuning_constants.TAX_RATE_VERY_HIGH and (game.trend_delta(game_trends.G_COOM_POPULATION,6) < 2 or game.trend_delta(game_trends.G_COSM_POPULATION,6) < 2) and game.g_city_c_population > 600"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6a540ab2]]
a.message   = [[text@2a540ab6]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Tax Torment Snuffs Commerce Candle
a = create_advice_cityplanning ('ca5ccbaf')
a.trigger  = "game.g_tax_rate_co_med > game.g_tax_rate_neutral * tuning_constants.TAX_RATE_VERY_HIGH and (game.trend_delta(game_trends.G_COOM_POPULATION,6) < -5 or  game.trend_delta(game_trends.G_COSM_POPULATION,6) < -5) and game.g_city_c_population > 600"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea540aba]]
a.message   = [[text@8a540abe]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

---------- Advice record ----
--Low Taxes: Business Backslaps All Around
a = create_advice_cityplanning ('6a5ccbf1')
a.trigger  = "game.g_tax_rate_co_med <= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_LOW and (game.trend_delta(game_trends.G_COOM_POPULATION,6) > 5 or game.trend_delta(game_trends.G_COSM_POPULATION,6) > 5) and game.g_city_co2_population > 600"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6a540ac4]]
a.message   = [[text@8a540ac8]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

---------- Advice record ----
--Tax Flak: Shiny Commercial Coin Held For Ransom
a = create_advice_cityplanning ('ca5ccc34')
a.trigger  = "game.g_tax_rate_co_high > game.g_tax_rate_neutral * tuning_constants.TAX_RATE_HIGH and game.g_tax_rate_co_high < game.g_tax_rate_neutral * tuning_constants.TAX_RATE_VERY_HIGH and (game.trend_delta(game_trends.G_COOH_POPULATION,6) < 2 or game.trend_delta(game_trends.G_COSH_POPULATION,6) < 2) and game.g_city_co3_population > 500"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a540acd]]
a.message   = [[text@8a540ad2]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--High-end Commerce Packing it in After Taxing Takedowns
a = create_advice_cityplanning ('2a5ccc68')
a.trigger  = "game.g_tax_rate_co_high > game.g_tax_rate_neutral * tuning_constants.TAX_RATE_VERY_HIGH and (game.trend_delta(game_trends.G_COOH_POPULATION,6) < -5 or  game.trend_delta(game_trends.G_COSH_POPULATION,6) < -5) and game.g_city_co3_population > 400"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca540ad6]]
a.message   = [[text@8a540ada]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

---------- Advice record ----
--Tiny Tax Rate = Big Business Boom
a = create_advice_cityplanning ('0a5cccaf')
a.trigger  = "game.g_tax_rate_co_high <= game.g_tax_rate_neutral * tuning_constants.TAX_RATE_LOW and (game.trend_delta(game_trends.G_COOH_POPULATION,6) > 5 or  game.trend_delta(game_trends.G_COSH_POPULATION,6) > 5) and game.g_city_co3_population > 1000"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aa540adf]]
a.message   = [[text@0a540ae2]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

---------- Advice record ----
--Farm Economy: Easy Pickings
a = create_advice_cityplanning ('8a623ab0')
a.trigger  = "game.g_city_ir_population > 0 and game.g_population > 1000"
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a6223b0	SC4_AdvCP_agriculture_301_hdl	Agriculture can provide an economic base]]
a.message   = [[text@8a6223b5	SC4_AdvCP_agriculture_301_msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Farms, a low-intensity industrial alternative NO LONGER NEEDED
--a = create_advice_cityplanning ('ca623b6b')
--a.trigger  = "0"
--city_Ir_population > 0 AND num_Izone_tiles_R = 0
--a.timeout = 60
--a.title   = [[text@6a6223b9	SC4_AdvCP_agriculture_302_hdl	Farms, a low-intensity industrial alternative']]
--a.message   = [[text@2a6223bd	SC4_AdvCP_agriculture_302_msg']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Agriculture Can Make Industry Flower
a = create_advice_cityplanning ('4a623bc4')
a.trigger  = "0"
--"game.g_num_izone_r_tiles == 0 and game.g_city_id_population > 900 and game.trend_delta(game_trends.G_ID_POPULATION,6) < 2"
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aa6223c0	SC4_AdvCP_agriculture_303_hdl	Agriculture can give a boost to industry]]
a.message   = [[text@ca6223c3	SC4_AdvCP_agriculture_303_msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--The Back Forty Is Filled With Fieldworkers
a = create_advice_cityplanning ('ea623c30')
a.trigger  = "game.g_city_ir_population > 200"
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@4a6223c6	SC4_AdvCP_agriculture_304_hdl	Farms mean jobs]]
a.message   = [[text@aa6223ca	SC4_AdvCP_agriculture_304_msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Farms Vulnerable To Foul Air 
a = create_advice_cityplanning ('4a623c79')
a.trigger  = "game.g_city_ir_population > 2000 and game.ga_air_pollution >= tuning_constants.GA_POLLUTION_MEDIUM"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea6223cd	SC4_AdvCP_agriculture_305_hdl	Pollution is bad for farms]]
a.message   = [[text@0a6223d0	SC4_AdvCP_agriculture_305_msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Lack of Public Water Limits Growth
a = create_advice_cityplanning ('6a623ccf')
a.trigger  = "game.g_water_source_count == 0 and game.g_water_production_capacity == 0 and game.g_city_rci_population > tuning_constants.POPULATION_STEP_5 and game.g_water_imported == 0 and game.g_income_monthly - game.g_expense_monthly  > 200"
--"game.g_city_rci_population > 7000 and game.g_unwatered_building_count > 5 * game.g_watered_building_count and (game.g_num_rzone_md_tiles	+ game.g_num_rzone_hd_tiles	+ game.g_num_czone_md_tiles	+ game.g_num_czone_hd_tiles	+ game.g_num_izone_h_tiles) > 4"
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = [[text@4a6223d3	SC4_AdvCP_Blockages_311_hdl	Dense development first requires a civic water system]]
a.message   = [[text@6a6223d6	SC4_AdvCP_Blockages_311_msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL
a.frequency = tuning_constants.ADVICE_FREQUENCY_VERY_LOW

---------- Advice record ----
--Port Placement Would Float #City#'s Boat
a = create_advice_cityplanning ('aa623d29')
a.trigger  = "game.g_city_id_population + game.g_city_im_population	> tuning_constants.POPULATION_STEP_6 and game.g_seaport_count==0 and (100*256*game.g_water_tile_count) / game.g_city_tile_size > 35"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca6223d9	SC4_AdvCP_Ports_330_hdl	#city# a good place for a seaport]]
a.message   = [[text@aa6223dc	SC4_AdvCP_Ports_330_msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.frequency = 720

---------- Advice record ----
--Full Employment Without Enjoyment
a = create_advice_cityplanning ('2a623d94')
a.trigger  = "(game.trend_delta(game_trends.G_CO_POPULATION,12) > 8 or game.trend_delta(game_trends.G_I_POPULATION,12) > 8) and (game.trend_delta(game_trends.G_R_POPULATION,12) < 5 and game.trend_delta(game_trends.G_R_POPULATION,12) > -5) and game.g_region_c_population + game.g_region_i_population > 1.1 * game.g_region_workforce_population and game.g_population > tuning_constants.POPULATION_STEP_5"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a6223df	SC4_AdvCP_RCIFluxes_339_hdl	Low unemployment has drawbacks]]
a.message   = [[text@ca6223e5	SC4_AdvCP_RCIFluxes_339_msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Companies Looking High and Low for Laborers
a = create_advice_cityplanning ('2a623e54')
a.trigger  = "(game.trend_delta(game_trends.G_CO_POPULATION,12) > 0 or game.trend_delta(game_trends.G_I_POPULATION,12) > 0) and game.trend_delta(game_trends.G_R_POPULATION,12) < -8 and game.g_workforce_active_demand < -200 and (game.g_region_c_population + game.g_region_i_population > 1.1 * game.g_region_workforce_population) and game.g_population > tuning_constants.POPULATION_STEP_5"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a6223e8	SC4_AdvCP_RCIFluxes_340_hdl	Disappearing workforce leaves companies in a lurch.]]
a.message   = [[text@ea6223ec	SC4_AdvCP_RCIFluxes_340_msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--No Hands To Handle Job; Businesses Bailing
a = create_advice_cityplanning ('8a623eb4')
a.trigger  = "game.g_co2_active_demand	< -200 and game.g_co3_active_demand	< -200 and game.g_id_active_demand	< -200 and game.g_im_active_demand	< -200 and game.g_iht_active_demand	< -200 and (game.g_region_c_population + game.g_region_i_population > 1.1 * game.g_region_workforce_population) and game.g_population > tuning_constants.POPULATION_STEP_5"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea6223ef	SC4_AdvCP_RCIFluxes_341_hdl	Businesses leaving due to lack of workforce']]
a.message   = [[text@0a6223f2	SC4_AdvCP_RCIFluxes_341_msg']]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Sims Turn To Daytime TV After Businesses Shut Doors
a = create_advice_cityplanning ('6a623efd')
a.trigger  = "game.g_co2_active_demand	< -200 and game.g_co3_active_demand	< -200 and game.g_id_active_demand	< -200 and game.g_im_active_demand	< -200 and game.g_iht_active_demand	< -200 and (game.g_region_c_population + game.g_region_i_population < .85 * game.g_region_workforce_population) and game.g_population > tuning_constants.POPULATION_STEP_5"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a6223f5	SC4_AdvCP_RCIFluxes_342_hdl	Closing businesses leave many sims without jobs']]
a.message   = [[text@4a6223f9	SC4_AdvCP_RCIFluxes_342_msg']]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--New Arrivals Face Poor Job Prospects
a = create_advice_cityplanning ('ea623f3a')
a.trigger  = "game.trend_delta(game_trends.G_R_POPULATION,12) > 5 and (game.g_region_c_population + game.g_region_i_population < .9 * game.g_region_workforce_population) and game.g_population > tuning_constants.POPULATION_STEP_5"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aa6223fd	SC4_AdvCP_RCIFluxes_343_hdl	New residents finding a lack of work opportunities.']]
a.message   = [[text@6a622400	SC4_AdvCP_RCIFluxes_343_msg']]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Residents Turn Tail On Jobless #City#
a = create_advice_cityplanning ('2a623f82')
a.trigger  = "game.trend_delta(game_trends.G_R_POPULATION,12) < -8 and (game.g_region_c_population + game.g_region_i_population < .9 * game.g_region_workforce_population) and game.g_population > tuning_constants.POPULATION_STEP_5"
-- COMPLEX TRIGGER, is this workin?
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a622403	SC4_AdvCP_RCIFluxes_344_hdl	Residents abandoning city for lack of jobs']]
a.message   = [[text@ea622407	SC4_AdvCP_RCIFluxes_344_msg']]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Parks A Plus For Neighborhood Betterment
a = create_advice_cityplanning ('ea6640f8')
a.trigger  = "game.g_num_parks + game.g_num_recreation < 3 and game.g_population > tuning_constants.POPULATION_STEP_4"
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = [[text@ea637a0b']]
a.message   = [[text@6a637a0e']]
a.once = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Parks Give Elbow Room To Congested City
a = create_advice_cityplanning ('ca664174')
a.trigger  = "game.g_num_parks + game.g_num_recreation < 25 and game.g_population > tuning_constants.POPULATION_STEP_7"
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@8a637a11']]
a.message   = [[text@ea637a14']]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Commercial Districts Partial to Plazas--
a = create_advice_cityplanning ('4a6641c4')
a.trigger  = "game.g_num_parks < 14 and game.g_city_c_population > tuning_constants.POPULATION_STEP_5"
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = [[text@aa637a18']]
a.message   = [[text@6a637a1b']]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Tree Planting A Powerful Panacea -  TRIGGERS NOT YET AVAILABLE
--a = create_advice_cityplanning ('2a664204')
--a.trigger  = "0"
--"num_trees < 500"
--a.timeout = 60
--a.title   = [[text@4a637a1e']]
--a.message   = [[text@ea637a22']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Every Scholar Brings Top Dollar
a = create_advice_cityplanning ('0a66431d')
a.trigger  = "game.g_num_educational_buildings == 1"
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ea6630f2]]
a.message   = [[text@0a6630ff]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Good Health Makes Sims Stand Tall And Sit Pretty
a = create_advice_cityplanning ('8a664251')
a.trigger  = "game.g_num_hospitals + game.g_num_clinics == 1"
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@8a637aca]]
a.message   = [[text@6a637acc]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--#City# Law And Its Order
a = create_advice_cityplanning ('ea66429f')
a.trigger  = "game.g_police_station_count + game.g_jail_count == 1"
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@8a637acf]]
a.message   = [[text@0a637ad2]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Placing Fire Stations Keeps A Mayor From Being Flamed
a = create_advice_cityplanning ('2a6642d8')
a.trigger  = "game.g_fire_station_count == 1"
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@8a637ad5]]
a.message   = [[text@aa637ad8]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Ports For Storms, Ports For Calms, Ports For Cash
a = create_advice_cityplanning ('6a71187e')
a.trigger  = "game.g_seaport_count + game.g_medium_airport_count + game.g_small_airport_count + game.g_large_airport_count == 1"
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ea637ae1]]
a.message   = [[text@6a637ae4]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Cheap #City# Therapy: Parks and Rec 
a = create_advice_cityplanning ('ea66447b')
a.trigger  = "game.g_num_parks > 0"
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ca637adb]]
a.message   = [[text@0a637ade]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Mayor Rating Tells You Sims Loving Or Hating
a = create_advice_cityplanning ('ca71195c')
a.trigger  = "(game.ga_mayor_rating < tuning_constants.AVG_MAYOR_RATING_AVERAGE - 10 or game.ga_mayor_rating > tuning_constants.AVG_MAYOR_RATING_AVERAGE + 10) and game.g_population > tuning_constants.POPULATION_STEP_2"
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = [[text@4a6379c1]]
a.message   = [[text@0a6379c5]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Dig Deeper Than The Mayors Rating
a = create_advice_cityplanning ('aa7119c3')
a.trigger  = "game.l_mayor_rating_l < tuning_constants.AVG_MAYOR_RATING_LOW and game.l_mayor_rating_h > tuning_constants.AVG_MAYOR_RATING_GOOD and game.g_population > tuning_constants.POPULATION_STEP_2"
-- trigger: "TractWithLowestMR <-70 AND  TractWithHighestMR > 70"
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = [[text@aa6379c8]]
a.message   = [[text@ca6379cb]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--#City# Districts Down On Mayor
a = create_advice_cityplanning ('2a84ac59')
a.trigger  = "game.l_mayor_rating_l < tuning_constants.AVG_MAYOR_RATING_VERYLOW and game.g_population > tuning_constants.POPULATION_STEP_3"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a6379d2 #City# Districts Down On Mayor]]
a.message   = [[text@ca6379e2  Wow, something about your mayoral work has really fouled the nests here, Mayor. Sims in <a href="#link_id#game.camera_jump_a]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW

---------- Advice record ----
--Mayor Rocks According To City Blocks
a = create_advice_cityplanning ('0a84ac79')
a.trigger  = "game.l_mayor_rating_h > tuning_constants.AVG_MAYOR_RATING_VERYGOOD"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6a6379e9]]
a.message   = [[text@aa6379ed]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_VERY_LOW

---------- Advice record ----
--Mayor Rating Says City Leader A Stinker
a = create_advice_cityplanning ('ca711a24')
a.trigger  = "game.ga_mayor_rating <=     tuning_constants.AVG_MAYOR_RATING_LOW and game.g_population > tuning_constants.POPULATION_STEP_4"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aa6379f0]]
a.message   = [[text@ea6379f4]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW

---------- Advice record ----
--Mayor A Clown But Nobody's Laughing
a = create_advice_cityplanning ('ea711a97')
a.trigger  = "game.ga_mayor_rating < tuning_constants.AVG_MAYOR_RATING_VERYLOW and game.g_population > tuning_constants.POPULATION_STEP_4"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a6379f7]]
a.message   = [[text@2a6379fa]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.ALARM
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW

---------- Advice record ----
--Mayor A Player
a = create_advice_cityplanning ('0a711b04')
a.trigger  = "game.ga_mayor_rating >=     tuning_constants.AVG_MAYOR_RATING_GOOD and game.ga_mayor_rating <  tuning_constants.AVG_MAYOR_RATING_VERYGOOD and game.g_population > tuning_constants.POPULATION_STEP_4"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a6379fd]]
a.message   = [[text@4a637a00]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

---------- Advice record ----
--Mayor A Giant Of Governing Gifts
a = create_advice_cityplanning ('ca711b09')
a.trigger  = "game.ga_mayor_rating >=     tuning_constants.AVG_MAYOR_RATING_VERYGOOD and game.g_population > tuning_constants.POPULATION_STEP_4"
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = [[text@0a637a03]]
a.message   = [[text@4a637a07]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB

---------- Advice record ----
--New Residential Development Stymied By Limited Choices
a = create_advice_cityplanning ('8a9f13af')
a.trigger  = "(game.g_r1_active_demand	> 800 or game.g_r2_active_demand	> 800 or game.g_r3_active_demand > 800) and game.trend_delta(game_trends.G_R_POPULATION,6) <= 3"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ca9f07c3 New Residential Development Stymied By Limited Choices ]]
a.message   = [[text@aa9f07c9 Mayor, we've got prospective residents knocking on #city#'s door wanting to move in, but they are having trouble finding good locations to develop.  It might be that you need to <a href="#link_id#game.tool_plop_zone(zone_tool_types.RESIDENTIAL_LD)">zone more</a> areas for them, or maybe the problem is that the zones we have already don't suit their needs - aren't <a href="#link_id#game.window_map(map_window_types.DESIRABILITY)">desirable</a> for development. It's up to you, Mayor: shall #city# grow or not?]]
a.once = 1
a.frequency = tuning_constants.ADVICE_FREQUENCY_VERY_LOW
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Business Wants To Grow; Needs Mayor's Help
a = create_advice_cityplanning ('2a9f13aa')
a.trigger  = "game.g_co2_active_demand + game.g_co3_active_demand > 200 and game.g_r1_demand	+ game.g_r2_demand + game.g_r3_demand	< 0"
--"(game.g_co2_active_demand	> 300 or game.g_co3_active_demand	> 300) and game.trend_value(game_trends.G_COOM_POPULATION,6) + game.trend_value(game_trends.G_COOH_POPULATION,6) >= game.g_city_co2_population + game.g_city_co3_population"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6a9f07cc Business Wants To Grow; Needs Mayor's Help]]
a.message   = [[text@6a9f07d0 I've been getting calls lately, Mayor, from businesses wanting to open shop here in #city#, but they can't find any locations to their liking.  You might want to <a href="#link_id#game.tool_plop_zone(zone_tool_types.COMMERCIAL_MD)">zone more commercial</a> areas or take measures to improve the <a href="#link_id#game.window_map(map_window_types.DESIRABILITY)">desirability</a> of the zones we have.  Remember, more businesses mean more taxes for us!]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Industry Needs Room To Expand
a = create_advice_cityplanning ('0a9f13a6')
a.trigger  = "(game.g_id_active_demand	> 800 or game.g_im_active_demand	> 800 or game.g_iht_active_demand > 800) and game.trend_value(game_trends.G_I_POPULATION,6) >= game.g_city_i_population"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a9f07d3 Industry Needs Room To Expand]]
a.message   = [[text@ca9f07d6 We've got some strong demand for new industry here in #city#, but all proposals for industrial growth keep hitting a brick wall.  There's a real lack of proper industrial zoning in town, requiring either more <a href="#link_id#game.tool_plop_zone(zone_tool_types.INDUSTRIAL_HEAVY)">new zones</a> or better preparation of existing zones - infrastructure or terrain levelling.  Let's get those gears in motion and put this city to work!  ]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Apartments Herald City Expansion
--a = create_advice_cityplanning ('ea6645d3')
--a.trigger  = "0"
--#event_first_instance_R$stage4#
--a.timeout = 60
--a.title   = [[text@6a637a25']]
--a.message   = [[text@ca637a29']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Townhouses Tiptoeing Into #City#
--a = create_advice_cityplanning ('8a66460c')
--a.trigger  = "0"
---#event_first_instance_R$$stage4#
--a.timeout = 60
--a.title   = [[text@6a637a2d']]
--a.message   = [[text@aa637a31']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Designer Digs Decorate #City#
--a = create_advice_cityplanning ('2a664646')
--a.trigger  = "0"
----#event_first_instance_R$$$stage4#
--a.timeout = 60
--a.title   = [[text@8a637a34']]
--a.message   = [[text@2a637a37']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Costly Condos Seen In City
--a = create_advice_cityplanning ('ea66467d')
--a.trigger  = "0"
----#event_first_instance_R$$$stage5#
--a.timeout = 60
--a.title   = [[text@ea637a3a']]
--a.message   = [[text@6a637a41']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Sky-Scraping Citizens Taking A Stand
--a = create_advice_cityplanning ('ca6646ae')
--a.trigger  = "0"
---#event_first_instance_Rstage7#
--a.timeout = 60
--a.title   = [[text@ca637a44']]
--a.message   = [[text@aa637a4a']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Towering Buildings Top City Skyline
--a = create_advice_cityplanning ('ea6646e0')
--a.trigger  = "0"
--#event_first_instance_Rstage8#
--a.timeout = 60
--a.title   = [[text@4a637a4d']]
--a.message   = [[text@6a637a54']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Shopping Centers Hold Increasing Fascination--And Financial Interests--In City
--a = create_advice_cityplanning ('ea66470f')
--a.trigger  = "0"
----#event_first_instance_Csstage4#
--a.timeout = 60
--a.title   = [[text@ca637a57']]
--a.message   = [[text@8a637a5d']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Shopping Opportunities Abound In #City#
--a = create_advice_cityplanning ('0a66473e')
--a.trigger  = "0"
----#event_first_instance_Csstage8#
--a.timeout = 60
--a.title   = [[text@8a637a5d']]
--a.message   = [[text@8a637a63']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Job Growth Smoking Like The Surrounding Stacks 
--a = create_advice_cityplanning ('ea66477b')
--a.trigger  = "0"
---#event_first_instance_Imstage3#
--a.timeout = 60
--a.title   = [[text@aa637a66']]
--a.message   = [[text@8a637a6a']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--High-Tech Happy To Make #City# Acquaintance
--a = create_advice_cityplanning ('ea6647b6')
--a.trigger  = "0"
--#event_first_instance_R$stage1#
--a.timeout = 60
--a.title   = [[text@ca637a6f']]
--a.message   = [[text@0a637a72']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--#City#'s Future Face In Today's Tech Mirror
--a = create_advice_cityplanning ('6a6647e7')
--a.trigger  = "0"
--#event_first_instance_Iht_stage3#
--a.timeout = 60
--a.title   = [[text@0a637a76']]
--a.message   = [[text@ca637a79']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Shiny New Professional Building Reflects #City# Business Health
--a = create_advice_cityplanning ('ca664869')
--a.trigger  = "0"
----#event_first_instance_Co$$stage4#
--a.timeout = 60
--a.title   = [[text@ca637a7d']]
--a.message   = [[text@2a637a81']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Office Tower Fills Tall Order
--a = create_advice_cityplanning ('6a664895')
--a.trigger  = "0"
--#event_first_instance_Co$$stage7#
--a.timeout = 60
--a.title   = [[text@8a637a85']]
--a.message   = [[text@6a637a89']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Money Mavens Set Up Stake In #City#
--a = create_advice_cityplanning ('6a6648c6')
--a.trigger  = "0"
--#event_first_instance_Co$$$stage4#
--a.timeout = 60
--a.title   = [[text@2a637a8d']]
--a.message   = [[text@0a637a91']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Corporate Constuction Changing Face Of #City#
--a = create_advice_cityplanning ('8a6648f3')
--a.trigger  = "0"
--#event_first_instance_Co$$$stage7#
--a.timeout = 60
--a.title   = [[text@4a637a93']]
--a.message   = [[text@6a637a96']]
--a.priority  = 60
--a.mood = advice_moods.NEUTRAL



--------------------------------------------------------------------
-- This will try to execute triggers for all registerd advices 
-- to make sure they don't have any syntactic errors.

if (_sys.config_run == 0)
then
   advices : run_triggers()
end
