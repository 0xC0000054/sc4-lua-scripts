--
-- toxic.lua
--

dofile("_templates.lua")
dofile("vehicles.lua")
   -----------------toxic SECTION -----------------------------
attractor.toxic_attract = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 60,
	radius = 60,					-- influence radius, in meters
	automata = { "toxic_carrier" },		-- automata_groups this attractor affects
	--calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {        --- push trucks out and back a few times a day.
			[0.0] = 0.0,				
         [3.0] =-1.0,         -- 
			[6.0] = 0.0,			-- 
         [9.0] =1.0,         -- 
			[12.0] = 0.0,			-- 				
         [15.0] =-1.0,         -- 
         [18.0] = 0.0,			-- 
         [21.0] =1.0,         -- 
			
   },
	--behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		--~ {	
         --~ radius =16,
			--~ state = BehaviorState.QUEUE,
			--~ timeout = 9,
         --~ final = true,
		--~ },
   --},
}
-- create a generator that creates toxic trucks at the edge of the lot.
generator.toxic_out = 
{
      automata = { "toxic_carrier" },						-- create toxic trucks
      --occupancy_pct = 0.1,						-- generate 1% of school's occupancy...
      count = 1,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=2,
      
      -- generate at random distances between 1 and 7 meters away.
      radius = { 1,32 },
      
      --~ --calendar = { monday, tuesday, wednesday, thursday, friday },
      --~ time_of_day = {
            --~ [14.8] = 0.0,			
            --~ [15.0] = 1.0,	
            --~ [15.6] = 1.0,
            --~ [15.8] = 0.0,
            --~ },
      
      follow_roads = true,
}

   ---------------------------------------------------------------------------------------
-- Finally, create a "school" occupant group with attached attractor & generator

occupant_group.toxic_dump =   ---- this is the building group name
{
	 group_id = "0x1405",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	
	controllers = {
		"toxic_attract",
		"toxic_out",
		},
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
---verify_all_templates()
