-----------------------------------------------------------------------------------------
-- This file defines advices for the the FINANCES
dofile("_adv_sys.lua") 
dofile("_adv_advice.lua") 
dofile("adv_game_data.lua") 

-- helper funcition
function create_advice_finances_with_base(guid_string, base_advice)
   local a =  advices : create_advice(tonumber(guid_string, 16), base_advice)
   a.type   = advice_types . FINANCES
   return a 
end

-- helper funcition
function create_advice_finances(guid_string)
   local a =  create_advice_finances_with_base(guid_string, nil)
   return a
end

-- function to create a 'reward' advice
function create_reward_finances(guid_string)
   local a =  create_advice_finances(guid_string, nil)
   a.class_id = hex2dec("aa371c32") -- cSC4RewardAdvice class ID
   a.once = 0
   return a
end
--
--

----------------------------------------------------------------------
-- Advice fields 

--type      = advice_types . FINANCES,
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

------------ Advice record TEST FORMAT ----
a = create_advice_finances('6a8c615c')
a.trigger = "0"
a.title   = [[schools:#game.g_num_educational_buildings#  school funding:#game.g_education_funding_p#]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.GREAT_JOB
--a.event = game_events.NEW_CITY
a.timeout = 30
a.frequency = 30


------------ Advice record ----
a = create_advice_finances('2a625b47')
-- Introduction: Meet the keeper of the coffer
a.trigger  = "game.g_funds < tuning_constants.STARTING_FUNDS - 5000"
--game.g_funds < tuning_constants.STARTING_FUNDS - 3000 or game.g_population > 50"
a.once = 1
a.title   = [[text@4a60f690	SC4_AdvFin_Intro_101	Meet the keeper of the coffer']]
a.message   = [[text@ca60f695	SC4_AdvFin_Intro_101']]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB
--a.event = game_events.NEW_CITY
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG

----------------BUDGET TREND NOTICES----------------------

------------ Advice record ----
a = create_advice_finances('aa84b35d')
-- New Mayor On Optimistic Spending Spree
a.trigger  = "game.g_funds < tuning_constants.STARTING_FUNDS - 20000"
a.once = 1
a.title   = [[text@6a84b286	 (PH)New Mayor On Optimistic Spending Spree]]
a.message   = [[text@aa84b28c  ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
--a.event = game_events.NEW_CITY
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM

------------ Advice record ----
a = create_advice_finances('2a626007')
--City Funds Falling Fast
a.trigger  = "game.g_funds < tuning_constants.BUDGET_FUNDS_LOW and game.g_funds > tuning_constants.BUDGET_FUNDS_VERY_LOW and game.trend_value(game_trends.G_FUNDS,3) * 1000 > 1.5 * game.g_funds and game.g_income_monthly < game.g_expense_monthly + 400 and game.g_year > 2001"
--and game.g_population > 100"
a.title   = [[text@ea9039ce (PH) City Budget Takes Big Hit ]]
a.message   = [[text@4a9039e5 (PH) My goodness, Mayor!  I just checked my books and got a real shock -- you've been spending like a senator on a junket!   We've got enough financial obligations just keeping our Sims provided for, so this better be a short-term thing or else #city# will be facing some serious budget problems before too long. ]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_MED_HIGH
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.ALARM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM

------------ Advice record ----
a = create_advice_finances('ca74bb71')
--#city#'s Coffers Kaput
a.trigger  = "game.g_funds < 0 and game.g_income_monthly < game.g_expense_monthly"
--and game.g_population > 100"
a.title   = [[text@aa60f708	SC4_AdvFin_Status_112	City is out of money]]
a.message   = [[text@2a60f70b	SC4_AdvFin_Status_112]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.frequency = tuning_constants.ADVICE_FREQUENCY_MED_HIGH
a.mood = advice_moods.ALARM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM




------------ Advice record ----
a = create_advice_finances('8a9f0d3b')
--Budget Outlook Grim
a.trigger  = "game.g_funds+(6*(game.g_income_monthly - game.g_expense_monthly))<=0"
a.title   = [[text@0a9f07da	Budget Outlook Grim]]
a.message   = [[text@0a9f07de	Take a look at ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.frequency = 30
--a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.mood = advice_moods.ALARM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM

-------ANNUAL STATUS REPORTS-------------
------------ Advice record ----
a = create_advice_finances('8a62630a')
--D  Simoleon Levels In City Vault Plummet
a.trigger  = "(game.g_funds > tuning_constants.BUDGET_FUNDS_VERY_LOW and game.g_funds < tuning_constants.BUDGET_FUNDS_HIGH) and game.trend_value(game_trends.G_FUNDS,12) * 1000 > 1.4 * game.g_funds and game.g_year > 2000 and game.g_month < 3"
--"game.trend_value(game_trends.G_FUNDS,3) > -0.6 * game.g_funds and game.trend_slope(game_trends.G_FUNDS,3) < -0.3 * game.g_funds"
--and game.trend_value(game_trends.G_FUNDS,6) > -0.30 * game.g_funds"
a.title   = [[text@4a60f73f	SC4_AdvFin_Status_120	City budget hemorraging']]
----a.frequency = 365
a.message   = [[text@6a60f743	SC4_AdvFin_Status_120' (PH)Mayor #mayor#, we can't spend what we don't have. In the past year you <a href="#link_id#game.window_graph(graph_window_types.FUNDS)">spent much</a> more than the city brought in through taxes and fees, and I worry that this next year will be the same. I'm sorry, but I don't have any little magic gnomes over here making an endless supply of simoleons. The vault does have a bottom, and we'll get there fast if you don't reverse this trend.   <a href="#link_id#game.window_budget(budget_window_types.MAIN_SMALL)">Cut spending</a> or <a href="#link_id#game.window_budget(budget_window_types.TAXES)">raise taxes</a>, or else I'm taking the rest of the week off to get my nerves together.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM

------------ Advice record ----
a = create_advice_finances('6a8e04d6')
--D1 City Posts Moderate Deficit for Past Year
a.trigger  = "(game.g_funds > tuning_constants.BUDGET_FUNDS_LOW and game.g_funds < tuning_constants.BUDGET_FUNDS_HIGH) and game.trend_value(game_trends.G_FUNDS,12) * 1000 <= 1.4 * game.g_funds and game.trend_value(game_trends.G_FUNDS,12) * 1000 >= 1.1 * game.g_funds and game.g_year > 2000 and game.g_month < 3"
a.title   = [[text@2a903a43 (PH) Mayor Spanked for Spending]]
a.message   = [[text@ca903a55 (PH)Now, now, Mayor!  My books show that we've spent quite a bit more in the past year than we've taken in, and you know was well as I do that this can eventually lead to budget trouble.  #city# will survive, for now, but in the future I advise you to keep the public checkbook locked away in a safe place -- where you'll forget about it.  ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM

------------ Advice record ----
a = create_advice_finances('2a62614a')
--E  City In Poor House
a.trigger  = "game.g_funds < tuning_constants.BUDGET_FUNDS_VERY_LOW and game.trend_value(game_trends.G_FUNDS,12) * 1000 <= game.g_funds + 500 and game.trend_value(game_trends.G_FUNDS,12) * 1000 < tuning_constants.BUDGET_FUNDS_VERY_LOW and game.g_year > 2000 and game.g_month < 3 and game.g_borrowed < 2000000"
-- This trigger is tricky.  First, funds are obviously in deficit ( < 0) and dropping.  Then, the amount of drop must be LESS THAN the total deficit, requiring that the previous years funds must have been < 0 too.
a.title   = [[text@4a60f70e	SC4_AdvFin_Status_113	Red, red, red….the city hasn't a simoleon.']]
a.message   = [[text@6a60f711	SC4_AdvFin_Status_113']]
--a.frequency = 365
a.frequency = tuning_constants.ADVICE_FREQUENCY_MED_HIGH
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.ALARM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM

------------ Advice record ----
a = create_advice_finances('0a626180')
--F   Population Down, Taxes Aren't Adding Up
a.trigger  = "game.trend_value(game_trends.G_R_POPULATION,12) * 1000 + game.trend_value(game_trends.G_CO_POPULATION,12) * 1000 + game.trend_value(game_trends.G_I_POPULATION,12) * 1000 < game.g_city_rci_population and game.g_funds - game.trend_value(game_trends.G_FUNDS,12) * 1000 < -2000 and game.g_year > 2002 and game.g_month < 3"  
--trigger: "TaxIncome_trend_12mos < -3,000 AND TaxIncome_trend_24mos > -1000 AND city_RCI_pop_trend_12mos < -1000 AND CurrentBalance > so-so AND year > 10 AND date = Jan 15"
a.title   = [[text@ca60f714	SC4_AdvFin_Status_114	Tax income starts to drop - falling population blamed]]
a.message   = [[text@8a60f717	SC4_AdvFin_Status_114]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM

------------ Advice record ----
a = create_advice_finances('8a62608d')
--G  #city# Rolling In Riches
a.trigger  = "game.g_funds > tuning_constants.BUDGET_FUNDS_HIGH and game.trend_value(game_trends.G_FUNDS,12) * 1000 < 1.1 * game.g_funds and game.g_year > 2001 and game.g_month < 3"
a.title   = [[text@0a60f701	SC4_AdvFin_Status_111	24 Carat water pipes? Personal security guards for every citizen?]]
a.message   = [[text@4a60f704	SC4_AdvFin_Status_111]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM

------------ Advice record ----
a = create_advice_finances('ea6261cf')
--H   City Funds Post Plentiful Profit	
a.trigger  = "game.g_funds > tuning_constants.BUDGET_FUNDS_LOW and game.g_funds < tuning_constants.BUDGET_FUNDS_HIGH and game.trend_value(game_trends.G_FUNDS,12) * 1000 < .8 * game.g_funds and game.g_year > 2000 and game.g_month < 3"
--trigger: "(current_balance) > 1.30 * game.trend_value(balance, 12mos) AND date = Jan 15"
a.title   = [[text@2a60f72b	SC4_AdvFin_Status_117	City showing a handsome profit']]
a.message   = [[text@2a60f72e	SC4_AdvFin_Status_117']]
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM

------------ Advice record ----
a = create_advice_finances('4a62629c')
--J   Finance Advisor Happy With Budget Surplus
a.trigger  = "game.g_funds > tuning_constants.BUDGET_FUNDS_VERY_LOW and (game.trend_value(game_trends.G_FUNDS,12) * 1000 >= .8 * game.g_funds and game.trend_value(game_trends.G_FUNDS,12) * 1000 <= .93 * game.g_funds) and game.g_year > 2000 and game.g_month < 3"
--game.trend_value(game_trends.G_FUNDS,12) > .1 * game.g_funds and  game.trend_value(game_trends.G_FUNDS,12) <= .2 * game.g_funds and game.g_funds > 1.2 * tuning_constants.BUDGET_FUNDS_WORRISOME and game.g_month==1"
a.title   = [[text@8a60f731	SC4_AdvFin_Status_118	City doing well, generating surplus funds']]
a.message   = [[text@aa60f735	SC4_AdvFin_Status_118']]
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM

------------ Advice record ----
a = create_advice_finances('6a6262d7')
--K   Mayor Recognized For Balancing Act
a.trigger  = "(game.g_funds > tuning_constants.BUDGET_FUNDS_LOW and game.g_funds < tuning_constants.BUDGET_FUNDS_HIGH) and (game.trend_value(game_trends.G_FUNDS,12) * 1000) < 1.1 * game.g_funds and (game.trend_value(game_trends.G_FUNDS,12) * 1000) > .93 * game.g_funds and game.g_month < 3 and game.g_year > 2000"
a.title   = [[text@6a60f738	SC4_AdvFin_Status_119	City budget maintains healthy balance']]
a.message   = [[text@0a60f73c	SC4_AdvFin_Status_119']]
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM

------------ Advice record ----
a = create_advice_finances('aa85d11b')
--L  Finance Advisor Fighting Bout of Budget Nerves
a.trigger  = "game.g_funds > tuning_constants.BUDGET_FUNDS_VERY_LOW and game.g_funds < tuning_constants.BUDGET_FUNDS_LOW and game.trend_value(game_trends.G_FUNDS,12) * 1000 < 1.2 * game.g_funds and game.trend_value(game_trends.G_FUNDS,12) * 1000 > .8 * game.g_funds and game.g_year > 2000 and game.g_month < 3"
--game.trend_value(game_trends.G_FUNDS,12) < 0.1 * game.g_funds and game.trend_value(game_trends.G_FUNDS,12) > -0.03 * game.g_funds and game.g_funds < 1.2 * tuning_constants.BUDGET_FUNDS_WORRISOME and game.g_funds > tuning_constants.BUDGET_FUNDS_LOW and game.g_month==1 and game.g_population > 100"
a.title   = [[text@4a872a54 (PH) Finance Advisor Fighting Bout of Budget Nerves  ]]
a.message   = [[text@ea872a58 (PH)Mayor, #city#'s <a href="#link_id#game.window_budget(budget_window_types.budget_window_types.MAIN_SMALL)">financial situation</a> could be better.  I mean, funds are low but we still have some money in the bank, and you haven't been on any big spending spree lately.  If you continue to take it easy, then I think we'll turn the corner and start posting some nice surpluses.   Stay the course, and we'll turn this pinched purse around.  ]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM

------------ Advice record ----
a = create_advice_finances('aa85d1b3')
--M  City Budget on the Brink
a.trigger  = "game.g_funds > tuning_constants.BUDGET_FUNDS_VERY_LOW and game.g_funds < tuning_constants.BUDGET_FUNDS_LOW and game.trend_value(game_trends.G_FUNDS,12) * 1000 >= 1.2 * game.g_funds and game.g_year > 2000 and game.g_month < 3 and game.g_income_monthly < game.g_expense_monthly"
--game.trend_value(game_trends.G_FUNDS,12) < 0.1 * game.g_funds and game.trend_value(game_trends.G_FUNDS,12) > -0.03 * game.g_funds and game.g_funds < tuning_constants.BUDGET_FUNDS_LOW and game.g_funds > tuning_constants.BUDGET_FUNDS_VERY_LOW and game.g_month==1 and game.g_population > 100"
a.title   = [[text@4a872a5c  (PH) City Budget on the Brink  ]]
a.message   = [[text@4a872a5f (PH) I've hardly been sleeping nights, Mayor, tossing and turning with nightmares of red ink everywhere!  The latest annual <a href="#link_id#game.window_budget(budget_window_types.budget_window_types.MAIN_SMALL)">budget report</a> is in, and we're just barely keeping our funds afloat.  I don't know what the next year holds except more gray hairs for me.  Try to resist starting any new major public works projects, and consider <a href="#link_id#game.window_budget(budget_window_types.budget_window_types.MAIN_LARGE)">cutting expenses</a> or <a href="#link_id#game.window_budget(budget_window_types.budget_window_types.TAXES)">raising taxes</a> to fend off the creditors. ]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM

------------ Advice record ----
a = create_advice_finances('0a8b4a16')
--N   Budget Bleeding Stemmed - For Now
a.trigger  = "game.g_funds < tuning_constants.BUDGET_FUNDS_VERY_LOW and game.trend_value(game_trends.G_FUNDS,12) * 1000 > game.g_funds - 1000 and game.trend_value(game_trends.G_FUNDS,12) * 1000 < game.g_funds + 500 and game.g_month < 3"
a.title   = [[text@8a8b4929 (PH)Budget Bleeding Stemmed - For Now ]]
a.message   = [[text@aa8b492e (PH) Our <a href="#link_id#game.window_budget(budget_window_types.MAIN_SMALL)">budget</a> is still in the red, Mayor, but the worst may have passed.  The past year wasn't as bad as before, and I think we've turned the corner - a good thing, since my shredder burned out last week.  We're not out of the woods yet, so please try to keep a lid on spending. ]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM

------------ Advice record ----
a = create_advice_finances('8a8b4aca')
--O  Budget Bounce Brings Big Relief
a.trigger  = "game.g_funds < tuning_constants.BUDGET_FUNDS_VERY_LOW and game.trend_value(game_trends.G_FUNDS,12) * 1000 <= game.g_funds - 1000 and game.g_month < 3"
a.title   = [[text@2a8b4932 (PH)Budget Bounce Brings Big Relief ]]
a.message   = [[text@ca8b4935 (PH)I think we did it, Mayor!  We actually posted a surplus for the past year, and our days of debt may finally be coming to an end.  Your leadership and spending acumen has pulled #city# out of a deep dark hole, and I see blue skies ahead.   ]]
--a.frequency = 365
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM

------------ Advice record ----
a = create_advice_finances('0a8c5e1d')
--P    City's Deep Pockets Fund Big Improvements
a.trigger  = "game.g_funds > tuning_constants.BUDGET_FUNDS_HIGH and game.trend_value(game_trends.G_FUNDS,12) * 1000 >= 1.1 * game.g_funds and game.g_month < 3 and game.g_year > 2001"
a.title   = [[text@4a8b4e4e (PH) City's Deep Pockets Fund Big Improvements  ]]
a.message   = [[text@2a8b4e53 (PH) With a <a href="#link_id#game.window_budget(budget_window_types.MAIN_SMALL)">bank balance</a> as big as #city#'s, I'm sure our Sims appreciate the extra spending you've been up to lately.  After all, what is money for except to spend?  But I hope you have a clear plan, Mayor, because we can't keep spending like this every year.  But for now, happy shopping!  ]]
--a.frequency = 365
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM



------------------DEPARTMENT OVERSPENDING NOTICES--------------

------------ Advice record ----
a = create_advice_finances('aa625c8b')
--Donut budget reaches all time high at local precincts
a.trigger  = "game.g_police_funding_p > 105 and game.g_police_station_count > 0 and game.g_funds < tuning_constants.BUDGET_FUNDS_WORRISOME and game.trend_value(game_trends.G_FUNDS,12) * 1000 > 1.2 * game.g_funds and game.g_population > 500"
a.title   = [[text@aa60f699	SC4_AdvFin_Expense_102	Donut budget reaches all time high at local precincts]]
a.message   = [[text@ea60f6c8	SC4_AdvFin_Expense_102]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG

------------ Advice record ----
a = create_advice_finances('ea4bc116')
--adv_Finance_fire funding
a.trigger  = "game.g_fire_funding_p > 105 and game.g_fire_station_count > 0 and game.g_funds < tuning_constants.BUDGET_FUNDS_WORRISOME and game.trend_value(game_trends.G_FUNDS,12) * 1000 > 1.2 * game.g_funds and game.g_population > 500"
a.title   = [[text@2a60f6cc	SC4_AdvFin_Expense_103	Simoleons up in smoke…]]
a.message   = [[text@4a60f6d0	SC4_AdvFin_Expense_103]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG


------------ Advice record ----
a = create_advice_finances('ca85b3dd')
-- Parks budget high
a.trigger  = "game.g_parks_funding_p > 103 and game.g_num_parks + game.g_num_recreation > 6 and game.g_funds < tuning_constants.BUDGET_FUNDS_WORRISOME and game.trend_value(game_trends.G_FUNDS,12) * 1000 > 1.2 * game.g_funds and game.g_population > 500"
a.title   = [[text@0a60f6d5	SC4_AdvFin_Expense_104	Can a city be too beautiful?]]
a.message   = [[text@8a60f6d8	SC4_AdvFin_Expense_104]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG

------------ Advice record ----
a = create_advice_finances('0a625d5b')
--Transportation spending high
a.trigger  = "(game.g_road_funding_p > 105 or game.g_masstransit_funding_p > 105) and game.g_funds < tuning_constants.BUDGET_FUNDS_WORRISOME and game.trend_value(game_trends.G_FUNDS,12) * 1000 > 1.2 * game.g_funds and game.g_population > 500"
a.title   = [[text@ea60f6db	SC4_AdvFin_Expense_105	What's next, gold plated roads?]]
a.message   = [[text@ca60f6dd	SC4_AdvFin_Expense_105]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG

------------ Advice record ----
a = create_advice_finances('ca625e84')
--School spending high
a.trigger  = "game.g_education_funding_p > 105 and game.g_funds < tuning_constants.BUDGET_FUNDS_WORRISOME and game.trend_value(game_trends.G_FUNDS,12) * 1000 > 1.2 * game.g_funds and game.g_population > 500"
a.title   = [[text@ea60f6e0	SC4_AdvFin_Expense_106	Desks by Simcedes for every child?]]
a.message   = [[text@0a60f6e3	SC4_AdvFin_Expense_106]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG

------------ Advice record ----
a = create_advice_finances('6aad946a')
--School spending high EARLY GAME
a.trigger  = "game.g_education_funding_p > 50 and game.g_population < 2 * tuning_constants.POPULATION_STEP_3 and game.g_population > tuning_constants.POPULATION_STEP_1 and game.g_num_educational_buildings > 0 and game.g_month > 6"
a.title   = [[text@4aa95b4b	Hordes Of City Teachers Clamor Over Mere Handful Of Students]]
a.message   = [[text@6aa95b4f ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG

------------ Advice record ----
a = create_advice_finances('2a625ed5')
--Health spending high
a.trigger  = "game.g_health_funding_p > 105 and game.g_funds < tuning_constants.BUDGET_FUNDS_WORRISOME and game.trend_value(game_trends.G_FUNDS,12) * 1000 > 1.2 * game.g_funds and game.g_population > 500"
a.title   = [[text@2a60f6e7	SC4_AdvFin_Expense_107	Platinum gurneys a bit too much?]]
a.message   = [[text@4a60f6e9	SC4_AdvFin_Expense_107]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG


------------ Advice record ----
a = create_advice_finances('6aad9563')
--Health spending high EARLY GAME
a.trigger  = "game.g_health_funding_p > 50 and game.g_population < 2 * tuning_constants.POPULATION_STEP_3 and game.g_population > tuning_constants.POPULATION_STEP_1 and game.g_num_clinics + game.g_num_hospitals > 0 and game.g_month > 8"
a.title   = [[text@8aa95b52	Flocks Of Docs Vie To Treat Limited Patients]]
a.message   = [[text@caa95b56 ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG

------------ Advice record ----
a = create_advice_finances('0a625f7c')
--Utility spending high
a.trigger  = "(game.g_water_funding_p > 105 or game.g_power_funding_p > 105 or game.g_pollution_funding_p > 105) and game.g_funds < tuning_constants.BUDGET_FUNDS_WORRISOME and game.trend_value(game_trends.G_FUNDS,12) * 1000 > 1.2 * game.g_funds and game.g_population > 500"
a.title   = [[text@aa60f6ed	SC4_AdvFin_Expense_108	Simoleons down the drain, in the dump and used for fuel to warm our houses]]
a.message   = [[text@8a60f6ef	SC4_AdvFin_Expense_108]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG

------------ Advice record ----
a = create_advice_finances('ea625fca')
---------- DISABLED -- DON'T HAVE ORDINANCE SPENDING EXPOSED---------------
--Ordinance spending high
a.trigger  = "0"
--trigger: Ordinances budget > x simoleons monthly and funds < x
a.title   = [['text@aa60f6f2	SC4_AdvFin_Expense_109	Laws, laws and more laws…how many do we need']]
a.message   = [['text@aa60f6f8	SC4_AdvFin_Expense_109']]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG


------------ Advice record ----REMOVED
--a = create_advice_finances('8a626357')
--big budget trouble ahead!
--a.trigger  = "0"
--trigger: "(current_balance) < .70 * game.trend_value(balance, 12mos) AND year > 10 AND date = Jan 15" 
--a.title   = [['text@6a60f746	SC4_AdvFin_Status_121	big budget trouble ahead!']]
--a.message   = [['text@2a60f749	SC4_AdvFin_Status_121']]
--a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
--a.mood = advice_moods.ALARM
--a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG


-------------------------BUSINESS DEALS-------------------------------------------------------

------------ Reward record Casino----
a = create_reward_finances('033A0000')
-- New Casino Could Improve Odds for Balancing Budget
--not game.ordinance_is_on(ordinance_ids.ORDINANCE_GAMBLING) or game.g_funds > tuning_constants.BUDGET_FUNDS_WORRISOME or game.trend_value(game_trends.G_FUNDS,48) * 1000 < 2.0 * game.g_funds or game.g_income_monthly > game.g_expense_monthly or game.g_population < tuning_constants.POPULATION_STEP_6  or game.reward_instance_count('033A0000')== 1
function a.condition()
	if (not missions_completed( { 'ac1715fa'} ) and (not game.ordinance_is_on(ordinance_ids.ORDINANCE_GAMBLING) or game.g_population < 1.6 * tuning_constants.POPULATION_STEP_6  or game.reward_instance_count('033A0000')== 1)) then
		return reward_state.HIDDEN
	else
		return reward_state.AVAILABLE
	end
end
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
--a.frequency = 365
a.title   = [[text@aa60f770 ]]
a.message   = [[text@8a60f773 ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.NEUTRAL
a.persist =1

------------ Reward record Prison----
a = create_reward_finances('03380000')
--Prison Offer Escape From Budget Pinch
--game.g_funds > tuning_constants.BUDGET_FUNDS_LOW or game.trend_value(game_trends.G_FUNDS,24) * 1000 < 2 * game.g_funds or game.g_population < tuning_constants.POPULATION_STEP_5 or game.reward_instance_count('03380000')== 1
function a.condition()
	if (not missions_completed( { '0c0088ad'} ) and ( game.g_funds > tuning_constants.BUDGET_FUNDS_LOW or game.trend_value(game_trends.G_FUNDS,24) * 1000 < 2 * game.g_funds or game.g_income_monthly > game.g_expense_monthly or game.g_population < tuning_constants.POPULATION_STEP_5 or game.reward_instance_count('03380000')== 1)) then
		return reward_state.HIDDEN
	else
		return reward_state.AVAILABLE
	end
end
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
--a.frequency = 365
a.title   = [[text@ea60f769]]
a.message   = [[text@4a60f76d ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.BAD_JOB
a.persist = 1

----------- Reward record Missle Range----
a = create_reward_finances('03420000')
--Missiles Could Blast Budget Problems Out Of Town
--game.g_funds > tuning_constants.BUDGET_FUNDS_VERY_LOW or game.trend_value(game_trends.G_FUNDS,6) * 1000 < 1.2 * game.g_funds or game.g_population < tuning_constants.POPULATION_STEP_2 or game.reward_instance_count('03420000')== 1)
function a.condition()
	if (not missions_completed( { 'ec151d87'} ) and ( game.g_funds > tuning_constants.BUDGET_FUNDS_VERY_LOW or game.trend_value(game_trends.G_FUNDS,6) * 1000 < 1.2 * game.g_funds or game.g_population < tuning_constants.POPULATION_STEP_2 or game.g_income_monthly > game.g_expense_monthly or game.reward_instance_count('03420000')== 1) ) then
		return reward_state.HIDDEN
	else
		return reward_state.AVAILABLE
	end
end
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
--a.frequency = 365
a.title   = [[text@ea60f754]]
a.message  = [[text@ea60f757]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.BAD_JOB
a.persist = 1
a.once = 1

----------- Reward record Toxic Waste Dump----
a = create_reward_finances('03410000')
--Budget Woes Find Relief In Toxic Waste? 
--game.g_funds > -1000 or game.reward_instance_count('03410000') == 1
function a.condition()
	if (not missions_completed( { '2c008466'} ) and ( game.g_funds > -1000 or game.g_income_monthly > game.g_expense_monthly or game.reward_instance_count('03410000') == 1)) then
		return  reward_state.HIDDEN
	else
		return reward_state.AVAILABLE
	end
end
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
--a.frequency = 365
a.title   = [[text@6a60f74c]]
a.message   = [[text@0a60f750]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.BAD_JOB
a.persist = 1
a.once = 1

----------- Reward record Army Base----
--game.g_funds > tuning_constants.BUDGET_FUNDS_LOW or game.trend_value(game_trends.G_FUNDS,36) * 1000  < 2.5 * game.g_funds  or game.g_population < tuning_constants.POPULATION_STEP_4  or game.reward_instance_count('03460000')== 1
a = create_reward_finances('03460000')
--Military Base Could Defeat Budget Deficits 
function a.condition()
	if (not missions_completed( { '4c143283'} ) and (game.g_funds > tuning_constants.BUDGET_FUNDS_LOW or game.trend_value(game_trends.G_FUNDS,36) * 1000  < 2.5 * game.g_funds or game.g_income_monthly > game.g_expense_monthly or game.g_population < tuning_constants.POPULATION_STEP_4  or game.reward_instance_count('03460000')== 1)) then
		return reward_state.HIDDEN
	else
		return reward_state.AVAILABLE
	end
end
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
--a.frequency = 365
a.title   = [[text@aa60f75a]]
a.message   = [[text@2a60f765]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.BAD_JOB
a.persist = 1
a.once = 1


--NEW MESSAGES FOR CORE

------------ Advice record ----
--Finance Bemoans Massive New Highway to Nowhere
a = create_advice_finances('2c0c4419')
a.trigger  = "game.g_highway_tile_count + game.g_groundhighway_tile_count > 20 and game.g_city_rci_population < 5000 and game.g_region_rci_population < 10000 and game.g_income_monthly - game.g_expense_monthly < 1500 and game.g_funds < 45000"
--highway getting little use - population too low
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ac04457e	Finance Bemoans Massive New Highway to Nowhere]]
a.message   = [[text@ac044584	Mayor, I hate to be a party pooper but someone has to tell it like it is. That highway you've constructed is bound to be no more than just a pretty slab of concrete - and an expensive one at that. #city# just doesn't have the population or the traffic demands to justify your otherwise visionary project. Meanwhile, we're committing a lot of money every month to keep it maintained. I recommend either <a href="#link_id#game.window_budget(budget_window_types.TRANSPORT1)">slashing the roads budget</a> now or <a href="#link_id#game.tool_button(button_tool_types.DEMOLISH)">bulldozing</a> the highway completely - or else we could be in real fiscal trouble.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB


--------------------------------------------------------------------
-- This will try to execute triggers for all registerd advices 
-- to make sure they don't have any syntactic errors.

if (_sys.config_run == 0)
then
   advices : run_triggers()
end
