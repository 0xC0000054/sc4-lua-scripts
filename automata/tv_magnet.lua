--
-- tv_magnet.lua
--
dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("vehicles.lua")
   -----------------tv_magnet SECTION -----------------------------
attractor.tv_magnet_attract = 
{
	-- attraction strength from -100 to 100 (negative values repel)
   effect_trigger = {"0x0A89DFD4"},
   strength = 100,
	radius = 50,					-- influence radius, in meters
	automata = { "tv_reporter" },		-- automata_groups this attractor affects
   lifetime = 60,
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{
         radius =16,
			state = BehaviorState.IDLE,
			timeout = 90,
         final = true,
		},
  },
}
-- create a generator that creates tv_magnet trucks at the edge of the lot.
generator.tv_magnet_in = 
{
      automata = { "tv_reporter" },						-- create tv_magnet trucks
      effect_trigger = {"0x0A89DFD4"},
      count = 1,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=1,
      lifetime = 10,
      -- generate at random distances between 1 and 7 meters away.
      radius = { 32,32 },
      follow_roads = true,
}

-- create a generator that creates tv_ped  at the edge of the lot.
generator.tv_peds_in = 
{
      automata = { "tv_peds" },						-- create tv_magnet trucks
      effect_trigger = {"0x0A89DFD4"},
      count = 1,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=1,
      lifetime = 90,
      -- generate at random distances between 1 and 7 meters away.
      radius = { 10,12 },
      follow_roads = true,
}


   ---------------------------------------------------------------------------------------
-- Finally, create an  occupant group with attached attractor & generator

occupant_group.tv_magnet =   ---- this is the building group name
{
	 group_id = "0x1911",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	
	controllers = {
		"tv_magnet_attract",
		"tv_magnet_in",
		"tv_peds_in",
		},
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
