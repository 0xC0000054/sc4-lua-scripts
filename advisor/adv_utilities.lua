-----------------------------------------------------------------------------------------
-- This file defines advices for the the UTILITIES
dofile("_adv_sys.lua") 
dofile("_adv_advice.lua") 
dofile("adv_game_data.lua") 
dofile("adv_const.lua") 

-- helper function
function create_advice_utilities_with_base(guid_string, base_advice)
   local a =  advices : create_advice(tonumber(guid_string, 16), base_advice)
   a.type   = advice_types . UTILITIES
   return a
end

function create_advice_utilities(guid_string)
   local a =  create_advice_utilities_with_base(guid_string, nil)
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
--frequency   = 35, -- in days
--timeout   = 45, -- in days
--trigger   = "1",
--once   = 1, -- trigger the advice only once
-- news_only = 0, -- set to 1 for news-flipper messages only 
-- event = 0, -- this has to be a valid event ID (see const file for the event table.)

------------ Advice record ----
---test record for displaying variable values
a = create_advice_utilities('4aad47c8')
a.trigger  = "0" 
a.title   = [[Water  ]]
a.message   = [[Prod:#game.g_water_production_capacity#, import:#game.g_water_imported#, consumed:#game.g_water_consumed# export:#game.g_water_exported#]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB
--a.event = game_events.NEW_CITY
a.timeout = 30
a.frequency = 30

------------------------------------Block of Test Messages for Reference-----------------------------

------------ Test Advice record ----
--Basic Message triggered on an event
a = create_advice_utilities('aa595461')
a.trigger  = "0"
a.once = 1 -- this message only gets displayed once
a.timeout = 60 -- message lasts for 60 days
--Message has two components, the title and the message body.
a.title   = [[TEMPLATE: Basic Message Display]]
a.message   = [[This is a general message which is always triggered upon a new city creation]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB
a.event = game_events.NEW_CITY 

------------ Advice record ----
-- introducing the utility advisor

a = create_advice_utilities('0a5f8597')

a.trigger  = "game.g_month > 2"
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = [[text@ca4f92f9 Meet the Tower of Power]]
a.message   = [[text@ea4f9311Glad to know you, Mayor, but I'm not one to bandy...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB
a.event = game_events.NEW_CITY


------------ Advice record ----
-- Global funding for Garbage is High

a = create_advice_utilities('8a52731f')

a.trigger  = "game.g_pollution_funding_p > tuning_constants.FUNDING_HIGH and (game.g_watered_building_count+game.g_unwatered_building_count > 50)" -- added building count check to keep this message from coming up at city start
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@8a50247a SC4_ADV_utl_Garbage001_Hdl Trash Cash Merrily Multiplying]]
a.message   = [[text@0a502489 SC4_ADV_utl_Garbage001_Mes You'll hear no trashy...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB


------------ Advice record ----
-- Global funding for Garbage is Adequate

a = create_advice_utilities('2a527337')

a.trigger  = "game.g_pollution_funding_p > tuning_constants.FUNDING_MEDIUM and game.g_pollution_funding_p < tuning_constants.FUNDING_HIGH"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@aa50249f SC4_ADV_utl_Garbage002_Hdl Clean-Up Monies Holding Steady]]
a.message   = [[text@6a5024ae SC4_ADV_utl_Garbage002_Mes OK, at this point we're in the clear...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Global funding for Garbage is Low
a = create_advice_utilities('4a527343')

a.trigger  = "game.g_pollution_funding_p < tuning_constants.FUNDING_LOW and (game.g_incinerator_count + game.g_waste_to_energy_building_count + game.g_recycling_center_count + game.g_landfill_capacity > 0)" --added check for garbage infrastructure
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@6a5024c4 SC4_ADV_utl_Garbage003_Hdl No Dough to Stem Trash Flow]]
a.message   = [[text@8a5024ce SC4_ADV_utl_Garbage003_Mes Mayor, dwindling dollars for trash collection...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
-- Excess trash handling trending to the positive
a = create_advice_utilities('8a527393')

a.trigger = "game.trend_slope(game_trends.G_TOTAL_GARBAGE_POLLUTION, tuning_constants.TREND_LONG) < tuning_constants.SLOPE_DOWN and game.g_uncollected_garbage < 100"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@ea5024ea SC4_ADV_utl_Garbage005_Hdl Exemplary Trash-Smashing In #city#]]
a.message   = [[text@4a5024f3 SC4_ADV_utl_Garbage005_Mes Nothing a feela likes better than a smooth...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
-- Advise zoning more landfill to accomodate growing population
a = create_advice_utilities('aa52739f')

a.trigger = "game.trend_slope(game_trends.G_TOTAL_GARBAGE_POLLUTION, tuning_constants.TREND_LONG) > 0 and game.trend_slope(game_trends.G_POPULATION, tuning_constants.TREND_LONG) > 0 and game.g_landfill_capacity > 0 and game.g_available_landfill_capacity/game.g_landfill_capacity < .8 and game.g_population > tuning_constants.POPULATION_STEP_4"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@0a5024fc SC4_ADV_utl_Garbage006_Hdl Garbage Gaining Ground on Nervous Noses]]
a.message   = [[text@8a502505 SC4_ADV_utl_Garbage006_Mes Mayor, even a tidy Sim produces...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Trash capacity low, advise adding a recyling plant, incinerator, etc.
a = create_advice_utilities('aa5273a9')

-- trigger on low available landfill capacity, no existing waste plants, and player has enough funds to afford buying a building
a.trigger = "game.g_landfill_capacity > 0 and (game.g_available_landfill_capacity/game.g_landfill_capacity)*100 < 10 and game.g_population > tuning_constants.POPULATION_STEP_7 and game.g_funds > 65000 and game.g_waste_to_energy_building_count == 0 and game.g_recycling_center_count == 0"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@aa502510 SC4_ADV_utl_Garbage007_Hdl Landfills Teeming, Sims Squeamish, City Squirming]]
a.message   = [[text@ea50251b SC4_ADV_utl_Garbage007_Mes Mayor, all landfills have its limits, and when they are exceeded...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Suggest a recycling Center
a = create_advice_utilities('6a5273db')

--trigger when the garbage pollution is trending up by 20% and no recycling centers exist in the city
a.trigger = "game.trend_delta(game_trends.G_TOTAL_GARBAGE_POLLUTION, tuning_constants.TREND_LONG) > 20 and game.g_recycling_center_count == 0 and game.ga_garbage_pollution > tuning_constants.POLLUTION_GARBAGE_MEDIUM and game.g_uncollected_garbage > 0"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@6a50257a SC4_ADV_utl_Garbage011_Hdl Second-Chance Trash: New Recycling Center Suggested]]
a.message   = [[text@8a502583 SC4_ADV_utl_Garbage011_Mes Mayor, I keep looking around...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Suggest a second recycling center
a = create_advice_utilities('ea5273e5')

--trigger:  long term garbage pollution trend is down and there is no existing recycling center
a.trigger = "game.trend_delta(game_trends.G_TOTAL_GARBAGE_POLLUTION, tuning_constants.TREND_LONG) > 20 and game.g_recycling_center_count == 1 and game.ga_garbage_pollution > tuning_constants.POLLUTION_GARBAGE_MEDIUM and game.g_uncollected_garbage > 0"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@2a510c02 SC4_ADV_utl_Garbage012_Hdl Recycling Center Would Corral Trash, Save Cash]]
a.message   = [[text@2a510c0b SC4_ADV_utl_Garbage012_Mes Mayor, I think a neighbor of mine lost his house this morning...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Suggest a waste to energy incinerator
a = create_advice_utilities('ea5273f1')

--trigger:  landfill capacity is low, there is available enough cash to buy a waste-to-energy plant, and none exist in the city
a.trigger = "game.g_landfill_capacity > 0 and game.g_available_landfill_capacity < 10 and game.g_funds > 5000 and game.g_waste_to_energy_building_count == 0"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@2a50258c SC4_ADV_utl_Garbage013_Hdl War on Waste Bulks Up Batteries]]
a.message   = [[text@0a502596 SC4_ADV_utl_Garbage013_Mes When is waste not waste, Mayor?...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Suggest a second waste to energy incinerator
a = create_advice_utilities('2a52740c')

--trigger:  first incinerator is working overtime, garbage handling capacity < 5 and game funds > 5000
a.trigger = "game.g_waste_to_energy_building_count > 0 and game.g_waste_to_energy_capacity_daily < 5 and game.g_available_landfill_capacity < 5 and game.g_funds > 5000"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@8a510c15 SC4_ADV_utl_Garbage014_Hdl Waste Not, Want Not (As Least As Power is Concerned)]]
a.message   = [[text@2a510c1d SC4_ADV_utl_Garbage014_Mes Think big, Mayor, think energy conversion...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Incinerator suggested, but no budget
a = create_advice_utilities('ca527417')

--trigger:  garbage handling capacity is low and available funds too low to buy a plant.  Some landfill exists in city.
a.trigger = "0"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@2a510c25 SC4_ADV_utl_Garbage015_Hdl Pick Pockets Set off Landfill Rockets]]
a.message   = [[text@4a510c2f SC4_ADV_utl_Garbage015_Mes I think it's embarrassing that our budget can't afford an incinerator...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- New city without trash buildings or a way of handling trash
a = create_advice_utilities('0a527425')
a.trigger = "game.g_uncollected_garbage > 0 and game.g_population > tuning_constants.POPULATION_STEP_5 and (game.g_waste_to_energy_building_count + game.g_recycling_center_count + game.g_landfill_capacity + game.g_garbage_exported == 0)"
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@ea510c37 SC4_ADV_utl_Garbage016_Hdl Let's Talk Turkey by Talking Trash]]
a.message   = [[text@ca510c40 SC4_ADV_utl_Garbage016_Mes Nice to see the city beginning to fill out its boots, mayor...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Increase in garbage expected, advise placing trash handlers
a = create_advice_utilities('2a52743c')

--trigger: garbage production increasing and 5 < capacity < 15 and population trend rising
a.trigger = "0"
--"game.trend_slope(game_trends.G_GARBAGE_PRODUCED, tuning_constants.TREND_LONG) > tuning_constants.SLOPE_UP and game.trend_slope(game_trends.G_POPULATION, tuning_constants.TREND_LONG) > tuning_constants.SLOPE_UP and ((game.g_available_landfill_capacity + game.g_waste_to_energy_capacity_daily > 0.05 * (game.g_waste_to_energy_capacity_daily + game.g_landfill_capacity)) and (game.g_available_landfill_capacity + game.g_waste_to_energy_capacity_daily < 0.15 * (game.g_waste_to_energy_capacity_daily + game.g_landfill_capacity)))"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@2a5025b6 SC4_ADV_utl_Garbage017_Hdl Swami Tsunami Predicts Flood of Garbage]]
a.message   = [[text@ea5025c2 SC4_ADV_utl_Garbage017_Mes There are a couple of ways of looking at it, mayor...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Garbage collection rating is acceptable, but growth will cause lots more trash - prepare for it
a = create_advice_utilities('6a527445')

--trigger: Landfill Capacity Remaining is > 80% and total city population > 500 people
a.trigger = "game.g_available_landfill_capacity > 380000 and game.g_population > tuning_constants.POPULATION_STEP_2"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@4a5025cd SC4_ADV_utl_Garbage018_Hdl City Opens Arms to More Garbage]]
a.message   = [[text@0a5025d9 SC4_ADV_utl_Garbage018_Mes Wow, Mayor, after looking at your staff's resumes, I didn't think...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Garbage Collection Rating is acceptable
a = create_advice_utilities('aa52744d')

--trigger:  Garbage Capacity remaining is between 15 and 80% 
a.trigger = "((game.g_available_landfill_capacity + game.g_waste_to_energy_capacity_daily) > 15  and (game.g_available_landfill_capacity + game.g_waste_to_energy_capacity_daily) < 80) and game.g_population > tuning_constants.POPULATION_STEP_3"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@2a5025e2 SC4_ADV_utl_Garbage019_Hdl City Still Skating on Sound Garbage Ground]]
a.message   = [[text@6a5025ee SC4_ADV_utl_Garbage019_Mes Well, if we're talking trash, Mayor, we're talking...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
-- Garbage Collection rating is low, need to do something about it
a = create_advice_utilities('2a527456')

--trigger: amount of garbage produced is greater than what's being handled (there's no single Garbage collection rating in the game) and garbage handling capacity is running low
a.trigger = "game.g_landfill_capacity > 0 and (game.g_available_landfill_capacity/game.g_landfill_capacity)*100 < 9 and game.g_population > tuning_constants.POPULATION_STEP_4"
--"game.g_garbage_produced > (game.g_garbage_to_energy + game.g_garbage_to_landfill) and (game.g_available_landfill_capacity + game.g_waste_to_energy_capacity_daily) < 25 and game.g_landfill_capacity > 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@2a5025f8 SC4_ADV_utl_Garbage020_Hdl City can barely put the lid on - trash tottering]]
a.message   = [[text@8a502602 SC4_ADV_utl_Garbage020_Mes In terms of trash, Mayor, there's no room at the inn...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
-- Garbage Collection rating very low - need to expand capacity
a = create_advice_utilities('0a52745f')

--trigger: uncollected garbage (or garbage pollution average) > 0 and % available landfill capacity below 10%
a.trigger = "0"
--game.ga_garbage_pollution > 0 and ((game.g_available_landfill_capacity/game.g_landfill_capacity) * 100)< 10"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@6a50260f SC4_ADV_utl_Garbage021_Hdl Sims Cry Foul -- City Garbage System Stinks]]
a.message   = [[text@6a50261a SC4_ADV_utl_Garbage021_Mes Mayor, it's true that your staff wearing bags...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
-- Garbage problem getting better, thanks to mayor action
a = create_advice_utilities('ca52746a')

--trigger: long term garbage trend greater than the lt handling capabilities and the short term trend the opposite.
a.trigger = "0"
--(game.trend_slope(game_trends.G_GARBAGE_PRODUCED, tuning_constants.TREND_LONG) > game.trend_slope(game_trends.G_GARBAGE_TO_ENERGY, tuning_constants.TREND_LONG)) or  (game.trend_slope(game_trends.G_GARBAGE_PRODUCED, tuning_constants.TREND_LONG) > game.trend_slope(game_trends.G_GARBAGE_TO_LANDFILL, tuning_constants.TREND_LONG))and (game.trend_slope(game_trends.G_GARBAGE_PRODUCED, tuning_constants.TREND_SHORT) < game.trend_slope(game_trends.G_GARBAGE_TO_ENERGY, tuning_constants.TREND_SHORT)) or  (game.trend_slope(game_trends.G_GARBAGE_PRODUCED, tuning_constants.TREND_SHORT) < game.trend_slope(game_trends.G_GARBAGE_TO_LANDFILL, tuning_constants.TREND_SHORT)) and game.g_landfill_capacity > 0"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@ca502625 SC4_ADV_utl_Garbage022_Hdl Rats Getting Laid Off:]]
a.message   = [[text@ca502632 SC4_ADV_utl_Garbage022_Mes Mayor, you're not off the hook completely, but at least it's not...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Garbage problem getting significantly better
a = create_advice_utilities('0a527473')

--trigger: Short term trend for dealing with garbage (waste to energy and sent to landfills) on a steep positive trend
a.trigger = "0"
--(game.trend_slope(game_trends.G_GARBAGE_TO_ENERGY, tuning_constants.TREND_SHORT) + game.trend_slope(game_trends.G_GARBAGE_TO_LANDFILL, tuning_constants.TREND_SHORT)) > tuning_constants.SLOPE_UP_UP_UP"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@aa502640 SC4_ADV_utl_Garbage023_Hdl Rubbish Room Expanding; Don't Stop the Slop]]
a.message   = [[text@8a50264f SC4_ADV_utl_Garbage023_Mes Well Mayor, since you authorized the city workers to have caffeinated coffee...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Bad Trash problem -- getting worse quickly
a = create_advice_utilities('4a52747c')

--trigger: There is local uncollected garbage above X and the available landfill capacity is less than 10%
a.trigger = "(game.l_uncollected_garbage_h > 25) and ((game.g_available_landfill_capacity/game.g_landfill_capacity) * 100) < 10"

--a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@aa502661 SC4_ADV_utl_Garbage024_Hdl City Neighborhood Fly-Ridden Wasteland]]
a.message   = [[text@2a502675 SC4_ADV_utl_Garbage024_Mes ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

------------ Advice record ----NEIGHBOR REFERENCE
a = create_advice_utilities('ea89dda7')
a.trigger = "0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@4a501f82 SC4_ADV_utl_Garbage025_Hdl City Send a Roadway TrashOGram To a Neighboring City]]
a.message   = [[text@8a501f94 SC4_ADV_utl_Garbage025_Mes Some of your deals stink, but this one smells just right: connect a road to a neighboring city and there's a good chance they'll offer to accept our trash at their open landfill. How can we miss--we'll be the city of sights and sounds, and they'll be the city of smells. Go for it! ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----NEIGHBOR REFERENCE
a = create_advice_utilities('8a89ddb3')
a.trigger = "0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@6a501fbd SC4_ADV_utl_Garbage026_Hdl City Rubbish On The Run From a Neighbor City?]]
a.message   = [[text@ea501fc8 SC4_ADV_utl_Garbage026_Mes When the wind blows right, you might have caught a whiff--your neighbor city has a trash disposal problem. Our landfills are open and ready, so it's likely that building a road connection there will result in a trash-collection offer from them. Hey, eggshells and coffee grounds can be moneymakers too, Mayor.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
-- Power funding high
a = create_advice_utilities('ea5bb19a')
--NEW TRIGGER 10/8
--trigger: global power funding high and there is at least 1 power plant placed in the city
a.trigger = "game.g_power_funding_p > 100 and (game.g_power_production_capacity + game.g_power_imported) > 1.4 * game.g_power_consumed and game.g_power_plant_count > 0 and game.g_population > tuning_constants.POPULATION_STEP_3"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@ca4f9320 SC4_ADV_Utl_Pow001_Hdl Power Plants Rolling in Dough]]
a.message   = [[text@aa4f935c SC4_ADV_Utl_Pow001_Mes Twist My Britches Mayor, but ...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
-- Power funding adequate
a = create_advice_utilities('2a5bb1a3')
--NEW TRIGGER 10/8
--trigger: 70% < global funding < 100% and at least 1 power plant placed in city
a.trigger = "game.g_power_funding_p > 60 and  game.g_power_funding_p < 90 and (game.g_power_production_capacity + game.g_power_imported) > 1.2 * game.g_power_consumed and game.g_power_plant_count > 0 and game.g_population > tuning_constants.POPULATION_STEP_3"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@ca4f936a SC4_ADV_Utl_Pow002_Hdl Power Funding Adequate, But Cushion Advised]]
a.message   = [[text@6a4f947b SC4_ADV_Utl_Pow002_Mes Sure, you've dropped enough coin...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Cash Shortage Threatens Power Supply - Global Power funding low
a = create_advice_utilities('aa5bb1ad')

--trigger:  Global funding low and at least 1 pwer plant placed in city
--DISABLED 10/8
a.trigger  = "0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@ea4f948c SC4_ADV_Utl_Pow003_Hdl Cash Shortage Threatens Power Supply]]
a.message   = [[text@aa4f9499 SC4_ADV_Utl_Pow003_Mes Saddle up the horses, Mayor--the money you've allocated...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL


------------ Advice record ----
-- local power funding low 
--a = create_advice_utilities('ca5bb1c3')
--a.trigger  = "0"
--DISABLED 10/8 - POWER FUNDING HAS CHANGED
---game.l_power_plant_funding_pl < 50 and game.g_population > tuning_constants.POPULATION_STEP_1" 
--a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
--a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
--a.title   = [[text@4a4f94cb SC4_ADV_Utl_Pow005_Hdl Local Power has a Cash-Ache]]
--a.message   = [[text@aa4f94da SC4_ADV_Utl_Pow005_Mes Just the basics, Mayor: water a plant, it grows...]]
--a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
--a.mood = advice_moods.BAD_JOB

------------ Advice record ----
-- Total city infrastructure threatened by power funding scarcity
a = create_advice_utilities('2a5bb1bb')
a.trigger  = "game.g_power_funding_p < 100 and game.l_power_plant_funding_pl < 75 and game.g_power_consumed > .9 * (game.g_power_production_capacity + game.g_power_imported) and game.trend_slope(game_trends.G_POWER_UNUSED,6) < 0 and game.trend_slope(game_trends.G_R_POPULATION,6) + game.trend_slope(game_trends.G_C_POPULATION,6) + game.trend_slope(game_trends.G_I_POPULATION,6) > 25"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@ea4f94ad SC4_ADV_Utl_Pow004_Hdl Total city infrastructure threatened by power funding scarcity]]
a.message   = [[text@0a4f94bc This city is busting loose, demanding more and more power, but it will flop like a house of cards if its power demands are met ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--Power Plant Output Falls Short Of Potential (Alternative to above?)
a = create_advice_utilities('0aa869b9')
a.trigger  = "game.g_power_funding_p < 100 and game.l_power_plant_funding_pl < 75 and game.g_power_consumed > .95 * (game.g_power_production_capacity + game.g_power_imported) and game.trend_slope(game_trends.G_POWER_UNUSED,6) < 0 and game.trend_slope(game_trends.G_R_POPULATION,6) + game.trend_slope(game_trends.G_C_POPULATION,6) + game.trend_slope(game_trends.G_I_POPULATION,6) < 25"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@6aa868bc	Power Plant Output Falls Short Of Potential]]
a.message   = [[text@4aa868c1	Mayor, we've got this fine power plant sitting there producing only a fraction of its potential while you continue to underfund it.  And now we're getting power demands greater than our production!  Go figure!  You've got to increase funding now if we're going to keep this city up and running.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
-- Growing City Cries For More Juice- City growing, new plant needed
a = create_advice_utilities('2a5bb1cd')
--cons:#game.g_power_consumed# + exp:#game.g_power_exported# vs. prod:#game.g_power_production_capacity# + imp:#game.g_power_imported# 
a.trigger  = "game.g_power_funding_p >= 100 and game.l_power_plant_funding_pl > 95 and game.g_power_consumed > .9 * (game.g_power_production_capacity + game.g_power_imported) and game.trend_slope(game_trends.G_POWER_UNUSED,6) < 0 and game.trend_slope(game_trends.G_R_POPULATION,6) + game.trend_slope(game_trends.G_C_POPULATION,6) + game.trend_slope(game_trends.G_I_POPULATION,6) > 25"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@aa4f94ec SC4_ADV_Utl_Pow006_Hdl Growing City Cries For More Juice]]
a.message   = [[text@6a4f94f9 SC4_ADV_Utl_Pow006_It's about power, Mayor -- electrical power, that is -- keeping #city# humming.   This city continues to grow and gr]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
--Power Demands Outpace Plant Potential (ALTERNATIVE TO ABOVE?)
a = create_advice_utilities('4aa86a10')
a.trigger  = "game.g_power_funding_p >= 100 and game.l_power_plant_funding_pl > 95 and game.g_power_consumed >= (game.g_power_production_capacity + game.g_power_imported) and game.trend_delta(game_trends.G_POWER_UNUSED,6) < -10 and game.trend_delta(game_trends.G_POWER_DEMANDED,6) > 10"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@4aa868c5	#city# Power Demands Outpace Plant Potential]]
a.message   = [[text@caa868c8	#city#'s growth has our infrastructure bursting at the seams, Mayor.  We're now clocking demands on our power supply in excess of what we can produce.  You've got to something mayor - build another power plant maybe, or else we'll be seeing non-stop rolling blackouts.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
-- Excess power trending positive enough to support growth
a = create_advice_utilities('8a5bb1d7')
a.trigger  = "game.trend_slope(game_trends.G_POWER_UNUSED,6) > 5 and game.g_population > tuning_constants.POPULATION_STEP_3"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@ea4f950f SC4_ADV_Utl_Pow007_Hdl Broad Power Grid Anticipates Needs]]
a.message   = [[text@aa4f951b SC4_ADV_Utl_Pow007_Mes Not bad for a rookie...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- BEscalating Power Crisis Demands Attention-uildings unpowered - need to increase power output
a = create_advice_utilities('ea5bb1de')
a.trigger  = "game.trend_slope(game_trends.G_POWER_BLACKOUT_P,3) > 5 and (game.g_unpowered_building_count > 0.15 * game.g_num_buildings) and game.g_population > tuning_constants.POPULATION_STEP_2"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@ea4f952b SC4_ADV_Utl_Pow008_Hdl Escalating Power Crisis Demands Attention]]
a.message   = [[text@8a4f9539 SC4_ADV_Utl_Pow008_Mes Coffee break's over--now! You've got <a href="#link_id#game.window_map(map_window_types.POWER)">power problems</a> criss-crossing this city, and if you don't get your rear in gear, there's going to be a major meltdown. Get the power grid off the skids, pronto!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
-- % buildings unpowered trending down, but still need additional power
a = create_advice_utilities('0a5bb1ec')
a.trigger  = "game.trend_slope(game_trends.G_POWER_BLACKOUT_P,3) < -10 and (game.g_unpowered_building_count < 0.05 * game.g_num_buildings and game.g_unpowered_building_count > 0) and game.g_population > tuning_constants.POPULATION_STEP_2"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@4a4f9547 SC4_ADV_Utl_Pow009_Hdl Power Panic Subsides, But Trouble Remains]]
a.message   = [[text@ea4f9554 SC4_ADV_Utl_Pow009_Mes OK, you can take a breath...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Based on available cash, suggest another power source
--a = create_advice_utilities('ca5bb1f9')
--a.trigger  = "0"
--a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
--a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
--a.title   = [[text@ea4f9593 SC4_ADV_Utl_Pow011_Hdl Power Up and Power On]]
--a.message   = [[text@8a4f95a2 SC4_ADV_Utl_Pow011_Mes Don't kid yourself -- if you want to weild power...]]
--a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
--a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Suggest an oil plant
a = create_advice_utilities('ea5bb204')
a.trigger  = "game.g_power_funding_p >= 100 and game.l_power_plant_funding_pl > 95 and game.g_power_consumed > .8 * (game.g_power_production_capacity + game.g_power_imported) and game.g_funds >= tuning_constants.COST_OIL_PLANT * 1.5 and game.g_funds < tuning_constants.COST_SOLAR_PLANT and game.g_power_plant_count_oil == 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@2a4f95b4 SC4_ADV_Utl_Pow012_Hdl Put an oil plant on the premises]]
a.message   = [[text@2a4f95c3 SC4_ADV_Utl_Pow012_Mes Nothing like seeing those smokestacks churning...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
-- another oi plant suggested
a = create_advice_utilities('ca5bb20a')
a.trigger  = "game.g_power_funding_p >= 100 and game.l_power_plant_funding_pl > 95 and game.g_power_consumed > .8 * (game.g_power_production_capacity + game.g_power_imported) and game.g_funds >= tuning_constants.COST_OIL_PLANT * 1.5 and game.g_funds < tuning_constants.COST_SOLAR_PLANT and game.g_power_plant_count_oil > 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@8a501aaa SC4_ADV_Utl_Pow013_Hdl One good oil plant deserves another]]
a.message   = [[text@ca501ac1 SC4_ADV_Utl_Pow013_Mes Another light burning in the darkness...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
-- suggest a coal plant
a = create_advice_utilities('6a5bb211')
a.trigger  = "game.g_power_funding_p >= 100 and game.l_power_plant_funding_pl > 95 and game.g_power_consumed > .8 * (game.g_power_production_capacity + game.g_power_imported) and game.g_funds >= tuning_constants.COST_COAL_PLANT * 1.5 and game.g_funds < tuning_constants.COST_OIL_PLANT and game.g_power_plant_count_oil == 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@ea501ace SC4_ADV_Utl_Pow014_Hdl Build a City With Coal]]
a.message   = [[text@8a501ad9 SC4_ADV_Utl_Pow014_Mes Listen joker, you can't produce without juice...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- suggest another coal plant
a = create_advice_utilities('8a5bb21c')
a.trigger  = "game.g_power_funding_p >= 100 and game.l_power_plant_funding_pl > 95 and game.g_power_consumed > .8 * (game.g_power_production_capacity + game.g_power_imported) and game.g_funds >= tuning_constants.COST_COAL_PLANT * 1.5 and game.g_funds < tuning_constants.COST_OIL_PLANT and game.g_power_plant_count_coal > 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@aa501ae7 SC4_ADV_Utl_Pow015_Hdl Another Coal Plant would make a good city better]]
a.message   = [[text@8a501b08 SC4_ADV_Utl_Pow015_Mes City's waking up, but it needs another power plant...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- suggest natural gas plant
a = create_advice_utilities('ca5bb222')
a.trigger  = "game.g_power_funding_p >= 100 and game.l_power_plant_funding_pl > 95 and game.g_power_consumed > .8 * (game.g_power_production_capacity + game.g_power_imported) and game.g_funds >= tuning_constants.COST_GAS_PLANT * 1.5 and game.g_funds < tuning_constants.COST_COAL_PLANT and game.g_power_plant_count_gas == 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@ea501b13 SC4_ADV_Utl_Pow016_Hdl Natural Gas Plants Put Wind in City Sails]]
a.message   = [[text@ea501b1c SC4_ADV_Utl_Pow016_Mes Face it, this city's never gonna...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- suggest another natural gas plant
a = create_advice_utilities('0a5bb227')
a.trigger  = "game.g_power_funding_p >= 100 and game.l_power_plant_funding_pl > 95 and game.g_power_consumed > .8 * (game.g_power_production_capacity + game.g_power_imported) and game.g_funds >= tuning_constants.COST_GAS_PLANT * 1.5 and game.g_funds < tuning_constants.COST_COAL_PLANT and game.g_power_plant_count_gas > 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@8a501b25 SC4_ADV_Utl_Pow017_Hdl More Natural Gas = More good growth]]
a.message   = [[text@4a501b2f SC4_ADV_Utl_Pow017_Mes There are power plants and there are power plants...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- suggest nuclear power plant  OBSOLETE - REWARD
a = create_advice_utilities('aa5bb230')
a.trigger  = "0"
--game.g_power_funding_p >= 100 and game.l_power_plant_funding_pl > 95 and (game.g_power_consumed) > .8 * (game.g_power_production_capacity + game.g_power_imported) and game.g_funds >= tuning_constants.COST_NUKE_PLANT * 1.5 and game.g_funds < tuning_constants.COST_HYDRO_PLANT and game.g_power_plant_count_nuclear == 0 and game.g_population > tuning_constants.POPULATION_STEP_7"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@4a501b3a SC4_ADV_Utl_Pow018_Hdl Nuke your city -- and watch it shine]]
a.message   = [[text@ea501b46 SC4_ADV_Utl_Pow018_Mes You don't use a cap gun to shoot a rino...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- suggest another Nuke power plant
a = create_advice_utilities('8a5bb236')
a.trigger  = "game.g_power_funding_p >= 100 and game.l_power_plant_funding_pl > 95 and game.g_power_consumed > .8 * (game.g_power_production_capacity + game.g_power_imported) and game.g_funds >= tuning_constants.COST_NUKE_PLANT * 1.5 and game.g_funds < tuning_constants.COST_HYDRO_PLANT and game.g_power_plant_count_nuclear > 0 and game.g_population > tuning_constants.POPULATION_STEP_8"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@6a501b52 SC4_ADV_utl_Pow019_Hdl A City That goes Nuclear Goes -- period]]
a.message   = [[text@6a501b5c SC4_ADV_utl_Pow019_Mes Those environmental nuts wouldn't know...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
-- suggest a wind power plant
a = create_advice_utilities('0a5bb23c')
a.trigger  = "game.g_power_funding_p >= 100 and game.l_power_plant_funding_pl > 95 and game.g_power_consumed > .8 * (game.g_power_production_capacity + game.g_power_imported) and game.g_funds >= tuning_constants.COST_WIND_PLANT * 1.5 and game.g_funds < tuning_constants.COST_GAS_PLANT and game.g_power_plant_count_wind == 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@ea501b8e SC4_ADV_utl_Pow020_Hdl A Fair Wind Blows Much Good]]
a.message   = [[text@0a501b9b SC4_ADV_utl_Pow020_Mes I could talk all day about the benefits of wind power...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- suggest another wind power plant
a = create_advice_utilities('6a5bb244')
a.trigger  = "game.g_power_funding_p >= 100 and game.l_power_plant_funding_pl > 95 and game.g_power_consumed > .8 * (game.g_power_production_capacity + game.g_power_imported) and game.g_funds >= tuning_constants.COST_WIND_PLANT * 1.5 and game.g_funds < tuning_constants.COST_GAS_PLANT and game.g_power_plant_count_wind > 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@6a501ba6 SC4_ADV_utl_Pow021_Hdl Light the Lamps by Weilding the Wind]]
a.message   = [[text@4a501bbd SC4_ADV_utl_Pow021_Mes Let's pow-wow about power...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- suggest a solar power plant OBSOLETE-REWARD
a = create_advice_utilities('2a5bb252')
a.trigger  = "0"
--(game.g_power_consumed) > .75 * (game.g_power_production_capacity + game.g_power_imported) and game.g_funds >= tuning_constants.COST_SOLAR_PLANT * 1.5 and game.g_funds < tuning_constants.COST_NUKE_PLANT and game.g_power_plant_count_solar == 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@6a501bcd SC4_ADV_utl_Pow022_Hdl Let your city harness the sun's energy]]
a.message   = [[text@2a501bd9 SC4_ADV_utl_Pow022_Mes It might not be news, but the sun isn't just good for a tan...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- suggest another solar power plant
a = create_advice_utilities('aa5bb259')
a.trigger  = "game.g_power_funding_p >= 100 and game.l_power_plant_funding_pl > 95 and game.g_power_consumed > .8 * (game.g_power_production_capacity + game.g_power_imported) and game.g_funds >= tuning_constants.COST_SOLAR_PLANT * 1.5 and game.g_funds < tuning_constants.COST_NUKE_PLANT and game.g_power_plant_count_solar > 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.requency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@6a501be6 SC4_ADV_utl_Pow023_Hdl Put Your Sunshine to Work]]
a.message   = [[text@ea501bf2 SC4_ADV_utl_Pow023_Mes Sunshine-- you can stick out a cup...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
-- suggest hydorgen power plant OBSOLETE-REWARD
a = create_advice_utilities('ea5bb25f')
a.trigger  = "0"
--(game.g_power_consumed) > .75 * (game.g_power_production_capacity + game.g_power_imported) and game.g_funds >= tuning_constants.COST_HYDRO_PLANT * 1.5 and game.g_power_plant_count_fusion == 0 and game.g_population > tuning_constants.POPULATION_STEP_8"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@8a501bfc SC4_ADV_utl_Pow024_Hdl Use Fusion Power for Every Energy need]]
a.message   = [[text@ea501c05 SC4_ADV_utl_Pow024_Mes OK, so the enviro-gyros have been complaining...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- suggest another hydrogen power plant
a = create_advice_utilities('ca5bb264')
a.trigger  = "game.g_power_funding_p >= 100 and game.l_power_plant_funding_pl > 95 and game.g_power_consumed > .8 * (game.g_power_production_capacity + game.g_power_imported) and game.g_funds >= tuning_constants.COST_HYDRO_PLANT * 1.5 and game.g_power_plant_count_fusion > 0 and game.g_population > tuning_constants.POPULATION_STEP_8"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@8a501c10 SC4_ADV_utl_Pow025_Hdl There's no confusion -- use fusion]]
a.message   = [[text@ca501c1b SC4_ADV_utl_Pow025_Mes It's simple math: you need the power...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
-- Zones but no power
a = create_advice_utilities('0a9ebf27')
a.trigger  = "game.g_num_rzone_ld_tiles + game.g_num_rzone_md_tiles	+ game.g_num_rzone_hd_tiles + game.g_num_czone_ld_tiles	+ game.g_num_czone_md_tiles	+ game.g_num_czone_hd_tiles	+ game.g_num_izone_r_tiles	+ game.g_num_izone_l_tiles	+ game.g_num_izone_h_tiles > 8 and game.g_power_production_capacity + game.g_power_imported == 0 and game.g_month > 3"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@8a9eb9c5 Lack Of Power Keeps #city# Just A Gleam In Mayor's Eye]]
a.message   = [[text@6a9eb9ca  Um, Mayor... Are you expecting something to happen?  Are you expecting some Sims will move in, despite having no source of power?  I have news for you: NOTHING will develop if you don't provide the juice!  Unless you actually like these empty spaces, these open and pristine plots of land, build a <a href="#link_id#game.tool_plop_building(building_tool_types.COALPOWER)">power plant</a>! ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
-- Time's Nearly Up For Local Power Plant
a = create_advice_utilities('2a5bb271')
a.trigger  = "game.l_power_plant_age_h > 91"
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@2a501c26 SC4_ADV_utl_Pow026_Hdl Time's Nearly Up For Local Power Plant]]
a.message   = [[text@4a501c3b SC4_ADV_utl_Pow026_Mes Get your feet off the desk...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.ALARM

------------ Advice record ----
-- Power Plant No Spring Chicken- aging power plant - suggest action
a = create_advice_utilities('0a7a26e6')
a.trigger  = "game.l_power_plant_age_h > 75" 
--NEED TO CHECK MESSAGE INTO DB
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@ea9ebb72 (PH) Power Plant No Spring Chicken ]]
a.message   = [[text@4a9ebb79 (PH)<a href="#link_id#game.camera_jump(game.l_power_plant_age_h_subject)">This old power plant</a> doesn't have too many years left on it, Mayor, and so you need to think about building a replacement soon.  And don't forget you will need to decommission it before it completely runs down, or we'll have quite a mess on our hands!  There's no rush, for now -- but don't delay either. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Several aging power plants - suggest action
a = create_advice_utilities('aa5bb277')
a.trigger  = "game.g_power_plant_count > 5 and game.g_aged_power_plant_count >= .30 * game.g_power_plant_count"
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@0a501c44 SC4_ADV_utl_Pow027_Hdl Your Power Plants Are Almost Obsolete]]
a.message   = [[text@2a501c4d SC4_ADV_utl_Pow027_Mes I tell you, it must be nice...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Power and population growth keeping up - good work
a = create_advice_utilities('8a5bd6af')
a.trigger  = "game.trend_slope(game_trends.G_POWER_UNUSED,36) > 10 and (game.trend_slope(game_trends.G_R_POPULATION,36) + game.trend_slope(game_trends.G_C_POPULATION,36) + game.trend_slope(game_trends.G_I_POPULATION,36))/3 > 10 and game.g_population > tuning_constants.POPULATION_STEP_5"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@8a501c6f SC4_ADV_utl_Pow029_Hdl Power Banks Get Deposits]]
a.message   = [[text@0a501c7d SC4_ADV_utl_Pow029_Mes Well now, #city# seems to be swaggering a touch...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
-- power being produced, but many zones unpowered--Power Now A Priviledge in #City#?
a = create_advice_utilities('ca5bb284')
a.trigger  = "game.g_power_consumed < .92 * (game.g_power_production_capacity + game.g_power_imported) and game.g_unpowered_building_count > 5"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.title   = [[text@aa501c93 SC4_ADV_utl_Pow030_Hdl Plan Your Power, Line Your Zones]]
a.message   = [[text@0a501c9e SC4_ADV_utl_Pow030_Mes It looks like you got caught asleep at the switch, Mayor.  ...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
--Disaster Looming: Power Plants Over Capacity!
a = create_advice_utilities('2a5e13b3')
a.trigger  = "game.g_power_plant_count > 0 and game.g_power_production_capacity + game.g_power_imported <= game.g_power_consumed and game.g_power_funding_p >= 100 and game.g_power_consumed > 100"
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.frequency = 75
a.title   = [[text@6a501de9 SC4_ADV_utl_Pow031_Hdl Disaster Looming: Power Plants Over Capacity!]]
a.message   = [[text@6a501df2 SC4_ADV_utl_Pow031_Mes No more committees, no more discussions: act! I've got imminent power plant failures left, right and center. This city is going to be crying big-time when they fail--and I don't mean IF they fail. Get on it, mayor: build more plants and build them now. You can go back to ordering more marble paperweights after you take care of some real business.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.ALARM


------------ Advice record ----SAME AS ABOVE????
--City Threatened With Power Calamity
a = create_advice_utilities('ca5e13b9')
a.trigger  = "0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@ea501dfc SC4_ADV_utl_Pow032_Hdl City Threatened With Power Calamity]]
a.message   = [[text@6a501e07 SC4_ADV_utl_Pow032_Mes Attention mayor: #city# power plants are going full-bore, but the city is demanding more! Sure, our existing plants are putting out, but if you can't meet power needs, our lights will be going out. Put more plants in service, buy power from neighbors, do something. Just don't wait--or you'll wake up in the dark.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL


------------ Advice record ----CAN'T DETERMINE IF W2E IN PARTICULAR IS AGING
a = create_advice_utilities('aa5e13c0')
a.trigger  = "0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@0a502093 SC4_ADV_utl_Pow033_Hdl Waste to Energy Plant Might Go Up In Smoke; Need Attention Now]]
a.message   = [[text@aa50209c SC4_ADV_utl_Pow033_Mes While you've been worrying about whether your Cuban cigars will get through customs, Mayor, I've been checking the Waste to Energy plant conditions in #city#. We've got aging and faulty equipment at every plant, and it's only going to get worse. Check the stats and clean up your act: I'd bulldoze the oldest ones before it's written on the foul wind that the city can't handle its collected trash--and the blame bloodhounds come sniffing around your office.  ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----NO EVENT???
a = create_advice_utilities('0a5e13c5')
a.trigger  = "0" 
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@4a5020a5 SC4_ADV_utl_Pow034_Hdl Power Plant Goes Boom; More Could Spell Doom]]
a.message   = [[text@ea5020af SC4_ADV_utl_Pow034_Mes Holy smokes, Mayor! While you were ironing your stable of shar pei dogs, a power plant exploded in #city#. That kind of neglect can spell disaster. You've got to keep a watchful eye on the age and funding for every power plant in the city--and then keep your other eye on them too. And build another power plant while you're at it.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
a = create_advice_utilities('6a5e13cb')
a.trigger  = "game.g_unpowered_building_count > .07 * game.g_num_buildings and (game.g_power_production_capacity + game.g_power_imported <= game.g_power_consumed) and game.l_power_plant_age_h < 80 and game.g_city_rci_population > 1000"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@aa5020b8 SC4_ADV_utl_Pow035_Hdl Sims Need Power: Claim Mayor Is Prince Of Darkness]]
a.message   = [[text@6a5020c2 SC4_ADV_utl_Pow035_Mes Mayor, you've got screaming Sims pounding on your door, clamoring for power for their blenders and their bagel-toasters. But they won't be pounding long. They'll ditch this unpowered place pronto if you don't build another power plant, posthaste. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
a = create_advice_utilities('2a5e13d1')
a.trigger  = "game.g_unpowered_building_count > .07 * game.g_num_buildings and (game.g_power_production_capacity + game.g_power_imported <= game.g_power_consumed) and game.l_power_plant_age_h >= 75"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@ea5020cc SC4_ADV_utl_Pow036_Hdl Inadequate Power Has Sims Steaming]]
a.message   = [[text@ea5020d5 SC4_ADV_utl_Pow036_Mes Land sakes alive Mayor! You've got brownouts and power failures up and down the grid, and you're getting three-hour morning pedicures. There's likely to be an explosion at one of our older plants any minute--check 'em out and build a new power plant now. And if that freaky Finance advisor or that brain-dead Environmental advisor try to interfere, send 'em down to my office. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB



------------ Advice record ----REDUNDANT???
a = create_advice_utilities('4a5e13d8')
a.trigger  = "0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@8a5020e1 SC4_ADV_utl_Pow037_Hdl  It's Lights Out For #City#]]
a.message   = [[text@8a5020ec SC4_ADV_utl_Pow037_Mes  Mayor, it's time to stop thinking about what you'll have for lunch and time to start thinking about whether this job's going to eat your lunch. We've got power blackouts happening NOW! That's right, Sims--voting Sims--in the dark because we don't have the generating capacity to power their penlights. Build a new power plant without fail, buy power from a neighbor, just do something!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL


------------ Advice record ----
a = create_advice_utilities('8a5e13df')
a.trigger  = "game.g_power_production_capacity + game.g_power_imported > 1.15 * game.g_power_consumed and game.l_power_plant_age_h < 75 and game.g_year > 2001"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@4a5020f5 SC4_ADV_utl_Pow038_Hdl Today's Power Poll: Light's On, Everybody's Home ]]
a.message   = [[text@ea5020fe SC4_ADV_utl_Pow038_Mes Well, Mayor, looks like you'll keep eating off your crystal dishware for the time being at least. #City# power plants are up to the job--all the city power needs are being met without incident. I'll look the other way when you slip out to go golfing.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
a = create_advice_utilities('aa5e13e4')
-- + game.g_power_imported  REMOVED FROM TRIGGER 10/17
a.trigger  = "game.g_power_production_capacity > 2 * game.g_power_consumed and game.l_power_plant_age_h < 80 and game.g_year > 2000"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@ca502107 SC4_ADV_utl_Pow039_Hdl The Shame Of Squandered Power]]
a.message   = [[text@4a502110 SC4_ADV_utl_Pow039_Mes Too much of a good thing is just that--too much. In the case of power supplies, here we are, generating and generating, but not utlizing what's produced. And don't tell me you could just destroy a power plant--if that's not fighting waste by wasting, I don't know what is. Check and see if any neighbors have power shortages, and try to stay on top of production and needs issues, Mister Bigshot.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----NEIGHBOR REFERENCE???
a = create_advice_utilities('4a89de8c')
a.trigger = "0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@aa501cc3 SC4_ADV_utl_Pow040_Hdl City New City Border Power Line Could Provoke Power Sale]]
a.message   = [[text@8a501ccd SC4_ADV_utl_Pow040_Mes We're packing a lot of power in #city# now, Mayor; in fact we've even got enough to peddle a little on the side and line the city coffers. Rumor has it that one of your neighbors are short on power and long on Benjamins. Let's bait the hook: run a hot power line to our border with them, and I'll bet they'll bite big, and we'll have to use a bulldozer to move all the money. You can even say it was your idea, o Saviour of the City.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

------------ Advice record ----NEIGHBOR REFERENCE???
a = create_advice_utilities('8a89df27')
a.trigger = "0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@ea501cf1 SC4_ADV_utl_Pow041_Hdl City Power Line To a Neighbor City Could Solve Power Deficit]]
a.message   = [[text@4a501d21 SC4_ADV_utl_Pow041_Mes Mayor, while you've been busy putting more mirrors in your office, #city# has been running short on power. If new power plants don't suit your mood, you might consider a little "one hand washes the other" with a neighbor. They've got power by the bushelsfull, and might part with some for a bit of the green. Loud hint: We won't know unless we hook up a power line to the correct border. Louder hint: when I say "we," I mean you.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
a = create_advice_utilities('2a89df31')
a.trigger = "game.g_unpowered_building_count > .15 * game.g_num_buildings and (game.g_power_production_capacity + game.g_power_imported) > 1.15 * game.g_power_consumed"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@ca502119 SC4_ADV_utl_Pow042_Hdl City Sims On The Skids Without Power Grid]]
a.message   = [[text@0a502124 SC4_ADV_utl_Pow042_Mes Mayor, it boggles the mind: on the one hand we have power aplenty, and on the other, we have Sims who plug in their power tools and get nada. Make the connection--literally. Power plants need connections to city zones with power lines. And stretches of unzoned tiles break power connections. Duh, it's like we're back in grade school here--and this teacher has a temper.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----SAME AS ABOVE?
a = create_advice_utilities('aa89df3b')
a.trigger = "0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@8a50212e SC4_ADV_utl_Pow043_Hdl City Sims Grope For Dead Light Switches--Power Grid Problems?]]
a.message   = [[text@0a502139 SC4_ADV_utl_Pow043_Mes Mayor, gaps in power grid are like having a keyboard that's missing some keys. Sure, you can type a few  words, but you won't get far. And your Sims are suffering power gaps in sections of #city#. Look long and hard at the power grid and ensure connections between all the zones. Keep the lights on and the powers of darkness at bay.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
a = create_advice_utilities('4a89df45')
a.trigger = "game.trend_value(game_trends.G_POWER_UNUSED,4) == 0 and game.trend_slope(game_trends.G_POWER_UNUSED,4) > 0 and game.g_unpowered_building_count < .05 * game.g_num_buildings and game.g_year > 2000"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@6a502143 SC4_ADV_utl_Pow044_Hdl Good Buzz On Power Grid]]
a.message   = [[text@4a50214c SC4_ADV_utl_Pow044_Mes Mayor, I don't know if you used bribes, jive or skinned someone alive, but the power grid is now sending sweet juice to all corners of the city. Prudence says you'll check the gr   id now and then (and save me from screaming), but for the moment, we're cooking. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB


------------ Advice record ----
-- Global Water Funding High
a = create_advice_utilities('ea5bb298')
--trigger:  The global water funding is at 100% or greater and water sources have been placed in the city.
a.trigger = "game.g_water_funding_p > tuning_constants.FUNDING_HIGH and game.g_water_source_count > 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@aa50215c SC4_ADV_utl_Water001_Hdl Waves of Cash Keep Water Flowing]]
a.message   = [[text@8a502168 SC4_ADV_utl_Water001_Mes Grab your board, Mayor...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
-- Global Water Funding Adequate
a = create_advice_utilities('ca5bda88')
--trigger:  The global water funding is between 80 and 100% and water sources have been placed in the city.
a.trigger  = "game.g_water_funding_p < tuning_constants.FUNDING_HIGH and game.g_water_funding_p > tuning_constants.FUNDING_MEDIUM and game.g_water_source_count > 0 and game.g_watered_building_count > 300 and game.trend_slope(game_trends.G_POPULATION, tuning_constants.TREND_MEDIUM) > 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@8a502172 SC4_ADV_utl_Water002_Hdl Adequate Water Funding no reason to sleep]]
a.message   = [[text@6a50217c SC4_ADV_utl_Water002_Mes "Granted, Mayor, the city has the dough behind the water flow. Now. But what about after now? Sure, it's nice to have enough <a href=""#link_id#game.window_budget(budget_window_types.UTILITIES)"">funding</a> to keep water supply steady, but we should always plan ahead. If the cash dries
up, the city does too--and so do your re-election chances."]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----FRANK - WHAT ARE THE RISKS OF FUNDING IN THIS RANGE?
-- Global Water Funding Low
a = create_advice_utilities('0a5bda8e')
--trigger:  global water funding is between 50 and 80% and water sources have been placed in the city
a.trigger  = "0"
--a.trigger = "(game.g_water_funding_p < tuning_constants.FUNDING_MEDIUM and game.g_water_funding_p > tuning_constants.FUNDING_LOW) and game.g_water_source_count > 0 and game.g_water_consumed > game.g_water_production_capacity+game.g_water_imported"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@8a50218a SC4_ADV_utl_Water003_Hdl Water Funding Glass Half Empty--And Going]]
a.message   = [[text@0a502194 SC4_ADV_utl_Water003_Mes Mayor, I'll tell you this before my throat's too parched to get it out--you need to kick up <a href="#link_id#game.window_budget(budget_window_types.UTILITIES)">funding</a> for city water supplies, or you'll have a desert on your hands. The desiccated old bones of an ex-mayor are not a pretty sight.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Global Water Funding Very Low
a = create_advice_utilities('4a5bda98')

--trigger: global water funding less than 50% and water sources have been placed in the city.
a.trigger = "game.g_water_funding_p < tuning_constants.FUNDING_VERY_LOW and game.g_water_source_count > 0"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@4a5021af SC4_ADV_utl_Water004_Hdl Strangled Water Funding Might Clamp City Pipes]]
a.message   = [[text@2a5021ba SC4_ADV_utl_Water004_Mes Water, water, water, Mayor...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
-- Pipe burst due to underfunding, call to repair
a = create_advice_utilities('2a5bda9e')

--trigger:  always trigger on a pipe burst event
a.trigger  = "1"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@0a510bd1 SC4_ADV_utl_Water005_Hdl Sims Need Water Wings After Pipe Burst]]
a.message   = [[text@ca510be2 SC4_ADV_utl_Water005_Mes Mayor, those waders of yours...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.event = game_events.PIPE_BURST -- pipe bursts
a.mood = advice_moods.ALARM

------------ Advice record ----
-- Excess water trending upwards
a = create_advice_utilities('0a5bdaa4')

--trigger: there are water sources placed in the city and the trend for excess water is growing for the previos year
a.trigger = "game.g_water_source_count > 0 and (game.trend_slope(game_trends.G_WATER_PRODUCED, tuning_constants.TREND_MEDIUM) > game.trend_slope(game_trends.G_WATER_CONSUMED, tuning_constants.TREND_MEDIUM)) and game.g_year > 2001 and game.g_month >= 3 and game.g_month < 5"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@8a5021c4 SC4_ADV_utl_Water006_Hdl Sims Go, go, go with the Flow, flow, flow]]
a.message   = [[text@8a5021cd SC4_ADV_utl_Water006_Mes I don't want your head to balloon...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
-- City is dry, advise placing some water production in city
a = create_advice_utilities('6a5bdaac')

--trigger: water production + water imports < water consumed + water exported.  Unwatered buildings exist in city
a.trigger = "(game.g_water_production_capacity + game.g_water_imported < game.g_water_consumed + game.g_water_exported) and game.g_unwatered_building_count > 0"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@ca5021db SC4_ADV_utl_Water007_Hdl Mayor's Policies Smell: No Water in the Well]]
a.message   = [[text@aa5021e4 SC4_ADV_utl_Water007_Mes It doesn't get any more basic than water...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Suggest a water treatment plant
a = create_advice_utilities('0a5bdab5')

--trigger: no water treatment plants exist in city, water pollution exists, and player has enough money to buy
a.trigger = "game.g_water_treatment_plant_count == 0 and game.ga_water_pollution > tuning_constants.GA_POLLUTION_MEDIUM and game.g_funds > 40000 and game.g_water_consumed > 20000"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@8a4f9561 SC4_ADV_utl_Water008_Hdl Give your water a (treat)ment]]
a.message   = [[text@0a4f9584 SC4_ADV_utl_Water008_Mes Look, nobody likes water that looks like espresso...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- % of unwater buildings trending upwards
a = create_advice_utilities('6a5bdabe')
--trigger: trend of % of unwatered buildings in the city rising and percentage of unwatered buildings is > X (NEED VAR EXPOSED)
a.trigger  = "game.trend_slope(game_trends.G_UNWATERED_BUILDING_COUNT,6) > 0 and game.g_unwatered_building_count > .1 * game.g_num_buildings and game.g_year > 2000 and game.g_water_source_count > 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@ca502201 SC4_ADV_utl_Water009_Hdl Baked Buildings Reveal Heat's on for Mayor]]
a.message   = [[text@4a50220f SC4_ADV_utl_Water009_Mes Mayor, I don't know if you're hoarding all the water for your 900-acre pool and blue-whale fountains, but the rest of the city's not getting much. We've got more and more buildings all over #city# without water. <a href="#link_id#game.window_map(map_window_types.WATER)">Check your systems</a> and <a href="#link_id#game.tool_plop_network(network_tool_types.PIPE)">plow those pipelines</a>--water's the blood of the city.<a href="#link_id#game.tool_plop_network(network_tool_types.PIPE)"]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
-- % unwatered buildings trending down, good work
a = create_advice_utilities('6a5bdac5')
--trigger:  % of unwatered building in a city trending down and percentage of unwatered buildings < X (NEED VAR EXPOSED)
a.trigger  = "game.trend_slope(game_trends.G_UNWATERED_BUILDING_COUNT,3) < 0 and game.g_unwatered_building_count < .1 * game.g_watered_building_count and game.g_population > tuning_constants.POPULATION_STEP_3"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@ea50221c SC4_ADV_utl_Water010_Hdl Liquid Assets on the Upswing]]
a.message   = [[text@2a502226 SC4_ADV_utl_Water010_Mes Mayor the situation is still fluid, but it's looking better as far as #city# water allocations are going. Most buildings have water flow again, and your Sims aren't sweating it. I'd say your glass is at least half-full, even if you remove the olives and gin.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Suggest a water treatment plant
a = create_advice_utilities('ca5bdacc5')

--trigger: water pollution exists and water treatment plants in city == 0
a.trigger = "game.ga_water_pollution > tuning_constants.GA_POLLUTION_MEDIUM and game.g_water_treatment_plant_count == 0  and game.g_funds > 45000 and game.g_water_consumed > 14000"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@2a50222f SC4_ADV_utl_Water011_Hdl Plant a Treatment Plant and get a water treat]]
a.message   = [[text@ea50223a SC4_ADV_utl_Water011_Mes  Mayor, I'm sure none of your friends...]]
a.message   = [[text@ea50223a SC4_ADV_utl_Water011_Mes  Mayor, I'm sure none of your friends...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- No water produced, put in water buildings
a = create_advice_utilities('8a5bdad2')
--trigger: no water produced in city and city has more than 30 buildings (at this point, there isn't a single variable to give us total number of buildings in the city -- to compensate, using the total of watered and unwatered buildings)
a.trigger = "(game.g_water_source_count == 0 and game.g_water_production_capacity == 0) and (game.g_watered_building_count+game.g_unwatered_building_count > 150) and (game.g_year > 2000 and game.g_population > tuning_constants.POPULATION_STEP_5) and game.g_water_imported == 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@0a5023a6 SC4_ADV_utl_Water012_Hdl One word from the parched throat of the city: water!]]
a.message   = [[text@ea5023b0 SC4_ADV_utl_Water012_Mes I've said it before Mayor -- water is the blood of a city...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
--No Water, No Way- Production barely keeping up with demand, do something about it
a = create_advice_utilities('aa5bdad9')
--trigger: water consumed > production capacity, no water ND exists, and there are at least 50 buildings in the game
a.trigger = "game.g_water_consumed > 0.95 * game.g_water_production_capacity and game.g_nd_count_buy_water == 0" -- need to add # of buildings one the var is exposed.

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@4a5023b9 SC4_ADV_utl_Water013_Hdl No Water, No Way]]
a.message   = [[text@4a5023c3 SC4_ADV_utl_Water013_Mes Mayor, your sims aren't statues -- they need water...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
-- Water production = water consumption, place water, do something to increase output
a = create_advice_utilities('aa5bdae0')

--trigger: water consumed 95% of produced, mid-term city growth trending up, there are at least 10 unwatered buildings.
a.trigger = "game.g_water_consumed > 0.95 * game.g_water_production_capacity and game.trend_slope(game_trends.G_POPULATION, tuning_constants.TREND_MEDIUM) > tuning_constants.SLOPE_UP and (game.g_unwatered_building_count > 0.5 * game.g_watered_building_count)"
 
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@6a5023cd SC4_ADV_utl_Water014_Hdl Sims Protesting Mayor's Wiggling on Water Demand]]
a.message   = [[text@6a5023d6 SC4_ADV_utl_Water014_Mes Mayor, there are Sims lined up in and around every one of yoru stretch limos...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- Water system meeting demands of the city
a = create_advice_utilities('6a5bdae8')

--trigger: Consumed water less than 45% of production capacity and long term trend of population is positive
--a.trigger  = "0"  (game.g_unwatered_building_count > 0.3 * (game.g_watered_building_count + game.g_unwatered_building_count))
a.trigger = "game.g_water_consumed < 0.45 * game.g_water_production_capacity and game.trend_slope(game_trends.G_POPULATION, tuning_constants.TREND_LONG) > tuning_constants.SLOPE_UP and (game.g_unwatered_building_count < 0.3 * (game.g_watered_building_count + game.g_unwatered_building_count))"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@ea5023f1 SC4_ADV_utl_Water015_Hdl Water Every Whichaway]]
a.message   = [[text@ea5023fa SC4_ADV_utl_Water015_Mes Well, tickle my aquifer, mayor...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
-- % of unwater buildings high and water useage greater than production, suggest water pipes
a = create_advice_utilities('ca5bdaf2')

--trigger: Unwatered buildings % > 60% and water produced > water consumed, # buildings > 50 (might need to look for existing pipes in the city?)
a.trigger = "(game.g_unwatered_building_count > 0.5 * (game.g_watered_building_count + game.g_unwatered_building_count)) and game.g_water_consumed > game.g_water_production_capacity and (game.g_unwatered_building_count + game.g_watered_building_count) > 50"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@0a502414 SC4_ADV_utl_Water017_Hdl Dry Patches on City Face: Pipe those Zones]]
a.message   = [[text@8a50241d SC4_ADV_utl_Water017_Mes Mayor, there's that old line: you do the greatest good...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- dry zones exist, suggest water pipes
a = create_advice_utilities('ca5bdaf8')

--trigger: Unwatered buildings > 30% of city total, the production capacity exceeds consumption, and the city is appropriately big.  Should we check for locally unwatered buildings?  Need to ask Alex to expose this.
a.trigger = "(game.g_unwatered_building_count > 0.3 * (game.g_watered_building_count + game.g_unwatered_building_count)) and game.g_water_production_capacity > game.g_water_consumed" -- need to add total buildings check.

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@aa502425 SC4_ADV_utl_Water018_Hdl Water 101:  The dry zone ind its discontents]]
a.message   = [[text@0a50242f SC4_ADV_utl_Water018_Mes Mayor, while you're trying to decide...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
-- entire city is watered, good job
a = create_advice_utilities('2a5bdb01')
--trigger: Less than 95% of buildings are unwatered, there exist at least 50 watered buildings, and the city growth is trending up
a.trigger  = "(game.g_unwatered_building_count < 0.05 * game.g_num_buildings) and game.g_watered_building_count >= 50 and game.trend_slope(game_trends.G_POPULATION,3) > 0 and game.g_population < tuning_constants.POPULATION_STEP_4"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@ca502439 SC4_ADV_utl_Water019_Hdl Mayor is a Player: Sims Well Watered]]
a.message   = [[text@0a502441 SC4_ADV_utl_Water019_Mes Good gravy mayor, weve got so much water in the city...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
-- Green Meddlers put the clamp on water pump--Water pump shuts down due to excessive pollution
a = create_advice_utilities('ca5bdb07')
--trigger: water pollution shutdown count > 0, water pollution global average > 0
a.trigger = "game.g_water_pollution_pump_shutdown_count > 0 and game.ga_water_pollution > 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@4a50244a SC4_ADV_utl_Water020_Hdl Green Meddlers put the clamp on water pump]]
a.message   = [[text@8a50245b SC4_ADV_utl_Water020_Mes Asthought the city doesn't have some real problems...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----NEIGHBOR?????
a = create_advice_utilities('ca89e1b6')
a.trigger  = "0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@ea501e12 SC4_ADV_utl_Water021_Hdl Dry #ND_city# Will Buy, But Pipes Needed]]
a.message   = [[text@ea501e1e SC4_ADV_utl_Water021_Mes Check this out: our water pumping plants are liquid in every sense of the word. We've got water resources out the yin-yang, and the word going around says that #ND_city# is parched. Odds are that if we plumb a line to their border, they'll make us a cash offer for our excess agua. I don't know why you're just staring at me--put that pipe in now!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------------ Advice record ----NEIGHBOR???
a = create_advice_utilities('ca89e1b0')
a.trigger  = "0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.frequency   = tuning_constants.ADVICE_FREQUENCY_HIGH
a.title   = [[text@2a501e3f SC4_ADV_utl_Water022_Hdl Citizens Call For  Water Could Be Answered By One Our Neighbor Cities]]
a.message   = [[text@8a501e4c SC4_ADV_utl_Water022_Mes Mayor, a city without water won't be a city for long. We're barely producing enough water to wash your limo fleet, much less provide for basic needs. I've got the skinny on water doings over at one of our neighbors. They've got so much water they're putting pools in their cars. No doubt if we built a water main to our shared borders, they'll make us a "sell" offer. C'mon Mayor, 10 gardens have died while you stood there scratching your head. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

--------------------------------------------------------------------
-- This will try to execute triggers for all registerd advices 
-- to make sure they don't have any syntactic errors.

if (_sys.config_run == 0)
then
   advices : run_triggers()
end
