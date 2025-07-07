--
-- kidcrowd.lua
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
generator.crowd_sim = 
{
      automata = { "sim" },						-- create crowd sims
      count = 1,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count= 30,
      radius = { 2, 4 },
      --~ lifetime = 60,
       behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {
                  state = BehaviorState.RANDOM_WALK,
                  sfx = { SFX.Automata_ThemeparkWalla},
                  random_walk =
                        {
                           kph = { 2,12},
                           delay = { 2, 5 },
                           turn = { 0.2, 0.1 },
                           idle_delay = { 1, 4 },
                           idle_time = { 0.1, 1 },
                           strength = 0.5,
                           acceleration = 0.2,
                           deceleration = 0.5,
                        },
                  timeout = 30,
                  ignore_roads = true,
                  ignore_paths = true,
                  final = true,
                  },
      },
}  ---------------------------------------------------------------------------------------
-- Finally, create a "school" occupant group with attached attractor & generator

occupant_group.simcrowd = 
{
	--~ group_id = "0x150B",		-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	controllers = {
		"crowd_sim",
		--~ "sim_pull",
		},
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
verify_all_templates()
