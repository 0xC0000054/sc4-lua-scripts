-----------------------------------------------------------------------------------------
-- This file defines advices for the the UTILITIES
dofile("adv_utilities.lua") 

-- helper funcition
function create_advice_neighbor_deal(guid_string)
   local a =  create_advice_utilities(guid_string)
   a.class_id = hex2dec('6a3848db') -- the class ID for neighbor deal advice objects
   a.trigger  = "1"
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
-- nd_type  = ... : one of the value from "neighbor_deal_types" table

-- Tokens used by the the neighbor deal messages are as follows
-- %nd_city%    :     neighbor's city
-- %nd_amount%    :     deal amount
-- %nd_cost%    :     deal cost

-- Deal types are defined in the table "neighbor_deal_types" found adv_const.lua. 
-- Look at the example below to what your messages will look like.

------------ Test Advice record ----

a = create_advice_neighbor_deal('6a3936fc')

a.trigger  = "0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "You city connections with city #nd_city# suck."
a.message   = [[You have lost your power connection with #nd_city#.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.event = game_events.NEIGHBOR_DEAL_DEFAULTED_CONNECTION
a.nd_type  = neighbor_deal_types.BUYPOWER 
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW

------------ Advice record ----
--ND_city takes trash for cash  uggesting sell deal for trash.  Neighbor city has excess capacity and no trash deal exists yet.
a = create_advice_neighbor_deal('6a5e1345')

--trigger:  City garbage capacity high, neighbor city garbage capacity low, road connection exists, and no trash deal exists yet.
a.trigger  = "game.g_nd_can_export_garbage >0 and game.g_nd_count_export_garbage < 1 and game.g_nd_count_import_garbage < 1 and game.g_city_rci_population > tuning_constants.POPULATION_STEP_5"
--a.trigger = "game.g_nd_connection_present_garbage > 0 and game.g_nd_can_export_garbage > 0"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a501f9e SC4_ADV_utl_NDGarbage002_Hdl ND_city takes trash for cash]]
a.message   = [[text@4a501fb5 SC4_ADV_utl_NDGarbage002_Msg Lets talk trash:...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL
a.nd_type  = neighbor_deal_types.EXPORTGARBAGE 
a.frequency = tuning_constants.ADVICE_FREQUENCY_VERY_LOW

------------ Advice record ----
--Relieve Rubbish Cries  Garbage buy deal.  City has capacity and neighbor has excess trash
a = create_advice_neighbor_deal('8a5e1355')

--trigger: city has garbage capacity > X, neighbor city has capacity < Y, road connection exists.
a.trigger  = "game.g_nd_can_import_garbage > 0 and game.g_nd_count_export_garbage < 1 and game.g_nd_count_import_garbage < 1"
--a.trigger = "game.g_nd_connection_present_garbage > 0 and game.g_nd_can_import_garbage > 0"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a501fd2 SC4_ADV_utl_NDGarbage004_Hdl Relieve Rubbish Cries]]
a.message   = [[text@6a501fdd SC4_ADV_utl_NDGarbage004_Msg It might sound trashy...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.GREAT_JOB
a.nd_type  = neighbor_deal_types.IMPORTGARBAGE 
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW


------------ Advice record ----
--We don't need your stinkin trashes  defaulted on trash sell deal, not enough money to pay for the export.
a = create_advice_neighbor_deal('aa5e135b')

--trigger:  event and nd_type triggered, should always trigger under these conditions (do we need to check the game funds level?)
trigger = "1"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca501fe6 SC4_ADV_utl_NDGarbage005_Hdl We don't need your stinkin trashes]]
a.message   = [[text@0a501ff1 SC4_ADV_utl_NDGarbage005_Msg I guess it's clothespin time...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB
a.event = game_events.NEIGHBOR_DEAL_DEFAULTED_PAYMENT
a.nd_type  = neighbor_deal_types.EXPORTGARBAGE 
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW


------------ Advice record ----
--No Room At The Inn  defaulted on trash buy deal, not enough garbage processing capacity
a = create_advice_neighbor_deal('ca5e1361')

--Garbage buy deal defaulted due to lack of capacity, always trigger under the event and nd conditions
trigger = "1"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a502030 SC4_ADV_utl_NDGarbage006_Hdl No Room At The Inn]]
a.message   = [[text@2a502040 SC4_ADV_utl_NDGarbage006_Msg Trash Deal Done, Well it was probably...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.ALARM
a.event = game_events.NEIGHBOR_DEAL_DEFAULTED_CONNECTION
a.nd_type  = neighbor_deal_types.IMPORTGARBAGE 
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW


------------ Advice record ----
--No Highway, No Haulaway Deal Trashed  Road condition lost with trash deal neighbor
a = create_advice_neighbor_deal('0a5e1366')

--trigger:  neighbor deal exists and road connection lost (what's the order - if roads destroyed, then neighbor deal automatically cancelled?  Also, do we need to check for roads destroyed due to maintenance?)
a.trigger = "1"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a502049 SC4_ADV_utl_NDGarbage007_Hdl No Highway, No Haulaway Deal Trashed]]
a.message   = [[text@ca502053 SC4_ADV_utl_NDGarbage007_Msg Dagnabbit Mayor, bad road maintenance]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB
a.event = game_events.NEIGHBOR_DEAL_DEFAULTED_CONNECTION
a.nd_type  = neighbor_deal_types.IMPORTGARBAGE 
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW



------------ Advice record ----
--Sell deal re-eval period comes due, the deal price changes.
a = create_advice_neighbor_deal('0a5e136c')

--trigger:  re-eval event happens.  Cannot check the price changes, though -- must issue advice upon the event.
a.trigger = "1"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca50205f SC4_ADV_utl_NDGarbage008_Hdl Dumping Dollars Rate Change]]
a.message   = [[text@8a502069 SC4_ADV_utl_NDGarbage008_Msg ND city is talking trash again.  They want to change...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.event = game_events.NEIGHBOR_DEAL_RENEW
a.nd_type  = neighbor_deal_types.IMPORTGARBAGE 
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW


------------ Advice record ----
--Buy Deal Re-eval period comes due, new trash deal terms demanded
a = create_advice_neighbor_deal('0a5e1372')

--trigger: neighbor deal comes up for renewal -- issue advice (there are no triggers for new terms - renewal is just a process.  Might need additional triggers to separate this advice from the one above)
a.trigger = "1"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6a502079 SC4_ADV_utl_NDGarbage009_Hdl Trashy Terms up for negotiation]]
a.message   = [[text@ca502083 SC4_ADV_utl_NDGarbage009_Msg Get a load of this...]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.event = game_events.NEIGHBOR_DEAL_RENEW
a.nd_type  = neighbor_deal_types.IMPORTGARBAGE 
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW




------------ Advice record ----
--City garbage capacity at 0 excess, cancel the import deal
a = create_advice_neighbor_deal('0a62694a')

--trigger:  City garbage capacity < 0, trash import deal exists
a.trigger = "(game.g_incinerator_capacity_daily + game.g_waste_to_energy_capacity_daily + game.g_available_landfill_capacity) < 0 and game.g_nd_count_import_garbage > 0"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea50d8cd SC4_ADV_utl_NDGarbage010_Hdl]]
a.message   = [[text@4a50d8d5 SC4_ADV_utl_NDGarbage010_Msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB
a.nd_type  = neighbor_deal_types.IMPORTGARBAGE
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW



------------ Advice record ----
--Stash Trash No More -Import trash deal exacerbates city's trash problem.  Cancel the deal
a = create_advice_neighbor_deal('2a626956')

--trigger:  Garbage capacity less than 10% and trash import deal exists
a.trigger = "game.g_nd_count_import_garbage > 0 and (game.g_incinerator_capacity_daily + game.g_waste_to_energy_capacity_daily + game.g_available_landfill_capacity) < 10"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a50d8bd SC4_ADV_utl_NDGarbage011_Hdl]]
a.message   = [[text@2a50d8c4 SC4_ADV_utl_NDGarbage011_Msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL
a.nd_type  = neighbor_deal_types.IMPORTGARBAGE 
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW



------------ Advice record ----
--Nbr City Pleadiung for Power Sell Deal, city has excess power, neighbor city needs power and power connection exists
a = create_advice_neighbor_deal('ea5e137f')

--trigger:  city excess power > X and a power connection exists and a sell deal exists -- cannot check for the neighbor city's power situation.
a.trigger = "game.g_nd_can_sell_power > 0 and game.g_nd_count_buy_power <1 and game.g_nd_count_sell_power <1"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a501cd7 SC4_ADV_utl_NDPow002_Hdl]]
a.message   = [[text@ca501ce5 SC4_ADV_utl_NDPow002_Mes]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.nd_type  = neighbor_deal_types.SELLPOWER 



------------ Advice record ----
a = create_advice_neighbor_deal('ea5e138d')

--trigger:  city power consumption < power capacity and power connection exists and a buy deal exists
a.trigger  = "game.g_nd_connection_present_power > 0  and game.g_nd_count_buy_power > 0 and game.g_power_production_capacity +game.g_power_imported < game.g_power_consumed +game.g_power_exported"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca501d2c SC4_ADV_utl_NDPow004_Hdl]]
a.message   = [[text@2a501d3d SC4_ADV_utl_NDPow004_Mes]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.nd_type  = neighbor_deal_types.BUYPOWER 
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW



------------ Advice record ----
--Nbr Quashes Poer Pledge!
a = create_advice_neighbor_deal('2a5e1394')

--trigger: defaulted neighbor deal due to lack of capacity -- trigger all the time upon the event
a.trigger  = "1"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a501d48 SC4_ADV_utl_NDPow005_Hdl]]
a.message   = [[text@4a501d55 SC4_ADV_utl_NDPow005_Mes]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB
a.event = game_events.NEIGHBOR_DEAL_DEFAULTED_DELIVERY
a.nd_type  = neighbor_deal_types.BUYPOWER 
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW



------------ Advice record ----
-- No Dough = No Go - Buy deal defaulted due to city's inability to pay
a = create_advice_neighbor_deal('aa5e1399')

--trigger:  event default due to non-payment -- trigger all the time upon the event
a.trigger  = "1"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a501d5f SC4_ADV_utl_NDPow006_Hdl]]
a.message   = [[text@2a501d6a SC4_ADV_utl_NDPow006_Mes]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB
a.event = game_events.NEIGHBOR_DEAL_DEFAULTED_PAYMENT
a.nd_type  = neighbor_deal_types.BUYPOWER 
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW



------------ Advice record ----
-- No Correction on Bad Connection - Power lines kaput, connection between cities have been lost so the power deal is off (the defaulted connection event happens for both buy and sell power deals -- do we need another piece of advice to handle the other one?)
a = create_advice_neighbor_deal('ea5e13a0')

--trigger:  lost connection -- tigger all the time upon the event
a.trigger  = "1"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea501d75 SC4_ADV_utl_NDPow007_Hdl]]
a.message   = [[text@4a501d7d SC4_ADV_utl_NDPow007_Mes]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB
a.event = game_events.NEIGHBOR_DEAL_DEFAULTED_CONNECTION
a.nd_type  = neighbor_deal_types.BUYPOWER 
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW



------------ Advice record ----
-- Sell Deal Renewal
a = create_advice_neighbor_deal('0a5e13a5')

--trigger:  sell deal renewal event happens -- always trigger upon event
a.trigger  = "1"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca501d87 SC4_ADV_utl_NDPow008_Hdl]]
a.message   = [[text@6a501d98 SC4_ADV_utl_NDPow008_Mes]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.event = game_events.NEIGHBOR_DEAL_RENEW
a.nd_type  = neighbor_deal_types.SELLPOWER 
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW



------------ Advice record ----
-- Offering a buy deal -- take it?
a = create_advice_neighbor_deal('ea5e13ae')

-- trigger:  power connection exists, buy deal exists and city needs power.
a.trigger  = "game.g_nd_can_buy_power > 0 and game.g_nd_count_buy_power < 1 and game.g_nd_count_sell_power < 1"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea501da3 SC4_ADV_utl_NDPow009_Hdl]]
a.message   = [[text@aa501de0 SC4_ADV_utl_NDPow009_Mes]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.nd_type  = neighbor_deal_types.BUYPOWER 


------------ Advice record ----
-- Nbr Power Sale Threatens Power Supply - City is experiencing a power shortage, so consider cancelling the sell deal in existence
a = create_advice_neighbor_deal('ea6269ac')

-- trigger:  City power capacity can't keep up with the demand and sell power deal exists.
a.trigger  = "game.g_nd_count_sell_power > 0  and (game.g_power_production_capacity+game.g_power_imported)*.9 < game.g_power_consumed"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca501ca8 SC4_ADV_utl_NDPow013_Hdl]]
a.message   = [[text@0a501cb3 SC4_ADV_utl_NDPow013_Mes]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.nd_type  = neighbor_deal_types.BUYPOWER 


------------ Advice record ----
-- City has excess water - consider selling to a neighbor
a = create_advice_neighbor_deal('4a5e140a')

--trigger:  water plants exist and city water capacity >  twice the demand and connection exists and can sell deal exists
a.trigger  = "game.g_nd_can_sell_water >0 and game.g_nd_count_sell_water < 1 and game.g_nd_count_buy_water < 1"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea501e28 SC4_ADV_utl_NDWater002_Hdl]]
a.message   = [[text@ea501e34 SC4_ADV_utl_NDWater002_Msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.nd_type  = neighbor_deal_types.SELLWATER 



------------ Advice record ----
--Nbr Promises Rain - Neighbor city offers to sell water -- accept a buy deal?
a = create_advice_neighbor_deal('ca5e1418')

--trigger:  city water capacity less than demand, water facility exists, water connection exists and buy deal has been offered
a.trigger  = "game.g_nd_can_buy_water > 0 and game.g_nd_count_sell_water < 1 and game.g_nd_count_buy_water < 1  and game.g_water_production_capacity < 1.05 * game.g_water_consumed"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a501e59 SC4_ADV_utl_NDWater004_Hdl]]
a.message   = [[text@ca501e9b SC4_ADV_utl_NDWater004_Msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.nd_type  = neighbor_deal_types.BUYWATER 


------------ Advice record ----
-- Deal with Nbr Goes Dry - Sell deal cancelled due to failure to deliver
a = create_advice_neighbor_deal('6a5e141c')

--trigger:  sell deal defaulted through non-delivery --always trigger on this event
a.trigger  = "1"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a501eaf SC4_ADV_utl_NDWater005_Hdl]]
a.message   = [[text@2a501f27 SC4_ADV_utl_NDWater005_Msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.NEUTRAL
a.event = game_events.NEIGHBOR_DEAL_DEFAULTED_DELIVERY
a.nd_type  = neighbor_deal_types.SELLWATER 
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW



------------ Advice record ----
-- Broken Lines Mean Broken contract - Broken Water lines cancels water deal (this is for a buy water deal, do we need one for a sell water deal too?)
a = create_advice_neighbor_deal('ca5e1421')

--trigger:  Defaulted connection event -- always trigger on the event
a.trigger  = "1"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca501f42 SC4_ADV_utl_NDWater006_Hdl]]
a.message   = [[text@ea501f4a SC4_ADV_utl_NDWater006_Msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.NEUTRAL
a.event = game_events.NEIGHBOR_DEAL_DEFAULTED_CONNECTION
a.nd_type  = neighbor_deal_types.BUYWATER 
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW



------------ Advice record ----
--Renewal of a sell water deal event happens -- advise player to consider renewal terms
a = create_advice_neighbor_deal('ea5e1425')

--trigger: deal renewal event happens -- always trigger on the event
a.trigger  = "1"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a501f53 SC4_ADV_utl_NDWater007_Hdl]]
a.message   = [[text@aa501f5d SC4_ADV_utl_NDWater007_Msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.event = game_events.NEIGHBOR_DEAL_RENEW
a.nd_type  = neighbor_deal_types.SELLWATER 
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW



------------ Advice record ----
-- Buy Deal renewal event happens -- advise player to consider terms
a = create_advice_neighbor_deal('ca5e142d')

--trigger:  deal renewal happens -- always trigger advice on the event
a.trigger  = "1"

a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aa501f6a SC4_ADV_utl_NDWater008_Hdl]]
a.message   = [[text@8a501f73 SC4_ADV_utl_NDWater008_Msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.event = game_events.NEIGHBOR_DEAL_RENEW
a.nd_type  = neighbor_deal_types.BUYWATER 
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW



------------ Advice record ----
-- Shut off the valve - City no longer has the excess capacity, advise canceling the deal
a = create_advice_neighbor_deal('aa626a77')

--trigger:  water capacity < 1.1 * demand and sell water deal exists and water buildings exist
a.trigger  = "game.g_nd_count_sell_water > 0 and game.g_water_production_capacity*.9 < game.g_water_consumed"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a502465 SC4_ADV_utl_NDWater009_Hdl]]
a.message   = [[text@aa50246f SC4_ADV_utl_NDWater009_Msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.nd_type  = neighbor_deal_types.SELLWATER


------------ Advice record ----
--Excess capacity exists -- advise a deal to sell the water to a neighbor
a = create_advice_neighbor_deal('8a626a84')
a.trigger  = "0"
--a.trigger  = "game.g_nd_can_sell_water > 0"
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a502401 SC4_ADV_utl_NDWater010_Hdl]]
a.message   = [[text@6a50240a SC4_ADV_utl_NDWater010_Msg]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.nd_type  = neighbor_deal_types.SELLWATER


--------------------------------------------------------------------
-- This will try to execute triggers for all registerd advices 
-- to make sure they don't have any syntactic errors.

if (_sys.config_run == 0)
then
   advices : run_triggers()
end


