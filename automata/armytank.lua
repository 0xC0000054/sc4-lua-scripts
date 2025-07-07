--
-- armytank.lua
--

dofile("_templates.lua")
dofile("vehicles.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua") 
-----------------armybase SECTION -----------------------------
attractor.armytank_pull = 
{
	strength = 90,
	radius = 60,					-- influence radius, in meters
	automata = { "armytank"},		-- automata_groups this attractor affects
}

-- create a generator that creates armybase trucks at the edge of the lot.
generator.armytank_out = 
{
      automata = { "armytank" },						-- create armybase trucks
      count = 3,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_HOUR,	-- ...game minute
      max_count=5,
      use_lot_facing = true,
      radius = { 10,19 },
      follow_roads = true,
      destroy_automata = false,
     behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	
			state = BehaviorState.DEFAULT,
			timeout = 290,
         final = true,
      },      
   },         
}


   ---------------------------------------------------------------------------------------
-- Finally, create a "school" occupant group with attached attractor & generator

occupant_group.armytanks =   ---- this is the building group name
{
	--group_id = "0x1914",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	
	controllers = {
       "armytank_pull",
      "armytank_out",
},
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
