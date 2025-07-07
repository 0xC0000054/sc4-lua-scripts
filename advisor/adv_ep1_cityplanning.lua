-----------------------------------------------------------------------------------------
-- This file defines advices for the the CITY PLANNING
dofile("adv_cityplanning.lua") 

--------------------------------------------------------------------
-- Add EP1 specific advice in this section.
-- 

------------ Advice record ----
--Roads Rule In #city#, But Streets Becoming Endangered
a = create_advice_cityplanning('2bfef580')
a.trigger  = "game.g_avenue_tile_count + game.g_road_tile_count > 1.5 * game.g_street_tile_count and game.g_city_rci_population < 85000 and game.g_road_tile_count > 250"
--when the proportion of the number of road tiles to the number of street tiles is high, and the population is still not large 
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@cbf0385c	Roads Rule in #city#, but Streets Becoming Endangered]]
a.message   = [[text@ebf03871	I'm glad to see you appreciate the benefits of roads over streets, Mayor. I too love the smell of asphalt in the morning. But I have to object to your tendency to turn so many otherwise quiet streets over to car traffic. Local neighborhoods object to the the increase in faster traffic, and I'm sure your Finance Advisor is none too pleased with the <a href="#link_id#game.window_budget(budget_window_types.TRANSPORT1)">extra maintenance costs</a> roads incur. My advice is to use roads only when traffic levels require them, and give back the streets back to the sims.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB


--------------------------------------------------------------------
-- This will try to execute triggers for all registerd advices 
-- to make sure they don't have any syntactic errors.

if (_sys.config_run == 0)
then
   advices : run_triggers()
end
