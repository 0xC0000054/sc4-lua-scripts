-----------------------------------------------------------------------------------------
-- This file defines advices for the the SAFETY
dofile("_adv_sys.lua") 
dofile("_adv_advice.lua") 
dofile("adv_rewards.lua") 
dofile("adv_game_data.lua") 

-- helper 
function create_advice_safety_with_base(guid_string, base_advice)
   local a =  advices : create_advice(tonumber(guid_string, 16), base_advice)
   a.type   = advice_types . SAFETY
   return a
end

-- helper function
function create_advice_safety(guid_string)
   local a =  create_advice_safety_with_base(guid_string, nil)
   return a
end

-- function to create a 'reward' advice
function create_reward_safety(guid_string)
   local a =  create_advice_safety_with_base(guid_string, nil)
   a.class_id = reward_class_id
   return a
end
--
--

----------------------------------------------------------------------
-- Advice fields 

--type      = advice_types . UTILITIES,
--mood      = advice_moods . NEUTRAL,
--priority  = 100,
--title        = "UNDEFINED title : from base advice structure",
--message = "UNDEFINED message : from base advice structure",
--news       = "UNDEFINED news : from base advice structure",
--frequency   = 35, -- in days
--timeout   = 45, -- in days
--trigger   = "1",
--once   = 1, -- trigger the advice only once
--introduction   = 1, -- the advice is an introduction for the acvisor


------------ Advice record ----
-- Safety Advisor Sam Sequirity Is On Mayor's Team
a = create_advice_safety('8a25964c')
a.trigger  = "game.g_month > 1 and game.g_population > tuning_constants.POPULATION_STEP_2 and game. g_fire_station_count < 1"
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = [[text@0a3ab960 Safety Advisor Sam Sequirity Is On Mayor's Team]]
a.message   = [[text@2a3aba25 Greetings Mayor #mayor#! I'm ready to go to bat for you and all #city#'s safety needs! I'm here in your dugout--you check with me any time a safety situation comes up. Looking at the field right now, I'd say you might want to build a <a href="#link_id#game.tool(game_tools.TOOL_PLOP_FIRE_STATION_SMALL)">fire station</a> in #city#.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB



------------ Advice record ----
-- Sims Smoulder for Station
a = create_advice_safety('8a316022')
a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_2 and game.g_fire_station_count == 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
frequency   =  tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = "text@8a3aba4b Citizens crave fire station"
a.message   = [[text@0a3aba56 Mayor #mayor#! You got Sims. You got roads.]]
a.priority  =   tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB



------------ Advice record ----
--Firefighters Want Way Out
a = create_advice_safety('2a316200')
a.trigger  = "game.l_fire_station_no_roads > 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = "text@ca3aba5cFirefighters Want Way Out"
a.message   = [[text@ea3aba63Mayor #mayor#, firefighters trapped in station.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB
a.frequency   =  tuning_constants.ADVICE_FREQUENCY_HIGH

------------ Advice record ----
--Smoke Detector Ordinance on the Docket
a = create_advice_safety("0a315420")
a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_6 and game . g_fire_station_count > 0 and not game.ordinance_is_on(ordinance_ids.ORDINANCE_SMOKEDETECTORS)"
a.title   = "text@8a3abd08Smoke Detector Ordinance on the Docket"
a.message   = [[text@8a3abd30Where there's smoke, there's fire]]
a.priority  =   tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.frequency   =  tuning_constants.ADVICE_FREQUENCY_LOW


------------ Advice record ----
--Firefighters Flip for First Station
a = create_advice_safety('ca259621')
a.once = 1 
a.trigger  = "game . g_fire_station_count > 0"
a.title   = "text@2a3abd9bFirefighters Flip for First Station"
a.message   = [[text@ea3abdadCitizens of #city# feel safer already!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT


------------ Advice record ----
--Fire Protection Spread Thin
a = create_advice_safety("6a2437c4")

a.trigger  = "game.g_fire_station_count > 1 and game.g_fire_coverage_p < tuning_constants.COVERAGE_LOW and game.g_population > tuning_constants.POPULATION_STEP_3"
a.title   = "text@4a3aba6eFire Protection Spread Thin"
a.message   = [[text@ca3aba72 Mayor #mayor#, your hoses are a little short! You got are]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.frequency   =  tuning_constants.ADVICE_FREQUENCY_LOW




------------ Advice record ----
--Citizens Free of Fire Worries
a = create_advice_safety("6a3a7364")
a.trigger  = "game.g_fire_station_count > 0 and game.g_fire_coverage_p >tuning_constants.COVERAGE_HIGH"
a.title   = "text@8a3aba7eCitizens Free of Fire Worries"
a.message   = [[text@0a3aba83You got control of the field, Mayor.]]
a.priority  =   tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT



------------ Advice record ----
--Fire Safety Record Nets Mayor the Dog
a = create_advice_safety('2a551f71')
a.trigger  = "game.trend_count(game_trends.FIRE_DISASTER,10*12) < 1 and game.g_year_count > 10 and game. g_fire_station_count > 0" -- No fires in 10 years
a.title   = "text@0a551f76Fire Safety Record Nets Mayor the Dog"
a.message   = [[text@ea551f84Mayor #mayor#, the F7s ]] 
a.priority  =   tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW


------------ Advice record ----
--Fire Epidemic in #city#
a = create_advice_safety('8a5521ad')

a.trigger  = "game.trend_count(game_trends.FIRE_DISASTER,10*12) > 3 and not game.ordinance_is_on(ordinance_ids.ORDINANCE_SMOKEDETECTORS) and game. g_fire_funding_p > tuning_constants.FUNDING_MEDIUM" 
a.title   = "text@ca5521b2Fire Epidemic in #city#"
a.message   = [[text@6a5521beFire records show that conditions in]] 
a.priority  =   tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB
a.frequency   =  tuning_constants.ADVICE_FREQUENCY_LOW


------------ Advice record ----
--#city# Outgrows Fire Department
a = create_advice_safety('8a74c147')
a.trigger  = "game.trend_slope(game_trends.G_FIRE_PROTECTION_COVERAGE_P,tuning_constants.TREND_MEDIUM) <  tuning_constants.SLOPE_DOWN and game.trend_slope(game_trends.G_POPULATION ,tuning_constants.TREND_MEDIUM) > tuning_constants.SLOPE_UP" --fireCoverage [- trend] & cityPopulation [+ trend]
a.title   = "text@ca55242d#city# Outgrows Fire Department"
a.message   = [[text@ca552437We're growing like mad, Mayor,]] 
a.priority  =   tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
--Firefighters Give Ten Hose Salute to Mayor
--fireCoverage [+ trend] & cityPopulation [+ trend]
--TREND EXAMPLE
a = create_advice_safety('aa552428')
a.trigger  = "game.trend_slope(game_trends.G_FIRE_PROTECTION_COVERAGE_P,tuning_constants.TREND_MEDIUM) > tuning_constants.SLOPE_UP_UP and game.trend_slope(game_trends.G_RESIDENTIAL_POPULATION, tuning_constants.TREND_MEDIUM) > tuning_constants.SLOPE_UP_UP" 
a.trigger  = "game.trend_slope(game_trends.G_FIRE_PROTECTION_COVERAGE_P,tuning_constants.TREND_MEDIUM) > tuning_constants.SLOPE_UP_UP and game.trend_slope(game_trends.G_RESIDENTIAL_POPULATION, tuning_constants.TREND_MEDIUM) > tuning_constants.SLOPE_UP_UP" 
a.title   = "text@8a564044Firefighters Give Ten Hose Salute to Mayor"
a.message   = [[text@6a56404bGive yourself the wave, Mayor #mayor#! You know how to keep the ball moving. Fire protection has kept up with the city's growth. Firefighters in #city# know they have what they need to stomp out the flames. Keep up the good work!]] 
a.priority  =   tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB



------------ Advice record ----
--Fire Department Morale Low, Tempers Flare
a = create_advice_safety('4a2437d0')
a.trigger  = "game.g_fire_strike_chance > tuning_constants.STRIKE_HIGH and game.g_fire_station_count > 0 and game.g_fire_strike == 0" 
a.frequency   =  tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = "text@8a3abafbFire Department Morale Low, Tempers Flare"
a.message   = [[text@ca3abb04I'm tellin' ya, Mayor, things in the Fire Depa]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB
a.effects = { effects.POOR_FIRE_COVERAGE, effects.UNHAPPY_SIMS } --what is this??


------------ Advice record ----
--Local Fire Station Gives Mayor Thumbs Down
a = create_advice_safety('6a25962d')
a.trigger  = "game.l_fire_funding_p < tuning_constants.FUNDING_LOW and game.g_fire_coverage_p < tuning_constants.COVERAGE_LOW and game.g_fire_strike < 1" --local budget lowno strike yet, and coverage is poor
a.title   = "text@6a3abb0bLocal Fire Station Gives Mayor Thumbs Down"
a.message   = [[text@ca3abb0fYou got a problem, Mayor #mayor# . Mem]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.frequency   =  tuning_constants.ADVICE_FREQUENCY_MEDIUM



------------ Advice record ----
--#city# Fire Fighters Strike
a = create_advice_safety('2a64d230')
a.event = game_events.FIRE_STRIKE_STARTED
a.trigger ="game.g_fire_strike > 0"
a.title   = "text@0a3abb29#mayor# Fire Department Strikes!"
a.message   = [[text@aa3abb2eMayor #mayor#, your entire fire department is on strike.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.ALARM
a.effects = effects.FIRE_STRIKE -- this triggers the actual striking animations

------------ Advice record ----
--Potential Hotspot Excites Local Fire Expert
a = create_advice_safety('2a74cf2f')
a.trigger  = "game.l_flammability_h>tuning_constants.TINDER_BOX_FLAMMABILITY"
a.title   = "text@4a3abb37Potential Hotspot Excites Local Fire Expert"
a.message   = [[text@6a3abb3bPiero Maneyak, President of SAFE]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL



------------ Advice record ----
--Fire Breaks Out in #city#
a = create_advice_safety('0a74c63c')
a.event = game_events.DISASTER_STARTED_FIRE
a.trigger  = "game.g_fire_station_count>0 and game.g_disasters_in_progress>0"
a.title   = "text@2a54d7e9Fire Breaks Out in #city#"
a.message   = [[text@0a3abb40It's rock and roll time, Mayor #mayor# ! We got <a href="#link_id#game.camera_jump(game.event_subject())">fire!</a> Our brave fire fighting Sims are ready to do their jobs. <a href="#link_id#game.tool_button(button_tool_types.FIRE_DISPATCH);game.camera_jump_and_zoom(game.event_subject(),camera_zooms.MAX_IN)">Dispatch those trucks</a> now, and let 'em get to the action before any more damage is done!]]
a.priority  =tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.ALARM


------------ Advice record ----
--Help! Fire!
a = create_advice_safety('ea3eb37c')
a.event = game_events.DISASTER_STARTED_FIRE
a.trigger  = "game.g_fire_station_count==0 and game.g_disasters_in_progress>0"
a.title   = "text@4a3fb055Help! Fire!"
a.message = [[text@0a3fb05bThere's a <a href="#link_id#game.camera_jump(game.event_subject())">fire </a> in #city#! Desperate Sims have gathered to use anything on hand to douse the flames--but their feet are scorched and they are running out of saliva!! We need a <a href="#link_id#game.tool_plop_building(building_tool_types.STATION_HOUSE_2ENGINE);game.camera_jump(game.event_subject())">fire station</a>, quick! DO SOMETHING!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.ALARM


------------ Advice record ----
--Mayor #mayor# Gets the Job Done
a = create_advice_safety('ea3fc65b')
a.event = game_events.DISASTER_ENDED
a.trigger  = "game.g_disasters_fire_ended > 0 and game.g_disasters_fire_dispatch_effectiveness > tuning_constants.DISPATCH_EFFICIENCY_HIGH" 

a.title   = "text@aab2ac33Mayor #mayor# Gets the Job Done"
a.message   = [[text@6a3abb59Congrats, Mayor #mayor#! You were obviously]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
--Mayor's Dispatch Finger Fails
a = create_advice_safety('2a74c64b')
a.event = game_events.DISASTER_ENDED
a.trigger  = "game.g_disasters_fire_dispatch_effectiveness < tuning_constants.DISPATCH_EFFICIENCY_LOW and game.g_disasters_damage_cost > tuning_constants.DISASTER_COST_LOW and game.g_disasters_fire_ended > 0" 
a.title   = "text@2a3abb55Mayor's Dispatch Finger Fails"
a.message   = [[text@8a3abb62Helloooo. Anybody home? What's with you, Mayor? Has all that glad handing given you carpal tunnel? Wrist too weak to make the dispatch call? You did nothing while #city# burned. Your citizens are not happy being treated like kindling. You have some work to do to make up for this poor performance.]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
--Fire Fighters Can't Get There from Here
a = create_advice_safety('ca3abb5e')
a.event = game_events.FAILED_FIRE_DISPATCH
a.trigger  = "game.g_disasters_fire_started > 0" 
a.title   = "text@6a3abb68Fire Fighters Can't Get There from Here"
a.message   = [[text@ca3abb6bOops. You were there]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
--Special Report: After the Disaster
--Medium disaster
a = create_advice_safety('ea5524e6')
a.event = game_events.DISASTER_ENDED
a.trigger  = "game.g_disasters_damage_cost > tuning_constants.DISASTER_COST_MEDIUM and game.g_disasters_damage_cost < tuning_constants.DISASTER_COST_HIGH"
a.title   = "text@6a5524f0Special Report: After the Disaster"
a.message   = [[text@0a5524faMayor, we got the stats on]] 
a.priority  =   tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
--two more levels of disaster assetment coming

------------ Advice record ----
--Minimal Damage From Disaster
a = create_advice_safety('4a638cb2')
a.event = game_events.DISASTER_ENDED
a.trigger  = "game.g_disasters_damage_cost > tuning_constants.DISASTER_COST_LOW and game.g_disasters_damage_cost < tuning_constants.DISASTER_COST_MEDIUM" 
a.title   = "text@aa56404fdisaster aftermath 2"
a.message   = [[text@8a564053]] 
a.priority  =   tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL


------------ Advice record ----
--Terrible Disaster Finally Over
a = create_advice_safety('6a638cbb')
a.event = game_events.DISASTER_ENDED
a.trigger  = "game.g_disasters_damage_cost>tuning_constants.DISASTER_COST_HIGH" 
a.title   = "text@ea564057"
a.message   = [[text@8a56405b]] 
a.priority  =   tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
--Arson Rages in #city#
a = create_advice_safety('6a5525ab')
a.event = game_events.DISASTER_ENDED
--a.trigger  = "game. g_fire_station_count>0" --  WAITING FOR ARSON fire cause
a.title   = "text@2a5525c1Arson Rages in #city#"
a.message   = [[text@aa5525caBernie Starter, our fire forensic]] 
a.priority  =  tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB



------------ Advice record ----
--Nuclear Plant Explodes! Radiation Leaking! Evacuate!
a = create_advice_safety('4a5530ba')
a.event = game_events.NUKE_EXPLOSION
a.trigger  = "1"
a.title   = "text@ca5530c1Nuclear Plant Explodes! Radiation Leaking! Evacuate!"
a.message   = [[text@ea553109Mayor, no playbook is gonna]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.ALARM



------------ Advice record ----
--Citizens Tire of Vigilante Justice
a = create_advice_safety('ea5531a3')
a.trigger  = "game.ga_crime > tuning_constants.GA_CRIME_LOW and game.g_police_station_count < 1"
a.title   = "text@ca5531a9Citizens Tire of Vigilante Justice"
a.message   = [[text@2a5531bdMayor #mayor#, your law-abiding Sims are]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB



------------ Advice record ----
--Police Need Escape
a = create_advice_safety('8a6cbfbb')
a.trigger   = "game.l_police_no_roads > 0"
a.title   = "text@8a56405fPolice Need Escape"
a.message   = [[text@aa564063The men and women in blue at <a href="#link_id#game.camera_jump(game.l_police_no_roads_subject)">this precinct</a> say their only chance to fight crime occurs if someone tries to steal a squad car. No problem catching the criminal, though, because there are no roads out of the parking lot! Lay some <a href="#link_id#game.tool_plop_network(network_tool_types.ROAD)">asphalt</a> to connect your cops to the rest of the city quick!]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
--#city# has Gaps in Police Coverage
a = create_advice_safety('ea6cb278')

a.trigger  = "game.g_police_station_count > 0 and game.g_police_coverage_p < tuning_constants.COVERAGE_LOW"
a.title   = "text@4a564067#city# has Gaps in Police Coverage"
a.message   = [[text@4a56406bYour police officers may be world class, Mayor, but even the best of 'em can't be in three places at once. Take a look at your city data to see where you could use more police stations, or beef up funding for existing precincts.]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--No Jail Means Crooks Go Free
a = create_advice_safety('ca6cb285')

--note: police stations have jail capacity too
a.trigger  = "game.g_arrest_count > game.g_jail_capacity and game.g_jail_count == 0 and game.g_population > tuning_constants.POPULATION_STEP_5"
a.title   = "text@4a564073No Jail Means Crooks Go Free"
a.message   = [[text@6a564077We can catch 'em, but we can't keep 'em. Don't let #city# become a felon's fantasy land, Mayor #mayor#. Build a jail so we can keep these creeps off the streets!]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB
a.frequency = advice_moods.NEUTRAL

------------ Advice record ----
--Crowded Crooks Reported Ready to Riot

a = create_advice_safety('ca63951d')

a.trigger  = "game.g_jail_count > 0 and (game.g_inmate_count/game.g_jail_capacity>.8) and (game.g_inmate_count/game.g_jail_capacity<1)"
a.title   = "text@6a56407aCrowded Crooks Reported Ready to Riot"
a.message   = [[text@6a56407eCranky crooks lose their table manners fast, Mayor #mayor#. We need to deal with the overcrowding in our jails before spoon duels become knife fights. I suggest you build some more jails soon.]] 
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
--No Room in Jails Turns Justice System into Revolving Door
a = create_advice_safety('0a639607')

a.trigger  = "game.g_jail_count > 0 and (game.g_inmate_count == game.g_jail_capacity)"
a.title   = "text@6a564082No Room in Jails Turns Justice System into Revolving Door"
a.message   = [[text@4a564086The #city# Justice System has no chance, Mayor #mayor#! No rooms at the jail means known criminals are hitting the streets without any chance for rehabilitation! The situation is grave. I strongly suggest we build more jails before the overflow takes over the city!]] 
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
--Citizens Applaud Low Crime Rates
a = create_advice_safety('4a6396e7')

a.trigger  = "game.ga_crime < tuning_constants.GA_CRIME_LOW and game.l_crime_h < tuning_constants.CRIME_LOW and game.g_population > tuning_constants.POPULATION_STEP_4 and game.g_police_station_count > 0"
a.title   = "text@6a56408a"
a.message   = [[text@ca56408eCongrats, Mayor #mayor#, your citizens are feeling safe and secure with the excellent police coverage you have provided. Moe Barrbeecu says he can even leave his grill tools out at night (this is good, because he likes to grill his toast in the morning).]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
--Oppressive Policing has Citizens Considering Return to Vigilante Justice
a = create_advice_safety('2a639726')
a.trigger  = "game.g_police_funding_p > 100 and game.ga_crime < tuning_constants.GA_CRIME_MEDIUM and game.g_police_strike ==0 and game.g_police_coverage_p > tuning_constants.COVERAGE_HIGH"
a.title   = "text@ea564092Oppressive Policing has Citizens Considering Return to Vigilante Justice"
a.message   = [[text@6a564095Toddlers arrested for using swings incorrectly? City gardener ticketed for trespassing? Our overpaid cops are getting a bit out of hand, Mayor #mayor#. You might want to look at safety funding or number of police stations to adjust things so our men and women in blue have enough to do.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
--Study Shows Police Not Stopping Crime
a = create_advice_safety('0a639bc4')

a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_3 and game.g_police_coverage_p > tuning_constants.COVERAGE_HIGH and game.ga_crime > tuning_constants.GA_CRIME_MEDIUM and game.g_police_funding_p < 101"
a.title   = "text@aa56409aStudy Shows Police Not Stopping Crime"
a.message   = [[text@ca56409fDespite good police coverage, crime still pays in #city#. This is where the coaching job gets tricky, Mayor #mayor#. Take a look at your crime data, or your police funding to see if you can get a lock on the problem. You might also try passing some ordinances (don't fumble) to see if you can reduce crime this way.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL


------------ Advice record ----
--#city# Voted One of Ten Safest
a = create_advice_safety('0a639f82')
--police coverage trend +, avg crime trend -, crime<LOW_CRIME
a.trigger  = "game.trend_delta(game_trends.G_POLICE_PROTECTION_COVERAGE_P,tuning_constants.TREND_MEDIUM) >tuning_constants.SLOPE_UP and game.trend_delta(game_trends.GA_CRIME,tuning_constants.TREND_MEDIUM) <tuning_constants.SLOPE_DOWN and game.ga_crime < tuning_constants.GA_CRIME_LOW and game.g_population > tuning_constants.POPULATION_STEP_4"
a.title   = "text@4a5640a3#city# Voted One of Ten Safest"
a.message   = [[text@ea5640a7Nice job, Mayor #mayor#! FUSS (Families United for Safe Streets) has voted #city# onto their top ten list. "Safety records like ours get no fuss from us!" says FUSS chair Kitty N. Bakseet.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB


------------ Advice record ----
--Citizens Calm and Content in #city#
a = create_advice_safety('aa63a3ef')

a.trigger  = "game.trend_count(game_trends.RIOT_DISASTER,5*12) < 1 and game.g_year_count > 5 and game.g_population > 2"
a.title   = "text@aa5640baCitizens Calm and Content in #city#"
a.message   = [[text@8a5640aeNo riots in five years, Mayor! Way to go! Xanax prescriptions are at an all time low, and your citizens spend more time practicing yoga than self defense. Peace rules!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB
a.frequency   =  tuning_constants.ADVICE_FREQUENCY_LOW*3


------------ Advice record ----

--Unrest in #city# New Trend?
--#of Riots in 5 Years > 3
a = create_advice_safety('6a63a884')

a.trigger  = "game.trend_count(game_trends.RIOT_DISASTER,5*12) > 3 and game.g_police_funding_p > tuning_constants.FUNDING_MEDIUM"
a.title   = "text@ea5640c9Unrest in #city# New Trend?"
a.message   = [[text@4a5640d0Mayor, my studies show that the number of riots in #city# over the past few years is a cause for concern. Before your Sims start thinking of gas masks as normal glove compartment gear, you might want to try passing some anti-crime ordinances to see if this stems the unrest.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
--Monthly Arrest Report Released
a = create_advice_safety('ea63aa1c')
a.trigger  = "game.g_arrest_count > tuning_constants.ARRESTS_HIGH"
a.title   = "text@8a5640d3Monthly Arrest Report Released"
a.message   = [[text@ca5640d8Just want to keep you up to snuff, Mayor #mayor#. There were quite a few arrests last month. Here's the stats: Number of Arrests Last Month = #game.g_arrest_count#]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL


------------ Advice record ----
--Crime Heats Up in #city#
a = create_advice_safety('2a63bd88')
--# of crimes Trend +, # of crimes committed in past month>x
a.trigger  = "game.trend_slope(game_trends.G_NUM_CRIMES,tuning_constants.TREND_MEDIUM) > tuning_constants.SLOPE_UP and game.ga_crime > tuning_constants.GA_CRIME_MEDIUM" 
a.title   = "text@8a5640dcCrime Heats Up in #city#"
a.message   = [[text@aa5640e0I'm not liking the current numbers on crime, Mayor. We're seeing an increase recently, and citizens are starting to think twice about going out at night. Check out your police coverage, safety budget, and ordinances to see if you can stop this wave in its tracks.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
--Crime Wave Smooths Out
a = create_advice_safety('ea74c65d')
--# of crimes Trend -, # of crimes committed in past month<x
a.trigger  = "game.trend_slope(game_trends.G_NUM_CRIMES,tuning_constants.TREND_MEDIUM) < tuning_constants.SLOPE_DOWN and game.ga_crime < tuning_constants.GA_CRIME_MEDIUM" 
a.title   = "text@ea5640e4Crime Wave Smooths Out"
a.message   = [[text@ea5640e8Pass complete, Mayor #mayor#! The measures you took to subdue the mounting crime rates in #city# seem to be working! Police Chief Miranda Rights says, "Right On!" ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency =tuning_constants.ADVICE_FREQUENCY_LOW
a.mood = advice_moods.NEUTRAL


------------ Advice record ----
--Police Not Superheroes: City Outgrowing Police Force
--policeCoverage [- trend] & cityPopulation [+ trend]
a = create_advice_safety('2a63bfa0')
a.trigger  = "game.trend_slope( game_trends.G_POLICE_PROTECTION_COVERAGE_P, tuning_constants.TREND_MEDIUM) < tuning_constants.SLOPE_DOWN and game.trend_slope( game_trends.G_POPULATION, tuning_constants.TREND_MEDIUM) > tuning_constants.SLOPE_UP and game.ga_crime < tuning_constants.GA_CRIME_MEDIUM and game.g_population > tuning_constants.POPULATION_STEP_4"
a.title   = "text@ea5640ecPolice Not Superheroes: City Outgrowing Police Force"
a.message   = [[text@ea5640f1Superman is faster than a speeding bullet, but our officers are only human, Mayor #mayor#. Our city is growing, and it is time to make sure we have enough police coverage to keep up. Build some more stations or watch the crime rates climb!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
--Police make Mayor #mayor# Honorary Beat Cop
--policeCoverage [+ trend] & cityPopulation [+ trend]
a = create_advice_safety('ea74cf5e')
a.trigger  = "game.trend_slope( game_trends.G_POLICE_PROTECTION_COVERAGE_P, tuning_constants.TREND_MEDIUM) > tuning_constants.SLOPE_UP and game.trend_slope( game_trends.G_POPULATION, tuning_constants.TREND_MEDIUM) > tuning_constants.SLOPE_UP and game.g_population > tuning_constants.POPULATION_STEP_5"
a.title   = "text@ca56410bPolice make Mayor #mayor# Honorary Beat Cop"
a.message   = [[text@aa56410fMayor, in recognition of the fact that you keep your police team clean and well-fed, your officers have awarded you their highest honor. You have been made an honorary beat cop! Walk the streets with pride, Mayor #mayor#, and keep up the good work!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL


------------ Advice record ----
--Police Look for Jobs in Private Sector
a = create_advice_safety('4a74cf51')
--PoliceFunding<70% & crime>X (increase with time and degree of underfunding)
a.trigger  = "game.g_police_funding_p < tuning_constants.FUNDING_MEDIUM and game.ga_crime > tuning_constants.GA_CRIME_LOW"
a.title   = "text@8a564113Police Look for Jobs in Private Sector"
a.message   = [[text@6a564117We're losing policemen and women left and right, Mayor #mayor#. Chief Miranda Rights says the chronic underfunding of her force has morale at an all time low. Officers can't keep the streets safe, and paid vacation time was just cut again. Increase your safety funding now, or I predict you'll have a strike on your hands.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL


------------ Advice record ----
--Local Police Station says "Mayor Don't Care!"
a = create_advice_safety('8a63c426')
--(stationFunding<80% & crime Near Station>X) & policeFunding>85%
a.trigger  = "game.l_police_funding_p < tuning_constants.FUNDING_LOW and game.g_police_strike == 0 and game.g_police_coverage_p < tuning_constants.COVERAGE_LOW"
a.title   = [[text@2a56411bLocal Police Station says "Mayor Don't Care!"]]
a.message   = [[text@4a564125Mayor #mayor#, this <a href="#link_id#game.camera_jump_and_zoom(game.l_police_funding_p_subject,camera_zooms.MAX_IN)">local police station</a> seems to have missed out on funding handouts. As a result, they have a mannequin that looks suspiciously like you in one of their holding cells. <a href="#link_id#game.window_query(game.l_police_funding_p_subject)">Fund the station</a> adequately before they bring out the voodoo pins. You may have a strike on your hands if you don't act now!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
--Crooks Rejoice! Police Strike in #city#!
a = create_advice_safety('ca5e732a')
a.event = game_events.POLICE_STRIKE_STARTED
a.trigger  = "game.g_police_strike>0"
a.title   = "text@aa564132Crooks Rejoice! Police Strike in #city#!"
a.message   = [[text@0a564137It's bad, Mayor #mayor#, real bad. Some of our police officers have walked off the job. I don't blame 'em. Their station rooftop is leaking, and most officers haven't seen new uniforms in years. Loosen that belt and fork over some <a href="#link_id#game.camera_jump_and_zoom(game.l_police_funding_p_subject,camera_zooms.MAX_IN);game.window_query(game.l_police_funding_p_subject)">funds</a>, Mayor, or this city will be owned by crooks.]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.ALARM
a.effects = effects.POLICE_STRIKE -- starts animations for striking sims


------------ Advice record ----
--Undercover Cop Unearths Den of Crime
a = create_advice_safety('6a63c8a6')
a.trigger  = "game.l_crime_h > tuning_constants.CRIME_HIGH"
a.title   = "text@0a56413cUndercover Cop Unearths Den of Crime"
a.message   = [[text@ca564141"Officer Dizzy Guys has done his work well, Mayor. ""<a href=""#link_id#game.camera_jump_and_zoom(game.l_crime_h_subject,MAX_IN)"">This locale</a> is crawling with unlawful creeps, Mayor #mayor#. Give us the means to get in there and clean it up before the dirt spreads!"" he pleads. I'd build a local police station to make the streets safe again."]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
--Crime On the Rise in #city#
a = create_advice_safety('6a63ca9f')
--Avg Crime > MEDIUM_CRIME, avg crime trend +
a.trigger  = "game.ga_crime > tuning_constants.CRIME_MEDIUM and game.trend_slope(game_trends.GA_CRIME,tuning_constants.TREND_MEDIUM) > tuning_constants.SLOPE_UP"
a.title   = "text@2a564145Crime On the Rise in #city#"
a.message   = [[text@0a564149Mayor, crime levels have been increasing lately and I don't like it. Build more police stations at the key crime hot spots. Now."]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
--Crime Wave Goes Tidal - Wealthy Flee
a = create_advice_safety('ca63d2c6')
--Crime level trend +, crime>X, demand - R$$$
a.trigger  = "game.ga_crime > tuning_constants.CRIME_HIGH and game.trend_slope(game_trends.GA_CRIME,tuning_constants.TREND_MEDIUM) > tuning_constants.SLOPE_UP and game.trend_slope(game_trends.G_RH_POPULATION,tuning_constants.TREND_SHORT) < 0"
a.title   = "text@2a564166Crime Wave Goes Tidal - Wealthy Flee"
a.message   = [[text@aa56416eDon't let that finance guru stop you on this one, Mayor #mayor#! Crime has reached dangerous levels in #city#. Rich folks are moving out of town and our hardware stores are out of padlocks and window bars. More police stations and increased safety funding are a must! Check out the crime map to see where the situation is most dire.]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
--RIOT!!!
a = create_advice_safety('2a74cf91')
a.event = game_events.DISASTER_STARTED_RIOT
a.trigger  ="game.g_disasters_riot_started > 0 and game.g_police_station_count > 0"
a.title   = "text@aa564172RIOT!!!"
a.message   = [[text@2a564176No time to chat, Mayor #mayor#. We got a riot of angry citizens. Dispatch the police force at once before the crowd moves on from tossing tomatoes.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.ALARM



------------ Advice record ----
--Mayor Unfazed by Disaster
--Fire dispatch highly effective
a = create_advice_safety('ea74cf9f')
a.event = game_events.DISASTER_ENDED
a.trigger  = "game.g_disasters_fire_ended > 0 and game.g_disasters_fire_dispatch_effectiveness > tuning_constants.FIRE_DISPATCH_GOOD" 
a.title   = "text@8a56417aMayor Unfazed by Disaster"
a.message   = [[text@aa56417eYou are a dispatching fool, Mayor #mayor#! Thanks to your ability to call the plays in the field, the current disaster was not the tragedy it could have been. Nice work!!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB



------------ Advice record ----
--Riot Damage Widespread
a = create_advice_safety('8a63d605')
a.event = game_events.DISASTER_ENDED
a.trigger  = "game.g_disasters_police_dispatch_effectiveness < tuning_constants.POLICE_DISPATCH_BAD and game.g_disasters_damage_cost > tuning_constants.DISASTER_COST_MEDIUM and game.g_disasters_riot_ended>0" 
a.title   = "text@aa564183Riot Damage Widespread"
a.message   = [[text@6a564186Mayor #mayor#, how was that croquet game with the Governor? Hope it was good, because while you were playing with your mallet, #city# was being ravaged by riot! Get a cell phone so you can make dispatch your police force from the wicket. Not good, Mayor, not good. Here's what that croquet game cost: Buildings destroyed: #game.g_disasters_damage_building_count#  Cost to Rebuild: #game.g_disasters_damage_cost#]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
--No Way to Riot
a = create_advice_safety('2a63dcc5')

a.event = game_events.FAILED_POLICE_DISPATCH
a.trigger  = "game.g_disasters_riot_started > 0"

a.title   = "text@ea56418aNo Way to Riot"
a.message   = [[text@6a56418ePolice were dispatched. Good. Cars on the road. Good. Road doesn't get to riot site. Bad. Don't let all your new riot gear go to waste. Talk with your transportation advisor NOW about building a network of roads that are connected!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.persist = "1"

------------ Advice record ----
--View of Blue Quells Riot
a = create_advice_safety('ea63df5f')
a.event = game_events.DISASTER_ENDED
a.trigger  = "game.g_disasters_riot_ended > 0 and game.g_disasters_police_dispatch_effectiveness > tuning_constants.POLICE_DISPATCH_GOOD" --wait until riot is over before alerting you
a.title   = "text@0a56419bView of Blue Quells Riot"
a.message   = [[text@4a56419eNice work, Mayor #mayor#. Your dispatching acumen got the police force to the riot before things got too ugly. Police Chief Miranda Rights says she is proud to be a part of your administration! Fine work!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB


------------ Advice record ----
--Happy Survey Shows Sims Not
a = create_advice_safety('4a63e3b7')

a.trigger  = "game.trend_count(game_trends.RIOT_DISASTER,5*12) > 1" 
a.title   = "text@2a5641a2Happy Survey Shows Sims Not"
a.message   = [[text@6a5641a6Unhappy Sims seem to like to riot, Mayor #mayor#. In fact, they have really taken to it in the past few years. Time to pay attention to those complaint slips, Mayor. Work to make your citizens happier, or at least build some more police stations to keep the malcontents in line.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB



--NO CROSSWALK ORDINANCE
------------ Advice record ----
--Expert Worries about Crosswalk Safety
--a = create_advice_safety('2a74cfb4')
--a.trigger  = "game.ga_life_exp < tuning_constants.LE_HIGH and random (5) and (game.g_num_elem_schools + game.g_num_high_schools > 3) and not (game.ordinance_is_on(ordinance_ids.ORDINANCE_CROSSINGGUARDS))"
--a.persist = 1
--a.title   = "text@8a5641a9Expert Worries about Crosswalk Safety"
--a.message   = [[text@0a5641adLocal safety expert, Florrie E. Sentorange, says rush hour and school age kids don't mix. She personally counted 18 near misses at school crosswalks last week. I suggest spending the money to install crossing guards at all school crosswalks--or you'll have FUSS (Families United for Safe Streets) on your back.]]
--a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
--a.mood = advice_moods.NEUTRAL
--a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW



------------ Advice record ----
--Jailbreak started
a = create_advice_safety('ca6167ba')

a.event = game_events.POLICE_JAILBREAK_STARTED
a.trigger  = "game.g_jailbreak > 0"
a.title   = "text@8a6df6f1 Jailbreak!"
a.message   = [[text@2a6df6fb Prisoners are escaping!]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
--Jailbreak ended
a = create_advice_safety('0a616893')
a.event = game_events.POLICE_JAILBREAK_ENDED
a.trigger  = "game.g_jailbreak < 1"
a.title   = "text@4adcc1e3Jailbreak Ended!"
a.message   = [[text@8adcc1e8Prisoners are back under control.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.GREAT_JOB


---------- Advice record ----
--Animals escaped from zoo
a = create_advice_safety('ea668069')
a.event = game_events.PARKS_ZOO_ESCAPE
a.trigger  = "1"
a.title   = [[text@0a6df70a #city# Lions are On the Lam]]
a.message   = [[text@ca6df70e Mayor, it's not your imagination, that really was an elephant heading down ]]
a.mood = advice_moods.BAD_JOB
a.timeout = 60          -- keep this equal to the "timeout" property in Automata\zoomanji.lua
a.priority = tuning_constants.ADVICE_PRIORITY_MEDIUM


------------ Advice record ----
a = create_advice_safety('ea3162b8')

a.trigger  = "0" -- made trigger 0 for the DEMO
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "Testing Medium Priority Message"
a.priority  =   tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.message   = [[This is a test of medium priority message.<br><a href="#link_id#game.camera_zoom(camera_zooms.MAX_IN)">Camera Zoom MAX_IN</a>.<br><a href="#link_id#game.camera_zoom(camera_zooms.MAX_OUT)">Zoom MAX_OUT</a>.<br><a href="#link_id#game.camera_zoom(camera_zooms.MIDDLE)">Zoom MIDDLE</a>.<br><a href="#link_id#game.camera_jump(game.l_air_pollution_h_subject)">Camera Jump</a>.<br>
==#game.ordinance_name(odinance_ids.ORDINANCE_POWERCONSERVATION)#==.]]

------------ Advice record ----
a = create_advice_safety('0a3162de')

a.trigger  = "0" -- made trigger 0 for the DEMO
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "Testing Low Priority Message"
a.message   = [[This is a test of low priority message.]]
a.priority  =  tuning_constants.ADVICE_PRIORITY_LOW 
a.mood = advice_moods.NEUTRAL


------------ Advice record ----
a = create_advice_safety('8a31630f')

a.trigger  = "0" -- made trigger 0 for the DEMO
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "Testing Fluff Priority Message"
a.message   = [[This is a test of Fluffy the wondercat-type messages.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
a = create_advice_safety('ea316343')

a.trigger  = "0" -- made trigger 0 for the DEMO
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "Testing 'No Headline' Priority Message"
a.message   = [[This is a test of a message that should only appear in the advisor window but not in the news flipper.]]
a.priority  = 1
a.mood = advice_moods.BAD_JOB


--------------------------------------------------------------------
-- This will try to execute triggers for all registerd advices 
-- to make sure they don't have any syntactic errors.

if (_sys.config_run == 0)
then
   advices : run_triggers()
end
