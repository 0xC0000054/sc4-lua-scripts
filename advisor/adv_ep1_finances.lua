-----------------------------------------------------------------------------------------
-- This file defines advices for the the FUNANCE
dofile("adv_finances.lua") 

--------------------------------------------------------------------
-- Add EP1 specific advice in this section.
-- 

------------ Advice record ----
a = create_advice_finances('6bfecddb')
a.trigger  = "0"
--"game.g_dirtroad_tile_count == 0 and game.g_city_rci_population < 3000 and (game.g_city_r1_population/game.g_city_r_population) > .8"
a.once = 1
--once, early in a city's development, if no dirt roads used yet and % of R$ to R is high
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2bf03849	Dirt Roads Are Dirt Cheap]]
a.message   = [[text@0bf0384d	To me, pavement is a wonderful thing - the hard smooth surface, the extreme heat on a summers day. But it can be costly to create and maintain. If you are looking to save a few simoleons you might consider <a href="#link_id#game.tool_plop_network(network_tool_types.DIRT_ROAD)">dirt roads</a> as an alternative. There's something special about the bumpy ride and billows of dust that only an unpaved path can provide. And what a boon to our local car wash owners!]]
a.priority  =tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
--Rapid Transit System Rapidly Losing City Money
a = create_advice_finances('cbf18d6a')
a.trigger  = "(game.g_elevated_station_count + game.g_subway_station_count) > 1 and (game.g_subway_tile_count + game.g_elevated_rail_tile_count) > 5 and game.g_population < tuning_constants.POPULATION_STEP_6 and (game.trend_value(game_trends.G_FUNDS,4)*1000)-game.g_funds > 2000 and game.g_funds < 50000"
--plenty of transit tiles and at least 2 station and transit use is low and population is small  
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@abf03909	Rapid Transit System Rapidly Losing City Money]]
a.message   = [[text@2bf0390d	I took rapid transit to work today, Mayor, and I had no trouble getting seat. In fact, I was the only passenger! I'm afraid that your ambitions have proven to be a huge boondoggle for #city#, and that it is simply much more than this city's feeble population merits. Our sims children and grandchildren will be paying dearly for this expensive.... <i>toy</i> of yours! I say, <a href="#link_id#game.tool_button(button_tool_types.DEMOLISH)">tear it down</a> before it costs us everything. Everything!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
--Traffic Takes Toll, Toll Might Take Traffic Back
a = create_advice_finances('ec0c44bc')
a.trigger  = "0"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0c044591	Traffic Takes Toll, Toll Might Take Traffic Back]]
a.message   = [[text@2c044595 	Mayor, I was in morning traffic today and thinking about our current budget problems. I remember thinking, "If we had a simoleon for every time some nutty driver cut me off…" and I thought, "Maybe we can!" To make extra money for the budget, you could install <a href="#link_id#game.tool_plop_building(building_tool_types.TOLLBOOTH)">tollbooths</a> along busy roads. It won't solve our traffic problems, but at least we'll have more money to spend!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

----------- Reward record Area 51 type lot ----
a = create_reward_finances('03960000')
function a.condition()
--if (missions_completed( { '6c1430d1', '4c1431fe', '0c1432d0', '4c172d73'} ) or game.g_funds > 20000 or game.difficulty_level() < game_difficulty_level.HARD or game.g_city_rci_population < 15500) then
--if (not missions_completed( { '6c1430d1', '0c1432d0', '4c172d73'} ) and ( game.g_funds > 20000 or game.difficulty_level() < game_difficulty_level.HARD or game.g_city_rci_population < 15500 or game.trend_value(game_trends.G_FUNDS,4) > -3000  or game.reward_instance_count('03960000')== 1)) then
if ((game.reward_instance_count('03960000') > 0) or (not missions_completed( { '6c1430d1', '0c1432d0', '4c172d73'} ) and ( game.g_funds > 20000 or game.difficulty_level() < game_difficulty_level.HARD or game.g_city_rci_population < 15500 or (game.trend_value(game_trends.G_FUNDS,4)*1000) - game.g_funds < 3000))) then
		return reward_state.HIDDEN
	else
		return reward_state.AVAILABLE
	end
end
a.timeout = tuning_constants.ADVICE_TIMEOUT_LONG
--a.frequency = 365
a.title   = [[text@cc02a3e4 Dr. Vu Proposes a Sinister Deal]]
a.message  = [[text@ac02a3e9]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.BAD_JOB
a.persist = 1
a.once = 1

--------------------------------------------------------------------
-- This will try to execute triggers for all registerd advices 
-- to make sure they don't have any syntactic errors.

if (_sys.config_run == 0)
then
   advices : run_triggers()
end
