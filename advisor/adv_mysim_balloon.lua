-----------------------------------------------------------------------------------------
-- This file defines advices for the the MYSIM
dofile("_adv_sys.lua") 
dofile("_adv_advice.lua") 
dofile("adv_game_data.lua") 
dofile("adv_mysim_data.lua") 

-- helper funcition
function create_mysim_balloon_advice_with_base(guid_string, base_advice)
   local a =  advices : create_advice(tonumber(guid_string, 16), base_advice)
   a.type   = advice_types . MYSIM
   a.class_id = hex2dec("6b70efad") -- cSC4MySimBalloonAdvice class ID
   a.frequency = 0
   a.balloon_message = ""
--   a.balloon_sound = hex2dec('ea5ec59f') -- this is a bulding plop sound
   a.balloon_sound = 0 -- Zero sound ID means no sound
--   a.balloon_sound_m = 0 -- Male specific sound. If not specified "balloon_sound" will be used. 
--   a.balloon_sound_f = 0 -- Female specific sound. If not specified "balloon_sound" will be used.  
   a.balloon_sound_chance = 100 -- the game compares a random number to this one (RN < a.balloon_sound_chance) in order to determine whether or not to play the balloon sound
   return a
end

-- helper funcition
function create_mysim_balloon_speech_advice(guid_string)
   local a = create_mysim_balloon_advice_with_base(guid_string, nil)
   a.balloon_icon1 = hex2dec('5b7e54f3') -- this needs to be an ID for the speech balloons
   return a
end

function create_mysim_balloon_thought_advice(guid_string)
   local a = create_mysim_balloon_advice_with_base(guid_string, nil)
   a.balloon_icon1 = hex2dec('7b7e54f5')   -- this needs to be an ID for the thought balloons
   return a
end

function create_mysim_balloon_spiky_advice(guid_string)
   local a = create_mysim_balloon_advice_with_base(guid_string, nil)
   a.balloon_icon1 = hex2dec('8b9d3ad5')   -- this needs to be an ID for the spiky balloons
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
-- balloon_iconN = 0   -- N can go up to 9 (balloon_icon9). They will be stacked at run time on top each other, the lowest number at the bottom of the stack.

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
--a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
--a.mood = advice_moods.BAD_JOB




--Approaching friend's house
a = create_mysim_balloon_thought_advice('ec1abb3d')
a.trigger  = "game.random_chance(60) and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.CelebrateF
a.balloon_sound_m = mysim_VOX.CelebrateM
a.event = game_events.MYSIM_APPROACHING_LOCATION
a.balloon_icon2 = mysim_balloons.FRIENDGREEN

--Approaching house of Sim who was cheating on your boy/girl friend
a = create_mysim_balloon_spiky_advice('2b9d6fda')
a.trigger  = "game.random_chance(5) and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.FRIENDRED
a.balloon_sound_f = mysim_VOX.JealousyF
a.balloon_sound_m = mysim_VOX.JealousyM


------------- INSIDE A RESIDENCE-------------------------------------------------------
--Inside friend's house -exercise1
a = create_mysim_balloon_speech_advice('cc1a8b5a')
a.trigger = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM
a.balloon_icon2 = mysim_balloons.exercise1

--Inside friend's house -exercise2
a = create_mysim_balloon_speech_advice('cc2cd892')
a.trigger = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.InterestF
a.balloon_sound_m = mysim_VOX.InterestM
a.balloon_icon2 = mysim_balloons.exercise2

--Inside friend's house -exercise3
a = create_mysim_balloon_speech_advice('2c2cd95b')
a.trigger = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.ConcernF
a.balloon_sound_m = mysim_VOX.ConcernM
a.balloon_icon2 = mysim_balloons.exercise3

--Inside friend's house -food1
a = create_mysim_balloon_speech_advice('ac1abb36')
a.trigger  = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.GreetF
a.balloon_sound_m = mysim_VOX.GreetM
a.balloon_icon2 = mysim_balloons.food1

--Inside friend's house -food2
a = create_mysim_balloon_speech_advice('ac2cd984')
a.trigger = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM
a.balloon_icon2 = mysim_balloons.food2

--Inside friend's house -food3
a = create_mysim_balloon_speech_advice('8c2cd98a')
a.trigger = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.DisgustF
a.balloon_sound_m = mysim_VOX.DisgustM
a.balloon_icon2 = mysim_balloons.food3


--Inside friend's house -movies1
a = create_mysim_balloon_speech_advice('2c1abd23')
a.trigger  = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.ComplaintF
a.balloon_sound_m = mysim_VOX.ComplaintM
a.balloon_icon2 = mysim_balloons.movies1

--Inside friend's house -movies2
a = create_mysim_balloon_speech_advice('4c2cd9d3')
a.trigger = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.InterestF
a.balloon_sound_m = mysim_VOX.InterestM
a.balloon_icon2 = mysim_balloons.movies2

--Inside friend's house -movies3
a = create_mysim_balloon_speech_advice('2c2cda34')
a.trigger = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.ShockF
a.balloon_sound_m = mysim_VOX.ShockM
a.balloon_icon2 = mysim_balloons.movies3


--Inside friend's house -party1
a = create_mysim_balloon_speech_advice('2c2cda55')
a.trigger  = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.CelebrateF
a.balloon_sound_m = mysim_VOX.CelebrateM
a.balloon_icon2 = mysim_balloons.party1

--Inside friend's house -party2
a = create_mysim_balloon_speech_advice('6c2cda5a')
a.trigger = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.InterestF
a.balloon_sound_m = mysim_VOX.InterestM
a.balloon_icon2 = mysim_balloons.party2

--Inside friend's house -party3
a = create_mysim_balloon_speech_advice('ec2cda5f')
a.trigger = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.JealousyF
a.balloon_sound_m = mysim_VOX.JealousyM
a.balloon_icon2 = mysim_balloons.party3

--Inside friend's house -romance1
a = create_mysim_balloon_speech_advice('0c2cdafe')
a.trigger  = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.GreetF
a.balloon_sound_m = mysim_VOX.GreetM
a.balloon_icon2 = mysim_balloons.romance1

--Inside friend's house -romance2
a = create_mysim_balloon_speech_advice('2c2cdb03')
a.trigger = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.DisgustF
a.balloon_sound_m = mysim_VOX.DisgustM
a.balloon_icon2 = mysim_balloons.romance2

--Inside friend's house -romance3
a = create_mysim_balloon_speech_advice('cc2cdb08')
a.trigger = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.JealousyF
a.balloon_sound_m = mysim_VOX.JealousyM
a.balloon_icon2 = mysim_balloons.romance3

--Inside friend's house -style1
a = create_mysim_balloon_speech_advice('6c2cdb5f')
a.trigger  = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.InterestF
a.balloon_sound_m = mysim_VOX.InterestM
a.balloon_icon2 = mysim_balloons.style1

--Inside friend's house -style2
a = create_mysim_balloon_speech_advice('4c2cdb63')
a.trigger = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.DisgustF
a.balloon_sound_m = mysim_VOX.DisgustM
a.balloon_icon2 = mysim_balloons.style2

--Inside friend's house -style3
a = create_mysim_balloon_speech_advice('8c2cdb68')
a.trigger = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.JealousyF
a.balloon_sound_m = mysim_VOX.JealousyM
a.balloon_icon2 = mysim_balloons.style3


--Inside friend's house -tech1
a = create_mysim_balloon_speech_advice('cc2cdbab')
a.trigger  = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.InterestF
a.balloon_sound_m = mysim_VOX.InterestM
a.balloon_icon2 = mysim_balloons.tech1

--Inside friend's house -tech2
a = create_mysim_balloon_speech_advice('4c2cdbb1')
a.trigger = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.CelebrateF
a.balloon_sound_m = mysim_VOX.CelebrateM
a.balloon_icon2 = mysim_balloons.tech2

--Inside friend's house -tech3
a = create_mysim_balloon_speech_advice('ac2cdbb5')
a.trigger = "game.random_chance(10) and mysim.trip_at_location > 0 and game.is_building_group(mysim.destination_subject, building_groups.RESIDENTIAL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.DeathF
a.balloon_sound_m = mysim_VOX.DeathM
a.balloon_icon2 = mysim_balloons.tech3
--------------------------------------------------------------------------------------------------------------------------




--APPROACHING COMMERCIAL SERVICES--------------------------------------
--Approaching cheap eats and Sim is R$
a = create_mysim_balloon_thought_advice('ec1abfa8')
a.trigger  = "mysim.wealth == 1 and game.is_building_group(mysim.destination_subject,building_groups.COM_FOOD) and game.is_building_group(mysim.destination_subject,building_groups.CS1)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.DININGGREEN
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM

--Approaching cheap eats and Sim is NOT  R$
a = create_mysim_balloon_spiky_advice('cc23ec72')
a.trigger  = "mysim.wealth > 1 and game.is_building_group(mysim.destination_subject,building_groups.COM_FOOD) and game.is_building_group(mysim.destination_subject,building_groups.CS1)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.DININGRED
a.balloon_sound_f = mysim_VOX.DisgustF
a.balloon_sound_m = mysim_VOX.DisgustM
   
--Approaching tacostand and Sim is R$$ or R$$
a = create_mysim_balloon_spiky_advice('6c1abfaf')
--a.trigger  = "mysim.wealth > 1 and game.is_building_group(mysim.destination_subject, building_groups.TACOSTAND)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.DININGRED
a.balloon_sound_f = mysim_VOX.DisgustF
a.balloon_sound_m = mysim_VOX.DisgustM

--Approaching famil ydiner and Sim is R$$
a = create_mysim_balloon_spiky_advice('2c1abf74')
--a.trigger  = "mysim.wealth == 1 and game.is_building_group(mysim.destination_subject, building_groups.FAMILYDINER)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.DININGGREEN
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM

--Approaching familydiner and Sim is R$ or R$$$
a = create_mysim_balloon_spiky_advice('cc1abf7c')
--a.trigger  = "(mysim.wealth== 1 or mysim.wealth== 3)and game.is_building_group(mysim.destination_subject, building_groups.FAMILYDINER)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.DININGRED
a.balloon_sound_f = mysim_VOX.DisgustF
a.balloon_sound_m = mysim_VOX.DisgustM


--Approaching chez fancy and Sim is R$$$
a = create_mysim_balloon_spiky_advice('0c1abf82')
--a.trigger  = "mysim.wealth == 3 and game.is_building_group(mysim.destination_subject, building_groups.CHEZFANCY)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.DININGGREEN
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM

--Approaching chez fancy and Sim is R$ or R$$
a = create_mysim_balloon_spiky_advice('cc1abf8a')
--a.trigger  = "(mysim.wealth < 3 or mysim.wealth== 3)and game.is_building_group(mysim.destination_subject, building_groups.CHEZFANCY)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.DININGRED
a.balloon_sound_f = mysim_VOX.DisgustF
a.balloon_sound_m = mysim_VOX.DisgustM

--Approaching chez fancy and Sim is R$$$
a = create_mysim_balloon_spiky_advice('cc1abf91')
--a.trigger  = "mysim.wealth == 3 and game.is_building_group(mysim.destination_subject, building_groups.CHEZFANCY)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.DININGGREEN
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM

--Approaching chez fancy and Sim is R$ or R$$
a = create_mysim_balloon_spiky_advice('ec1abf95')
--a.trigger  = "(mysim.wealth < 3 or mysim.wealth== 3)and game.is_building_group(mysim.destination_subject, building_groups.CHEZFANCY)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.DININGRED
a.balloon_sound_f = mysim_VOX.DisgustF
a.balloon_sound_m = mysim_VOX.DisgustM



--XXXXXXXXXXXXXXXXXXXXXX
--ON FOOT

--pollution  LOW, on foot
a = create_mysim_balloon_thought_advice('eb8ef289')
a.trigger = "mysim.trip_in_transit > 0 and mysim.trip_on_foot > 0 and mysim.trip_pollution_air < tuning_constants.POLLUTION_LOW"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = tuning_constants.BALLOON_CHANCE_PERCENT
a.balloon_icon4 = mysim_balloons.SUNSHINEGREEN
a.balloon_sound = mysim_VOX.SatisfiedF
 
--pollution  HIGH, on foot
a = create_mysim_balloon_spiky_advice('eb9d4835')
a.trigger ="mysim.trip_in_transit > 0 and mysim.trip_on_foot > 0 and mysim.trip_pollution_air > tuning_constants.POLLUTION_HIGH"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = tuning_constants.BALLOON_CHANCE_PERCENT
a.balloon_icon2 = mysim_balloons.POLLUTIONRED
a.balloon_sound = mysim_VOX.PollutionF
--a.balloon_icon3 = mysim_balloons.NEGATIVEICON

--Crime low, on foot
a = create_mysim_balloon_thought_advice('abba7fcc')
a.trigger  = "mysim.trip_in_transit > 0 and mysim.trip_on_foot > 0 and mysim.trip_crime < tuning_constants.CRIME_LOW"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
--a.balloon_icon4 = mysim_balloons.CRIMEGREEN
a.balloon_sound_chance = tuning_constants.BALLOON_CHANCE_PERCENT
a.balloon_icon4 =mysim_balloons.JUSTICEGREEN
a.balloon_sound_f  = mysim_VOX.SatisfiedF
a.balloon_sound_m  = mysim_VOX.SatisfiedM

--crime high, on foot
a = create_mysim_balloon_spiky_advice('cbba7fd3')
a.trigger  = "mysim.trip_in_transit > 0 and mysim.trip_on_foot > 0 and mysim.trip_crime > tuning_constants.CRIME_HIGH"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.CRIMERED
a.balloon_sound_chance = tuning_constants.BALLOON_CHANCE_PERCENT
a.balloon_sound_f =  mysim_VOX.FearF
a.balloon_sound_m =  mysim_VOX.FearM

--HQ high, on foot
a = create_mysim_balloon_thought_advice('6bc3597d')
a.trigger  = "mysim.trip_in_transit > 0 and mysim.trip_on_foot > 0 and mysim.trip_hq > tuning_constants.MYSIM_HQ_MEDIUM"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.HEALTHGREEN
a.balloon_sound_chance = tuning_constants.BALLOON_CHANCE_PERCENT
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM

--Health bad, on foot
a = create_mysim_balloon_spiky_advice('2bc35984')
a.trigger  = "mysim.trip_in_transit > 0 and mysim.trip_on_foot > 0 and mysim.trip_hq < tuning_constants.MYSIM_HQ_LOW"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.HEALTHRED
a.balloon_sound_chance = tuning_constants.BALLOON_CHANCE_PERCENT
a.balloon_sound_f = mysim_VOX.ConcernF
a.balloon_sound_m = mysim_VOX.ConcernM
 
--EQ good, on foot
a = create_mysim_balloon_thought_advice('ebc3598e')
a.trigger  = "mysim.trip_in_transit > 0 and mysim.trip_on_foot > 0 and mysim.trip_eq > tuning_constants.MYSIM_HQ_MEDIUM"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.EDUCATIONGREEN
a.balloon_sound_chance = tuning_constants.BALLOON_CHANCE_PERCENT
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM

--Education bad, on foot
a = create_mysim_balloon_spiky_advice('2bc35999')
a.trigger  = "mysim.trip_in_transit > 0 and mysim.trip_on_foot > 0 and mysim.trip_eq < tuning_constants.MYSIM_EQ_LOW"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.EDUCATIONRED
a.balloon_sound_chance = tuning_constants.BALLOON_CHANCE_PERCENT
a.balloon_sound_f = mysim_VOX.ConcernF
a.balloon_sound_m = mysim_VOX.ConcernM

--XXXXXXXXXXXXXXXXXXXXXX
--In CAR

-- in transit CAR and low congestion
a = create_mysim_balloon_thought_advice('cb8ef308')
a.trigger  = "mysim.trip_in_transit > 0 and mysim.trip_in_car > 0 and mysim.trip_traffic_congestion < tuning_constants.TRAFFIC_CONGESTION_LOW"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.CARGREEN
a.balloon_sound_chance = tuning_constants.BALLOON_CHANCE_PERCENT
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM

--in transit CAR and HIGH low congestion
a = create_mysim_balloon_spiky_advice('ab8ef30d')
a.trigger  = "mysim.trip_in_transit > 0 and mysim.trip_in_car > 0 and mysim.trip_traffic_congestion > tuning_constants.TRAFFIC_CONGESTION_HIGH"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.CARRED
a.balloon_sound_chance = tuning_constants.BALLOON_CHANCE_PERCENT
a.balloon_sound_f = mysim_VOX.ComplaintF
a.balloon_sound_m = mysim_VOX.ComplaintM

--pollution  LOW, in car
a = create_mysim_balloon_thought_advice('0bc35080')
a.trigger = "mysim.trip_in_transit > 0 and mysim.trip_in_car > 0 and mysim.trip_pollution_air < tuning_constants.POLLUTION_LOW"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.SUNSHINEGREEN
a.balloon_sound_chance = tuning_constants.BALLOON_CHANCE_PERCENT
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM
 
--pollution  HIGH, in car
a = create_mysim_balloon_spiky_advice('8bc3508b')
a.trigger ="mysim.trip_in_transit > 0 and mysim.trip_in_car > 0 and mysim.trip_pollution_air > tuning_constants.POLLUTION_HIGH"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.POLLUTIONRED
a.balloon_sound_chance = 60
a.balloon_sound_f = mysim_VOX.PollutionF
a.balloon_sound_m = mysim_VOX.PollutionM

--Crime low, in car
a = create_mysim_balloon_thought_advice('0bc35092')
a.trigger  = "mysim.trip_in_transit > 0 and mysim.trip_in_car > 0 and mysim.trip_crime < tuning_constants.CRIME_LOW"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 =mysim_balloons.JUSTICEGREEN
a.balloon_sound_chance = tuning_constants.BALLOON_CHANCE_PERCENT
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM

--crime > high, in car
a = create_mysim_balloon_spiky_advice('2bc35098')
a.trigger  = "mysim.trip_in_transit > 0 and mysim.trip_in_car > 0 and mysim.trip_crime > tuning_constants.CRIME_HIGH"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.CRIMERED
a.balloon_sound_chance = 45
a.balloon_sound_f =  mysim_VOX.FearF
a.balloon_sound_m =  mysim_VOX.FearM


--XXXXXXXXXXXXXXXXXXXXXX
--On Bus

--low congestion, on bus
a = create_mysim_balloon_thought_advice('4bc145d3')
a.trigger  = "mysim.trip_in_transit > 0 and mysim.trip_on_bus > 0 and mysim.trip_traffic_congestion < tuning_constants.TRAFFIC_CONGESTION_LOW"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.BUSGREEN
a.balloon_sound_chance = tuning_constants.BALLOON_CHANCE_PERCENT
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM

-- HIGH congestion, on bus
a = create_mysim_balloon_spiky_advice('2bc14b1d')
a.trigger  = "mysim.trip_in_transit > 0 and mysim.trip_on_bus > 0 and mysim.trip_traffic_congestion > tuning_constants.TRAFFIC_CONGESTION_HIGH"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.BUSRED
a.balloon_sound_chance = tuning_constants.BALLOON_CHANCE_PERCENT
a.balloon_sound_f = mysim_VOX.ComplaintF
a.balloon_sound_m = mysim_VOX.ComplaintM


-- On train or any type of rail, and trip is taking more than twice as long as it should. is that how this works??
-- Will balloons show through the ground if my sim is on subway?
a = create_mysim_balloon_spiky_advice('4c291332')
a.trigger  = "mysim.trip_in_transit > 0 and (mysim.trip_on_subway > 0 or mysim.trip_on_train > 0 or mysim.trip_on_elevated_train > 0 or mysim.trip_on_monorail > 0) and mysim.trip_time_ratio < .5"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.TRAINRED --no subway icon
a.balloon_sound_chance = tuning_constants.BALLOON_CHANCE_PERCENT
a.balloon_sound_f = mysim_VOX.ComplaintF
a.balloon_sound_m = mysim_VOX.ComplaintM

--Happy train commuter
a = create_mysim_balloon_thought_advice('4c2cd761')
a.trigger  = "mysim.trip_in_transit > 0 and (mysim.trip_on_subway > 0 or mysim.trip_on_train > 0 or mysim.trip_on_elevated_train > 0 or mysim.trip_on_monorail > 0) and mysim.trip_time_ratio >= 1"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.TRAINGREEN
a.balloon_sound_chance = tuning_constants.BALLOON_CHANCE_PERCENT
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM


--XXXXXXXXXXXXXXXXXXXXXX
--Idiling

--HQ good, idle
a = create_mysim_balloon_thought_advice('4bbe7b12')
a.trigger  = "mysim.trip_idle > 0 and mysim.trip_hq > tuning_constants.MYSIM_HQ_LOW_WEALTH_RICH"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.HEALTHGREEN
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM

--HQ bad, idle
a = create_mysim_balloon_spiky_advice('2bbe7b49')
a.trigger  = "mysim.trip_idle > 0 and mysim.trip_hq < tuning_constants.MYSIM_HQ_LOW_WEALTH_MIDDLE"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.HEALTHRED
a.balloon_sound_f = mysim_VOX.ConcernF
a.balloon_sound_m = mysim_VOX.ConcernM

--EQ good, idle
a = create_mysim_balloon_thought_advice('cbbe7cb1')
a.trigger  = "mysim.trip_idle > 0 and mysim.trip_eq > tuning_constants.MYSIM_EQ_LOW+20"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.EDUCATIONGREEN
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM

--EQ bad, idle
a = create_mysim_balloon_spiky_advice('8bbe7cbc')
a.trigger  = "mysim.trip_idle > 0 and mysim.trip_eq < tuning_constants.MYSIM_EQ_LOW"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.EDUCATIONRED
a.balloon_sound_f = mysim_VOX.ConcernF
a.balloon_sound_m = mysim_VOX.ConcernM

--Crime low, idle
a = create_mysim_balloon_thought_advice('ebbe7d49')
a.trigger  = "mysim.trip_idle > 0 and mysim.trip_crime  < tuning_constants.CRIME_LOW"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.JUSTICEGREEN
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM

--Crime bad, idle
a = create_mysim_balloon_spiky_advice('6bbe7d4e')
a.trigger  = "mysim.trip_idle > 0 and mysim.trip_crime  > tuning_constants.CRIME_MEDIUM"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.CRIMERED
a.balloon_sound_f = mysim_VOX.FearF
a.balloon_sound_m = mysim_VOX.FearM

--Pollution low, idle
a = create_mysim_balloon_thought_advice('6bbe7eb6')
a.trigger  = "mysim.trip_idle > 0 and mysim.trip_pollution_air  < tuning_constants.GA_POLLUTION_LOW"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.SUNSHINEGREEN
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM

--Pollution bad, idle
a = create_mysim_balloon_spiky_advice('2bbe7ebd')
a.trigger  = "mysim.trip_idle > 0 and mysim.trip_pollution_air  > tuning_constants.POLLUTION_MEDIUM"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.POLLUTIONRED
a.balloon_sound_f = mysim_VOX.PollutionF
a.balloon_sound_m = mysim_VOX.PollutionM


--At HOME
--XXXXXXXXXXXXXXXXXXX
--CONVERSATION ICONS, just random...

a = create_mysim_balloon_thought_advice('8bc3b75d')
a.trigger  = "mysim.state == 2 and game.random_chance(3)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.DININGGREEN
a.balloon_sound_chance = 30
a.balloon_sound_f = mysim_VOX.Home_dayF
a.balloon_sound_m = mysim_VOX.Home_dayM

a = create_mysim_balloon_thought_advice('cc2cf9fd')
a.trigger  = "mysim.state == 2 and game.random_chance(3)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.HOTELGREEN
a.balloon_sound_chance = 30
a.balloon_sound_f = mysim_VOX.Home_dayF
a.balloon_sound_m = mysim_VOX.Home_dayM


--food2
a = create_mysim_balloon_speech_advice('0c2cfbf0')
a.trigger = "mysim.state == 2 and game.random_chance(3)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 30
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM
a.balloon_icon2 = mysim_balloons.food2

--food3 COFFEE
a = create_mysim_balloon_speech_advice('0c2cfbf4')
a.trigger = "mysim.state == 2 and game.random_chance(3)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 30
a.balloon_sound_f = mysim_VOX.DisgustF
a.balloon_sound_m = mysim_VOX.DisgustM
a.balloon_icon2 = mysim_balloons.food3

--romance1
a = create_mysim_balloon_speech_advice('ec2cfe55')
a.trigger  = "mysim.state == 2 and game.random_chance(3)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 30
a.balloon_sound_f = mysim_VOX.GreetF
a.balloon_sound_m = mysim_VOX.GreetM
a.balloon_icon2 = mysim_balloons.romance1

--romance2
a = create_mysim_balloon_speech_advice('4c2cfe58')
a.trigger = "mysim.state == 2 and game.random_chance(3)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 30
a.balloon_sound_f = mysim_VOX.DisgustF
a.balloon_sound_m = mysim_VOX.DisgustM
a.balloon_icon2 = mysim_balloons.romance2

--romance3
a = create_mysim_balloon_speech_advice('ec2cfe5c')
a.trigger = "mysim.state == 2 and game.random_chance(3)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 30
a.balloon_sound_f = mysim_VOX.JealousyF
a.balloon_sound_m = mysim_VOX.JealousyM
a.balloon_icon2 = mysim_balloons.romance3


--Local Conditions AT HOME
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
--low Air pollution at home
a = create_mysim_balloon_thought_advice('ec364f6f')
a.trigger = "mysim.state == 2 and mysim.local_air_pollution < tuning_constants.POLLUTION_LOW and game.random_chance(25)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 10
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM
a.balloon_icon2 = mysim_balloons.SUNSHINEGREEN

--high Air pollution at home
a = create_mysim_balloon_spiky_advice('4c36509b')
a.trigger = "mysim.state == 2 and mysim.local_air_pollution > tuning_constants.POLLUTION_HIGH and game.random_chance(25)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 30
a.balloon_sound_f = mysim_VOX.DisgustF
a.balloon_sound_m = mysim_VOX.DisgustM
a.balloon_icon2 = mysim_balloons.POLLUTIONRED


--high Water pollution at home
a = create_mysim_balloon_spiky_advice('6c3651de')
a.trigger = "mysim.state == 2 and mysim.local_water_pollution > tuning_constants.POLLUTION_HIGH and game.random_chance(25)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 30
a.balloon_sound_f = mysim_VOX.PollutionF
a.balloon_sound_m = mysim_VOX.PollutionM
a.balloon_icon2 = mysim_balloons.POLLUTIONRED


--high traffic congestion at home (traffic noise!)
a = create_mysim_balloon_spiky_advice('0c36510a')
a.trigger = "mysim.state == 2 and mysim.local_traffic_congestion > tuning_constants.TRAFFIC_CONGESTION_HIGH and game.random_chance(25) or mysim.home_has_road == 0"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 10
a.balloon_sound_f =  mysim_VOX.ComplaintF
a.balloon_sound_m =  mysim_VOX.ComplaintM
a.balloon_icon2 = mysim_balloons.CARRED

--bad  health at home
a = create_mysim_balloon_spiky_advice('ac3651b7')
a.trigger = "mysim.state == 2 and mysim.local_air_pollution > tuning_constants.POLLUTION_HIGH and game.random_chance(25)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 30
a.balloon_sound_f = mysim_VOX.PollutionF
a.balloon_sound_m = mysim_VOX.PollutionM
a.balloon_icon2 = mysim_balloons.HEALTHRED

--bad  garbage at home 
a = create_mysim_balloon_spiky_advice('8c3652b9')
a.trigger = "mysim.state == 2 and mysim.local_garbage > tuning_constants.POLLUTION_GARBAGE_MEDIUM and game.random_chance(30)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 30
a.balloon_sound_f = mysim_VOX.ShockF
a.balloon_sound_m = mysim_VOX.ShockM
a.balloon_icon2 = mysim_balloons.RATRED

--low crime at home
a = create_mysim_balloon_thought_advice('8c36536d')
a.trigger = "mysim.state == 2 and mysim.local_crime < tuning_constants.CRIME_LOW and game.random_chance(25)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 10
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM
a.balloon_icon2 = mysim_balloons.JUSTICEGREEN

--high crime  at home
a = create_mysim_balloon_spiky_advice('ec365363')
a.trigger = "mysim.state == 2 and mysim.local_crime > tuning_constants.CRIME_MEDIUM and game.random_chance(30)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 20
a.balloon_sound_f = mysim_VOX.FearF
a.balloon_sound_m = mysim_VOX.FearM
a.balloon_icon2 = mysim_balloons.CRIMERED

--Landmark nearby
a = create_mysim_balloon_thought_advice('cc36542e')
a.trigger = "mysim.state == 2 and game.mysim_distance_to_closest_building(building_groups.LANDMARK) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(30)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 20
a.balloon_sound_f = mysim_VOX.InterestF
a.balloon_sound_m = mysim_VOX.InterestM
a.balloon_icon2 = mysim_balloons.LANDMARKGREEN

--Landmark NOT nearby
a = create_mysim_balloon_spiky_advice('8c365614')
a.trigger = "mysim.state == 2 and game.mysim_distance_to_closest_building(building_groups.LANDMARK) > tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(5)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 20
a.balloon_sound_f = mysim_VOX.ComplaintF
a.balloon_sound_m = mysim_VOX.ComplaintM
a.balloon_icon2 = mysim_balloons.LANDMARKRED

--bus stop nearby, happy about it
a = create_mysim_balloon_thought_advice('6c365643')
a.trigger = "mysim.state == 2 and mysim.wealth < 3 and game.mysim_distance_to_closest_building(building_groups.BUS) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(30)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 20
a.balloon_sound_f = mysim_VOX.InterestF
a.balloon_sound_m = mysim_VOX.InterestM
a.balloon_icon2 = mysim_balloons.BUSGREEN

--bus stop nearby, NOT happy about it
a = create_mysim_balloon_spiky_advice('ac365694')
a.trigger = "mysim.state == 2 and mysim.wealth > 2 and game.mysim_distance_to_closest_building(building_groups.BUS) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(30)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 20
a.balloon_sound_f = mysim_VOX.ComplaintF
a.balloon_sound_m = mysim_VOX.ComplaintM
a.balloon_icon2 = mysim_balloons.BUSRED

--NUKE plant nearby, NOT happy about it
a = create_mysim_balloon_spiky_advice('cc36572c')
a.trigger = "mysim.state == 2 and game.mysim_distance_to_closest_building(building_groups.NUCLEAR) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(30)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 20
a.balloon_sound_f = mysim_VOX.ShockF
a.balloon_sound_m = mysim_VOX.ShockM
a.balloon_icon2 = mysim_balloons.GLOWRATRED

--XXXXXXXXXXXXXXX AT WORK XXXXXXXXXXXXX-----------------------
--Chatting about radioactive rats
a = create_mysim_balloon_spiky_advice('ac2cff13')
a.trigger  = "mysim.state == 3 and game.random_chance(10) "
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 30
a.balloon_sound_f = mysim_VOX.FearF
a.balloon_sound_m = mysim_VOX.FearM
a.balloon_icon2 = mysim_balloons.GLOWRATRED

--Chatting about a nice sail boat
a = create_mysim_balloon_thought_advice('4c2cff63')
a.trigger  = "mysim.state == 3 and game.mysim_distance_to_closest_landmark_or_reward(special_buildings.Marina) < tuning_constants.MYSIM_HOME_RADIUS and game.random_chance(5)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 30
a.balloon_sound_f = mysim_VOX.InterestF
a.balloon_sound_m = mysim_VOX.InterestM
a.balloon_icon2 = mysim_balloons.BOATGREEN

--coffee. High % chance they think about coffee at work
a = create_mysim_balloon_speech_advice('2c2cffc5')
a.trigger = "mysim.state == 3 and game.random_chance(30)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_chance = 20
a.balloon_sound_f = mysim_VOX.ComplaintF
a.balloon_sound_m = mysim_VOX.ComplaintM
a.balloon_icon2 = mysim_balloons.food3

--RANDOM WORK CONVERSATION
--at work -exercise1
a = create_mysim_balloon_speech_advice('0c3a3c8e')
a.trigger = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM
a.balloon_icon2 = mysim_balloons.exercise1

--at work -exercise2
a = create_mysim_balloon_speech_advice('2c3a3c9d')
a.trigger = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.InterestF
a.balloon_sound_m = mysim_VOX.InterestM
a.balloon_icon2 = mysim_balloons.exercise2

--at work -exercise3
a = create_mysim_balloon_speech_advice('ac3a400d')
a.trigger = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.ConcernF
a.balloon_sound_m = mysim_VOX.ConcernM
a.balloon_icon2 = mysim_balloons.exercise3

--at work -food1
a = create_mysim_balloon_speech_advice('0c3a3cac')
a.trigger  = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.GreetF
a.balloon_sound_m = mysim_VOX.GreetM
a.balloon_icon2 = mysim_balloons.food1

--at work -food2
a = create_mysim_balloon_speech_advice('cc3a3cb2')
a.trigger = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM
a.balloon_icon2 = mysim_balloons.food2

--at work -food3
a = create_mysim_balloon_speech_advice('2c3a3cb7')
a.trigger = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.DisgustF
a.balloon_sound_m = mysim_VOX.DisgustM
a.balloon_icon2 = mysim_balloons.food3


--at work -movies1
a = create_mysim_balloon_speech_advice('ac3a3cc0')
a.trigger  = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.ComplaintF
a.balloon_sound_m = mysim_VOX.ComplaintM
a.balloon_icon2 = mysim_balloons.movies1

--at work -movies2
a = create_mysim_balloon_speech_advice('6c3a3cc4')
a.trigger = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.InterestF
a.balloon_sound_m = mysim_VOX.InterestM
a.balloon_icon2 = mysim_balloons.movies2

--at work -movies3
a = create_mysim_balloon_speech_advice('6c3a3cc8')
a.trigger = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.ShockF
a.balloon_sound_m = mysim_VOX.ShockM
a.balloon_icon2 = mysim_balloons.movies3


--at work -party1
a = create_mysim_balloon_speech_advice('ac3a3ccd')
a.trigger  = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.CelebrateF
a.balloon_sound_m = mysim_VOX.CelebrateM
a.balloon_icon2 = mysim_balloons.party1

--at work -party2
a = create_mysim_balloon_speech_advice('ec3a3cd5')
a.trigger = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.InterestF
a.balloon_sound_m = mysim_VOX.InterestM
a.balloon_icon2 = mysim_balloons.party2

--at work -party3
a = create_mysim_balloon_speech_advice('4c3a3cda')
a.trigger = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.JealousyF
a.balloon_sound_m = mysim_VOX.JealousyM
a.balloon_icon2 = mysim_balloons.party3

--at work -romance1
a = create_mysim_balloon_speech_advice('4c3a3cde')
a.trigger  = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.GreetF
a.balloon_sound_m = mysim_VOX.GreetM
a.balloon_icon2 = mysim_balloons.romance1

--at work -romance2
a = create_mysim_balloon_speech_advice('2c3a3ce3')
a.trigger = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.DisgustF
a.balloon_sound_m = mysim_VOX.DisgustM
a.balloon_icon2 = mysim_balloons.romance2

--at work -romance3
a = create_mysim_balloon_speech_advice('ac3a3cec')
a.trigger = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.JealousyF
a.balloon_sound_m = mysim_VOX.JealousyM
a.balloon_icon2 = mysim_balloons.romance3

--at work -style1
a = create_mysim_balloon_speech_advice('4c3a3cf0')
a.trigger  = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.InterestF
a.balloon_sound_m = mysim_VOX.InterestM
a.balloon_icon2 = mysim_balloons.style1

--at work -style2
a = create_mysim_balloon_speech_advice('6c3a3cf4')
a.trigger = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.DisgustF
a.balloon_sound_m = mysim_VOX.DisgustM
a.balloon_icon2 = mysim_balloons.style2

--at work -style3
a = create_mysim_balloon_speech_advice('6c3a3cf8')
a.trigger = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.JealousyF
a.balloon_sound_m = mysim_VOX.JealousyM
a.balloon_icon2 = mysim_balloons.style3


--at work -tech1
a = create_mysim_balloon_speech_advice('8c3a3d00')
a.trigger  = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.InterestF
a.balloon_sound_m = mysim_VOX.InterestM
a.balloon_icon2 = mysim_balloons.tech1

--at work -tech2
a = create_mysim_balloon_speech_advice('6c3a3d08')
a.trigger = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.CelebrateF
a.balloon_sound_m = mysim_VOX.CelebrateM
a.balloon_icon2 = mysim_balloons.tech2

--at work -tech3
a = create_mysim_balloon_speech_advice('ac3a3d0c')
a.trigger = "game.random_chance(5) and mysim.state == 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.DeathF
a.balloon_sound_m = mysim_VOX.DeathM
a.balloon_icon2 = mysim_balloons.tech3


--   Funny Trips ---------------------------------------------

--Visit to Lovely Landfill
a = create_mysim_balloon_thought_advice('2c2a7e31')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.LANDFILL)and game.g_available_landfill_capacity > 25"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.RATGREEN

--Visit to Crowded Landfill
a = create_mysim_balloon_spiky_advice('0c2a7e2a')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.LANDFILL)and game.g_available_landfill_capacity < 25"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.DisgustF
a.balloon_sound_m = mysim_VOX.DisgustM
a.balloon_icon2 = mysim_balloons.RATRED


--Approaching landmark
a = create_mysim_balloon_thought_advice('6c23ea4f')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.LANDMARK)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon4 = mysim_balloons.LANDMARKGREEN
 a.balloon_sound_f = mysim_VOX.InterestF
a.balloon_sound_m = mysim_VOX.InterestM
a.event = game_events.MYSIM_APPROACHING_LOCATION

--Visit to Recycle Plant and there is uncollected garbage in the city
a = create_mysim_balloon_spiky_advice('cc2ccf57')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.RECYCLE)and game.g_uncollected_garbage >0"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.DisgustF
a.balloon_sound_m = mysim_VOX.DisgustM
a.balloon_icon2 = mysim_balloons.RATRED

--Visit to Recycle Plant and there is NO uncollected garbage in the city
a = create_mysim_balloon_thought_advice('ac2ccf5f')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.RECYCLE)and game.g_uncollected_garbage <= 0"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.RATGREEN

--Visit to Nuke plant
a = create_mysim_balloon_spiky_advice('2c2a8f3e')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.NUCLEAR)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.FearF
a.balloon_sound_m = mysim_VOX.FearM
a.balloon_icon2 = mysim_balloons.RADRED

--Visit to toxic waste dump!
a = create_mysim_balloon_spiky_advice('cc2a9553')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.TOXIC_DUMP)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.DisgustF
a.balloon_sound_m = mysim_VOX.DisgustM
a.balloon_icon2 = mysim_balloons.GLOWRATRED

--Visit to car-related commercial service
a = create_mysim_balloon_thought_advice('cc2a963b')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.COM_CAR)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.SERVICEGREEN

--Visit to randomly "bad" car-related commercial service
a = create_mysim_balloon_spiky_advice('0c2cc92f')
a.trigger  = "game.random_chance(30)and game.is_building_group(mysim.destination_subject, building_groups.COM_CAR)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.ComplaintF
a.balloon_sound_m = mysim_VOX.ComplaintM
a.balloon_icon2 = mysim_balloons.SERVICERED

--Visit to a "good" food-related commercial service
a = create_mysim_balloon_thought_advice('0c2a964b')
a.trigger  = "game.random_chance(60)and game.is_building_group(mysim.destination_subject, building_groups.COM_FOOD)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.SatisfiedF
a.balloon_sound_m = mysim_VOX.SatisfiedM
a.balloon_icon2 = mysim_balloons.DININGGREEN

--Visit to a "bad" food-related commercial service
a = create_mysim_balloon_spiky_advice('4c2be29a')
a.trigger  = "game.random_chance(30)and game.is_building_group(mysim.destination_subject, building_groups.COM_FOOD)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.DisgustF
a.balloon_sound_m = mysim_VOX.DisgustM
a.balloon_icon2 = mysim_balloons.DININGRED

--Visit to shopping-related commercial service
a = create_mysim_balloon_thought_advice('2c2bcb6c')
a.trigger  = "game.random_chance(60)and game.is_building_group(mysim.destination_subject, building_groups.COM_SHOP)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.SHOPPINGGREEN

--Visit to "bad" shopping-related commercial service
a = create_mysim_balloon_spiky_advice('6c2cce7a')
a.trigger  = "game.random_chance(30)and game.is_building_group(mysim.destination_subject, building_groups.COM_SHOP)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_sound_f = mysim_VOX.JealousyF
a.balloon_sound_m = mysim_VOX.JealousyM
a.balloon_icon2 = mysim_balloons.SHOPPINGRED

-- Off to see a good movie
a = create_mysim_balloon_thought_advice('4c2bcbb3')
a.trigger  = "game.random_chance(60)and game.is_building_group(mysim.destination_subject, building_groups.COM_MOVIE)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.MOVIEGREEN

-- Off to see a bad movie
a = create_mysim_balloon_spiky_advice('ec2be256')
a.trigger  = "game.random_chance(30)and game.is_building_group(mysim.destination_subject, building_groups.COM_MOVIE)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.MOVIERED

-- Going to a hotel
a = create_mysim_balloon_thought_advice('6c2be13f')
a.trigger  = "game.random_chance(60)and game.is_building_group(mysim.destination_subject, building_groups.COM_HOTEL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.HOTELGREEN

-- Going to a "bad" hotel
a = create_mysim_balloon_spiky_advice('ec2cc99b')
a.trigger  = "game.random_chance(30)and game.is_building_group(mysim.destination_subject, building_groups.COM_HOTEL)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.HOTELRED

-- Going to a park and the air is fresh 
a = create_mysim_balloon_thought_advice('ec2be391')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.PARK)and mysim.trip_pollution_air  < tuning_constants.GA_POLLUTION_MEDIUM"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.PARKGREEN

-- Going to a park and the air is not fresh 
a = create_mysim_balloon_spiky_advice('8c2be5a3')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.PARK)and mysim.trip_pollution_air  > tuning_constants.GA_POLLUTION_MEDIUM"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.PARKRED

-- Going to jail and there are more arrests than the prisons can hold
a = create_mysim_balloon_spiky_advice('ec2be5a9')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.JAIL)and game.g_arrest_count > game.g_jail_capacity"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.JAILRED

-- Going to jail and there are enough prisions
a = create_mysim_balloon_thought_advice('4c2be5cb')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.JAIL)and game.g_arrest_count <= game.g_jail_capacity"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.JAILGREEN

-- Going to  airport
a = create_mysim_balloon_thought_advice('8c2be651')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.AIRPORT)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.AIRPLANEGREEN

-- Going to  any type of port/ferry and water pollution is low
a = create_mysim_balloon_thought_advice('ac2be6ee')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.SEAPORT) or game.is_building_group(mysim.destination_subject, building_groups.Marina) or game.is_building_group(mysim.destination_subject, building_groups.CarFerry) or game.is_building_group(mysim.destination_subject, building_groups.PassengerFerry) and game.ga_water_pollution < tuning_constants.GA_POLLUTION_MEDIUM"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.BOATGREEN

-- Going to  any type of port/ferry and water pollution is not low
a = create_mysim_balloon_spiky_advice('2c2be747')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.SEAPORT) or game.is_building_group(mysim.destination_subject, building_groups.Marina) or game.is_building_group(mysim.destination_subject, building_groups.CarFerry) or game.is_building_group(mysim.destination_subject, building_groups.PassengerFerry) and game.ga_water_pollution > tuning_constants.GA_POLLUTION_MEDIUM"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.BOATRED

-- Going to  a farm and air pollution is high
a = create_mysim_balloon_spiky_advice('0c2be7d8')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.FARMLAND) and game.ga_air_pollution >= tuning_constants.GA_POLLUTION_MEDIUM"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.TRACTORRED

-- Going to  a farm and air pollution is low
a = create_mysim_balloon_thought_advice('ac2be843')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.FARMLAND) and game.ga_air_pollution < tuning_constants.GA_POLLUTION_MEDIUM"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.TRACTORGREEN

-- Going to a reward building and happy about it
a = create_mysim_balloon_thought_advice('cc2be860')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.REWARD) and game.random_chance(30)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.REWARDGREEN

-- Going to  a reward building and not happy about it
a = create_mysim_balloon_spiky_advice('ec2be891')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.REWARD) and game.random_chance(30)"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.REWARDRED


-- Going to a health building, and global health grade IS up to snuff
a = create_mysim_balloon_thought_advice('2c2ce194')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.HEALTH) and game.ga_health_grade > 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.HEALTHGREEN

-- Going to a health building, and global health grade not up to snuff
a = create_mysim_balloon_spiky_advice('cc2ce271')
a.trigger  = "game.is_building_group(mysim.destination_subject, building_groups.HEALTH) and game.ga_health_grade <= 3"
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.balloon_icon2 = mysim_balloons.HEALTHRED