-----------------------------------------------------------------------------------------
-- This file defines advices for the the ENVIRONMENT
dofile("_adv_sys.lua") 
dofile("_adv_advice.lua") 
dofile("adv_game_data.lua") 

-- helper funcition
function create_advice_fluff_with_base(guid_string, base_advice)
   local a =  advices : create_advice(tonumber(guid_string, 16), base_advice)
   a.type   = advice_types . FLUFF_NEWS
   a.news_only = 1
   return a
end

-- helper funcition
function create_advice_fluff(guid_string)
   local a =  create_advice_fluff_with_base(guid_string, nil)
   return a
end
--
--

----------------------------------------------------------------------
-- Advice fields 

--type      = advice_types . ENVIRONMENT,
--mood      = advice_moods . NEUTRAL,
--priority  = 100,
--title        = "UNDEFINED title : from base advice structure",
--message = "UNDEFINED message : from base advice structure",
--frequency   = 35, -- in days
--timeout   = 45, -- in days
--trigger   = "1",
--once   = 1, -- trigger the advice only once
-- event = 0, -- this has to be a valid event ID (see const file for the event table.)

------------ Advice record ----
--Fluffy The Wonder Cat Says, "Use 'Control-?' To Turn Off Help Text!"  ALREADY IN THERE?
a = create_advice_fluff('6aa95d42')
a.trigger = "game.g_month > 5 and game.g_year < 2001"
a.title   = [[text@aa9f2ec3 ]]
a.news_only = 1
a.persist = 1
a.once=1
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.FLUFF
a.timeout = 200

------------ Advice record ----
a = create_advice_fluff('6a898e98')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@4a7619cf ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.timeout = 90
--a.effect = { effects.Play_Ball }

------------ Advice record ----
a = create_advice_fluff('6a898f7f')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@0a7619d4 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('4a898f83')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@2a7619d8 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30
----
------------ Advice record ----
a = create_advice_fluff('8a898fe1')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@8a7619dc ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a898fe7')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@0a7619df ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a898fea')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@0a7619e2 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ca898ff1')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@8a7619e5 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a89abce')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@ca7619e9 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a89abca')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@ea7619ec ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea89abc4')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@0a7619ef ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea89ac36')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@8a7619f2 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a89ac33')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@8a7619f5 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a89ac2e')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@6a7619f8 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ca89ac29')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@4a7619fc ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a89ac25')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@8a7619ff ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30
-----

------------ Advice record ----
a = create_advice_fluff('4a89ac22')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@8a761a03 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a89ac1a')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@6a761a06 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a89ac17')

a.trigger = "game.random_chance(60) and game.reward_instance_count('03360000')== 1"
a.title   = [[text@ea761a09 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = 45
a.effects = effects.BALLOON_LAUNCH

------------ Advice record ----
a = create_advice_fluff('aa89ac14')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@4a761a0d ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a89ac11')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@ea761a11 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a89ac0b')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@8a761a14 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a89ac07')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@6a761a17 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('4a89ac04')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@ea761a1b ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a89abfe')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@aa761a1d ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('4a89abfb')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@2a761a20 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a89abf7')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@0a761a23 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30
------
------------ Advice record ----
a = create_advice_fluff('4a89ada3')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@ca761a26 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('4a89ada8')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@4a761a29 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a89adb1')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@8a761a2c ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a89adb6')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@8a761a33 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea89adb9')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@8a761a36 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a89af13')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@ea761a39 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea89af0f')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@0a761a23 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a89af16')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@8a761a40 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ca89af1b')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@0a761a42 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a89adcc')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@ea761a46 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a89adce')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@2a761a48 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a89add3')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@ea761a4c]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a89add5')

a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@6a761a4f]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea89add8')

a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@4a761a51 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a89addd')

a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@2a761a54 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('aa89addf')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@8a761a57 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea89ade2')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@6a761a5a ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ca89ade4')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@0a761a5e ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea89adeb')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@ca761a61]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('aa89adee')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@6a761a64 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a89adf0')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@4a761a67 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a89adf3')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@6a761a6a ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea89adf9')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@aa761a6d ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('4a89adfc')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@2a761a70]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ca89aff0')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@aa761a74 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30
-----

------------ Advice record ----
a = create_advice_fluff('aa89afec')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@ca761a77 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a89afe9')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@2a761a7b ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('4a89afe6')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@6a761a81 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a89afde')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@6a761a83 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a89afda')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@4a761a86 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('4a89afd7')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@8a761a89 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea89afd4')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@aa761abb ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a89afd0')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@6a761a8d ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('4a89afcc')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@2a761a90 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a89afc6')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@6a761a93 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a89afc9')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@6a761ab8 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a89afc2')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@4a761a97 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('aa89afbf')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@4a761a9b ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('4a89afbb')

a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@8a761ab6 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record --------
a = create_advice_fluff('aa89afb6')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@8a761a9d ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('aa89afb0')

a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@2a761aa0 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea89afb3')

a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ca761aa2 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a89af90')

a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@4a761ab3 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a89af8c')

a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@aa761aa5 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('aa89af96')

a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@4a761aa7 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a89af86')

a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@aa761aaa ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea89af84')

a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ca761aad ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('aa89af81')

a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@4a761ab0 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30
----------
------------ Advice record ----
a = create_advice_fluff('ca8c9a2e')
a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@8a8c96b8 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('4a8c9a29')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@8a8c96bb ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a8ca8f5')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@0a8c96bd ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a8c9a27')
a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@4a8c96bf ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a8c9a24')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ea8c96c2 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ca8c9a20')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@6a8c96c4 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a8c9a1e')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@2a8c96c8 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('4a8c9a1c')
a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@aa8c96ca ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('4a8c9a19')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@aa8c96cd ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('aa8c9a16')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@8a8c96cf ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea8c9a11')
a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@ea8c96d6 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a8c9a0e')
a.trigger = "game.random_chance(.3) and game.g_population > 100"
a.title   = [[text@6a8c96d9 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a8c9a0b')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ca8c96df ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('aa8c9a09')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@aa8c96e1]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a8c9a07')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@6a8c96e4 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a8c99ff')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@4a8c96e7 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a8ca9bc')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@0a8c96e9 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a8c99fd')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@4a8c96ec ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ca8c99fb')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@4a8c96ee ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a8c99f9')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@2a8c96f0 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('aa8c99f1')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@4a8c96f2 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a8c99ef')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@0a8c96f4 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a8c99ec')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@0a8c96f6 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a8c99e9')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ca8c96f8]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ca8c99e7')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@0a8c96fa ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a8c99e3')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@2a8c96fc ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a8c99e0')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@6a8c96fe ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a8d8d68')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ca8c9700]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea8ca97c')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@8a8c9703 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a8ca974')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ea8c9706 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea8c99d5')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ca8c9709 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a8c99d3')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@aa8c970c ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a8c99d0')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@2a8c9713 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea8c99cd')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ea8c9716 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ca8c99cb')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@8a8c9719 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea8c99c9')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@8a8c971c ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('4a8c99c6')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ea8c971f]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a8c99c1')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@0a8c9721 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea8c99be')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@aa8c9723 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('4a8c99bc')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@6a8c9729 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea8c99ba')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@6a8c972c ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a8c99b7')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@aa8c972e ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a8c99b5')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@6a8c9733 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a8c99b2')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@6a8c9733 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('aa8c99ae')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ca8c9741 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a8c99ab')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@4a8c9746 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('4a8c99a9')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ea8c9749 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a8c99a6')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@4a8c974c ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea8c99a3')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ca8c974f ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('aa8c99a0')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@6a8c9751 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a8c999c')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@8a8c9754]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('4a8c9999')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ca8c9756 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a8c9997')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@0a8c9759 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a8c9994')
a.trigger = "game.random_chance(.3) and game.g_population > 1000 and game.g_num_libraries > 0"
a.title   = [[text@ea8c975c ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a8c993f')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@0a8c975f ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a8c993d')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@8a8c9762 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a8c993b')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@8a8c9764 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ca8c9938')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@aa8c96b3 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a8c9936')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ea8c9767 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a8c9933')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@6a8c976b ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a8c9931')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@2a8c976e ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('4a8c992e')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@8a8c9770 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('aa8c9929')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ea8c9773 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('aa8c9926')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@6a8c9777 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a8c9924')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@8a8c977e ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea8c9921')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@4a8c9779 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a8c991f')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@2a8c9781 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a8c991c')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@6a8c9784 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea8c991a')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ea8c9786 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a8c9918')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@aa8c96b3 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a8c9915')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ca8c9789 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a8c9912')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@2a8c978b ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a8c9910')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@6a8c9791 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a8c990d')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ea8c978e ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('aa8c98ff')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ea8c9794 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a8c98fc')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ca8c9796 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ca8c98fa')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@6a8c9799 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a8c98f7')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ca8c979d ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a8c98f5')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@0a8c97a0 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a8c98f3')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@0a8c97a3 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea8c98f0')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@0a8c97a5 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a8ca99a')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ca8c97a8 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a8c98e9')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@aa8c97aa ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a8c98e5')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ea8c97ad ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a8c98e2')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@4a8c97b0 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a8c98e0')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@4a8c97b2 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ca8c98db')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@4a8c97bb ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ca8c98d8')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ca8c97be ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea8c98d6')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ea8c97c1 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a8c98d3')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@0a8c97c4 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a8c98d0')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@0a8c97c8 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ca8c98cb')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@8a8c97ca ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ca8c98c9')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@0a8c97cd ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('aa8c98c6')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ea8c97d0 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('4a8c98c4')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@aa8c97d2 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea8c98c1')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@ea8c97d5 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea8c98ba')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@0a8c97d8 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a8c98b8')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@0a8c96af ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a8c98b1')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@0a8c97da ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ca8c98ae')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@8a8c97dd ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a8c98ac')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@aa8c97df ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a8c98a8')
a.trigger = "game.random_chance(.3) and game.g_population > 1000"
a.title   = [[text@2a8c97e2 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('0a8c98a6')
a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@aa8c97e5 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a8c98a3')
a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@2a8c97e7 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('2a8c98a1')
a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@8a8c97ea ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ca8c989f')
a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@8a8c97ed ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('aa8c989c')
a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@ea8c96ac ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('8a8c989a')
a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@2a8c97f0 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea8c9895')
a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@4a8c97f2 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('ea8c9892')
a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@0a8c97f5 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30

------------ Advice record ----
a = create_advice_fluff('6a8c9887')
a.trigger = "game.random_chance(.3) and game.g_population > 10000"
a.title   = [[text@6a8c97f9 ]]
a.news_only = 1
a.persist = 1
a.priority  = tuning_constants.ADVICE_PRIORITY_VERY_LOW
a.mood = advice_moods.FLUFF
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = 30



----------------------Reward and Landmark Headlines--------------------------

-------------Reward news Mayors House----
a = create_advice_fluff ('ca777017')
a.trigger  = "game.reward_instance_count('031f0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ea777f4f]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Private School 1----
a = create_advice_fluff ('6a78902e')
a.trigger  = "game.reward_instance_count('03180000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@2a777f67]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Private School 2----
a = create_advice_fluff ('0a78941a')
a.trigger  = "game.reward_instance_count('03790000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@2a777f67]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Private School 3 ----
a = create_advice_fluff ('ca79e6dd')
a.trigger  = "game.reward_instance_count('037a0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@2a777f67]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Main Branch Library----
a = create_advice_fluff ('4a789148')
a.trigger  = "game.reward_instance_count('031b0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ca777f33]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Radio Station----
a = create_advice_fluff ('ca78914e')
a.trigger  = "game.reward_instance_count('03330000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@0a777f6c]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Tourist Trap----
a = create_advice_fluff ('6a789192')
a.trigger  = "game.reward_instance_count('032d0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@aa777f78]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Major Art Museum----
a = create_advice_fluff ('ca7891b4')
a.trigger  = "game.reward_instance_count('033c0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@2a777f3c]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Courthouse----
a = create_advice_fluff ('aa7894aa')
a.trigger  = "game.reward_instance_count('03220000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ca777f29]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news University----
a = create_advice_fluff ('4a789538')
a.trigger  = "game.reward_instance_count('033d0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ca777f83]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Opera House---
a = create_advice_fluff ('0a789576')
a.trigger  = "game.reward_instance_count('032b0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ca777f5e]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news City Hall 1----
a = create_advice_fluff ('ea7895af')
a.trigger  = "game.reward_instance_count('03C00000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ca777f29]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news City Hall 2----
a = create_advice_fluff ('6a7895e8')
a.trigger  = "game.reward_instance_count('03C10000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ca777f29]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news City Hall 3----
a = create_advice_fluff ('8a7895ec')
a.trigger  = "game.reward_instance_count('03C20000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ca777f29]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Bureau of Bureaucracy----
a = create_advice_fluff ('2a789612')
a.trigger  = "game.reward_instance_count('03310000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@2a777f0e]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Minor League Stadium----
a = create_advice_fluff ('0a789647')
a.trigger  = "game.reward_instance_count('03440000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ea777f55]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Major League Stadium----
a = create_advice_fluff ('aa7896b8')
a.trigger  = "game.reward_instance_count('03280000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@8a777f3f]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news House of Worship 1----
a = create_advice_fluff ('0a789793')
a.trigger  = "game.reward_instance_count('031e0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@aa777f30]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news House of Worship 2----
a = create_advice_fluff ('2a7897c3')
a.trigger  = "game.reward_instance_count('03760000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@aa777f30]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news House of Worship 3----
a = create_advice_fluff ('2a7897c9')
a.trigger  = "game.reward_instance_count('03770000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@aa777f30]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news House of Worship 4----
a = create_advice_fluff ('2a78980f')
a.trigger  = "game.reward_instance_count('03780000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@aa777f30]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Cemetery 1----
a = create_advice_fluff ('0a789838')
a.trigger  = "game.reward_instance_count('03470000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@8a777f1d]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Cemetery 2----
a = create_advice_fluff ('aa789860')
a.trigger  = "game.reward_instance_count('037b0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@8a777f1d]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Cemetery 3----
a = create_advice_fluff ('ca789864')
a.trigger  = "game.reward_instance_count('037c0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@8a777f1d]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Farmers Market----
a = create_advice_fluff ('8a789891')
a.trigger  = "game.reward_instance_count('032c0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@8a777f2c]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Medical Research Center----
a = create_advice_fluff ('4a7898cb')
a.trigger  = "game.reward_instance_count('033f0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@aa777f52]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Country Club----
a = create_advice_fluff ('4a789b0a')
a.trigger  = "game.reward_instance_count('03270000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@aa777f26]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news TV Statio----
a = create_advice_fluff ('8a789ba0')
a.trigger  = "game.reward_instance_count('03340000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@6a777f80]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Advance Research Center----
a = create_advice_fluff ('ea789bde')
a.trigger  = "game.reward_instance_count('032f0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@4a777f02]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Stock Exchange----
a = create_advice_fluff ('ca789c02')
a.trigger  = "game.reward_instance_count('03320000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@6a777f75]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Mayor Statue 1----
a = create_advice_fluff ('4a789c37')
a.trigger  = "game.reward_instance_count('03210000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ea777f42]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Mayor Statue 2----
a = create_advice_fluff ('0a789c61')
a.trigger  = "game.reward_instance_count('03730000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ca777f45]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Mayor Statue 3----
a = create_advice_fluff ('4a789c65')
a.trigger  = "game.reward_instance_count('03740000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@6a777f48]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Mayor Statue 4----
a = create_advice_fluff ('8a789c8e')
a.trigger  = "game.reward_instance_count('03750000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@0a777f4c]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Convention Center----
a = create_advice_fluff ('0a789d47')
a.trigger  = "game.reward_instance_count('03430000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@8a777f23]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Movie Studio----
a = create_advice_fluff ('4a789d4b')
a.trigger  = "game.reward_instance_count('03750000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@8a777f5b]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Zoo----
a = create_advice_fluff ('2a789d4e')
a.trigger  = "game.reward_instance_count('03750000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@6a777f86]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news State Fair----
a = create_advice_fluff ('8a789d50')
a.trigger  = "game.reward_instance_count('03750000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@6a777f72]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1


-------------Reward news Resort Hotel----
a = create_advice_fluff ('0a789d54')
a.trigger  = "game.reward_instance_count('03750000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ea777f6f]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

---------------------------------------------------------------------------------------------

-------------Landmark news Great Pyramid----
a = create_advice_fluff ('6a78a6c6')
a.trigger  = "game.reward_instance_count('04cb0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ea777f89]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news Alamo----
a = create_advice_fluff ('ea78a707')
a.trigger  = "game.reward_instance_count('04da0000') == 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@2a777fb2]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news Taj Mahal----
a = create_advice_fluff ('ea78a6d0')
a.trigger  = "game.reward_instance_count('04cc0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@aa777f8e]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news Big Ben----
a = create_advice_fluff ('2a78a6d7')
a.trigger  = "game.reward_instance_count('04cd0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@2a777f91]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark newsStBasils ----
a = create_advice_fluff ('ea78a6dc')
a.trigger  = "game.reward_instance_count('04ce0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@2a777f93]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news BostonFaneuilHall----
a = create_advice_fluff ('2a78a6df')
a.trigger  = "game.reward_instance_count('04cf0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ca777f96]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news JohnHancockCenter----
a = create_advice_fluff ('6a78a6e1')
a.trigger  = "game.reward_instance_count('04d00000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@0a777f98]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news Sphynx----
a = create_advice_fluff ('6a78a6e5')
a.trigger  = "game.reward_instance_count('04d10000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@8a777f9a]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news Hollywoodsign----
a = create_advice_fluff ('2a78a6e8')
a.trigger  = "game.reward_instance_count('04d20000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@aa777f9c]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news ChryslerBuilding----
a = create_advice_fluff ('ca78d976')
a.trigger  = "game.reward_instance_count('04D30000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@aa777f9f]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news EmpireStateBuilding----
a = create_advice_fluff ('4a78a6f3')
a.trigger  = "game.reward_instance_count('04d40000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@4a777fa1]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news Guggenhiem----
a = create_advice_fluff ('ea78a6f5')
a.trigger  = "game.reward_instance_count('04d50000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ca777fa5]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news StatueofLiberty----
a = create_advice_fluff ('ca78a6f8')
a.trigger  = "game.reward_instance_count('04d60000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@0a777fa8]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news IndependenceHall----
a = create_advice_fluff ('4a78a6fc')
a.trigger  = "game.reward_instance_count('04d70000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@4a777faa]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news SmithTower----
a = create_advice_fluff ('0a78a702')
a.trigger  = "game.reward_instance_count('04d80000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@8a777fad]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news GatewayArch----
a = create_advice_fluff ('4a78a704')
a.trigger  = "game.reward_instance_count('04d90000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@6a777faf]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1



-------------Landmark news CNtower----
a = create_advice_fluff ('8a78a70a')
a.trigger  = "game.reward_instance_count('04db0000') > 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ea777fb7]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news CaliforniaPlaza----
a = create_advice_fluff ('4a78a70e')
a.trigger  = "game.reward_instance_count('04dc0000')> 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@aa777fba]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news JeffersonMemoria----
a = create_advice_fluff ('0a78a715')
a.trigger  = "game.reward_instance_count('04dd0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ca777fbc]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news LincolnMemorial----
a = create_advice_fluff ('ca78a717')
a.trigger  = "game.reward_instance_count('04de0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@6a777fbe]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news USCapitol----
a = create_advice_fluff ('aa78a71a')
a.trigger  = "game.reward_instance_count('04df0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@0a777fc1]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news WashingtonMonument----
a = create_advice_fluff ('ea78a71c')
a.trigger  = "game.reward_instance_count('04e00000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@aa777fc4]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news WhiteHouse----
a = create_advice_fluff ('8a78a71f')
a.trigger  = "game.reward_instance_count('04e10000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@ca777fc7]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news Tower of London 04C5 ----
a = create_advice_fluff ('4ace3310')
a.trigger  = "game.reward_instance_count('04C50000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@0ace3483 Tower of London]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1


-------------Landmark news Amalienborg Palace 04BF----
a = create_advice_fluff ('6ad23307')
a.trigger  = "game.reward_instance_count('04bf0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@0ac91adb]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Landmark news Bank of china 04C4----
a = create_advice_fluff ('aad23312')
a.trigger  = "game.reward_instance_count('04c40000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@2ac91adf]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------LATE ADDITIONS----------------------------------

--------POWER PLANT REWARDS------------------------

-------------Reward news Solar Plant----
a = create_advice_fluff ('0aad417d')
a.trigger  = "game.reward_instance_count('1f440000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@4aa6dc72]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Nuke Plant----
a = create_advice_fluff ('eaad426e')
a.trigger  = "game.reward_instance_count('1f3f0000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@8aa6dc77]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Reward news Fusion Plant----
a = create_advice_fluff ('8aad429d')
a.trigger  = "game.reward_instance_count('1f460000')== 1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@0aa6dc7b]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------POPULATION MILESTONES-------------------------

-------------Population Milestone 1----
a = create_advice_fluff ('0aad3a32')
a.trigger  = "0"
--"game.g_population > tuning_constants.POPULATION_STEP_3"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@4aa95b5a]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Population Milestone 2----
a = create_advice_fluff ('8aad3abc')
a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_5"
a.title   = [[text@6aa95b5f]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.FLUFF
a.news_only = 1
a.once = 1

-------------Population Milestone 3----
a = create_advice_fluff ('aaad3c21')
a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_6"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@4aa95b62]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Population Milestone 4----
a = create_advice_fluff ('6aad3c59')
a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_8"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@0aa95b65]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------------Population Milestone 5----
a = create_advice_fluff ('4aad3c7f')
a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_9"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@aaa95b68]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.FLUFF
a.news_only = 1
a.persist = 1
a.once = 1

-------EFFECTS TRIGGERS-------------------------

-------------Missile Range Launch----
a = create_advice_fluff ('eaad3cf4')
a.trigger  = "game.random_chance(20) and game.reward_instance_count('03420000')== 1"
a.title   = [[text@0aa95b6b  missile launch! bldg present?: #game.reward_instance_count('03420000')# ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.FLUFF
a.news_only = 1
a.effects = effects.MISSILE_LAUNCH 
--a.effects = effects.MISSILE_BUNKERS
a.timeout = 45
a.persist = 1

-------------ARC event (ball lightning)----
a = create_advice_fluff ('8aad3d3e')
a.trigger  = "game.random_chance(15) and game.reward_instance_count('032F0000')== 1"
a.title   = [[text@8aa95b6e]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.FLUFF
a.news_only = 1
a.effects = effects.LIGHTNING_BALL
a.timeout = 45
a.persist = 1

-------------Llama spit----
a = create_advice_fluff ('8aad3d7d')
a.trigger  = "game.random_chance(40) and game.reward_instance_count('032D0000')== 1"
a.title   = [[text@0aa96aca]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.FLUFF
a.news_only = 1
a.effects = effects.LLAMA_SPIT
a.timeout = 45
a.persist = 1


-------------New Years fireworks----
a = create_advice_fluff ('aacbd9bb')
a.trigger  = "game.g_month == 1 and game.g_day < 8 and game.reward_instance_count('031F0000')== 1"
a.title   = [[text@aacbf7b8 Happy New Year!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.FLUFF
a.news_only = 1
a.effects = effects.NEW_YEARS_FIREWORKS
a.timeout = 15
a.persist = 1

--------------------------------------------------------------------
-- This will try to execute triggers for all registerd advices 
-- to make sure they don't have any syntactic errors.

if (_sys.config_run == 0)
then
   advices : run_triggers()
end




