-----------------------------------------------------------------------------------------
-- This file defines advices for the the ENVIRONMENT
dofile("_adv_sys.lua") 
dofile("_adv_advice.lua") 
dofile("adv_game_data.lua") 

-- helper funcition
function create_advice_environemt_with_base(guid_string, base_advice)
   local a =  advices : create_advice(tonumber(guid_string, 16), base_advice)
   a.type   = advice_types . ENVIRONMENT
   return a
end

-- helper funcition
function create_advice_environemt(guid_string)
   local a =  create_advice_environemt_with_base(guid_string, nil)
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


--welcome msg
------------ Advice record ----
a = create_advice_environemt('6a74b73a')

a.trigger  = "game.g_month > 4"
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@eac3f1c8#advisor# Is Happy To be Environment Advisor]]
a.message   = [[text@cac3f1aa Env. advisor msg text coming tomorrow]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB



--GARBAGE
--------- Advice record ----
--Export Deal Will Get Trash Out
a = create_advice_environemt('6a711822')

a.trigger  = "game.g_nd_count_export_garbage ==0 and game.g_uncollected_garbage > tuning_constants.POLLUTION_GARBAGE_MEDIUM and game.g_population > tuning_constants.POPULATION_STEP_4 and game.g_num_cities_adjacent > 1" 
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea524032]]
a.message   = [[text@aa524037 Wherever you have Sims, you have trash, Mayor. But we don't need to live in it! We can do a trash export deal, and truck our refuse away! Just build a connecting road to the nearest town that can take our trash, and voila! No worries about ground water, no NIMBY complaints about incinerators, no testy talks with that utilities advisor. If you decide you want to take care of your own trash, be sure to build that landfill away from #city#'s developed areas!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL


--------- Advice record ----
--Sim Tempers Rise as Garbage Mounts
a = create_advice_environemt('ea711a6c')

a.trigger  = "game.g_uncollected_garbage > tuning_constants.POLLUTION_GARBAGE_MEDIUM  and game.l_uncollected_garbage_h > tuning_constants.POLLUTION_GARBAGE_HIGH and game.g_population > tuning_constants.POPULATION_STEP_3 "
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca52403a]]
a.message   = [[text@6a52403f Pedestrians are tripping over trash heaps, Mayor, and the rats are going wild. Let's not risk a plague! We have to get the garbage off the streets! Perhaps you need to build a new landfill far from the heart of our city. I would also recommend a talk with your utilities advisor about this situation.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB


--------- Advice record ----
--Garbage Gone: Sims Take Pride in Clean Streets
a = create_advice_environemt('4a711c40')

a.trigger  = "game.trend_delta(game_trends.G_TOTAL_GARBAGE_POLLUTION, 3) < 0 and game.g_uncollected_garbage < 100 and game.g_population > tuning_constants.POPULATION_STEP_4"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea524042]]
a.message   = [[text@0a524046 Nice work, Mayor! #city#'s day of looking like a dump are over! Sims are actually sweeping their sidewalks! A Keep #city# Clean Campaign has been started by our kindergartners, who have decided that you are their new hero. So put on that cape, Mayor, and give yourself a gold star for the good work!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

-------- Advice record ----
--Neighborhood Trash Problem Very Messy
a = create_advice_environemt('6a711c89')
a.trigger  = "game.l_uncollected_garbage_h > tuning_constants.POLLUTION_GARBAGE_HIGH and game.g_population > tuning_constants.POPULATION_STEP_6"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a524049]]
a.message   = [[text@aa52404d The ecosystem in <a href="#link_id#game.camera_jump(game.l_uncollected_garbage_h_subject)">this area</a> is getting seriously out of balance, Mayor #mayor#. Activist Flora Fauna says several species of moth may become non-existent in our fair city if we don't clean up the mounds of mess. Let's do lunch with the utilities advisor and get some consensus on this situation before angry locals start throwing this trash around!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL



------- Advice record ----
--Garbage for Bucks? Trash Deal on Table
a = create_advice_environemt('6a711d9d')
a.trigger  = "game.g_nd_count_import_garbage > 0 "
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@4a524052]]
a.message   = [[text@ea524056 Money for garbage is never a good idea, Mayor. Today's profits will be tomorrow's money pit. One of the areas you are considering as a new landfill is a breeding ground for boreal toads! Think about real profits, Mayor #mayor#. Build a park! Cancel the deal now!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL


--WATER POLLUTION
------- Advice record ----
--#city# Becoming a Green Dream
a = create_advice_environemt('2a711e57')

 a.trigger  = "game.g_water_source_count > 0 and game.trend_delta(game_trends.G_TOTAL_WATER_POLLUTION,tuning_constants.TREND_MEDIUM) < - 20 and game.trend_delta(game_trends.G_POPULATION,tuning_constants.TREND_MEDIUM) > 20 and game.g_population > tuning_constants.POPULATION_STEP_3"
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a52405b]]
a.message   = [[text@4a524060 Oh, you are growing a nice city, Mayor! Even though people are beginning to flock here, your policies have ensured that the water quality is improving! A true marriage of nature and civilization. Keep our town swimming in the best of both! Nice work!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

------- Advice record ----
--City Water Full of Filth
a = create_advice_environemt('4a711ee4')
a.trigger  = "game.g_water_source_count > 0 and game.ga_water_pollution > tuning_constants.GA_POLLUTION_HIGH and game.g_water_treatment_plant_count < 1 and game.g_water_consumed > 10000"
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6a524064]]
a.message   = [[text@4a524068 Have you got investments in the bottled water biz, Mayor #mayor#? The stench from the faucets is enough to put anyone off our H2O, and that's not the only thing that smells! I can't tell if our citizens are actually bathing in this sludge, or if they've just given up on the whole shower thing. Take care of this now, before our entire water system is hopelessly contaminated! Build some water treatment plants now!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

------- Advice record ----
--Is That---Brown? Water System Pollution Alleged
a = create_advice_environemt('0a711f54')
a.trigger  = "game.g_water_source_count > 0 and game.trend_delta(game_trends.G_TOTAL_WATER_POLLUTION, tuning_constants.TREND_MEDIUM) > 20 and game.trend_delta(game_trends.G_POPULATION,12) > 20 and game.g_population > tuning_constants.POPULATION_STEP_7"
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca52406c]]
a.message   = [[text@6a524070 #city# may be growing, Mayor #mayor#, but out water is dying. Pollution levels continue to climb, and now some Sims are wondering about what is coming out of the faucet. Clean our streams now, Mayor, or watch the city be taken over by pond scum! How about building some water treatment plants, or taxing high polluters?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB


------- Advice record ----
--H2O Outlook Cloudy
a = create_advice_environemt('4a711fbb')
a.trigger  = "game.g_water_source_count > 0 and game.trend_delta(game_trends.G_TOTAL_WATER_POLLUTION, tuning_constants.TREND_MEDIUM) > 10 and game.ga_water_pollution < tuning_constants.GA_POLLUTION_LOW and game.g_population > tuning_constants.POPULATION_STEP_4"
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a524075]]
a.message   = [[text@ea52407c Keep an eye on our water quality situation, Mayor. City data shows that pollution levels are rising. There's no serious threat yet, but if you stand idle, kids won't be catching tadpoles anywhere around #city#--although we may find some interesting microbial life in our sinks! Try a water treatment plant near the biggest pollution source]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------- Advice record ----
--Water Clears Up! Sims Celebrate!
a = create_advice_environemt('ea712031')
a.trigger  = "game.g_water_source_count > 0 and game.trend_delta(game_trends.G_TOTAL_WATER_POLLUTION, tuning_constants.TREND_LONG) < -30 and game.g_population > tuning_constants.POPULATION_STEP_7 and game.ga_water_pollution < tuning_constants.GA_POLLUTION_MEDIUM"
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a52407f]]
a.message   = [[text@2a524083 The earth and all her creatures smile on you, Mayor #mayor#. Activist Flora Fauna has arranged a vegan feast in your honor at the City Co-op. You have made our waters clean again. City maintenance workers are especially happy, "That bluish-brownish smell scum stuff that was on the fountains? We had to scour it with steel wool? It's gone, man. Thanks."]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

------- Advice record ----
--Sims and Salamanders Love Clean Water in #city#
a = create_advice_environemt('2a7122cc')
a.trigger  = "game.ga_water_pollution < tuning_constants.GA_POLLUTION_LOW and game.g_population > tuning_constants.POPULATION_STEP_3 and game.g_population < tuning_constants.POPULATION_STEP_5"
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a524087]]
a.message   = [[text@ea52408b Our salamander population is thriving, Mayor #mayor#, because you continue to keep our city waters crystalline. I even saw three newts in the city park pond yesterday! Amazing! Don't let that utilities advisor sway you into letting dirty industry change this lovely situation. Cheers! ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

------- Advice record ----
--Company Considers Bottling #city# H2O
a = create_advice_environemt('4a71237c')
a.trigger  = "game.g_water_source_count > 0 and game.ga_water_pollution < tuning_constants.GA_POLLUTION_LOW and game.g_population > tuning_constants.POPULATION_STEP_9"
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a524090]]
a.message   = [[text@6a524094 Mayor #mayor#, the Friends of Amphibious Matter (FOAM) and the Auto Washers for Clean Cars (AWCC) have joined forces to recognize you for your commitment to a pristine water supply. You are invited to a water-tasting/car-washing bash at Freddy's Auto Lube next week! Nice work, Mayor! ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB


------- Advice record ----
--Ailing Agua Needs Aid
a = create_advice_environemt('8a712401')
a.trigger  = "game.g_water_source_count > 0 and game.trend_delta(game_trends.G_TOTAL_WATER_POLLUTION, tuning_constants.TREND_LONG) > 25 and game.g_population > tuning_constants.POPULATION_STEP_8 and game.ga_water_pollution > tuning_constants.GA_POLLUTION_MEDIUM"
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a524097]]
a.message   = [[text@ca52409b Our water is crying out for your help, Mayor #mayor#! Can't you smell it? Check the pollution data to find the worst culprits, and build a water treatment facility right at the source. Be an eco-warrior, Mayor. Don't let dirty industry win this battle!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB

------- Advice record ----
--Water Bad, Budget Worse
a = create_advice_environemt('6a7124b2')
a.trigger  = "game.g_water_source_count > 0 and game.ga_water_pollution > tuning_constants.GA_POLLUTION_MEDIUM and game.trend_delta(game_trends.G_TOTAL_WATER_POLLUTION, tuning_constants.TREND_LONG) > 10 and game.g_funds < 15000 and game.g_borrowed < 2000000 and game.g_population > tuning_constants.POPULATION_STEP_4 "
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.message   = [[text@2a5240a3 Flora Fauna and your budget advisor almost came to blows last night, Mayor #mayor#! And Flora is a very peaceful spirit. I know #city# is not in good financial odor, but if we don't build a water treatment plant now, the stench from our fountains will make anything else smell like roses! I advise taking out a loan to build the plant. And raise taxes on polluters. We'll have funds for clean up that way!]]
a.title   = [[text@2a52409f]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

------- Advice record ----
--Pollution Paralyzes Pump
a = create_advice_environemt('6ac3c543')
a.trigger = "game.g_water_pollution_pump_shutdown_count > 0 and game.ga_water_pollution > 0"
a.frequency = tuning_constants.ADVICE_FREQUENCY_HIGH
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a5240a7 Pollution Paralyzes Pump]]
a.message   = [[text@0a5240aa Mayor #mayor#, a pumping station has been feeding pollution into our city's water supply! How could you let this happen? I have a court order which shuts this station down. This is a crime, Mayor! Until you address <a href="#link_id#game.window_data_map(map_window_types.WATER_POLLUTION)">the situation</a> by building a <a href="#link_id#game.tool_plop_building(building_tool_types.WATER_TREATMENT_PLANT)">water treatment plant</a>, or raise <a href="#link_id#game.window_budget(budget_window_types.TAXES)">taxes</a> as a punishment to profit-hungry industrialists, this station is pumping nothing but air!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB



--AIR POLLUTION

------- Advice record ----
--#city#: Where Everything Grows Except Smog
a = create_advice_environemt('ca7125dc')
a.trigger  = "game.ga_air_pollution < tuning_constants.GA_POLLUTION_MEDIUM and game.trend_delta(game_trends.G_POPULATION, tuning_constants.TREND_LONG) > tuning_constants.SLOPE_UP and game.trend_delta(game_trends.G_TOTAL_AIR_POLLUTION, tuning_constants.TREND_LONG) < -5 and game.g_population > tuning_constants.POPULATION_STEP_7 "
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aa5240ae]]
a.message   = [[text@0a5240b3  You have a biosphere brain, Mayor #mayor#. Souls continue to increase in count, but air quality has actually improved! If you keep this up, we can hold SimNation's Environmental Summits here! Oh, wouldn't that be the most lovely time! Nice Work!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB


------- Advice record ----
--Air Quality Bad: Breathing Not Recommended
a = create_advice_environemt('8a712863')
a.trigger  = "(game.ga_air_pollution > tuning_constants.GA_POLLUTION_HIGH and game.l_air_pollution_h >  tuning_constants.POLLUTION_HIGH) and game.g_population > tuning_constants.POPULATION_STEP_3"
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea5240b7]]
a.message   = [[text@0a5240bb  Air pollution is off the charts, Mayor #mayor#! Stores are selling gas masks just so people can go to work! Youngsters are practicing minimal breathing exercises at their indoor recesses. Do something now, Mayor! Plant some trees! Build some parks! Our birds have flown, Sims will too if they can't even take a safe breath!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB



------- Advice record ----
--City Skyline Missing: Smog is Culprit
a = create_advice_environemt('2a7128d3')
a.trigger  = "(game.ga_air_pollution > tuning_constants.GA_POLLUTION_MEDIUM and game.l_air_pollution_h > tuning_constants.POLLUTION_HIGH) and game.g_population < tuning_constants.POPULATION_STEP_5"
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.title   = [[text@ea5240c0]]
a.message   = [[text@0a5240c4  Mayor, look at your air pollution data! Even pigeons are developing asthma! Coo, cough, coo coo, cough, whoo whoo whoo. It's awful! Take action now before it's not safe to go outdoors! Trees, parks, anti-pollution ordinances! Please!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB

------- Advice record ----
--Certain Something in Air Ain't Love
a = create_advice_environemt('ca712973')
a.trigger  = "game.trend_delta(game_trends.G_TOTAL_AIR_POLLUTION, tuning_constants.TREND_LONG) > tuning_constants.SLOPE_UP_UP and game.g_population > tuning_constants.POPULATION_STEP_4 and game.ga_air_pollution < tuning_constants.GA_POLLUTION_HIGH"
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a5240c8]]
a.message   = [[text@2a5240d0  We could be romantic and pretend it's just atmosphere, Mayor #mayor#, but we know better. Air pollution is not yet severe, but we need to pay attention before it gets worse. Gas masks aren't conducive to smooching. How about a city-wide tree-planting project?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL


------- Advice record ----
--Air Fair Again: Sims Breathe Freely
a = create_advice_environemt('ca7129db')
a.trigger  = "game.trend_delta(game_trends.G_TOTAL_AIR_POLLUTION, tuning_constants.TREND_LONG) < tuning_constants.SLOPE_DOWN_DOWN and game.ga_air_pollution < tuning_constants.GA_POLLUTION_MEDIUM and game.g_population > tuning_constants.POPULATION_STEP_4 "
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a5240d6]]
a.message   = [[text@8a5240da  Whew. Nice to be able to do my Tai Chi at the park again, Mayor! Our air pollution is back to low levels. Nice work reversing the situation! Breathe in, release! Ahhhhh.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------- Advice record ----
--Sims Can See Forever in #city#'s Clean Air
a = create_advice_environemt('6a712aae')
a.trigger  = "game.l_air_pollution_h < tuning_constants.POLLUTION_LOW and game.ga_air_pollution <   tuning_constants.GA_POLLUTION_LOW and game.g_population > tuning_constants.POPULATION_STEP_3"
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a5240dd]]
a.message   = [[text@ca5240e1  Do yourself a favor, Mayor #mayor#. Lean out your window tomorrow morning, take a big deep breath of #city#'s pristine air, listen to birdsong, the buzz of bees, the pad pad pad of jogger's feet. Doesn't that renew your spirit? Ahhh. Mayor, as we build #city# keep our souls (and lungs) in mind.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

------- Advice record ----
--Activist Demands Equal Air Time
a = create_advice_environemt('4a712b0d')
a.trigger  = "game.l_air_pollution_h > tuning_constants.POLLUTION_MEDIUM or (game.ga_air_pollution < tuning_constants.GA_POLLUTION_MEDIUM and game.ga_air_pollution > tuning_constants.GA_POLLUTION_LOW) and game.g_population > tuning_constants.POPULATION_STEP_4"
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a5240f4]]
a.message   = [[text@8a5240f8  Flora Fauna, Environmental Activist, is demanding the city plant trees and build more parks to help clear the air, Mayor #mayor#. "A city needs green at it's heart," says Ms. Fauna. She's right--Let's do something about our moderate air pollution before it gets worse. Besides, Flora has clout.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL


------- Advice record ----
--Coal Plant Causes Curious Illness
a = create_advice_environemt('8a712b85')
a.trigger  = "game.random_chance(2) and game.g_power_plant_count_coal >0 and game.l_air_pollution_h > tuning_constants.POLLUTION_HIGH"
a.once = 1
--a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca5240fd]]
a.message   = [[text@ea524101  Mayor #mayor#, the Health and Education Advisor and I have co-authored a study on the local effects of this coal plant. I was actually interested in reports of three-headed frogs in the area, but we found that these reports came from Sims living near the plant who are delirious with illness. We haven't isolated the exact nature of the disease, but only Sims living within a mile of the plant have contracted it. Don't even ask your utilities advisor, Mayor! Bulldoze that plant now!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.persist = 1


------- Advice record ----
--Recycling Needs New Funds
a = create_advice_environemt('aa712c7f')
a.trigger  = "game.g_recycling_center_count > 0 and game.g_pollution_funding_p < tuning_constants.FUNDING_MEDIUM and game.g_uncollected_garbage > tuning_constants.POLLUTION_GARBAGE_MEDIUM"
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca52410d]]
a.message   = [[text@4a524111  The #city# Recycles! Festivals are going well, Mayor #mayor#--but our recycling infrastructure itself needs some retooling. This local recycling plant is not operating at top form, and could use some more funding. In fact, the city's recycling operations could use a funding boost overall to help reduce #city#'s garbage production. Festivals are great--but let's not forget the real work.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_LOW
a.mood = advice_moods.NEUTRAL

------- Advice record ----
--Pavement Don't Breathe: We Need Trees
a = create_advice_environemt('aa712dba')
a.trigger  = "game.g_population> tuning_constants.POPULATION_STEP_4 and ((game.g_num_parks/(game.g_num_rzone_ld_tiles + game.g_num_rzone_md_tiles + game.g_num_rzone_hd_tiles + game.g_num_czone_ld_tiles + game.g_num_czone_md_tiles + game.g_num_czone_hd_tiles + game.g_num_izone_r_tiles + game.g_num_izone_l_tiles + game.g_num_izone_h_tiles +game.g_road_tile_count + game.g_rail_tile_count + game.g_highway_tile_count + game.g_street_tile_count)) * 100)< 10"
--Need variable to count parks a percentage of all developed tiles
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
a.title   = [[text@4a5ff002]]
a.message   = [[text@2a5ff009  Are you paving paradise, Mayor #mayor#? You will have a city without harmony if your ratio of development to green space doesn't improve. Develop for the long run, Mayor! Plant some trees, and build more parks to bring our city back in line with the universe!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL




------------ Advice record ----
a = create_advice_environemt('2a62665f')

a.trigger  = "0"
a.once = 0
a.timeout =  tuning_constants.ADVICE_TIMEOUT_SHORT 
a.title   = "This is test for game UI"
a.message   = 
[[
== Network tools ==<br>
<a href="#link_id#game.tool_plop_network(network_tool_types.ROAD)">Roads</a>, 
<a href="#link_id#game.tool_plop_network(network_tool_types.PIPE)">Pipes</a>, 
<a href="#link_id#game.tool_plop_network(network_tool_types.HIGHWAY)">Highways</a>, 
<a href="#link_id#game.tool_plop_network(network_tool_types.SUBWAY)">Subways</a>, 
<a href="#link_id#game.tool_plop_network(network_tool_types.RAIL)">Rail roads</a>, 
<a href="#link_id#game.tool_plop_network(network_tool_types.POWER_LINE)">Power lines</a>,
<br> 

== Zone tools ==<br>
<a href="#link_id#game.tool_plop_zone(zone_tool_types.RESIDENTIAL_LD)">R-LD</a>, 
<a href="#link_id#game.tool_plop_zone(zone_tool_types.RESIDENTIAL_MD)">R-MD</a>, 
<a href="#link_id#game.tool_plop_zone(zone_tool_types.RESIDENTIAL_HD)">R-HD</a>, 
<a href="#link_id#game.tool_plop_zone(zone_tool_types.COMMERCIAL_LD)">C-LD</a>, 
<a href="#link_id#game.tool_plop_zone(zone_tool_types.COMMERCIAL_MD)">C-MD</a>, 
<a href="#link_id#game.tool_plop_zone(zone_tool_types.COMMERCIAL_HD)">C-HD</a>, 
<a href="#link_id#game.tool_plop_zone(zone_tool_types.INDUSTRIAL_RES)">I-Res</a>, 
<a href="#link_id#game.tool_plop_zone(zone_tool_types.INDUSTRIAL_LIGHT)">I-Light</a>, 
<a href="#link_id#game.tool_plop_zone(zone_tool_types.INDUSTRIAL_HEAVY)">I-Heavy</a>, 
<a href="#link_id#game.tool_plop_zone(zone_tool_types.LANDFILL)">Landfill</a>, 
<a href="#link_id#game.tool_plop_zone(zone_tool_types.DEZONE)">Dezone</a>,
<br>

== Building tools  ==<br>
<a href="#link_id#game.tool_plop_building(building_tool_types.LOCAL_PRECINCT_4CAR)">4 Car police station</a>, 
<a href="#link_id#game.tool_plop_building(building_tool_types.STATION_HOUSE_4ENGINE)">4 Eng fire house</a>, 
<a href="#link_id#game.tool_plop_building(building_tool_types.SMALL_SCHOOL)">Small school</a>, 
<a href="#link_id#game.tool_plop_building(building_tool_types.CITY_COLLEGE)">City college</a>, 
<a href="#link_id#game.tool_plop_building(building_tool_types.AIRPORT_MUNICIPAL_PHASE1)">Municipal airport</a>, 
<a href="#link_id#game.tool_plop_building(building_tool_types.MAYORS_STATUE)">Mayor's statue</a>, 
<a href="#link_id#game.tool_plop_building(building_tool_types.INCINERATOR)">Incinerator</a>, 
<a href="#link_id#game.tool_plop_building(building_tool_types.WATER_TOWER)">Water tower</a>, 
<a href="#link_id#game.tool_plop_building(building_tool_types.OIL_POWER)">Oil power</a>, 
<br>

== Flora tools  ==<br>
<a href="#link_id#game.tool_plop_flora(flora_tool_types.OAK_TREE)">Oak tree</a> 
<br>

== Button tools  ==<br>
<a href="#link_id#game.tool_button(button_tool_types.DEMOLISH)">Demolish</a>,
<a href="#link_id#game.tool_button(button_tool_types.POLICE_DISPATCH)">Police dispatch</a>,
<a href="#link_id#game.tool_button(button_tool_types.FIRE_DISPATCH)">Fire dispatch</a>
<br>

== Budget windows ==<br>
<a href="#link_id#game.window_budget(budget_window_types.MAIN_SMALL)">Main small</a>, 
<a href="#link_id#game.window_budget(budget_window_types.MAIN_LARGE)">Main large</a>, 
<a href="#link_id#game.window_budget(budget_window_types.TAXES)">Taxes</a>, 
<a href="#link_id#game.window_budget(budget_window_types.PUBLIC_SAFETY)">Public safety</a>, 
<a href="#link_id#game.window_budget(budget_window_types.LOAN)">Loan</a>, 
<br>

== Map window ==<br>
<a href="#link_id#game.window_map(map_window_types.LAND_VALUE)">Land value map</a>, 
<a href="#link_id#game.window_map(map_window_types.POLICE)">Police map</a>, 
<a href="#link_id#game.window_map(map_window_types.WATER)">Water map</a>, 
<a href="#link_id#game.window_map(map_window_types.POWER)">Power map</a>, 
<br>

== Query window ==<br>
<a href="#link_id#game.window_query(game.l_fire_station_no_roads_subject)">No access fire station</a>, 
<a href="#link_id#game.window_query(game.l_police_no_roads_subject)">No access police station</a>, 
<br>

== Graph window ==<br>
<a href="#link_id#game.window_graph(graph_window_types.POWER)">Show power graph</a>, 
<a href="#link_id#game.window_graph(graph_window_types.TRAFFIC)">Show traffic graph</a>, 
<br>

== Misc ==<br>
<a href="#link_id#game.retire_advice()">Retire this advice </a>, 
<a href="#link_id#game.expire_advice()">Expire this advice </a>, 
date #d@game.g_date# day #s@game.g_day# month #s@game.g_month# year #s@game.g_year#, 
<br>

]]
a.priority  = 40
a.mood = advice_moods.GREAT_JOB



------------ Advice record ----
a = create_advice_environemt('4a355b2f')

a.trigger  = "0"
a.once = 0
a.timeout =  tuning_constants.ADVICE_TIMEOUT_SHORT 
a.title   = "This is a test for rewards/business deal type of messages."
a.message   = 
[[ 
You have been rewarded a City College building. Would you like to place it in your city now?<br>
<a href="#link_id#game.tool_plop_building(building_tool_types.CITY_COLLEGE);game.retire_advice()">Yes</a><br><a href="#link_id#game.retire_advice()">No</a>
]]
a.priority  = 40
a.mood = advice_moods.GREAT_JOB

--------------------------------------------------------------------
-- This will try to execute triggers for all registerd advices 
-- to make sure they don't have any syntactic errors.

if (_sys.config_run == 0)
then
   advices : run_triggers()
end




