--
-- my_sim_removed.lua
--
dofile("_templates.lua")
dofile("vehicles.lua")
   -----------------my_sim_removed SECTION -----------------------------
attractor.my_sim_removed_pull = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 100,
	radius = 50,					-- influence radius, in meters
	automata = { "my_sim_vehicle" },		-- automata_groups this attractor affects

	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{
         radius =12,
			state = BehaviorState.IDLE,
			timeout = 15,
		},
  },
}
-- create a generator that creates my_sim_removed trucks at the edge of the lot.
generator.my_sim_removed_in = 
{
      automata = { "my_sim_vehicle" },						-- create my_sim_removed trucks
      count = 1,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=1,
      
      -- generate at random distances between 1 and 7 meters away.
      radius = { 22,25 },
      follow_roads = true,
}

   ---------------------------------------------------------------------------------------
-- Finally, create an  occupant group with attached attractor & generator

--~ occupant_group.my_sim_removed =   ---- this is the building group name
--~ {
	--~ controllers = {
		--~ "my_sim_removed_pull",
		--~ "my_sim_removed_in",
		--~ },
--~ }

-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--verify_all_templates()
