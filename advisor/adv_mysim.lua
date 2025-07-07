-----------------------------------------------------------------------------------------
-- This file defines advices for the the MYSIM
dofile("_adv_sys.lua") 
dofile("_adv_advice.lua") 
dofile("adv_game_data.lua") 
dofile("adv_mysim_data.lua") 

-- helper funcition
function create_advice_mysim_with_base(guid_string, base_advice)
   local a =  advices : create_advice(tonumber(guid_string, 16), base_advice)
   a.type   = advice_types . MYSIM
   return a
end

-- helper funcition
function create_advice_mysim(guid_string)
   local a =  create_advice_mysim_with_base(guid_string, nil)
   a.class_id = hex2dec("6a9335de") -- cSC4MySimAdvice class ID
   a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
   return a
end
--
--

----------------------------------------------------------------------
-- Advice fields 

--type      = advice_types . MYSIM,
--priority  = 100,
--title        = "UNDEFINED title : from base advice structure",
--message = "UNDEFINED message : from base advice structure",
--frequency   = 35, -- in days
--timeout   = 45, -- in days
--trigger   = "1",
--once   = 0, -- trigger the advice only once
-- news_only = 0, -- set to 1 for news-flipper messages only 
-- event = 0, -- this has to be a valid event ID (see const file for the event table.)
-- command = 0, -- game command to trigger along with the advice message
-- persist = 0, -- if 1, message will remain visible once triggered whether or not trigger condition remains true (useful for random triggers)

------------ Advice records ----
-- the advice records below are merely *samples* showing how to 
-- use the various events, variables and commands!


  -- advice_moods.ALARM = 0
   --advice_moods.BAD_JOB = 1   
  -- advice_moods.NEUTRAL = 3
  -- advice_moods.GREAT_JOB = 5
   
   
   --TEST FOR VARIABLE
--a = create_advice_mysim('6aca5a0f')

--a.trigger  = "1" 
--a.command = game_commands.MYSIM_MOVE_OUT
--a.persist = 1
--a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM

--a.title   = [[mysim.desirability=#mysim.desirability#]]
--a.message   = [[text@ea5bc817This place is the pits. No one wants to live here, least of all me! I've got to find a new place to live.]]
--a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
--a.mood = advice_moods.BAD_JOB


--#Advisor# Moves In
a = create_advice_mysim('aa3e8b5e')

a.event = game_events.MYSIM_MOVE_IN
a.trigger  = "1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@aa5bc803#Advisor# moves into new home"
a.message   = [[text@4a5bc806Hi Mayor #mayor#! #Advisor# here. I just wanted to let you know that I'm settling in and happy to be living at <a href="#link_id#game.camera_jump(mysim.home_location)">#mysim.home_building#</a>, my new home.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB
   
--Failed Commute, #Advisor# can't get to work
a = create_advice_mysim('4a455b0c')

a.event = game_events.MYSIM_COMMUTE_FAILED
a.trigger  = "1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@6a5bc3ea#Advisor# can't get to work"
a.message   = [[text@2a5bc488I got fired because I couldn't make it to work. I don't know what's with these roads, but I hope I can find a 
that I can actually get to.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB





--Long Commute
a = create_advice_mysim('aa5ce714')

a.trigger  = "mysim.employed == 1 and mysim.last_commute_time > tuning_constants.LONG_COMMUTE"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca5bc48e#Advisor# says "My commute sucks"]]
a.message   = [[text@ca5bc493My commute sucks. Its taking way to long to get to work. Grrrr…]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB


--Short Commute
a = create_advice_mysim('aa5ce7b7')
--trigger used to use mysim.last_commute_time < tuning_constants.SHORT_COMMUTE. It could be a short congested commute. Wonder if this works...
a.trigger  = "mysim.employed == 1 and mysim.last_trip_type == mysim_trip_types.CAR and mysim.trip_time_ratio >= 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@ea5bc496Clear Roads for #Advisor#"
a.message   = [[text@8a5bc499Ahhh... Commuting is such a joy. I love the open road. Keep it up.]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.GREAT_JOB


--high traffic congestion by My Sim's home
a = create_advice_mysim('ca5cebfb')

a.trigger  = "mysim.local_traffic_congestion > tuning_constants.TRAFFIC_CONGESTION_HIGH"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@ca5bc4a3High traffic congestion by My Sim's home"
a.message   = [[text@ea5bc4a7complain about honking and angry commuters making it hard to watch TV.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.NEUTRAL

--WATER POLLUTION SECTION

--Water Pollution > Medium & MySim is middle-aged
a = create_advice_mysim('aa5ce9fa')

a.trigger  = "mysim.local_water_pollution > tuning_constants.POLLUTION_MEDIUM and mysim.age > tuning_constants.MYSIM_MIDDLE_AGE and mysim.age < tuning_constants.MYSIM_OLD_AGE"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@6a5bc4aaWater is Sickening #Advisor#'s kids"
a.message   = [[text@0a5bc4adMayor, is your "water" coming out of tap green and stinky? Well mine is! Crack down on the polluters. It's gross and my kids are getting sick.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB

--Water Pollution> Medium & MySim is NOT middle-aged
a = create_advice_mysim('8a5cecf2')

a.trigger  = "mysim.local_water_pollution> tuning_constants.POLLUTION_MEDIUM and (mysim.age<tuning_constants.MYSIM_MIDDLE_AGE or mysim.age>tuning_constants.MYSIM_OLD_AGE) and mysim.home_has_water > 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a5bc4b3#Advisor# says "water is stinky!"]]
a.message   = [[text@6a5bc4b6Mayor, is your "water" coming out of tap green and stinky? Well mine is! Crack down on the polluters. It's gross.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB

--Water Pollution > High & MySim <medium healthy &  hospital nearby
a = create_advice_mysim('2a5cedb7')

a.trigger  = "mysim.local_water_pollution> tuning_constants.POLLUTION_HIGH and mysim.hq<tuning_constants.MYSIM_HQ_MEDIUM and game.mysim_distance_to_closest_building(building_groups.HEALTH) < tuning_constants.MYSIM_HOME_RADIUS"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@aa5bc4cc#Advisor# hospitalized"
a.message   = [[text@2a5bc4cfPolluted drinking water suspected]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB


--                   ****************KILLS MY SIM. URGENT MESSAGE****************
--Water Pollution > High & MySim is low health & NO hospital nearby & my sims is a pisces
a = create_advice_mysim('6a74cce0')

a.trigger  = [[mysim.local_water_pollution> tuning_constants.POLLUTION_HIGH and mysim.hq<tuning_constants.MYSIM_HQ_LOW and game.mysim_distance_to_closest_building(building_groups.HEALTH) > tuning_constants.MYSIM_HOME_RADIUS and mysim.zodiac == 11]]--11 = pisces
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM

a.title   = "text@8a5bc4d2#advisor# Dies"
a.message   = [[text@4a5bc4d5Polluted drinking water suspected. The rare tricanastious germ that propogates itself in in highly polluted water is to blame. Mayor, please do something before more sims perish.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.command = game_commands.MYSIM_DIE
a.mood = advice_moods.ALARM


--Water Pollution > High & MySim is > medium health
a = create_advice_mysim('4a5cfaed')

a.trigger  = "mysim.local_water_pollution> tuning_constants.POLLUTION_HIGH and mysim.hq>tuning_constants.MYSIM_HQ_MEDIUM"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a5bc4d8#Advisor# says "My tap water is UNDRINKABLE!"]]
a.message   = [[text@6a5bc4dbThis has got to be a health hazard mayor. I don't know what those big factories are dumping into the water, but you've got to stop it!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB


--AIR POLLUTION SECTION

--Air Pollution = medium & MySim is old and unhealthy
a = create_advice_mysim('0a5cfbca')

a.trigger  = "mysim.local_air_pollution< tuning_constants.POLLUTION_HIGH and mysim.local_air_pollution > tuning_constants.POLLUTION_MEDIUM and mysim.age> tuning_constants.MYSIM_OLD_AGE and mysim.hq < tuning_constants.MYSIM_HQ_LOW"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@2a5bc4e0#advisor# can't breathe"
a.message   = [[text@8a5bc4e3Hello…Mayor. COUGH!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB

--Air Pollution = medium & MySim is at least somewhat healthy
a = create_advice_mysim('6a5cffce')

a.trigger  = "mysim.local_air_pollution< tuning_constants.POLLUTION_HIGH and mysim.local_air_pollution > tuning_constants.POLLUTION_MEDIUM and mysim.hq > tuning_constants.MYSIM_HQ_LOW "
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@ea5bc4e9Bad Air near #advisor#'s Home"
a.message   = [[text@ca5bc4ecThe air quality is pretty crappy]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB

--Air Pollution = high & MySim is old & unhealthy and hospital nearby
a = create_advice_mysim('6a74ccf1')

a.trigger  = "mysim.local_air_pollution> tuning_constants.POLLUTION_HIGH and mysim.age > tuning_constants.MYSIM_OLD_AGE and mysim.hq < tuning_constants.MYSIM_HQ_LOW and game.mysim_distance_to_closest_building(building_groups.HEALTH) < tuning_constants.MYSIM_HOME_RADIUS "
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@ea5bc4f0#advisor# hospitalized for Crusty Lung"
a.message   = [[text@6a5bc4f3Hey Mayor, the hospital caught my Crusty Lung]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.mood = advice_moods.BAD_JOB

--                   ****************KILLS MY SIM. URGENT MESSAGE****************
--Air Pollution = high & MySim is old & unhealthy and NO hospital nearby
a = create_advice_mysim('ca5d0040')

a.trigger  = "mysim.local_air_pollution> tuning_constants.POLLUTION_HIGH and mysim.age > tuning_constants.MYSIM_OLD_AGE and mysim.hq < tuning_constants.MYSIM_HQ_LOW and game.mysim_distance_to_closest_building(building_groups.HEALTH) > tuning_constants.MYSIM_HOME_RADIUS "
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@8a5bc4f8#advisor# dies from Crusty Lung"
a.message   = [[text@8a5bc4fcAir Pollution and poor medical care are blamed]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.command = game_commands.MYSIM_DIE
a.persist = 1
a.mood = advice_moods.ALARM

--Air Pollution = high & MySim is not old
a = create_advice_mysim('6a5d0669')

a.trigger  = "mysim.local_air_pollution > tuning_constants.POLLUTION_HIGH and mysim.age <   tuning_constants.MYSIM_OLD_AGE"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@0a5bc500#advisor# can't breathe"
a.message   = [[text@6a5bc503COUGH! HACK! WHEEZE!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB


--Polluted Air Not Good for Aging #advisor#
a = create_advice_mysim('8a5d08c1')

a.trigger  = "mysim.local_air_pollution > tuning_constants.POLLUTION_HIGH and mysim.age > tuning_constants.MYSIM_OLD_AGE and mysim.hq> tuning_constants.MYSIM_HQ_LOW"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@4a5bc506Polluted Air Not Good for Aging #advisor#"
a.message   = [[text@ea5bc50aThe air quality around my house is TERRIBLE!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

--RADIATION
--#advisor# glows in the dark
a = create_advice_mysim('aa5d095d')

a.trigger  = "mysim.local_radiation > tuning_constants.POLLUTION_RADIATION_HIGH"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@0a5bc50e#advisor# glows in the dark"
a.message   = [[text@ea5bc511Mayor, my Landgraab Industries Pocket Giger Counter]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB


--GARBAGE
--#advisor# grossed out by garbage
a = create_advice_mysim('ca74cc9a')

a.trigger  = "mysim.local_garbage > tuning_constants.POLLUTION_GARBAGE_HIGH"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@4a5bc515#advisor# grossed out by garbage"
a.message   = [[text@ca5bc519Trash is piling up in the streets by my house]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

--CRIME
--#advisor# Safe and Secure
a = create_advice_mysim('2a5d0a87')

a.trigger  = "mysim.local_crime < tuning_constants.CRIME_LOW and game.g_population > tuning_constants.POPULATION_STEP_3 and game.g_police_station_count > 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@ea5bc51c#advisor# Safe and Secure"
a.message   = [[text@ea5bc520I leave my door unlocked]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

--#advisor# Mugged
a = create_advice_mysim('4a5d0e90')

a.trigger  = "mysim.local_crime > tuning_constants.CRIME_MEDIUM and mysim.local_crime < tuning_constants.CRIME_HIGH and game.random_chance(10) "
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@8a5bc523#advisor# Mugged"
a.message   = [[text@2a5bc526I was mugged last night]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB
a.persist = 1
a.frequency =tuning_constants.ADVICE_FREQUENCY_LOW

--#Advisor# Says Local Crime-Spree Heats Up
a = create_advice_mysim('2a5d0efd')

a.trigger  = "mysim.local_crime > tuning_constants.CRIME_HIGH"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@ea5bc529#Advisor# Says Local Crime-Spree Heats Up"
a.message   = [[text@2a5bc6bcThey stole the numbers off my house, Mayor! The numbers! What are they gonna do with a plastic eight, one and nine? Sell 'em on the black market for integers? Broad daylight doesn't even stop 'em! Could you get some <a href="#link_id#game.camera_jump_and_zoom(mysim.home_location,camera_zooms.MAX_IN);game.tool_plop_building(building_tool_types.LOCAL_PRECINCT_4CAR)">police presence</a> around here, Mayor? I'd give you my address, but....]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.mood = advice_moods.BAD_JOB

--                   ****************KILLS MY SIM. URGENT MESSAGE****************
--#advisor# Killed in Robbery
a = create_advice_mysim('4a5d0f57')

a.trigger  = "mysim.local_crime > tuning_constants.CRIME_HIGH and game.random_chance(5)"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@0a5bc6c0#advisor# Killed in Robbery"
a.message   = [[text@4a5bc6c3Mayor, I am sorry to report that #advisor# has been killed]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.command = game_commands.MYSIM_DIE
a.persist = 1
a.mood = advice_moods.ALARM



--NOTICE PLOPS via game.event_building_is_group(building_groups.WHATEVER)

--#advisor# Happy About Crime Prevention Attempts
a = create_advice_mysim('aa5d14d6')

a.trigger  = "game.event_building_is_group(building_groups.POLICE) and game.event_building_distance() < tuning_constants.MYSIM_HOME_RADIUS and mysim.local_crime > tuning_constants.CRIME_LOW"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@ea5bc6c6#advisor# Happy About Crime Prevention Attempts"
a.message   = [[text@4a5bc6c9Hurray! Mayor I'm gald to see you are doing something about the crimes]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.event = game_events.MYSIM_BUILDING_ADD
a.mood = advice_moods.GREAT_JOB

--#advisor# Upset by Excessive Police Protection
a = create_advice_mysim('aa5d1805')

a.trigger  = "mysim.local_police_funding > tuning_constants.FUNDING_EXCESSIVE and mysim.local_crime < tuning_constants.CRIME_LOW and mysim.age < tuning_constants.MYSIM_MIDDLE_AGE"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@0a5bc6cd#advisor# Upset by Excessive Police Protection"
a.message   = [[text@0a5bc6d0FASCISTS! I can't cross the street without getting a ticket from some leather clad "peace officer" in a Hummer.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB


--Cops Bothering #advisor#'s Kids
a = create_advice_mysim('ca5d18a2')

a.trigger  = "mysim.local_police_funding > tuning_constants.FUNDING_EXCESSIVE and mysim.local_crime < tuning_constants.CRIME_LOW and mysim.age > tuning_constants.MYSIM_MIDDLE_AGE and (game.ordinance_is_on(ordinance_ids.ORDINANCE_YOUTHCURFEW) or game.ordinance_is_on(ordinance_ids.ORDINANCE_NEIGHBORHOODWATCH))"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@aa5bc6d2Cops Bothering #advisor#'s Kids"
a.message   = [[text@6a5bc6d6The cops are out of control in my neighborhood. I didn't move here to live in a POLICE STATE!  Tell the cops to stop harrasing my kids and lift those ordinances you passed!.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB


--#advisor# wants protection
a = create_advice_mysim('0a5d1aa9')

a.trigger  = "mysim.home_police_coverage < tuning_constants.COVERAGE_LOW and mysim.local_crime > tuning_constants.CRIME_MEDIUM and mysim.eq > tuning_constants.MYSIM_EQ_LOW"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@aa5bc6d9#advisor# wants protection"
a.message   = [[text@aa5bc6dd"Dear Mayor #mayor#,
I am writing to inform you that I am very concerned about the lack of police departments in my neighborhood. Please rectify the situation immediately, if not sooner.

A concerned citizen,
#advisor#"]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.NEUTRAL

--#advisor# wantz proteckshun
a = create_advice_mysim('6a5d1bd0')

a.trigger  = "mysim.home_police_coverage < tuning_constants.COVERAGE_LOW and mysim.local_crime > tuning_constants.CRIME_MEDIUM and mysim.eq < tuning_constants.MYSIM_EQ_LOW"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@ca5bc6e0#advisor# wantz proteckshun"
a.message   = [[text@6a5bc6e5'Mayer #mayor# -
Why ain't there any police stayshuns wher I live? Pleze fix it now! And more schools while your at it!

- #advisor#]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.NEUTRAL


--#advisor# Wants Fire House
a = create_advice_mysim('6a5d215a')

a.trigger  = "mysim.home_fire_coverage < tuning_constants.MYSIM_HOME_FIRE_COVERAGE_LOW and game.g_population > tuning_constants.POPULATION_STEP_2"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@6a5bc727#advisor# Wants Fire House"
a.message   = [[text@ea5bc72aHey Mayor, why aren't there any fire stations near my house? Huh?]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.NEUTRAL

--NOTICE FIRESTATION  PLOP
--#advisor# Happy About Fire Fighters In Neighborhood
a = create_advice_mysim('ea5d24ad')

a.event = game_events.MYSIM_BUILDING_ADD
a.trigger  = "game.event_building_is_group(building_groups.FIRE) and game.event_building_distance() < tuning_constants.MYSIM_HOME_RADIUS and mysim.home_fire_coverage < tuning_constants.MYSIM_HOME_FIRE_COVERAGE_HIGH"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@2a5bc72d#advisor# Happy About Fire Fighters In Neighborhood"
a.message   = [[text@2a5bc730Hurray! Let's have a BBQ!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.GREAT_JOB



--NOTICE FIRESTATION  PLOP
--#advisor# says, "Why So Many Dalmations Wandering Around?"
a = create_advice_mysim('4a5d2592')

a.event = game_events.MYSIM_BUILDING_ADD
a.trigger  = "game.event_building_is_group(building_groups.FIRE) and game.event_building_distance() < tuning_constants.MYSIM_HOME_RADIUS and mysim.home_fire_coverage > tuning_constants.MYSIM_HOME_FIRE_COVERAGE_HIGH"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea5bc734#advisor# says, "Why So Many Dalmations Wandering Around?]]
a.message   = [[text@ea5bc737Um, Mayor #mayor#? What's up with all of the fire stations in my neck of the woods?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.NEUTRAL

--HEALTH SECTION

--#advisor# Feels Sick. No Doctors Nearby and LOW wealth ($)
a = create_advice_mysim('aa5d261c')

a.trigger  = "mysim.wealth == 1 and game.mysim_distance_to_closest_building(building_groups.HEALTH) > tuning_constants.MYSIM_HEALTH_RADIUS and mysim.hq <  tuning_constants.MYSIM_HQ_LOW_WEALTH_POOR and game.g_population > tuning_constants.POPULATION_STEP_2"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a5bc73a#Advisor#'s Arm In Bad Shape, No Docs To Tell]]
a.message   = [[text@4a5bc73dI got this sore on my arm that won't heal and now my hand is turnin' green, Mayor. I'm startin' to get worried. I'd go see a doc, but I'm havin' a little trouble drivin' with the dizziness, and there's no clinic nearby. I know we're poor, but we really need some <a href="#link_id#game.camera_jump(mysim.home_location);game.tool_plop_building(building_tool_types.URGENT_CARE_CLINIC)">healthcare</a> around here, Mayor. Don't ignore us, please!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW


--#advisor# Feels Sick. No Doctors Nearby and MEDIUM wealth ($$)
a = create_advice_mysim('0a5d2802')

a.trigger  = "mysim.wealth == 2 and game.mysim_distance_to_closest_building(building_groups.HEALTH) > tuning_constants.MYSIM_HEALTH_RADIUS and mysim.hq < tuning_constants.MYSIM_HQ_LOW_WEALTH_MIDDLE"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a5bc740#advisor# Feels Sick. No Doctors Nearby.]]
a.message   = [[text@6a5bc743I don't feel so good. Maybe I should go to a doctor. Too bad I can't find one around here. Why is it that the middle-class always misses out?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB


--#Advisor# Will Not Abide Lack of Medical Services
--HIGH wealth ($$$)
a = create_advice_mysim('8a5d287e')

a.trigger  = "mysim.wealth == 3 and game.mysim_distance_to_closest_building(building_groups.HEALTH) > tuning_constants.MYSIM_HEALTH_RADIUS and mysim.hq < tuning_constants.MYSIM_HQ_LOW_WEALTH_RICH"
-- Note 585 is the current 100% radius of a hospital
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca5bc746#advisor# Feels Sick. No Doctors Nearby.]]
a.message   = [[text@6a5bc74aMayor #mayor#! Binky P. Enthouse had a blister that needed lancing the other day, and I actually had to drive her ACROSS town to get to the nearest hospital. Oh, the neighborhoods we had to traverse! This situation is absolutely unacceptable! We need better access to <a href="#link_id#game.camera_jump(mysim.home_location);game.tool_plop_building(building_tool_types.LARGE_MEDICAL_CENTER)">healthcare</a>! These emergencies will happen, you know.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB


--#advisor# Health is Declining
a = create_advice_mysim('4a5d2904')

a.trigger  = "mysim.delta_eq < tuning_constants.MYSIM_EQ_TREND_DECLINE"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a5bc74e#Advisor# Sinks Into State of Ill Health]]
a.message   = [[text@aa5bc751I'm not sure what is happening to me, Mayor. Mononucleoisis, fibromyalgia, pneumonia--you name it, I've had it these past six months. Latin is becoming my second language. One of these tongue twisters is going to finish me off soon. What's going on? How come I'm so ill? ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.mood = advice_moods.BAD_JOB

--#Advisor#'s Health Improves, Talking Triathlon
a = create_advice_mysim('ea5d3c1a')

a.trigger  = "mysim.delta_eq > tuning_constants.MYSIM_EQ_TREND_INCREASE and mysim.delta_eq < 200" --the < 200 is just to deal with a mysim.delta_eq bug
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a5bc753#Advisor#'s Health Improves, Talking Triathlon]]
a.message   = [[text@4a5bc756Yeeeehaaaa! I feel wonderful, Mayor! After months of feeling under the weather, the clouds have finally lifted. I'm thinking about training for the city's triathlon! What do you think?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB




--#advisor# says "Let Me Smoke"
a = create_advice_mysim('6a5d3fd4')
a.trigger  ="0"
--a.trigger  = "mysim.zodiac < 6 and game.ordinance_is_on(ordinance_ids.ORDINANCE_SMOKINGBAN)and game.random_chance(3)"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea5bc75d#advisor# says "Let Me Smoke"]]
a.message   = [[text@aa5bc760Hey Mayor. I'm one of your citizens, so listen up. I want a smoke! Me and my pals are none to happy about this goody-two shoes "no smoking" ban. If people don't like it, let them stay inside! ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB


--#advisor# says "Ban Smoking"
a = create_advice_mysim('aa5d4037')

a.trigger  = "mysim.zodiac >5 and game.ordinance_is_available(ordinance_ids.ORDINANCE_SMOKINGBAN)and mysim.local_air_pollution>tuning_constants.POLLUTION_MEDIUM and game.random_chance(10)"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a5bc763#advisor# says "Ban Smoking"]]
a.message   = [[text@4a5bc766Hey Mayor. I'm one of your citizens, so listen up. I'm sick of all these smokers stinking up the air and ruining our health. Pass the anti-smoking ban, PLEASE!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB
a.persist = 1


--#advisor# in the dark
a = create_advice_mysim('ea5d4133')

a.trigger  = "mysim.home_has_power == 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6a5bc768#advisor# in the dark]]
a.message   = [[text@aa5bc76bNO POWER!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.mood = advice_moods.BAD_JOB

--#advisor# is thirsty
a = create_advice_mysim('0a5d4309')

a.trigger  = "mysim.home_has_water == 0 and mysim.wealth > 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a5bc76f#advisor# is thirsty]]
a.message   = [[text@aa5bc773I turned on my tap and nothing came out except a gurgle! Where's the water Mayor?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW --don't harass them again for a while
a.mood = advice_moods.NEUTRAL


--No power at #advisor#'s work
a = create_advice_mysim('4a5d436e')

a.trigger  = "mysim.job_has_power == 0 and mysim.employed == 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6a5bc777No power at #advisor#'s work]]
a.message   = [[text@4a5bc77aNO POWER at work!!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB



--#Advisor#'s Workplace Water-Free
a = create_advice_mysim('ca5d43b6')

a.trigger  = "mysim.job_has_water == 0 and mysim.employed == 1 and mysim.wealth > 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea5bc77cNo water at #advisor#'s work]]
a.message   = [[text@8a5bc77fUh, Mayor? Our watercoolers at work are bone dry, and now they're asking us not to use the bathrooms. Is management sending us a message, or do we have a <a href="#link_id#game.camera_jump(mysim.job_location);game.window_data_map(map_window_types.WATER)">water supply</a> problem here?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW --don't harass them again for a while
a.mood = advice_moods.NEUTRAL


--Taxes Need to be Submarined Says #Advisor#
a = create_advice_mysim('0a5d45d2')

--   residential $ taxes very high
a.trigger  = "mysim.wealth == 1 and game.g_tax_rate_r_low >tuning_constants.TAX_RATE_HIGH*game.g_tax_rate_neutral"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a5bc781#advisor# says "Screw Your Taxes"!]]
a.message   = [[text@6a5bc786I'm down to considering ketchup a luxury item, Mayor! City Hall already got my mustard money. You don't lower <a href="#link_id#game.window_budget(budget_window_types.TAXES)">taxes</a> soon, I'll do something you'll regret. Tax the rich! Folks like me get very irritated when we don't have our ketchup!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB


--Low Taxes Make #Advisor# Feel Rich
a = create_advice_mysim('aa71f3dc')

a.trigger  = "mysim.wealth == 1 and game.g_tax_rate_r_low < tuning_constants.TAX_RATE_LOW*game.g_tax_rate_neutral"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea5bc789Low Taxes Make #Advisor# Feel Rich]]
a.message   = [[text@2a5bc78bNice work keepin' those taxes down there, Mayor! I got extra money in my pocket, and now Aunt Mabel, Uncle Thatticus and seven of their ten kids are talkin' about movin in to the trailer next store! Keep it up!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.GREAT_JOB


--#Advisor# Says Taxes Making Middle Class Downwardly Mobile
a = create_advice_mysim('ca71f708')

a.trigger  = "mysim.wealth == 2 and game.g_tax_rate_r_med > tuning_constants.TAX_RATE_HIGH*game.g_tax_rate_neutral"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea5bc78e#Advisor# Says Taxes Making Middle Class Downwardly Mobile]]
a.message   = [[text@0a5bc791These <a href="#link_id#game.window_budget(budget_window_types.TAXES)">taxes</a> are killing me, Mayor #name#. I'm looking at trailer parks if I want to keep paying my bills AND these ridiculous taxes! Stop milking the middle class--we're not cash cows!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB


--Low Taxes Increase Happiness Levels for #Advisor#
a = create_advice_mysim('aa71ff16')

a.trigger  = "mysim.wealth == 2 and game.g_tax_rate_r_med < tuning_constants.TAX_RATE_LOW*game.g_tax_rate_neutral"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a5bc794Low Taxes Increase Happiness Levels for #Advisor#]]
a.message   = [[text@6a5bc7971I'm saving up for a new car, Mayor #name#, and these low tax rates are going to see me in the driver's seat a lot sooner! I'm getting personalized plates that say THNKSMYR!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.GREAT_JOB


--Taxation Rates Inflated, Says #Advisor#
a = create_advice_mysim('6a71fff8')

a.trigger  = "mysim.wealth == 3 and game.g_tax_rate_r_high > tuning_constants.TAX_RATE_HIGH*game.g_tax_rate_neutral"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca5bc799Taxation Rates Inflated, Says #Advisor#]]
a.message   = [[text@8a5bc79cReally, Mayor #name#. I heard that Snoggy Highbrow spoke to you about these <a href="#link_id#game.window_budget(budget_window_types.TAXES)">tax rates</a> ages ago at that benefit Binky P. Enthouse put together for one of your pet causes. Keep these tax rates up and I imagine Binky, Snoggy and the rest of us will be out of spare change for benefits, campaigns, and such. Wouldn't you think?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB

--Low Taxes Good For Trickle Down, Says #Advisor#

a = create_advice_mysim('4a720083')

a.trigger  = "mysim.wealth == 3 and game.g_tax_rate_r_high < tuning_constants.TAX_RATE_LOW*game.g_tax_rate_neutral"
a.timeout= tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca5bc79fLow Taxes Good For Trickle Down, Says #Advisor#]]
a.message   = [[text@ea5bc7a1I want to congratulate you, Mayor #mayor#, on your wise decision to keep tax rates reasonably low. I can assure you that you are truly stimulating #city#'s economy. I have already hired two new maids with money my accountant assures me would have gone to taxes in any other city. We'll have you over for dinner very soon, Mayor. I'm told Maria makes a tremendous tiramisu.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.GREAT_JOB


--#Advisor# Happily Hums 'Hi Ho' Over New Job
a = create_advice_mysim('2a5e5657')

a.event = game_events.MYSIM_NEW_JOB
a.trigger  = "mysim.job_is_neighbor == 0 and mysim.employed == 1"
a.timeout = 120 --the job is no longer new after a while
a.title   = [[text@4a5bc7a4#Advisor# Happily Hums 'Hi Ho' Over New Job]]
a.message   = [[text@aa5bc7a7I want to report some changes in my life, Mayor. Always like to keep you informed. I have a new job as #mysim.job_title# at <a href="#link_id#game.camera_jump_and_zoom(mysim.job_location,camera_zooms.MAX_IN)">#mysim.job_building#</a>. Can't wait to start learning the ropes! I'm always up for a new challenge!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB


--#Advisor# finds a new job IN A NEIGHBOR CITY
a = create_advice_mysim('8a6639d9')

a.trigger  = "mysim.job_is_neighbor == 1 and mysim.employed == 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea931136#Advisor# Happy About New Job In #mysim.job_city#]]
a.message   = [[text@6a93113dWell Mayor, I couldn't find a job that suited me in #city#, so I had to looked elsewhere. I'm glad to say I landed a job as #mysim.job_title# at Distant Industries in #mysim.job_city#.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.event = game_events.MYSIM_NEW_JOB
a.mood = advice_moods.GREAT_JOB


--#Advisor# Unemployed
a = create_advice_mysim('0a5e5819')

a.trigger  = "mysim.unemployed_days>3"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a5bc7a9#Advisor# Unemployed]]
a.message   = [[text@4a5bc7acI'm looking for a new job but can't seem to find one. I'll need to leave town if I can't find a job.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.mood = advice_moods.BAD_JOB


--#mySimjobBuilding# Abandoned, says #Advisor#
a = create_advice_mysim('6a5e5b9b')

a.trigger  = "mysim.job_condition == building_conditions.ABANDONED and mysim.employed == 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a5bc7c6#mysim.job_building# Abandoned, says #Advisor#]]
a.message   = [[text@0a5bc7c9I went to work and no one was there. The building was deserted! I guess I better look for another job.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.command = game_commands.MYSIM_QUIT_JOB
a.mood = advice_moods.BAD_JOB

--#mysim.job_building# Looking Shabby, says #Advisor#
a = create_advice_mysim('aa5e5cd7')

a.trigger  = "mysim.job_condition == building_conditions.DISTRESSED1 and mysim.employed == 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a5bc7cc#mysim.job_building# Looking Shabby, says #Advisor#]]
a.message   = [[text@6a5bc7d0You know, things at work are looking pretty shabby. I hope things pick up over there before they close the place down.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.BAD_JOB

--                   ****************KILLS MY SIM. URGENT MESSAGE****************
--#Advisor# killed at work
a = create_advice_mysim('ea5e5dc7')

a.event =game_events.MYSIM_JOB_DESTROYED_BY_DISASTER
a.trigger  = "mysim.state == 3 and game.random_chance(80)" --20% chance gets out alive
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a5bc7d3#Advisor#'s Work Proves Fatal]]
a.message   = [[text@6a5bc7d5The corporate headquarters of #mysim.job_building# is sorry for the loss of #Advisor#, one of our finest employees. #Advisor# perished when the building was destroyed by a freak disaster while #Advisor# was hard at work.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.persist = 1
a.command = game_commands.MYSIM_DIE
a.mood = advice_moods.ALARM


--#mysim.job_building# Destroyed By Disaster!
a = create_advice_mysim('ca5e6be0')

a.event =game_events.MYSIM_JOB_DESTROYED_BY_DISASTER
a.trigger  = "mysim.state ~= 3" --not at work
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a5bc7df#mysim.job_building# Destroyed by Disaster!]]
a.message   = [[text@2a5bc7e2I went to work and guess what, the building was destroyed! I guess I better look for another job.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.mood = advice_moods.ALARM


--#Advisor# retires
a = create_advice_mysim('aa74ccaa')

a.trigger  = "mysim.retired == 0 and mysim.age >= 65"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6a5bc7e4#Advisor# retires]]
a.message   = [[text@8a5bc7e7After a lifetime of day in and day out work, I'm ready to retire and sit around at home.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.command = game_commands.MYSIM_RETIRE
a.persist = 1
a.mood = advice_moods.GREAT_JOB


--#Advisor# Loses Job
a = create_advice_mysim('aa5e7d14')

a.event =game_events.MYSIM_JOB_DESTROYED
a.trigger  = "1" --My Sim escapes scot free
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea5bc7e9#Advisor# Loses Job]]
a.message   = [[text@aa5bc7ebThe place I used to work doesn't exist anymore. I guess I better look for another job.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB


-- this example shows how a mysim spawn behavior would work
-- the persist=1 is necessary since after the spawn the age will change so the trigger will no longer be true

--MY SIM SPAWNS (dies of old age), female
a = create_advice_mysim('8a563603')

a.trigger  = "mysim.age > mysim.le and mysim.is_male ==0" --FEMALE my sim
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a6f379f#Advisor# Lays Her Head to Rest]]
a.message   = [[text@ca6f37a4#Advisor# died peacefully last night, surrounded by loving family and friends. She led a good life, and left me, her daughter, with her secret stash of recipes. I will represent our family in all future dealings with the city, and will continue to preserve the secrecy of the recipe file.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.command = game_commands.MYSIM_SPAWN
a.persist = 1
a.mood = advice_moods.ALARM

--MY SIM SPAWNS (dies of old age), male
a = create_advice_mysim('ea5e8ae3')

a.trigger  = "mysim.age > mysim.le and mysim.is_male == 1" --MALE my sim
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@4a5bc7ee#Advisor# passes away"
a.message   = [[text@8a5bc7f5#Advisor# #mysim.generation# passed away peacefully during the night.#Advisor# lead a rich, happy life. I am his son and I am stepping in to take my place as head of the family clan.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.command = game_commands.MYSIM_SPAWN
a.persist = 1
a.mood = advice_moods.ALARM

--Long Time #city# Family Gets Civic Award
a = create_advice_mysim('0a664d53')

a.trigger  = "mysim.generation == 5" 
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.once = "1"
a.title   = "text@aa5bc7f8Long Time #city# Family Gets Civic Award"
a.message   = [[text@ca5bc7fb[5 generation award] Hey Mayor! Thanks for the award! And my family thanks you.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.GREAT_JOB


--#Advisor# the 10th Honored By Mayor
a = create_advice_mysim('8a664e3c')

a.trigger  = "mysim.generation == 10" 
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.once = "1"
a.title   = "text@ea5bc7fd#Advisor# #mysim.generation# Honored By Mayor"
a.message   = [[text@4a5bc800#Advisor# the 10th Honored By Mayor]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.GREAT_JOB


--#Advisor# is Moving On Up! (From low wealth to medium wealth)
a = create_advice_mysim('6a74ccb7')

a.trigger  = "mysim.eq > tuning_constants.MYSIM_EQ_LOW_WEALTH_THRESHOLD and mysim.wealth == 1"  --my sim = R$
a.persist = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@ca5bc808#Advisor# is Moving On Up! from $ to $$"
a.message   = [[text@2a5bc80cAll those night classes really paid off. I'm now middle class. I better look for some new suitable digs that match my new found status.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.command = game_commands.MYSIM_INCREASE_WEALTH --should move out, find new house, find new job
a.mood = advice_moods.GREAT_JOB


--#Advisor# is Moving On Up! (From $$ to $$$)
a = create_advice_mysim('ea6674eb')

a.trigger  = "mysim.eq > tuning_constants.MYSIM_EQ_MEDIUM_WEALTH_THRESHOLD and mysim.wealth == 2" 
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@ea5bc80eMiddle Class Work Ethic Pays Off For #Advisor#"
a.persist = 1
a.message   = [[text@aa5bc812I've worked hard all my life, Mayor #mayor#, and just like my grandmother said they would, all those pennies add up! I'm ready to enjoy my hard-earned wealth, and thought I'd ask you about real estate. Got any tips? I really want a swimming pool.]]
a.command = game_commands.MYSIM_INCREASE_WEALTH --should move out, find new house, find new job
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.mood = advice_moods.GREAT_JOB


--#Advisor# Says My Place is No Good
a = create_advice_mysim('ea667550')

a.trigger  = "mysim.home_condition == building_conditions.ABANDONED or mysim.desirability < tuning_constants.MYSIM_DESIRABILITY_LOW" 
a.command = game_commands.MYSIM_MOVE_OUT
a.persist = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM

a.title   = [[text@ca5bc815#Advisor# Says My Place is No Good]]
a.message   = [[text@ea5bc817This place is the pits. No one wants to live here, least of all me! I've got to find a new place to live.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.mood = advice_moods.BAD_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_HIGH


-- My home is getting crappy
a = create_advice_mysim('ea667786')

a.trigger  = "mysim.home_condition == building_conditions.DISTRESSED1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@aa5bc81a#Advisor#'s home is getting crappy"
a.message   = [[text@2a5bc81cMy home looks terrible. Please do something about!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB


-- My home is getting REALLY crappy
a = create_advice_mysim('aa667807')

a.trigger  = "mysim.home_condition == building_conditions.DISTRESSED2"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@8a5bc820#Advisor#'s home is getting REALLY crappy"
a.message   = [[text@0a5bc822My home looks REALLY terrible. Please do something about before everyone moves out!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB


-- #Advisor# Unhappy With Housemates (my sim wealth higher than occupants)
a = create_advice_mysim('0aad49c6')

a.trigger = [[mysim.wealth > mysim.home_occupant_wealth]]
a.title   = "text@aaad49ea#Advisor# Unhappy With Housemates"
a.message   = [[text@caad4acfMayor, I don't know how this happened, but some low-rent squatters have moved into my house! I find this unacceptable and will immediately look for a new place to live.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB
a.command = game_commands.MYSIM_MOVE_OUT
a.persist =1
a.frequency = tuning_constants.ADVICE_FREQUENCY_HIGH

-- #Advisor# Priced Out, Looks For New Home (my sim wealht less than occupants)
a = create_advice_mysim('6aad4be9')
 
a.trigger = [[mysim.wealth < mysim.home_occupant_wealth]]
a.title   = "text@caad4bee#Advisor# Priced Out, Looks For New Home"
a.message   = [[text@caad4bfb#mayor#, my rent got raised and some fancy-pants rich folk have moved into my house. I just don't feel comfortable here any more. I've got to look for some new digs.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB
a.command = game_commands.MYSIM_MOVE_OUT
a.persist =1
a.frequency = tuning_constants.ADVICE_FREQUENCY_HIGH

--#Advisor# Escapes While Home Flattened
a = create_advice_mysim('4a48feb6')

a.event = game_events.MYSIM_HOME_DESTROYED
a.trigger  = "mysim.state == 2" --My Sim is at Home
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@6a5bc836H#Advisor# Escapes While Home Flattened"
a.message   = [[text@aa5bc838Whoa, Mayor! I was in the tub when the walls started cracking apart! I thought, "No time for modesty!", and got out of there right as the house collapsed! What's going on here, anyway? After I get some new underwear, I'm gonna need to start looking for a new place to take baths! ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.mood = advice_moods.BAD_JOB


--MESSAGE TRIGGER IDENTICAL TO ONE ABOVE
--#Advisor# Loses Home, Almost Self
--a = create_advice_mysim('aa6d1646')

--a.trigger  = "mysim.state == 2" --My Sim at home
--a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
--a.title   = "#text@6a5bc8fc#Advisor# Loses Home, Almost Self"
--a.message   = [[text@ea5bc900Things are changing pretty fast around our city, Mayor. One minute you got a house, next you don't. I figured it was time to get out of the kitchen when the living room walls disappeared! I hope I can find a place in a more stable neighborhood. Do we have any of those?]]
--a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
--a.event = game_events.MYSIM_HOME_DESTROYED
--a.command = game_commands.MYSIM_MOVE_OUT
--a.persist = 1


--Disaster Dooms Domicile and #Advisor#
--a = create_advice_mysim('ca6d07d6')

--a.trigger  = "mysim.state == 2 and mysim.last_local_disaster == disaster_ids.GENERIC"
-- a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
--a.title   = "text@aa5bc83bDisaster Dooms Domicile and #Advisor#"
--a.message   = [[text@2a5bc83eThe latest disaster destroyed the home of #Advisor#, who was sleeping peacefully when tragedy struck. Neighbors and relatives mourn the loss of one of #city#'s citizens.]]
--a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
--a.event = game_events.MYSIM_HOME_DESTROYED_BY_DISASTER
--a.command = game_commands.MYSIM_DIE
--a.persist = 1

--Earthquake Eliminates #Advisor#
a = create_advice_mysim('0a6d0bba')

a.trigger  = "mysim.state == 2 and mysim.last_local_disaster == disaster_ids.EARTHQUAKE"
-- a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@aa5bc869Earthquake Eliminates #Advisor#"
a.message   = [[text@4a5bc86bBad news, Mayor #mayor#. #Advisor# ignored the earthquake preparedness programs in school, and so perished in the recent quake. Witnesses say #Advisor# took shelter under a large, tippy, cast-iron sculpture. Notification will be sent to next of kin.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.event = game_events.MYSIM_HOME_DESTROYED_BY_DISASTER
a.command = game_commands.MYSIM_DIE
a.persist = 1
a.mood = advice_moods.ALARM

--#Advisor# Meets Fiery Finale
a = create_advice_mysim('ea70cf39')

a.trigger  = "mysim.state == 2 and mysim.last_local_disaster == disaster_ids.FIRE"
--a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a5bc86f#Advisor# Meets Fiery Finale]]
a.message   = [[text@0a5bc871Mayor #mayor#, the news is dire. #Advisor# met an untimely death while trying to rescue squirrels from the recent conflagration. A witness says, "It was amazing. #Advisor# kept going in with bags of nuts, coming out with armfuls of little smoke-dazed squirrels, then going in again, until.....Oh, it's so sad."]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.event = game_events.MYSIM_HOME_DESTROYED_BY_DISASTER
a.command = game_commands.MYSIM_DIE
a.persist = 1
a.mood = advice_moods.ALARM


--#Advisor# Gets In Way of Meteor
a = create_advice_mysim('6a74ccc8')

a.trigger  = "mysim.state == 2 and mysim.last_local_disaster == disaster_ids.METEOR" --METEOR is not yet implemented
--a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a5bc8e5#Advisor# Gets In Way of Meteor]]
a.message   = [[text@6a5bc8e9#Advisor# was enjoying a chocolate-dipped soft ice cream cone, the twisty flavor kind, when a meteor shower abruptly ended snacktime. Your sympathies will be sent to next of kin, along with coupons for free ice cream cones in #Advisor#'s memory.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.event = game_events.MYSIM_HOME_DESTROYED_BY_DISASTER
a.command = game_commands.MYSIM_DIE
a.persist = 1
a.mood = advice_moods.ALARM



--Twister Tags #Advisor#
a = create_advice_mysim('8a6d0f8f')

a.trigger  = "mysim.state == 2 and mysim.last_local_disaster == disaster_ids.TORNADO" 
--a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@ea5bc8edTwister Tags #Advisor#"
a.message   = [[text@4a5bc8f0Mayor, it's assumed that #Advisor# perished when the recent tornado sucked this sim into its roiling fury. As no reports have been received from this or any other plane of existence, condolences on #Advisor#'s passing will be sent to next of kin.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.event = game_events.MYSIM_HOME_DESTROYED_BY_DISASTER
a.command = game_commands.MYSIM_DIE
a.persist = 1
a.mood = advice_moods.ALARM


--Home Destroyed While #Advisor# at Work
a = create_advice_mysim('ca6d1003')

a.trigger  = "mysim.state > 2" --My Sim not at home
--a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aa5bc8f4Home Destroyed While #Advisor# at Work]]
a.message   = [[text@4a5bc8f7I'm doing my commute home, Mayor #mayor#, ready to put my feet up, make a nice dinner, maybe watch a little tv. I drive into the garage, EXCEPT THERE'S NO GARAGE! My house is a pile of smoking rubble! What's going on in this city, Mayor? Now I've got to find a new place. First maybe I can find a restaurant that is still standing....]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.event = game_events.MYSIM_HOME_DESTROYED
a.persist = 1
a.mood = advice_moods.BAD_JOB


--IDENTICAL TRIGGERS TO MESSAGE ABOVE
--#Advisor# Loses Home, Almost Self
--a = create_advice_mysim('8a6d17dc')

--a.trigger  = "mysim.state > 2" --My Sim at home
--a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
--a.title   = "#text@6a5bc903Home of #Advisor# a Goner"
--a.message   = [[text@2a5bc90dThat's right, Mayor #mayor#, a goner! As in I come home from work, and my house is GONE! Is our town suffering an epidemic of disappearing homes? I gotta find a new place, hope it's near enough so I can keep my job.]]
--a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
--a.event = game_events.MYSIM_HOME_DESTROYED
--a.command = game_commands.MYSIM_MOVE_OUT
--a.persist = 1









--#Advisor# Moves On, No Work To Blame
a = create_advice_mysim('ca68e689')

a.trigger  = "mysim.unemployed_days > 30"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@4a5bc907#Advisor# Moves On, No Work To Blame"
a.message   = [[text@aa5bc910I got the no work blues, Mayor. So while I can still sing, I'm movin' to a land far, far away where jobs are still thick on the ground. Adios, Mayor #mayor#! Good luck with #city#!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.command  = game_commands.MYSIM_LEAVE_CITY
a.mood = advice_moods.ALARM



-- Founding Family Flees #city#
a = create_advice_mysim('aa68e7f3')

a.event = game_events.MYSIM_CANT_FIND_HOME
a.trigger  = "mysim.generation > 3"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@6a5bc913Founding Family Flees #city#"
a.message   = [[text@0a5bc917My family has lived in #city# for #mysim.generation# generations, Mayor, but we don't want our name associated with this city any longer! This is the last you'll hear from #Advisor#--I'm outta here!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.command = game_commands.MYSIM_LEAVE_CITY
a.mood = advice_moods.ALARM



-- #Advisor# Packs Bags
a = create_advice_mysim('ea70cf4e')

a.event = game_events.MYSIM_CANT_FIND_HOME
a.trigger  = "mysim.generation <= 3"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@4a5bc919#Advisor# Packs Bags"
a.message   = [[text@ea5bc91cThere is NO decent place to live in this town, Mayor #mayor#! What kind of city have we been building here? One without ME in it anymore, that's for sure. See ya never, Mayor!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.command = game_commands.MYSIM_LEAVE_CITY
a.mood = advice_moods.ALARM


--#Advisor# Looking For Fun
a = create_advice_mysim('2a68e8d3')

--Eric G. says: As the cap approaches 100, the ability for R to grow is squashed to zero. So somewhere near 100, the sim ought to start complaining (but it may take a long time to actually get to 100, since growth slows as you approach the cap). I think something around 80 would be a reasonable value to tryout.

a.trigger = "(game.g_current_r1_cap > 80 and mysim.wealth==1) or (game.g_current_r2_cap > 80 and mysim.wealth==2)or (game.g_current_r3_cap > 80 and mysim.wealth==3)and game.g_num_parks < 1 and game.g_num_recreation < 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@6a5bc91f#Advisor# Looking For Fun"
a.message   = [[text@ea5bc922Hey Mayor #mayor#! I'm getting tired of playing tennis against my garage, and I've had windows broken 3 times in the last year by kids playing ball in the streets. How about a <a href="#link_id#game.tool_plop_building(building_tool_types.PARK_BASKETBALL)">b-ball court</a> or a <a href="#link_id#game.tool_plop_building(building_tool_types.PARK_REGULAR)">park</a> in the neighborhood? We'd sure use it!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.NEUTRAL

--Local Clinic Praises by #Advisor#
a = create_advice_mysim('ea71c6bc')
a.trigger  = "game.random_chance(5) and game.mysim_local_hospital_grade(building_groups.HEALTH) >  tuning_constants.HQ_GRADE_HIGH and game.mysim_distance_to_closest_building(building_groups.HEALTH) < tuning_constants.MYSIM_HOME_RADIUS"
a.title   = "text@ca5bc92aLocal Doctor Praised by #Advisor#"
a.message   = [[text@2a5bc92eHi Mayor. Just wanted to let you know that I've been having this thing? In my stomach? Anyway, it was hurting all the time, so I went to the doctor and had this amazing experience! Hardly had to wait at all, and the doc took a good history. You know my problem? I gotta stop this non-stop munching on habaneros! Who'd a thought it? Glad this place is here!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.GREAT_JOB
a.persist = 1

--#Advisor# Sick of Local Clinic
a = create_advice_mysim('8a9f185c')
a.trigger  = "game.random_chance(5) and game.mysim_local_hospital_grade(building_groups.HEALTH) <  tuning_constants.HQ_GRADE_LOW and game.mysim_distance_to_closest_building(building_groups.HEALTH) < tuning_constants.MYSIM_HOME_RADIUS"
a.title   = "text@4a5bc932#Advisor# Sick of Local Docs"
a.message   = [[text@4a5bc935I've got this chronic pain, Mayor. In my arm. Finally decided to check it out and went to the see the doctor. After waiting over 4 hours, my arm was numb and I couldn't feel anything in it anymore. Finally got to talk to some volunteer doing community service. Told me I was fine. Guess I gotta be doused in blood to get any attention in this place. How about stepping up our <a href="#link_id#game.window_budget(budget_window_types.HEALTH_ED)">healthcare</a>, Mayor?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB
a.persist = 1


--#Advisor# Signs On As Volunteer At Parent Teacher Conference
a = create_advice_mysim('4aa69072')
a.trigger  = "mysim.age > tuning_constants.MYSIM_MIDDLE_AGE and mysim.age < tuning_constants.MYSIM_OLD_AGE and game.random_chance(5) and game.mysim_local_school_grade(building_groups.SCHOOL) > tuning_constants.ED_GRADE_HIGH and game.mysim_distance_to_closest_building(building_groups.SCHOOL) < tuning_constants.MYSIM_HOME_RADIUS"
a.title   = "text@0a5bc98f#Advisor# Signs On As Volunteer At Parent Teacher Conference"
a.message   = [[text@2a5bc995I went to a first parent-teacher conference today. I wish I could quit my job and just be a full-time volunteer at this place. What a wonderful environment for my child! I did sign on to do some fundraising. How many roles of wrapping paper may I put you down for, Mayor?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.GREAT_JOB
a.persist = 1


--#Advisor# Says Parent-Teacher Conference Lacked Teacher
a = create_advice_mysim('6aa6902d')
a.trigger  = "mysim.age > tuning_constants.MYSIM_MIDDLE_AGE and mysim.age < tuning_constants.MYSIM_OLD_AGE and game.random_chance(10) and game.mysim_local_school_grade(building_groups.SCHOOL) < tuning_constants.ED_GRADE_LOW and game.mysim_distance_to_closest_building(building_groups.SCHOOL) < tuning_constants.MYSIM_HOME_RADIUS"
a.title   = "text@ca5bc999#Advisor# Says Parent-Teacher Conference Lacked Teacher"
a.message   = [[text@6a5bca43I went to the school for my parent-teacher conference, Mayor, but my kid's teacher never showed! I saw notes that said teachers need to bring their own chalk, and at least 15 of the desks in the room were broken. How's my kid going to learn anything here besides how to be depressed!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.mood = advice_moods.BAD_JOB
a.persist = 1


--#Advisor# Craves College
a = create_advice_mysim('8a71ce33')
--   mySim.age = young, no local city college, # of city college in city>0
a.trigger = "game.g_num_colleges > 0 and mysim.age < tuning_constants.MYSIM_MIDDLE_AGE and game.mysim_distance_to_closest_building(building_groups.COLLEGE) > tuning_constants.MYSIM_HOME_RADIUS"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@8a5bcaff#Advisor# Craves College"
a.message   = [[text@8a5bcb01Hey, I want to attend a good local college. Why aren't there any nearby?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.mood = advice_moods.NEUTRAL


--#Advisor# Want Local School
a = create_advice_mysim('6a71d192')
--      mySim.Age = middleage, no local school, # of school in city>0
a.trigger  = "game.g_num_elem_schools + game.g_num_high_schools > 0 and mysim.age > tuning_constants.MYSIM_MIDDLE_AGE and mysim.age < tuning_constants.MYSIM_OLD_AGE and game.mysim_distance_to_closest_building(building_groups.SCHOOL) > tuning_constants.MYSIM_HOME_RADIUS"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@ca5bcb04#Advisor# Want Local School"
a.message   = [[text@2a5bcb07Where are my kids supposed to go to school? All the way across town? I want a school by MY house.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.mood = advice_moods.NEUTRAL


  -- tuning_constants.MYSIM_OLD_AGE = 55
   --tuning_constants.MYSIM_MIDDLE_AGE =30


--Local Health Care Scarce, Says #Advisor#
a = create_advice_mysim('ea71d35a')
--       mysim.age = senior and no local hospital, clinic
a.trigger  = "game.g_num_hospitals + game.g_num_clinics > 0 and mysim.age >  tuning_constants.MYSIM_OLD_AGE and game.mysim_distance_to_closest_building(building_groups.HEALTH) > tuning_constants.MYSIM_HEALTH_RADIUS"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@8a5bcb0aLocal Health Care Scarce, Says #Advisor#"
a.message   = [[text@2a5bcb0cWhen I was a young thing, Mayor, I didn't think twice about wending my way across town for a check up. But with these eyes, my driving is starting to be a major health hazard. Please, Mayor, won't you build a <a href="#link_id#game.tool_plop_building(building_tool_types.URGENT_CARE_CLINIC)">clinic</a> or a <a href="#link_id#game.tool_plop_building(building_tool_types.LARGE_MEDICAL_CENTER)">hospital</a> in this part of town? Seems the least you could do for a loyal, upstanding citizen such as myself.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.mood = advice_moods.NEUTRAL


--#Advisor# Reaches Senior Status
a = create_advice_mysim('6a71d460')

a.trigger  = "(mysim.le - mysim.age) < tuning_constants.MYSIM_DEATH_WARNING and game.mysim_distance_to_closest_building(building_groups.HEALTH) < tuning_constants.MYSIM_HOME_RADIUS"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@ca5bcb0f#Advisor# Getting On In years"
a.message   = [[text@8a5bcb12I'm getting old, Mayor. My bones creak, and I can't sit in those really deep chairs anymore. Wellll, I can SIT in 'em, just can't get out of 'em. Age creeps up on you. Yes it does. Yup, I've lived here a long time. Just wanted you to know. Drop by anytime, Mayor. I'd love a chat.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_LOW
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW 
a.mood = advice_moods.NEUTRAL



--No Road Access at home
a = create_advice_mysim('0a5232f9')

a.trigger  = "mysim.home_has_road == 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aa5bc49c#Advisor# stuck at home]]
a.message   = [[text@aa5bc4a0Hello? I'm calling to let you know that I my car is trapped in the garage. Can I have some road access, please!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.mood = advice_moods.BAD_JOB




--TRIGGER ON PLOP MSGS via "game_events.MYSIM_BUILDING_ADD" and "game.event_building_is_group

--Nuclear power plant plopped nearby nearby
a = create_advice_mysim('ca71e2a7')

a.event = game_events.MYSIM_BUILDING_ADD
a.trigger  = "game.event_building_is_group(building_groups.NUCLEAR) and game.event_building_distance() < tuning_constants.MYSIM_HOME_RADIUS"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@6a5c0433Plant Has #Advisor# Going Nuclear"
a.message   = [[text@aa5c0435Come on over, Mayor, spend some time at my house. Oh, you don't want to run the risk of hanging out in the shadow of the Nuclear Plant's cooling towers? Get a clue and park it somewhere else!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.mood = advice_moods.GREAT_JOB

	
   
--AIRPORT plopped nearby nearby
--Airport Deafens #Advisor#
a = create_advice_mysim('2a88bfb2')

a.event = game_events.MYSIM_BUILDING_ADD
a.trigger  = "game.event_building_is_group(building_groups.AIRPORT) and game.event_building_distance() < tuning_constants.MYSIM_HOME_RADIUS"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@8a5c0414Airport Deafens #Advisor#"
a.message   = [[text@aa5c0417GREAT TO HAVE AN AIRPORT NEARBY, MAYOR! GREAT! I'M YELLING YOU SAY! SORRY! THOSE PLANES ARE KINDA NOISY, AREN'T THEY! IT SURE IS FUN HAVING THEM FLY JUST ABOUT 100 FEET OVER THE HOUSE, THOUGH!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.mood = advice_moods.GREAT_JOB


 

--PARK plopped nearby nearby
--Park Increases #Advisor#'s Backyard Wildlife
a = create_advice_mysim('6a88c01a')

a.event = game_events.MYSIM_BUILDING_ADD
a.trigger  = "game.event_building_is_group(building_groups.PARK) and game.event_building_distance() < tuning_constants.MYSIM_HOME_RADIUS"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@0a5c041bPark Increases #Advisor#'s Backyard Wildlife"
a.message   = [[text@8a5c041fWe're so close to the park that squirrels are coming to the door for treats! Actually, yesterday we had 50 visits! Went through eight boxes of cereal, those little rascals. Just a suggestion...how about installing some squirrel food dispensers in the park?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.mood = advice_moods.GREAT_JOB


  
--SEAPORT plopped nearby nearby
--Seaport Brings World To #Advisor#
a = create_advice_mysim('8a88c194')

a.event = game_events.MYSIM_BUILDING_ADD
a.trigger  = "game.event_building_is_group(building_groups.SEAPORT) and game.event_building_distance() < tuning_constants.MYSIM_HOME_RADIUS"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@4a5c0423Seaport Brings World To #Advisor#"
a.message   = [[text@ca5c0426I don't need to travel anymore, Mayor. I just go and hang at the Seaport. People from all over the globe! And fish I have never even dreamed of before! Whoa, some of these things are weird.    ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.mood = advice_moods.GREAT_JOB



  
--BUS, TRAIN, or RAIL STATION plopped nearby nearby
--Station To Attract Wrong Kind? Worries #Advisor#
a = create_advice_mysim('ea88d7a4')

a.event = game_events.MYSIM_BUILDING_ADD
a.trigger  = "game.event_building_is_group(building_groups.SUBWAY) or game.event_building_is_group(building_groups.BUS) or game.event_building_is_group(building_groups.RAIL)and game.event_building_distance() < tuning_constants.MYSIM_HOME_RADIUS"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@4a5c0429Station To Attract Wrong Kind? Worries #Advisor#"
a.message   = [[text@8a5c042bHaving the new station by my house is great, Mayor. I hate driving to work. But our part of town has been pretty safe up to now. My Aunt Layne lived right near a bus station, and she got so tired of people peering in windows and trying doors that she up and moved to the country. I really hope the new station won't increase crime around here.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.mood = advice_moods.GREAT_JOB



-- Notice buildings nearby and maybe comment on them. This applies to local commercial services, rewards, and landmarks.


--COMMERCIAL SERVICES NEARBY MY SIM'S HOME
--_________________________________________________

a = create_advice_mysim('aa80d1c4')

--#Advisor# Finds Flea Market
a.trigger  = "game.mysim_distance_to_closest_building(building_groups.FLEAMARKET) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@8a5bcb15#Advisor# Finds Flea Market]]
a.message   = [[text@aa5bcb19Whoowee, Mayor #mayor#! Me and some friends went to the city flea market on Saturday and did we do good. I'm gonna get my own booth there and sell off some of my old stuff for bowling money. You shoulda seen the deals! ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--Mall Is Marvy, Says #Advisor#
a = create_advice_mysim('ca83184f')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.MIDDLECLASSMALL) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@8a5bcb1bMall Is Marvy, Says #Advisor#]]
a.message   = [[text@ea5bcb1eOur shopping mall is just wonderful, Mayor #mayor#. I did all my holiday shopping, AND I bought myself a nice pair of shoes and got a haircut. I'm going to join the walking club there. Some folks have already clocked over 150 miles! Oh, and I just love the music. Nice job!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--Boutique Gets Raves From #Advisor#
a = create_advice_mysim('ca831b7b')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.FASHIONCENTRE) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@2a5bcb21Boutique Gets Raves From #Advisor#]]
a.message   = [[text@8a5bcb27Well, Mayor #mayor#, we will definitely attract the right kind of people to town with boutiques like this one. Wonderful service, and they carry all the best names. Binky P. Enthouse has purchased five suits there! Keep up the good work, Mayor, so that we continue to attract such fine establishments.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--#city#'s Best Popcorn at Drive-In, Says #Advisor#
a = create_advice_mysim('0a831bbe')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.DRIVEIN) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@2a5bcb2a#city#'s Best Popcorn at Drive-In, Says #Advisor#]]
a.message   = [[text@ca5bcb33We all loaded up, about fifteen of us in the truck, I'd say, and took us on over to the Drive-in for a show, Mayor. What a time! We musta gone through 10 of those big buckets of popcorn. Couldn't hear much over the kids shoutin', but the movie looked real good up there. Real good.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--Movies, More Movies, Says #Advisor#
a = create_advice_mysim('ea831c09')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.MULTIPLEX) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@4a5bcb36Movies, More Movies, Says #Advisor#]]
a.message   = [[text@ca5bcb38We just love the new multiplex, Mayor. It is wonderful to have 20 different movies to choose from all in one place. I hate to admit it, but once there were so many movies I wanted to see I just stayed in the theater and watched three in a row! Didn't even need to go outside--everything I needed was right there. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Deems Dinner Theater Passable
a = create_advice_mysim('8a831ca0')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.DINNERTHEATRE) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@4a5bcb3b#Advisor# Deems Dinner Theater Passable]]
a.message   = [[text@0a5bcb3dIt can't compare to London's West End, Mayor #mayor#, but our little dinner theater here does manage to offer some acceptable entertainments. I only had to send my meal back once (the garnish was slightly wilted), and the service was impeccable. The play, Chekhov, I think, was really rather good. It's nice to have somewhere to go when one is not summering on the shore. Keep our culture vibrant, Mayor!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1



--Motel Bug Count Down, Reports #Advisor#
a = create_advice_mysim('4a831ca5')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.FLEABAGMOTEL) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@4a5bcb40Motel Bug Count Down, Reports #Advisor#]]
a.message   = [[text@ea5bcb43Had to put Uncle Billybob Larry and Aunt Edna up at that motel nearby, Mayor. Had the little ones and the second cousins camped out all over the house and we just didn't have room for 'em. They said the roach problem was pretty much taken care of, and they didn't find ANY fleas--on the sheets anyway. Those owners deserve a pat on the back for their improvements, Mayor!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1



--Neighborhood Motel Keeps #Advisor# Sane
a = create_advice_mysim('6a831d08')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.FAMILYCOURT) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@6a5bcb46Neighborhood Motel Keeps #Advisor# Sane]]
a.message   = [[text@ca5bcb48I have to admit it, Mayor. When this family motel first went up, I wasn't entirely thrilled to have a motor inn nearby. Increased traffic, noise. You know. But we put my annoying brother-in-law up there every time he visits, and I am sold. Everyone should have a local motel for really obnoxious relative relief.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1



--Spa Masseur Worth Weight In Gold, Says #Advisor#
a = create_advice_mysim('ea831d50')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.LUXURYSPA) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ca5bcb50Spa Masseur Worth Weight In Gold, Says #Advisor#]]
a.message   = [[text@8a5bcb54Oh, Mayor, it is such a luxury to have a nice, quality spa so close by. Really adds to the neighborhood. And the massages....Let me tell you, Mayor, I treat myself at least once a week. Good for the skin tone.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--Good To Have Gas Close By, Says #Advisor#
a = create_advice_mysim('6a831da4')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.GREASEPIT) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@2a5bcb57Good To Have Gas Close By, Says #Advisor#]]
a.message   = [[text@aa5bcb5aThat old grease pit keeps m'car goin', Mayor. Used to drive clear across town to save a few cents a gallon. They don always use the right parts to fix the old jalopy up, but the price is right!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1



--Service Station Spotless, Says #Advisor#
a = create_advice_mysim('2a831dde')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.SERVICESTATION) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@0a5bcb5eService Station Spotless, Says #Advisor#]]
a.message   = [[text@ca5bcb61The local service station is spic and span, Mayor #mayor#. I feel just fine about having neighborhood kids run down for sodas from the machine, and while you pay a bit for the service--I haven't heard too many complaints about their work. Nice business to have nearby.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1



--Waiting Room Divine at Car Centre, Gushes #Advisor#
a = create_advice_mysim('8a831e1f')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.CARCARECENTRE) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ca5bcb68Waiting Room Divine at Car Centre, Gushes #Advisor#]]
a.message   = [[text@ea5bcb6bThese people at our local Car Care Centre are very expensive, but the service is worth it.They offer limosine service while your car is in the shop, but the small library and excellent selection of coffees and teas in the waiting room tempt me to stay on the premises during minor repairs! Excellent business, Mayor!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1




--Used Car Guy is Nuts! Says #Advisor#
a = create_advice_mysim('8a831e7d')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.USEDCARCHEAP) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@aa5bcb6fUsed Car Guy is Nuts! Says #Advisor#]]
a.message   = [[text@0a5bcb71I'm startin' to plan my day around drivin' by the used car place down the road, Mayor. Seems like that guy will do anythin to get attention. Yesterday he was swimmin' in a huge glass aquarium filled with tons of teeny fish. He kept poppin' up, sayin' "Come on in!" He's a hoot!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1




--Car Dealership Like Rock Concert, Says Frazzled #Advisor#
a = create_advice_mysim('8a831ebe')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.CARDEALERSHIP) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@aa5bcb74Car Dealership Like Rock Concert, Says Frazzled #Advisor]]
a.message   = [[text@2a5c029dThe car dealership over by my place must be run by teenagers, Mayor! Every loudspeaker in the place blares music all day long! On Saturdays, they have dancers on top of the building! What is going on over there? Why can't they just give away toasters like in the old days? ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Finds Stress Relief In New Car Smell
a = create_advice_mysim('6a831ef1')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.LUXURYAUTOCENTRE) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@0a5c02e3#Advisor# Finds Stress Relief In New Car Smell]]
a.message   = [[text@aa5c02e7Forget yoga, Mayor #name#, I've found a new way to beat the stress in my life! I just pop on over to our local purveyor of luxury vehicles. The manager (a woman of impeccable taste) lets me sit in whichever car takes my fancy for that session to breathe in the fine scent of unspoiled leather and polished mahogany wood. Lovely. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Thinks Tacos Taste Good
a = create_advice_mysim('8a831f75')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.TACOSTAND) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@8a5c02ee#Advisor# Thinks Tacos Taste Good]]
a.message   = [[text@8a5c02f2With this taco stand nearby, we've stopped eating at home, Mayor. These taco things are so good! And cheap! The neighbors started havin' em for breakfast even.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1



--Family Diner May Need Clean Up, Says #Advisor#
a = create_advice_mysim('2a831fa9')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.FAMILYDINER) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@2a5c02f5Family Diner May Need Clean Up, Says #Advisor#]]
a.message   = [[text@2a5c02f9I don't usually do stuff like this, Mayor, but when we were eating at the neighborhood diner the other day I think I saw a mouse run across the floor.  I like the place--but mice freak me out. Maybe they should be inspected? ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1



--#Advisor# Recommends Chez Fancy to Mayor
a = create_advice_mysim('0a831ff3')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.CHEZFANCY) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@2a5c02fd#Advisor# Recommends Chez Fancy to Mayor]]
a.message   = [[text@aa5c0300I understand you haven't yet dined at Chez Fancy, the small bistro near us, Mayor #name#. Really, you must try it--the chef trained under the great Emil Pierre. I'm sure you'd have no trouble getting a reservation, but feel free to use my name if needed. And do try the caviar pasta. It's divine. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Wants More Independent Film At Cinema
a = create_advice_mysim('ca832029')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.CINEMA) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@6a5c0304#Advisor# Wants More Independent Film At Cinema]]
a.message   = [[text@ca5c0307Hey, Mayor! The cinema by my house is great. I love the big screen. But I asked the manager to bring in some independent films and he looked at me like I'm crazy. I just want a little more choice around here, that's all.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Loves Deluxe Seating At MaxisSimTheatre
a = create_advice_mysim('0a832088')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.MAXISSIMTHEATRE) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ca5c030b#Advisor# Loves Deluxe Seating At MaxisSimTheatre]]
a.message   = [[text@ca5c030eI can't go back to the multiplex, Mayor #name#, now that I've been spoiled by the seating at the MaxisSimTheatre. Cupholders, tilting backs, adjustable foot and headrests. And they even used a tasteful upholstery! I also very much appreciate the Belgian chocolates at the concession. So nice to have a civilized experience while viewing a film.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--Pool At FamilyInn Nice Place To Cool Off, Says #Advisor#
a = create_advice_mysim('6a8320c5')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.FAMILYINN) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@6a5c0311Pool At FamilyInn Nice Place To Cool Off, Says #Advisor#]]
a.message   = [[text@2a5c031bWe joke that it's our own little country club. The FamilyInn near our house lets folks in the neighborhood use their pool for a small fee. Seems like we're the only ones who use it. The place can be full of guests, not one in the pool. Their loss, I guess.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1



--#Advisor#'s Uncle Says Hotel is Home Away From Home
a = create_advice_mysim('ca833994')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.RITZY) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ca5c031f#Advisor#'s Uncle Says Hotel is Home Away From Home]]
a.message   = [[text@ea5c0323Binky P. Enthouse and I have despaired of finding a suitable place to put up visiting relatives. Heaven knows we don't want to put them up ourselves! Well, Mayor #name#, Uncle Halsey just stayed at the Ritzy Hotel nearby, and he couldn't be happier! The staff even brought him a hot water bottle for his bed! And now I don't have to wait on him hand and foot during his interminable visits. Ah, joy!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--#Advisor# Recommends Bargain Basement At Simcy's
a = create_advice_mysim('ca83252c')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.SIMCYS) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ea5c0328Simcys nearby]]
a.message   = [[text@8a5c032dI love that bargain basement at Simcy's, Mayor! It gets a little cutthroat during special sales events. Last week two guys arguing over a leather jacket got the whole crowd involved. I thought we were going to have a riot right there in the store, but then a salesperson brought two more coats out...phew!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Requests Better Glove Selection At Sims 4th Avenue
a = create_advice_mysim('aa832838')

a.trigger  = "game.mysim_distance_to_closest_building(building_groups.SIMS4THAVE) < tuning_constants.MYSIM_HOME_RADIUS"
a.title   = [[text@aa5c0331#Advisor# Requests Better Glove Selection At Sims 4th Avenue]]
a.message   = [[text@8a5c0334I've talked to the glove department manager at Sims about offering more selection in the way of Italian leather, Mayor #name#, but still no response. I'm ready to discontinue buying my gloves there, and I am a VERY good customer. Perhaps you could drop a hint?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1




--REWARDS NEARBY MY SIM'S HOME
--_________________________________________________

--Club Course A Challenge, Says #Advisor#
a = create_advice_mysim('aa874527')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.Country_Club) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ea5c033b Club Course A Challenge, Says #Advisor#]]
a.message   = [[text@2a5c033fThe golf course at the Country Club stretches my game, Mayor #name#. The fifith hole is especially nasty, with the pond and that weird little slant on the right side of the green. Keep it well watered, Mayor! It's a real addition to the city!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Loves Cheering Home Team
a = create_advice_mysim('2a8749e1')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.MajorLeagueStadium) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@2a5c0342#Advisor# Loves Cheering Home Team]]
a.message   = [[text@4a5c0345fOur sports stadium is a beauty, Mayor #name#, and I really have team spirit. I start the wave whenever I can. Man, just sitting back and watching that thing rip through the crowd, knowing you started it all. Nothing like it, Mayor, nothing like it.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Buys Season Tickets For Opera
a = create_advice_mysim('4a874a53')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.OperaHouse) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@2a5c0348#Advisor# Buys Season Tickets For Opera]]
a.message   = [[text@0a5c034cPuccini, Verdi, Mozart....keep 'em coming, Mayor #name#. The #city# Opera Company has been so wonderful that we bought season tickets so we wouldn't miss one show. Solo mio, ma mia, ma mie...Oh, sorry, Mayor. People say I sound like a cat in heat. Good thing I don't sing along during performances.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Says Farmer's Market Becoming Cultural Mecca
a = create_advice_mysim('0a874ab3')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.FarmerMarket) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@4a5c034e#Advisor# Says Farmer's Market Becoming Cultural Mecca]]
a.message   = [[text@2a5c0351The Farmer's Market has added so much to #city#, Mayor. I buy my eggs there every week from Mrs. Kundy. I think she only has two dresses. But lately street musicians are hanging out and playing, and artists are setting up booths. I'm starting to spend every Saturday morning there just hanging out!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1



--#Advisor# Thinks Statue of Mayor Good LIkeness
a = create_advice_mysim('ca874b96')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.MayorStatue) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ea5c0355#Advisor# Thinks Statue of Mayor Good LIkeness]]
a.message   = [[text@0a5c0358Quite an honor, Mayor #name#, having a bronze statue of yourself adorning #city#'s public spaces. Congratulations! It really looks like you, too!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--#Advisor# Loves Courthouse
a = create_advice_mysim('6a874c05')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.CourtHouse) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@4a5c035b#Advisor# Loves Courthouse]]
a.message   = [[text@ea5c0360The #city# Courthouse is beautiful, Mayor, even if I did finally see it because of a complaint the mail carrier made about my dog. Poo-chee doesn't like anyone who wears a uniform. Anyway, the woodwork on the courtroom benches is really superb.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Says Roadside Attraction Not Just For Tourists
a = create_advice_mysim('6a874e72')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.TouristTrap) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@6a5c0363#Advisor# Says Roadside Attraction Not Just For Tourists]]
a.message   = [[text@4a5c0365Hate to admit it, Mayor, but me and the family have been going to the new tourist trap in #city# almost every weekend. I know there's some that worry about having these places in town--but you should see the version of La Boheme that the parrots put on!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Applauds Bringing Research Center to #city#
a = create_advice_mysim('0a874eea')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.AdvResearchCenter) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@0a5c0367#Advisor# Applauds Bringing Research Center to #city#]]
a.message   = [[text@2a5c036aThe Research Center is a great boon to our city, Mayor. Good jobs, clean industry--all that. But what I love most is hearing these researchers at the coffeehouse speak my language--and I don't understand even one word. Well, maybe 'the' or 'and'. That's about it.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--Bureau of Bureaucracy Needs Map, Complains #Advisor#
a = create_advice_mysim('4a874f6f')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.BureauofBureaucracy) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@aa5c036dBureau of Bureaucracy Needs Map, Complains #Advisor#]]
a.message   = [[text@8a5c036fIt's nice to have all this administrative stuff in one building, Mayor #name#, but I entered the Bureau of Bureaucracy the other day to get a permit and after looking around for the right office for a while, I couldn't even find my way back to the front door! I should have left a trail of croutons or something!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--City Stock Rises With #Advisor#
a = create_advice_mysim('6a88827e')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.StockExchange) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@8a5c0371City Stock Rises With #Advisor#]]
a.message   = [[text@ca5c0375Bravo, Mayor #name#, Bravo! The #city# Stock Exchange has brought us to the forefront of capitalist society, and is there anywhere else to be? I take my five-year old niece to the floor once a month. She's really taken to it. Her Simantha doll is history. She's selling stock in her future company to all the other kindergartners. Isn't that cute?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Says City Has Spirit
a = create_advice_mysim('2a8882c9')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.HouseofWorship) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@6a5c0377#Advisor# Says City Has Spirit]]
a.message   = [[text@ea5c0380Mayor, I'm so thankful to see that you don't ignore the spiritual life of your Sims. The #city# House of Worship is beautiful and welcoming to anyone who walks in the door. I'm glad to know our city doesn't ignore the higher powers!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Admires Gardens At Mayor's House
a = create_advice_mysim('0a88831d')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.MayorHouse) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@4a5c0382#Advisor# Admires Gardens At Mayor's House]]
a.message   = [[text@4a5c0385The dahlias in the gardens at your house are incredible, Mayor! What does your gardener use on them? I've heard that camel dung is especially good for dahlias. Do you think the grounds crew would let me in on their secrets?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Says City Hall Does #city# Proud
a = create_advice_mysim('ea888349')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.CityHall1) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ca5c0388#Advisor# Says City Hall Does #city# Proud]]
a.message   = [[text@6a5c038aRemember when the city hall was in that minimall, Mayor? Feels like we're hitting the big time with an "official" #city# City Hall. The glass tile mosaic in the entryway is a nice touch.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1



--#Advisor#'s Relatives Bowled Over By City Hall
a = create_advice_mysim('aa88837c')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward( special_buildings.CityHall2) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@0a5c038c#Advisor#'s Relatives Bowled Over By City Hall]]
a.message   = [[text@6a5c038fI took my relatives on a tour of #city# yesterday, Mayor, and this finally got me into our City Hall. Wow! Everything is gorgeous, down to the pewter doorknobs and the granite counters in the bathrooms. Um, how much did this place cost, Mayor? I mean it's great, but....Wow!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1




--#Advisor# Suggests Tours of City Hall
a = create_advice_mysim('2a8883e3')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.CityHall3) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@aa5c0392#Advisor# Suggests Tours of City Hall]]
a.message   = [[text@6a5c0394Mayor #name#, our City Hall is quite an edifice. Tours from out of town are making scheduled stops to admire the grounds, the architecture, and the public art. I understand the new mural in the meeting chambers was featured in five different national art journals! Why don't we offer official tours of the building? I think it would increase civic pride.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Wants More Jazz
a = create_advice_mysim('4a88aa17')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.RadioStation) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@6a5c0397#Advisor# Wants More Jazz]]
a.message   = [[text@aa5c039aCool, we got a radio station, #city#'s finest on the airwaves. Now let's get some good jazz programming going. I bet you looove jazz, Mayor. Yup, I can feeel it.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Appreciates Local TV
a = create_advice_mysim('2a88aab9')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.TV_Station) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@8a5c039d#Advisor# Appreciates Local TV]]
a.message   = [[text@4a5c03a3It's great to finally have a local TV news team, Mayor. And they really seem to know their stuff--although that meteorologist has absolutely no clue about how to predict tornadoes.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1



--#Advisor# Wins Prize At State Fair
a = create_advice_mysim('8a88aaf4')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.StateFair) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@2a5c03a6#Advisor# Wins Prize At State Fair]]
a.message   = [[text@aa5c03aaI'm sending you the recipe for my Six Alarm Chili, Mayor #name#. And it's quite a gift, let me tell you. My chili won first prize at the State Fair, and there were over 1500 entries! Hope you like it hot--the judges were turning a little purple during the tasting.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1



--Prison Scares #Advisor#
a = create_advice_mysim('2a88ab31')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.Prison) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@6a5c03acPrison Scares #Advisor#]]
a.message   = [[text@aa5c03afI've changed my dog-walking route, Mayor #name#, so I don't have to go by the prison. I know you don't want a prison to be pretty on the inside, but couldn't we paint it a nice butter yellow? Or add some soft landscaping? Fifi thinks so too.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1



--#Advisor# Love Emu At Zoo
a = create_advice_mysim('6a88db04')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.Zoo) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@0a5c03b1#Advisor# Love Emu At Zoo]]
a.message   = [[text@aa5c03b3Mayor, I never even knew there was such a thing as an emu before. Now I bought an annual membership at the zoo just so I can go see this guy whenever I have time. Man, they are weird!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1



--#Advisor# Wins Big At Casino
a = create_advice_mysim('4a88ae33')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.Casino) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@6a5c03b5#Advisor# Wins Big At Casino]]
a.message   = [[text@8a5c03b8All my friends told me I would just lose, lose, lose, if I gambled away my hard earned simoleons at the casino. Ha. Now's who's laughing all the way to the bank. I hit the jackpot, Mayor. Nice to have a little Vegas action right here in #city#.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--Renoir Exhibit Stunning, Says #Advisor#
a = create_advice_mysim('0a88ae8c')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.MajorArtMuseum) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@aa5c03baRenoir Exhibit Stunning, Says #Advisor#]]
a.message   = [[text@ea5c03c1I had to call, Mayor #name#, to tell you that I just spent four hours looking at one painting in the Renoir Exhibit at #city# Art Museum. I didn't know I could look at one thing for that long. I'll have to go back tomorrow, and I guess I need to find out if the museum offers art classes. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--University Has Intellectualized Neighborhood, Says #Advisor#
a = create_advice_mysim('2a88aee3')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.UnivAdmin) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ca5c03c5University Has Intellectualized Neighborhood, Says #Advisor#]]
a.message   = [[text@0a5c03ceEveryone around here seems a little smarter, Mayor, but also a bit more absentminded. Tell these University professors that one really shouldn't read while driving. I saw one guy doing 15 miles an hour, head buried in a book. Drove veeerrry slowly into a garbage truck. Ever see a physicist go head to head with one of #city#'s sanitation workers? Now that's entertainment.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Rents Front Yard Out For Star Gazing
a = create_advice_mysim('0a88af3e')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.MovieStudio) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@6a5c03d1#Advisor# Rents Front Yard Out For Star Gazing]]
a.message   = [[text@6a5c03d3I'm making a mint since the Movie Studio got built nearby, Mayor! Chairs in the front lawn cost 2 Simoleons an hour--one guy saw five character actors and one major motion picture stardrive by all in 45 minutes. Said it was the best 2 simoleons he'd ever spent!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--Diseases Contained At Center? Wonders #Advisor#
a = create_advice_mysim('6a88af5d')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.CenterForDisease) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@8a5c03d7Diseases Contained At Center? Wonders #Advisor#]]
a.message   = [[text@2a5c03d9Just how tight a ship do they run at the Disease Center, Mayor #name#? I read they're keeping all sorts deadly virus strains in there. Makes me a little nervous about living nearby. What if someone spills and doesn't notice? I do that all the time.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Complains Resort Blocks View
a = create_advice_mysim('8a88afbf')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.ResortHotel) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@6a5c03dd#Advisor# Complains Resort Blocks View]]
a.message   = [[text@aa5c03e0I move to a beautiful part of town, Mayor, so I can sit with my morning coffee and enjoy the view. What happens? Developers! That's what happens! Now I sit with my morning coffee and enjoy the view of a bunch of people at this resort hotel having their morning coffee enjoying my OLD view! I want my view back! ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.BAD_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--Toxic Dump Keeps #Advisor# Awake At Night
a = create_advice_mysim('6a88afb8')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.ToxicWasteDunp) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ca5c03e5Toxic Dump Keeps #Advisor# Awake At Night]]
a.message   = [[text@0a5c03e7I lay awake at night worrying about that toxic dump the city put practically in my backyard, Mayor #name#. I know some poisonous slime is gonna come alive and eat us all. I know it! And now the place has started to glow at night whenever it rains. I'm seriously considering relocation. It's always some hapless Sim who lives nearby that gets eaten first in all those movies!  ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.BAD_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--Such Thing As Pre-Post Traumatic Stress Disorder? Asks #Advisor#
a = create_advice_mysim('2a88afee')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.MissleTestingRange) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@6a5c03e9Such Thing As Pre-Post Traumatic Stress Disorder? Asks #Advisor#]]
a.message   = [[text@ca5c03f3Zzhhheeeooo! Eeeeeeeee-bam! Do you know what it's like living near a missile test range, Mayor? I've been doing some reading. Do you know that these things mis-fire? Guess where they land? Yup, usually right on somebody's patio. I'm jittery all the time now, and I'm having preview flashbacks. Don't know if I can take this strain too much longer.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.BAD_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--Convention Center Creates Parking Nightmare! Says Frustrated #Advisor#
a = create_advice_mysim('8a88b00f')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.ConventionCenter) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@2a5c03f5Convention Center Creates Parking Nightmare! Says Frustrated #Advisor#]]
a.message   = [[text@6a5c03faMayor, this is crazy! I drove around for two hours last night looking for a parking space. This convention center has every parking spot locked up for miles! I'm going to punch the next guy I see with a "Hello, my name is...." badge on his lapel. ARGH!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.BAD_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Loves The Minor Leagues
a = create_advice_mysim('aa88b03c')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.MinorLeagueStadium) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@4a5c03fd#Advisor# Loves The Minor Leagues]]
a.message   = [[text@ca5c0400As far as I'm concerned, Mayor, Minor Leagues are all we need. And living right near the stadium...I'm in heaven. My front window got smashed by two homers last season! What an honor!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--Army Base Reveille Grating On #Advisor#'s Nerves
a = create_advice_mysim('ca88b061')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.ArmyBase) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ca5c0403Army Base Reveille Grating On #Advisor#'s Nerves]]
a.message   = [[text@0a5c0406Every morning at 5 am, Mayor, it's the nice peaceful strains of the Reveille, getting everyone at the Army Base out of bed. Gets me out of bed, too, BUT I'M SUPPOSED TO HAVE TWO MORE HOURS TO SLEEP! I might as well have a rooster!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.BAD_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Sees Headless Harry
a = create_advice_mysim('8a88b085')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.Cemetery) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@2a5c0409#Advisor# Sees Headless Harry]]
a.message   = [[text@8a5c040cI was looking out my window at the cemetery in the light of the full moon, and there he was! Headless Harry I swear it! No swamp gas. He looked right at me (had to hold his head way up in the air to do so), sort of moaned, and walked away! Oh, I've still got chills!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1




--#Advisor# Likes Alternative Film at University
a = create_advice_mysim('8a88b0a7')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.UnivAdmin) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@0a5c040f#Advisor# Likes Alternative Film at University]]
a.message   = [[text@ca5c0412I've been going to the film festival at the University, Mayor #name#. Wow--has my mind broadened! The film about people's nostrils is my favorite so far. This stuff beats Hollywood anyday!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--STICK IN NEW EP1 REWARD MESSAGES HERE!

   --special_buildings.Marina
   --special_buildings.Area51
  
  
--'#Advisor# Awed By Shuttle Launch
a = create_advice_mysim('ac2a6e25')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.SpacePort) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@8bf1e528]]
a.message   = [[text@4bf1e52e'Mayor, I've never seen anything as majestic as the space shuttle launching into the skies over #city#. It's great I can see it out of my kitchen window. Too bad the vibrations shattered all of my plates though.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--'Cruise Ship Calling #Advisor#
a = create_advice_mysim('ac2a6ed8')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.DeluxePoliceStation) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@2bf1e560]]
a.message   = [[text@abf1e56fI've never gone on a cruise before Mayor, but being able to see that big ship and all those happy Sims strolling up the gangplank has got me thinking. I bet it'll never happen, but if I can get some time off work, I'm going for a cruise ship vacation! I can dream, can't I?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--#Advisor# Wants A Ride on Police Chopper
a = create_advice_mysim('8c2a6f2b')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.CruiseShipPier) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@8bf42bc2]]
a.message   = [[text@8bf42bcaHey Mayor, that police helicopter over at that the precinct sure is nifty! I'm sure it is the latest thing in crook catching technology. Do you think you could talk them into giving me a ride on it sometime? I keep asking down at the precinct and they threatened to lock me up. Can you believe that one? Talk to them for me, OK?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--#Advisor# Tired of Watering Plants - Wants Help
a = create_advice_mysim('0c2a6f8a')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.AerialFireFightingStrip) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@cbf1e5b9]]
a.message   = [[text@ebf1e5c8Mayor, I'm sure you can pull some strings down at the new fire station for me, right? I keep asking them if they'd take their  fancy-schmancy plane on a run past my house and drop a load so I wouldn't have to water my geraniums. They say it's "against regulations". Go figure.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


-- #Advisor# Becomes Train Enthusiast
a = create_advice_mysim('6c2a6fc8')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.GrandRailRoadStation) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@6bf1e5e7]]
a.message   = [[text@cbf1e5ecI never cared much for trains either way, but having that grand station so close to my house has made me change my tune. I go down there every chance I get. I just watch the trains go in and out, chug chug chug, woo woo!  I might have to go buy a model train set to go with the conductor's cap that I've taken to wearing. Folks at work are starting to look at me a little strangely.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


-- #Advisor# Loves Local Elementary School AND My Sim is middle aged
a = create_advice_mysim('4c2a7302')

a.trigger  = "mysim.age > tuning_constants.MYSIM_MIDDLE_AGE and mysim.age < tuning_constants.MYSIM_OLD_AGE and game.mysim_distance_to_closest_landmark_or_reward(special_buildings.LargeElementarySchool) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)and game.mysim_local_school_grade(building_groups.SCHOOL) > tuning_constants.ED_GRADE_HIGH"
a.title   = [[text@2bf42cf7]]
a.message   = [[text@2bf42cfcMayor, I just got back from my kid's elementary school down the block. Boy, oh boy! I wish I went to a school like that when I was a youngster! You should see the size of their gym. You could have fit my whole school in there. It's awesome.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

-- #Advisor# Lost in Halls of Local Elementary School AND My Sim is middle aged
a = create_advice_mysim('2c2a78e4')

a.trigger  = "mysim.age > tuning_constants.MYSIM_MIDDLE_AGE and mysim.age < tuning_constants.MYSIM_OLD_AGE and game.mysim_distance_to_closest_landmark_or_reward(special_buildings.LargeElementarySchool) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)and game.mysim_local_school_grade(building_groups.SCHOOL) < tuning_constants.ED_GRADE_LOW"
a.title   = [[text@4bf9c1df]]
a.message   = [[text@ebf9c1e6I showed up early for my kid's parent-teacher conference, but that school is so big I kept wandering the halls looking for the right classroom. And there was no one around to help me. It was like a nightmare I used to have. Mayor #name#, what kind of school are they running anyway?!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.BAD_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

-- #Advisor# Sets Sail
a = create_advice_mysim('ac2a7ac8')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.Marina) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@4bfee752]]
a.message   = [[text@cbfee758Mayor, I always wanted to do a little sailing and now's my chance. That marina has gotten me jumping up and down and saying things like "batten down the hatches" and "swab the poop deck"! I can almost taste that sea air now.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

-----------------------

--LANDMARKS NEARBY MY SIM'S HOME
--_________________________________________________

--Great Pyramid, Great Camels, Says #Advisor#
a = create_advice_mysim('0a88c6a5')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.GreatPyramid) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@0a5c0441Great Pyramid, Great Camels, Says #Advisor#]]
a.message   = [[text@ea843b02The Great Pyramid is awesome, Mayor, and the camel ride to the entrance was way cool. Did you know camels have really long tongues? Man. Awesome pyramid, awesome tongues. No wonder camels hang out around pyramids. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--#Advisor# Learns About Taj Mahal
a = create_advice_mysim('2a88c714')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.TajMahal) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@6a5c0444#Advisor# Learns About Taj Mahal]]
a.message   = [[text@8a843b09Wow, Mayor #name#, those gardens at the Taj really ARE paradise. And this guy built this place for his wife? Nice digs for eternity, that's for sure.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--Big Ben Bongs, well, Big, Reports #Advisor#
a = create_advice_mysim('ea88db2d')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.BigBen) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ea5c0446Big Ben Bongs, well, Big, Reports #Advisor#]]
a.message   = [[text@0a845906Nice clock tower, but the Ben is the bell. Did you know that, Mayor? What did they say? Yeah, 13 tons of bong, that's Big Ben. Gives #city# a nice historical feel, hearing Ben bong the hour. Nice addition, Mayor.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--St. Basil's Cathedral Raises Onions to New Heights, #Advisor# Jokes
a = create_advice_mysim('aa88c8a1')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.Basils) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@4a5c0449St. Basil's Cathedral Raises Onions to New Heights, #Advisor# Jokes]]
a.message   = [[text@8a843b0eThose tzars must have really loved onions, Mayor, to put them on top of their buildings of worship. Seeing the domes at St. Basil's make me think I'd better try the vegetable again. They must be good if these 16th century guys thought to get them out of the dirt and into the sky like that!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--Faneuil Hall Makes #Advisor# Feel Revolutionary
a = create_advice_mysim('6a88c8cf')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.BostonFaneuilHall) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@6a5c044cFaneuil Hall Makes #Advisor# Feel Revolutionary]]
a.message   = [[text@6a843b14I love going to the market at Faneuil Hall. I keep expecting to see a Redcoat around the corner. I know I'm just buying fish there, but the place makes me feel as if I should run off and have a tea party or something.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--#Advisor# Does Stairs At John Hancock Center
a = create_advice_mysim('ea88c8f6')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.JohnHancockCenter) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ea5c044f#Advisor# Does Stairs At John Hancock Center]]
a.message   = [[text@2a843b1aHey Mayor, pant, do I get a medal? (Gasp)! I just walked up all one hundred floors (count 'em, wheeze) of the John Hancock Building! Who needs a stairmaster? Just think, pantgasp, if I did that every day for the next six months, my thighs would be like iron!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--#Advisor# Has Stare Down With Sphinx
a = create_advice_mysim('2a88c929')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.Sphynx) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ea5c0452#Advisor# Has Stare Down With Sphinx]]
a.message   = [[text@0a845944I lost. Thought I could make that Great Sphinx blink--but I guess when you're a cat that's been around since 2500 BC, you don't get fazed by mere Sims like me. You think there's a relationship between needing to blink and an intact sense of smell, Mayor?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--#Advisor# Has Hollywood Riddle
a = create_advice_mysim('ca88c972')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.Hollywoodsign) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ca5c0455#Advisor# Has Hollywood Riddle]]
a.message   = [[text@6a843b1fWhat Hollywood star stands 50 feet tall, spans 450 feet, and weighs 450,000 pounds? Oh, yeah, and has had a strong career for 79 years? Can you guess, Mayor? Huh? The Hollywood Sign! Got ya! Well, the tour guide told us that riddle....so she got ya!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--#Advisor# Dizzy For Deco After Chrysler Visit
a = create_advice_mysim('ea88c978')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.ChryslerBuilding) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ca5c0458#Advisor# Dizzy For Deco After Chrysler Visit]]
a.message   = [[text@aa843b26I'm going cubic, industrial, sleek-lined next time I decorate, Mayor. The Chrysler Building has changed me, so it's goodbye country, hello Deco! How about a 20 foot high replica as a pagoda in the backyard? Do you think that's too much? A spire over the entryway? Oh, just build another one, Mayor. #city# can't have too many buildings like that one.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--Empire State Building King With #Advisor#
a = create_advice_mysim('ea88cb8f')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.EmpireStateBuilding) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ea5c045cEmpire State Building King With #Advisor#]]
a.message   = [[text@ca84594bI went to the top of the Empire State Building for the first time, Mayor #name#, and imagined seeing King Kong topping the rise onto the platform. Imagined so well that I had to leave pretty quick. Thinking of him balancing up there--man, it got me dizzy. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Kicked Out of Guggenheim
a = create_advice_mysim('2a88cb89')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.Guggenhiem) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@2a5c045e#Advisor# Kicked Out of Guggenheim]]
a.message   = [[text@ea843b2cI'm old enough to know better, Mayor, and I'm calling to sincerely apologize. And I DO love modern art. I just couldn't resist bringing along my scooter to take a ride down that spiral at the Guggenheim. What a rush! You should sneak in some rollerblades next time you're there.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1



--Fear Of Heights Keeps #Advisor# On Ground During Visit to Lady Liberty
a = create_advice_mysim('2a88cb85')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.StatueofLiberty) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@2a5c0461Fear Of Heights Keeps #Advisor# On Ground During Visit to Lady Liberty]]
a.message   = [[text@2a843b31The Statue of Liberty is truly amazing, Mayor, and I would love to be able to examine more than just her toes, but even looking up at the observation platform in her crown makes me green to the gills. Well, the others got the panoramic views, but I received the impromptu tour from one of the rangers about the rivets used in building the statue. Really cool rivets, too!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Appreciates History At Independence Hall
a = create_advice_mysim('ea88cbdb')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.IndependenceHall) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@4a5c0463#Advisor# Appreciates History At Independence Hall]]
a.message   = [[text@aa84589eI'm not one to get all goosepimply about much of anything, Mayor, but being in the room where the Declaration of Independence was signed made the hairs on my arms stand up. How did they write like that, anyway?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--Smith Tower More Colorful Than Name, Says #Advisor#
a = create_advice_mysim('6a88cbd4')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.SmithTower) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@8a5c0466Smith Tower More Colorful Than Name, Says #Advisor#]]
a.message   = [[text@6a843b37I was sort of expecting something a little more....blah. You know, Smith. But those enterprising westerners in the US knew how to build a nice little skyscraper.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1



--Arch Awes #Advisor#
a = create_advice_mysim('ea88cc2b')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.GatewayArch) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@2a5c0468Arch Awes #Advisor#]]
a.message   = [[text@0a843b3cI'd seen pictures of the Gateway Arch, Mayor #name#, but I had no idea it was so....well, big. How did Saarinen think of this thing, with the capsules taking you to the top and all. Wow. Only drawback was the little kid who decided the ride up didn't agree with his large pancake breakfast. Bet Saarinen didn't think of that!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Remembers The Alamo
a = create_advice_mysim('ca88cc5b')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.Alamo) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ca5c046a#Advisor# Remembers The Alamo]]
a.message   = [[text@aa8458bbI took my metal detector to The Alamo, Mayor, but the rangers wouldn't let me search for that gold that James Bowie was supposed to have dropped down a well during the Mexican siege. Darn. Can I get a permit or something? It would be way better than finding yet another buried bottletop in the park.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--#Advisor# Views CN Tower Safely From Ground
a = create_advice_mysim('ca88cc99')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.CNtower) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ca5c0475#Advisor# Views CN Tower Safely From Ground]]
a.message   = [[text@8a843b40I've been to the top of the Empire State Building, and I even looked over the edge of the Grand Canyon once, but you gotta draw the line somewhere, Mayor! The CN Tower is almost 2000 feet high! Freestanding! Uh-uh. I'm not going up there. No way.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--California Plaza Center of Universe, Gushes #Advisor#
a = create_advice_mysim('ea88ccc9')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.CaliforniaPlaza) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ca5c0478California Plaza Center of Universe, Gushes #Advisor#]]
a.message   = [[text@6a8458c7Talk about god mode, Mayor, this is where it all really happens. There wouldn't be a me, a you, any of this. My visit to California Plaza has revealed to me many secrets of the Maxis Universe. I am a changed Sim, and am now contemplating a life of Buddhist-like isolation to help me further understand the wonders to which I have been exposed. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Moved By Jefferson Memorial
a = create_advice_mysim('0a88ccf7')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.JeffersonMemorial) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@8a5c047b#Advisor# Moved By Jefferson Memorial]]
a.message   = [[text@aa843b48I have never seen such a beautiful memorial, Mayor. I was lucky enough to visit while the cherry trees were in bloom. I say I was moved, but I think I spent several hours just sitting still inside the rotunda, looking at all of Jefferson's words. I promise I will try to be a better citizen now, Mayor. I promise.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--#Advisor# Practices Speech At Lincoln Memorial
a = create_advice_mysim('ca88cd1d')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.LincolnMemorial) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@0a5c047f#Advisor# Practices Speech At Lincoln Memorial]]
a.message   = [[text@aa843b4cMartin Luther King, Jr. did pretty well with his "I Have a Dream" speech on the steps of the Lincoln Memorial, so I thought I'd practice my talk for toastmaster's there, too. Oh, Mayor, I was awful. I need help here. Do you think it was a mistake to choose the topic of hair restoration? ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1


--#Advisor# Watches Government Work At Capitol Building
a = create_advice_mysim('4a88cf12')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.USCapitol) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@aa5c0482#Advisor# Watches Government Work At Capitol Building]]
a.message   = [[text@4a843b52I got the tour of the whole four acres of the US Capitol Building, Mayor. I watched the Senate during a discussion of, well, I'm not sure what it was, but lots of senators were very upset. I hope they knew what was being discussed, because everyone voted "aye" finally. Is this how laws are passed in #city#?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1

--Advisor Learns About Obelisks During Visit to Washington Monument
a = create_advice_mysim('ca88cf37')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.WashingtonMonument) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@2a5c0485Advisor Learns About Obelisks During Visit to Washington Monument]]
a.message   = [[text@ca845887I always thought an obelisk was some sort of mythical creature, Mayor, and now I find our very famous Washington Monument is one! It's just a shape, obelisk. Obelisk, obelisk. It's like a tune that won't leave my head--obelisk.  obelisk]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1



--#Advisor# Goes To White House Easter Egg Hunt
a = create_advice_mysim('4a88cf66')

a.trigger  = "game.mysim_distance_to_closest_landmark_or_reward(special_buildings.WhiteHouse) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(tuning_constants.RANDOM_CHANCE)"
a.title   = [[text@ca5c0487#Advisor# Goes To White House Easter Egg Hunt]]
a.message   = [[text@8a843b57I went to the Easter Egg hunt at the White House, Mayor #name#. Quite an honor. I was smart. I made buddies with one of the Secret Service types, and she helped me locate a whole bunch of eggs with her superior skills in observation. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.persist = 1



-- this example has a my sim move out because his home has been abandoned
--a = create_advice_mysim('8a57d6c3')

--a.trigger  = "mysim.home_condition == building_conditions.ABANDONED"
--a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
--a.title   = "#Advisor# moves out of abandoned home."
--a.message   = [[My house was so horrible I had to leave that dump and find a new place.]]
--a.priority  = 60
--a.command = game_commands.MYSIM_MOVE_OUT
--a.persist = 1



-- Flames Flying Reports #Advisor#
a = create_advice_mysim('2a5e4f5f')

a.trigger  = "game.event_disaster_distance() < 100"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a5bc714Flames Flying Reports #Advisor#]]
a.message   = [[text@ea5bc718Mayor, call the Fire Department! <a href="#link_id#game.camera_jump_and_zoom(mysim.home_location,camera_zooms.MAX_IN);game.tool_button(button_tool_types.FIRE_DISPATCH)">Dispatch</a> the trucks! I'm looking out my kitchen window and all I see are smoke and flames! Hurry, before the whole neighborhood goes up!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.event    = game_events.MYSIM_FIRE_STARTED
a.mood = advice_moods.ALARM


-- #Advisor# Reports Riot
a = create_advice_mysim('8a918adb')

a.trigger  = "game.g_disasters_riot_started > 0 and game.event_disaster_distance() < 70"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a5bc71b#Advisor# Reports Riot]]
a.message   = [[text@6a5bc723This riot is really bad, Mayor! They've taken rotten vegetable throwing to a new height! Someone just lobbed a moldy eggplant onto my car! Eeewwww! <a href="#link_id#game.camera_jump_and_zoom(game.event_subject(),camera_zooms.MAX_IN);game.tool_button(button_tool_types.POLICE_DISPATCH)">Send</a> help quick!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.event    = game_events.MYSIM_RIOT
a.mood = advice_moods.ALARM


-- Quake Shakes #Advisor#
a = create_advice_mysim('6a918b70')

--a.trigger  = "game.event_disaster_distance() < 100"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a5bc6e9Quake Shakes #Advisor#]]
a.message   = [[text@ca5bc6ecGranny's china serving plate got broken in that last shake, Mayor. Okay, I never really liked that stupid hunting dog pattern--but I'm very attached to the cranberry goblets! Can you use your special influence to decrease events which trigger the richter scale before my crystal is smashed?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
--a.event    = game_events.DISASTER_STARTED_EARTHQUAKE
a.mood = advice_moods.ALARM



-- "VOLCANO!" Erupts #Advisor#
a = create_advice_mysim('eaa6904a')

a.trigger  = "game.g_disasters_in_progress > 0 and game.event_disaster_distance() < 300"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6a5bc6f5]]
a.message   = [[text@0a5bc6f9Help, Mayor, Help! Send lots of ice, quick! A volcano is erupting in <a href="#link_id#game.camera_jump_and_zoom(mysim.home_location,camera_zooms.MAX_IN)">my backyard</a>! The lava's eating my new patio! Now it's coming in the french doors! Now its...AAAAHHHHHHH!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.event    = game_events.MYSIM_VOLCANO
a.mood = advice_moods.ALARM


--Twister Torments #Advisor#
a = create_advice_mysim('6aa69091')

a.trigger  = "game.event_disaster_distance() < 100"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea5bc6fcTwister Torments #Advisor#]]
a.message   = [[text@ca5bc6ffAuntie N, Auntie N! No that's not it. P? Auntie R? What was it? Anyway. MAYOR! A raging tornado is bearing down on me as we speak! Help me! I don't deserve to be tormented like this! I want to go back to Kansas!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
a.event    = game_events.MYSIM_TORNADO
a.mood = advice_moods.ALARM


--WAITING ON Meteor GAME EVENT
--Meteor Shower Rains on #Advisor#'s Party
a = create_advice_mysim('2a918d76')

--a.trigger  = "game.event_disaster_distance() < 100"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a5bc709]]
a.message   = [[text@2a5bc70fMayor, Mayor! I'm having a party in <a href="#link_id#game.camera_jump_and_zoom(mysim.home_location,camera_zooms.MAX_IN)">my backyard</a>. Took me months to plan this thing. I hate giving parties, but I had to do this, you know? And now there are flaming chunks of molten rock crashing into the appetizers! The ice water the beer was in is boiling! Help me, Mayor! Make this stop! Please! This is why I hate planning parties!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_MED_LOW
--a.event    = game_events.DISASTER_STARTED_METEOR
a.mood = advice_moods.BAD_JOB



--#Advisor#'s Basement Flooded
a = create_advice_mysim('4a5e5f53')

a.trigger  = "game.event_disaster_distance() < 100"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aac104be#Advisor#'s Basement Flooded]]
a.message   = [[text@cac104c6Mayor, a <a href="#link_id#game.camera_jump_and_zoom(game.event_subject(),MAX_IN)">pipe burst</a> in my neighborhood and now my basement is filling up with water! Get a <a href="#link_id#game.camera_jump_and_zoom(game.event_subject(),MAX_IN);game.tool_plop_network(network_tool_types.PIPE)">plumber</a> over there NOW!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.event    = game_events.MYSIM_PIPE_BURST
a.mood = advice_moods.BAD_JOB




--My Sim Talking about commute on new networks (EP1)-----------------------------------
---------------------------------------------------------------

   
--WALK
--#Advisor# Loves Short Commute [And low crime, low air pollution] 
a = create_advice_mysim('cc2a84e9')

a.trigger  = "mysim.last_trip_type == mysim_trip_types.WALK and mysim.local_crime < tuning_constants.CRIME_LOW and mysim.local_air_pollution< tuning_constants.POLLUTION_LOW"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0bf9d0fc]]
a.message   = [[text@abf9d101There's nothing like being able to walk to work, Mayor. The birds are singing and life is swell. It's great having my job so close to home, but I think I may need to buy a new pair of shoes soon.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW


--Wheels on #Advisor#'s Bus Go Round and Round
a = create_advice_mysim('8c2a8653')

a.trigger  = "mysim.last_trip_type == mysim_trip_types.BUS and mysim.trip_time_ratio >= 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@abf9dc40]]
a.message   = [[text@4bf9dc44Mayor, my commute was so smooth that I caught myself humming on my way home from work the other day. My bus ride is so pleasant, and I always get a seat. It sure beats sitting behind the steering wheel of my car.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW


--Bus Commute a Bummer Says #Advisor#
a = create_advice_mysim('0c2a8789')

a.trigger  = "mysim.last_trip_type == mysim_trip_types.BUS and mysim.trip_time_ratio < .9"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@abf9dc48]]
a.message   = [[text@0bf9dc4dOur fair city's bus system is a disgrace! I could get to work quicker on a pogo stick. I was trying to "spare the air" by riding the bus, but I'm going to go back to driving my own car unless something changes soon.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW


--Train Commute a Joy Reports #Advisor#
a = create_advice_mysim('cc2a8d50')

a.trigger  = "mysim.last_trip_type == mysim_trip_types.TRAIN and mysim.trip_time_ratio >= 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4bf9dc2f]]
a.message   = [[text@abf9dc34Commuting by train really relaxes me before work. I get a chance to read the paper and look out the window, or even read a book. It sure beats driving. You should park your limo and give it a try sometime Mayor #name#.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW



--#Advisor#'s Commute A Train Wreck
a = create_advice_mysim('6c2a8452')

a.trigger  = "mysim.last_trip_type == mysim_trip_types.TRAIN and mysim.trip_time_ratio < .9"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0bf9dc39]]
a.message   = [[text@cbf9dc3d#name#, I don't know if you have any pull with the folks who run the passenger rail system in #city#, but it's a disaster. I could walk to work quicker!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW

--Monorail Magnificent Marvels #Advisor#
a = create_advice_mysim('2c2a8885')

a.trigger  = "mysim.last_trip_type == mysim_trip_types.MONORAIL and mysim.trip_time_ratio >= 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4bf9dc51]]
a.message   = [[text@4bf9dc55Now we're talking Mayor #name#! The monorail zips me to work and back like nobody's business. There's no other way to travel in my book.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW

--Monorail Monotonous Moans #Advisor#
a = create_advice_mysim('2c2a88df')

a.trigger  = "mysim.last_trip_type == mysim_trip_types.MONORAIL and mysim.trip_time_ratio < .9"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ebfaa7f8]]
a.message   = [[text@cbfaa7fd]Mayor, what's up with the monorail? I'm just trying to get to work and the thing moves like molasses. See if you can get them to pick up the pace a bit, will you?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW

--Rapid Transit Wows #Advisor#
a = create_advice_mysim('6c2a8935')

a.trigger  = "(mysim.last_trip_type == mysim_trip_types.SUBWAY or mysim.last_trip_type == mysim_trip_types.ELEVATED_TRAIN)and mysim.trip_time_ratio >= 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0bf9dc62]]
a.message   = [[text@6bf9dc66#city# Rapid Transit sets an example for all of SimNation. It is an efficient people mover. This rider has no complaints. Keep up the good work.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW

--Something Rotten with Rapid Transit Says #Advisor#
a = create_advice_mysim('2c2a8ac9')

a.trigger  = "(mysim.last_trip_type == mysim_trip_types.SUBWAY or mysim.last_trip_type == mysim_trip_types.ELEVATED_TRAIN)and mysim.trip_time_ratio <.9"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6bfaa844]]
a.message   = [[text@abfaa84aIs it just me or has it gotten harder to find a seat on the train? And the air conditioning always seems broken and it seems that the trains have been moving slower. I think we need more lines or stations, or something!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW


--WATING ON ALEX for mysim_trip_types.FERRY
--#Advisor#'s Ferry Commute is A Breeze
a = create_advice_mysim('ec2a8b33')

--a.trigger  = "mysim.last_trip_type == mysim_trip_types.FERRY and mysim.trip_time_ratio >= 1 and game.ga_air_pollution < tuning_constants.GA_POLLUTION_LOW"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0bf9dc59]]
a.message   = [[text@cbf9dc5eAhhh… the fresh air, the open water, the wind in my face, the occasional whale sighting… Commuting by boat has got to be the best.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW

--#Advisor#'s Ferry Commute Fairly Awful
a = create_advice_mysim('0c2a8c3a')

--WATING ON ALEX for mysim_trip_types.FERRY
--a.trigger  = "(mysim.last_trip_type == mysim_trip_types.FERRY and mysim.trip_time_ratio < .9"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@abfaa823]]
a.message   = [[text@0bfaa82aThe seasickness, the long ticket lines, the seagull poop. Ugh! Getting to work by boat ain't what it used to be Mayor.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW




--------------------------------------------------------------------
-- This will try to execute triggers for all registerd advices 
-- to make sure they don't have any syntactic errors.

if (_sys.config_run == 0)
then
   advices : run_triggers()
end
