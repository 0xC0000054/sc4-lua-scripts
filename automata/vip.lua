--
-- vip.lua
--

dofile("_templates.lua")

   -----------------VIP SECTION -----------------------------
---------------INCOMING  SECTION  
  -- create an attractor that attracts VIPs (Limo's)
attractor.vip_attract = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 30,
	radius = 60,					-- influence radius, in meters
	automata = { "limo" },		-- automata_groups this attractor affects
	--calendar = { monday, tuesday, wednesday, thursday, friday },
	--~ time_of_day = {
			--~ [6.0] = 0.0,				
         --~ [8.0] =1.0,         -- start at 8 AM...
         --~ [20.0] = 1.0,   -- max attraction strength at 8 pm
			--~ [22.5] = 0.0,			-- then taper off
   --~ },
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		--~ {	
         --~ radius =16,
			--~ state = BehaviorState.QUEUE,
			--~ timeout = 9,
         --~ final = true,
		--~ },
   },
}
-- create a IN generator that creates vips - INCOMING
--~ generator.vip_in = {
		--~ automata = { "limo" },					-- create children
      --~ --occupancy_pct = 0.1,						-- generate 1% of school's occupancy...
		--~ count =1,
		--~ rate = 0.5,										
		--~ rate_scale = RateScale.PER_MINUTE,	-- ...game minute
		--~ max_count=1,
		
		--~ -- generate at random distances between X and Y meters away.
		--~ radius = { 16,45},
		
				--~ --calendar = { monday, tuesday, wednesday, thursday, friday },
		--~ time_of_day = {
				--~ [6.8] = 0.0,
				--~ [6.9] = 0.8,			
				--~ [7.9] = 1.0,			
				--~ [21.0] = 0.1,
				--~ [21.3] = 0.0,
				--~ },
		--~ follow_roads = true,
	--~ }
   
   --------------------------- OUTGOING MOMS SECTION
   --~ attractor.vip_repulse =
--~ {
	--~ strength = -50,
	--~ radius = 16,					-- influence radius, in meters
	--~ automata = { "vip" },		-- automata_groups this attractor affects
	--~ --calendar = { monday, tuesday, wednesday, thursday, friday },
	--~ time_of_day = {
			--~ [14.0] = 0.0,
			--~ [14.1] = 1.0,			
			--~ [15.0] = 1.0,			-- ...go home at 3PM 
			--~ [16.9] = 1.0,
			--~ [17.0] = 0.0,
	--~ },
--~ }

-- create a generator that creates vip at the edge of the school
generator.vip_out = 
{
      automata = { "limo" },						-- create mom cars
      --occupancy_pct = 0.1,						-- generate 1% of school's occupancy...
      count = 1,
      rate =0.1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=1,
      
      -- generate at random distances between 1 and 7 meters away.
      radius = { 1,3 },
      
      --calendar = { monday, tuesday, wednesday, thursday, friday },
      --~ time_of_day = {
            --~ [14.8] = 0.0,			
            --~ [15.0] = 1.0,	
            --~ [15.6] = 1.0,
            --~ [15.8] = 0.0,
            --~ },
               behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
               --~ {
                  --~ --percentage = 0.1,                -- percentage that will do this behavior
                  --~ radius = 12,
                  --~ state = BehaviorState.QUEUE,
                  --~ --anims={ "woohoo", "walk" },
                  --~ timeout = 12,
                  --~ --final = true,
               --~ },
               {
                  --percentage = 0.1,                -- percentage that will do this behavior
                  radius = 20,
                  state = BehaviorState.DEFAULT,
                  --anims={ "woohoo", "walk" },
                  timeout = 28,
                  final = true,
               },
               },
      follow_roads = true,
}

  -----------------VIP SECTION -----------------------------
---------------INCOMING  SECTION  
  -- create an attractor that attracts VIPs (Limo's)
attractor.mayor_attract = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 30,
	radius = 60,					-- influence radius, in meters
	automata = { "mayor_limo" },		-- automata_groups this attractor affects
	--calendar = { monday, tuesday, wednesday, thursday, friday },
	--~ time_of_day = {
			--~ [6.0] = 0.0,				
         --~ [8.0] =1.0,         -- start at 8 AM...
         --~ [20.0] = 1.0,   -- max attraction strength at 8 pm
			--~ [22.5] = 0.0,			-- then taper off
   --~ },
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		--~ {	
         --~ radius =16,
			--~ state = BehaviorState.QUEUE,
			--~ timeout = 9,
         --~ final = true,
		--~ },
   },
}
-- create a IN generator that creates vips - INCOMING
--~ generator.vip_in = {
		--~ automata = { "limo" },					-- create children
      --~ --occupancy_pct = 0.1,						-- generate 1% of school's occupancy...
		--~ count =1,
		--~ rate = 0.5,										
		--~ rate_scale = RateScale.PER_MINUTE,	-- ...game minute
		--~ max_count=1,
		
		--~ -- generate at random distances between X and Y meters away.
		--~ radius = { 16,45},
		
				--~ --calendar = { monday, tuesday, wednesday, thursday, friday },
		--~ time_of_day = {
				--~ [6.8] = 0.0,
				--~ [6.9] = 0.8,			
				--~ [7.9] = 1.0,			
				--~ [21.0] = 0.1,
				--~ [21.3] = 0.0,
				--~ },
		--~ follow_roads = true,
	--~ }
   
   --------------------------- OUTGOING MOMS SECTION
   --~ attractor.vip_repulse =
--~ {
	--~ strength = -50,
	--~ radius = 16,					-- influence radius, in meters
	--~ automata = { "vip" },		-- automata_groups this attractor affects
	--~ --calendar = { monday, tuesday, wednesday, thursday, friday },
	--~ time_of_day = {
			--~ [14.0] = 0.0,
			--~ [14.1] = 1.0,			
			--~ [15.0] = 1.0,			-- ...go home at 3PM 
			--~ [16.9] = 1.0,
			--~ [17.0] = 0.0,
	--~ },
--~ }

-- create a generator that creates vip at the edge of the school
generator.mayor_out = 
{
      automata = { "mayor_limo" },						-- create mom cars
      --occupancy_pct = 0.1,						-- generate 1% of school's occupancy...
      count = 1,
      rate =0.1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=1,
      
      -- generate at random distances between 1 and 7 meters away.
      radius = { 1,3 },
      
      --calendar = { monday, tuesday, wednesday, thursday, friday },
      --~ time_of_day = {
            --~ [14.8] = 0.0,			
            --~ [15.0] = 1.0,	
            --~ [15.6] = 1.0,
            --~ [15.8] = 0.0,
            --~ },
               behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
               --~ {
                  --~ --percentage = 0.1,                -- percentage that will do this behavior
                  --~ radius = 12,
                  --~ state = BehaviorState.QUEUE,
                  --~ --anims={ "woohoo", "walk" },
                  --~ timeout = 12,
                  --~ --final = true,
               --~ },
               {
                  --percentage = 0.1,                -- percentage that will do this behavior
                  radius = 20,
                  state = BehaviorState.DEFAULT,
                  --anims={ "woohoo", "walk" },
                  timeout = 28,
                  final = true,
               },
               },
      follow_roads = true,
}



   ---------------------------------------------------------------------------------------
-- Finally, create a "school" occupant group with attached attractor & generator

occupant_group.vip = 
{
	 group_id = "0x1900",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map
	
	--property_check = { "0x691b42b3" },		-- "School Coverage Radius"
	
	controllers = {
		"vip_attract",
		--"vip_in",
		--"vip_repulse",
		"vip_out",
		},
}

occupant_group.mayor = 
{
	 group_id = "0x1938",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map
	
	controllers = {
		"mayor_attract",
		"mayor_out",
		},
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
---verify_all_templates()
