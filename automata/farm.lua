--
-- farm.lua
--

dofile("_templates.lua")
dofile("vehicles.lua")
   -----------------farm SECTION -----------------------------
--~ attractor.farm_attract = 
--~ {
	--~ -- attraction strength from -100 to 100 (negative values repel)
	--~ strength = 60,
	--~ radius = 60,					-- influence radius, in meters
	--~ automata = { "farm_vehicles" },		-- automata_groups this attractor affects
	--~ time_of_day = {        --- push vehicles out and back a few times a day.
			--~ [0.0] = 0.0,				
         --~ [3.0] =-1.0,         -- 
			--~ [6.0] = 0.0,			-- 
         --~ [9.0] =1.0,         -- 
			--~ [12.0] = 0.0,			-- 				
         --~ [15.0] =-1.0,         -- 
         --~ [18.0] = 0.0,			-- 
         --~ [21.0] =1.0,         -- 
			
   --~ },
	--behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		--~ {	
         --~ radius =16,
			--~ state = BehaviorState.QUEUE,
			--~ timeout = 9.0,
         --~ final = true,
		--~ },
   --~ },
--~ }
-- create a generator that creates farm vehicles at the edge of the lot.
generator.farm_out = 
{
      automata = { "farm_vehicles" },						-- create farm vehicles
      count = 1,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=2,
      
      -- generate at random distances between 1 and 7 meters away.
      radius = { 5,15},
      
      --~ --calendar = { monday, tuesday, wednesday, thursday, friday },
      --~ time_of_day = {
            --~ [3.8] = 0.0,			
            --~ [4.0] = 1.0,	
            --~ [16.6] = 1.0,
            --~ [17.8] = 0.0,
            --~ },
      --~ behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		--~ {	
			--~ state = BehaviorState.DEFAULT,
			--~ timeout = 2.9,
         --~ final = true,
		--~ },
   --~ },
      follow_roads = true,
}

   ---------------------------------------------------------------------------------------
-- Finally, create an occupant group with attached attractor & generator

occupant_group.farmland =   ---- this is the building group name
{
	 group_id = "0x1912",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	
	controllers = {
		--~ "farm_attract",
		"farm_out",
		},
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--verify_all_templates()
