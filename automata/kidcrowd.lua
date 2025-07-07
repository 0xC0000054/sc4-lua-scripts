--
-- kidcrowd.lua
--

dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua")

   -----------------crowd SECTION -----------------------------

--=============== Generator =============================
generator.crowd_child = 
{
      automata = { "child" },						-- create crowd sims
      count = 2,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count= 5,
      radius = { 1, 2 },
      --~ lifetime = 60,
      --~use_lot_center = true,
      ignore_lot = true, 
       behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {
                  state = BehaviorState.RANDOM_WALK,
                  anims = {"run","panic_run" },
                  sfx = { SFX.Automata_KidsPlay},
                  random_walk =
                        {
                           kph = { 8,20},
                           delay = { .1, .5 },
                           turn = { 0.8, 0.2 },
                           idle_delay = { .1, 2 },
                           idle_time = { 0.1, 1 },
                           strength = 0.10,
                           acceleration = 0.2,
                           deceleration = 0.5,
                        },
                  timeout = 6,
                  ignore_roads = true,
                  ignore_paths = true,
                  ignore_attractors = true,
                  final = true,
                  },
      },
}  
---------------------------------------------------------------------------------------
-- Finally, create a "school" occupant group with attached attractor & generator

occupant_group.kidcrowd = 
{
	group_id = "0x1922",		-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	controllers = {
		"crowd_child",
		},
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
