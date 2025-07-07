--
-- courthouse.lua
--

dofile("_templates.lua")
dofile("vehicles.lua")
dofile("biz.lua")
   -----------------courthouse SECTION -----------------------------
---------------INCOMING  SECTION  
  -- create an attractor that attracts courthouse folks
attractor.court_car_attract = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 60,
	radius = 40,					-- influence radius, in meters
	automata = { "patrol_car", "rich_cars" },		-- automata_groups this attractor affects
	--calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {
			[6.0] = 0.0,				
         [7.0] =1.0,         -- start at 8 AM...
         [15.0] = 1.0,   -- max attraction strength at 8 pm
			[18.5] = 0.0,			-- then taper off
   },
   behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	
         percentage = 0.5,
         radius =8,
			state = BehaviorState.IDLE,
			timeout = 10.9,
         final = true,
		},
   },
}
--~ -- create a IN generator that creates vips - INCOMING
generator.court_cars_in = {
	automata = { "patrol_car", "rich_cars" },		-- automata_groups this attractor affects
      --occupancy_pct = 0.1,						-- generate 1% of school's occupancy...
		count =1,
		rate = 4,										
		rate_scale = RateScale.PER_HOUR,	-- ...game minute
		max_count=5,
		
		-- generate at random distances between X and Y meters away.
		radius = { 16,45},
		
				--calendar = { monday, tuesday, wednesday, thursday, friday },
		time_of_day = {
				[6.0] = 0.0,
				[6.1] = 0.8,			
				[7.9] = 1.0,			
				[11.0] = 1.0,
				[11.3] = 0.0,
				},
		follow_roads = true,
	}
   
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
generator.court_car_out = 
{
	automata = { "patrol_car", "rich_cars" },		-- automata_groups this attractor affects
      --occupancy_pct = 0.1,						-- generate 1% of school's occupancy...
      count = 1,
      rate =5,										-- ...X times per...
      rate_scale = RateScale.PER_HOUR,	-- ...game minute
      max_count=2,
      
      -- generate at random distances between 1 and 7 meters away.
      radius = { 1,3 },
      
      --calendar = { monday, tuesday, wednesday, thursday, friday },
      time_of_day = {
            [7.8] = 0.0,			
            [8.0] = 1.0,	
            [18.6] = 1.0,
            [18.8] = 0.0,
            },
               behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
               --~ {
                  --~ --percentage = 0.1,                -- percentage that will do this behavior
                  --~ radius = 12,
                  --~ state = BehaviorState.QUEUE,
                  --~ --anims={ "woohoo", "walk" },
                  --~ timeout = 1.2,
                  --~ --final = true,
               --~ },
               {
                  --percentage = 0.1,                -- percentage that will do this behavior
                  radius = 20,
                  state = BehaviorState.DEFAULT,
                  --anims={ "woohoo", "walk" },
                  timeout = 7.8,
                  final = true,
               },
               },
      follow_roads = true,
}

   ---------------------------------------------------------------------------------------
-- Finally, create a "school" occupant group with attached attractor & generator

occupant_group.courthouse = 
{
	 group_id = "0x1511",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map
	
	controllers = {
		"court_car_attract",
		--~ "court_cars_in",
		--"vip_repulse",
		"court_car_out",
		"biz_gen_walk",
		"biz_gen_stand",
		},
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
