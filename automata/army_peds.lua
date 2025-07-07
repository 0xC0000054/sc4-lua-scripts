--
-- armybase_peds.lua
--

dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua") 


--=============== In Base Generator =============================
generator.inbase_walk = 
{
      automata = {"army_sims"},						-- create crowd sims
      count = 1,
      rate =5,										-- ...X times per...
      rate_scale = RateScale.PER_HOUR,	-- ...game minute
      max_count= 3,
      radius = { 1, 3 },
         ignore_lot = true, 
      time_of_day = {
         [5.1] = 0.1,   -- 
         [6.5] = 1.0,   -- 
          [17.5] = 1.0,   -- 
         [20.0] = 0.1,   -- 
         },
      --~ lifetime = 60,
       behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {
                  state = BehaviorState.RANDOM_WALK,
                  --~ sfx = { SFX.Automata_WallaMedium},
                  random_walk =
                        {
                           kph = { 5, 10},
                           delay = { 1, 3},
                           turn = { 0.0125, 0.25 },
                           idle_delay = { 10, 20 },
                           idle_time = { 0.1, 2.11 },
                           strength = 0.5,
                           acceleration = 1.0,
                           deceleration = 0.5,
                        },
                  timeout = 15,
                  ignore_roads = true,
                  ignore_paths = true,
                  final = true,
                  },
      },
}  
   ---------------------------------------------------------------------------------------
-- Finally, create an  occupant group with attached attractor & generator

occupant_group.armybase_peds =   ---- this is the building group name
{
	 group_id = "0x1931",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	
	controllers = {
      "inbase_walk",
      },
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
