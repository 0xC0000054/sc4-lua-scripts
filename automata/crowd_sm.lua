--
-- crowd_sm.lua
--

dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua")

   -----------------crowd SECTION -----------------------------
---Attractor Section ==============================
--~ attractor.sim_pull = 
--~ {
	--~ -- attraction strength from -100 to 100 (negative values repel)
	--~ strength = 10,
	--~ radius = 30,					-- influence radius, in meters
	--~ automata = { "sim" },		-- automata_groups this attractor affects
--~ }
--=============== Generator =============================
generator.crowd_sm = 
{
      automata = { "sim","child",},						-- create crowd sims
      count = 2,
      rate =5,										-- ...X times per...
      rate_scale = RateScale.PER_HOUR,	-- ...game minute
      max_count= 5,
      radius = { 1, 6 },

         ignore_lot = true, 
         time_of_day = {
         [8.1] = 0.0,   -- 
         [9.5] = 1.0,   -- 
          [19.5] = 1.0,   -- 
         [21.0] = 0.0,   -- 
         },

       behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {
                  state = BehaviorState.RANDOM_WALK,
                  sfx = { SFX.Automata_Park_Crowd},
                  random_walk =
                        {
                           kph = { 4, 7},
                           delay = { 0.5, 3 },
                           turn = { 0.1, 0.35 },
                           idle_delay = { 1, 4 },
                           idle_time = { 0.1, 1 },
                           strength = 0.5,
                           acceleration = 0.2,
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

occupant_group.crowd_small = 
{
	group_id = "0x1923",		-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	controllers = {
		"crowd_sm",
		},
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
