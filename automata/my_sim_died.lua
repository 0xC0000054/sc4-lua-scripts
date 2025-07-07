--
-- my_sim_died.lua
--

dofile("_templates.lua")
dofile("vehicles.lua")
   -----------------my_sim_died SECTION -----------------------------
attractor.my_sim_died_pull = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 100,
	radius = 50,					-- influence radius, in meters
	automata = { "hearse" },		-- automata_groups this attractor affects
   lifetime = 10,
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{
         radius =12,
			state = BehaviorState.IDLE,
			timeout = 15,
		},
  },
}
-- create a generator that creates my_sim_died trucks at the edge of the lot.
generator.my_sim_died_in = 
{
      automata = { "hearse" },						-- create my_sim_died trucks
      count = 1,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=1,
      lifetime = 5,
      -- generate at random distances between 1 and 7 meters away.
      radius = { 22,25 },
      follow_roads = true,
}

   ---------------------------------------------------------------------------------------
-- Finally, create an  occupant group with attached attractor & generator

occupant_group.my_sim_died =   ---- this is the building group name
{
	controllers = {
		"my_sim_died_pull",
		"my_sim_died_in",
		},
}

-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--verify_all_templates()
