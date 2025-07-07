--
-- taxi.lua
--

dofile("_templates.lua")
dofile("vehicles.lua")
   -----------------TAXI SECTION -----------------------------
---------------INCOMING  SECTION  
  -- create an attractor that attracts Taxis
attractor.taxi_attract = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 30,
	radius = 60,					-- influence radius, in meters
	automata = { "taxi" },		-- automata_groups this attractor affects
	--calendar = { monday, tuesday, wednesday, thursday, friday },
	use_lot_facing = true,
   time_of_day = {
         [0.1] = 0.3,   -- max attraction strength at 8 pm   },
         [1.5] = 1.0,   -- max attraction strength at 8 pm   },
         [2.0] = 0.0,   -- max attraction strength at 8 pm   },
         [6.0] = 0.0,				
         [8.0] =1.0,         -- start at 8 AM...
         [20.0] = 0.3,   -- max attraction strength at 8 pm
         },
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	
         percentage = .3,
         radius =8,
			state = BehaviorState.IDLE,
			timeout = 2,
         final = true,
		},
   },
}
-- create a IN generator that creates Taxis - INCOMING
generator.taxi_in = {
		automata = { "taxi" },					-- create children
		count =1,
		rate = 6,										
		rate_scale = RateScale.PER_HOUR,	-- ...game minute
		max_count=6,
		
		-- generate at random distances between X and Y meters away.
		radius = { 3,45},
		
				--calendar = { monday, tuesday, wednesday, thursday, friday },
		 time_of_day = {
         [0.1] = 0.3,   -- max attraction strength at 8 pm   },
         [1.5] = 1.0,   -- max attraction strength at 8 pm   },
         [2.0] = 0.0,   -- max attraction strength at 8 pm   },
         [6.0] = 0.0,				
         [8.0] =1.0,         -- start at 8 AM...
         [20.0] = 0.3,   -- max attraction strength at 8 pm
         },
		follow_roads = true,
	}
   
   --------------------------- OUTGOING MOMS SECTION
   --~ attractor.taxi_repulse =
--~ {
	--~ strength = -50,
	--~ radius = 16,					-- influence radius, in meters
	--~ automata = { "taxi" },		-- automata_groups this attractor affects
	--~ --calendar = { monday, tuesday, wednesday, thursday, friday },
	--~ time_of_day = {
			--~ [14.0] = 0.0,
			--~ [14.1] = 1.0,			
			--~ [15.0] = 1.0,			-- ...go home at 3PM 
			--~ [16.9] = 1.0,
			--~ [17.0] = 0.0,
	--~ },
--~ }

-- create a generator that creates taxi at the edge of the school
generator.taxi_out = 
{
      automata = { "taxi" },						-- create mom cars
      occupancy_pct = 0.1,						-- generate 1% of school's occupancy...
      --count = 1,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=6,
      
      -- generate at random distances between 1 and 7 meters away.
      radius = { 0,10 },
      
      --calendar = { monday, tuesday, wednesday, thursday, friday },
      time_of_day = {
            [14.8] = 0.0,			
            [15.0] = 1.0,	
            [15.6] = 1.0,
            [15.8] = 0.0,
            },
               --~ behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
               --~ {
                  --~ --percentage = 0.1,                -- percentage that will do this behavior
                  --~ radius = 12,
                  --~ state = BehaviorState.DEFAULT,
                  --~ --anims={ "woohoo", "walk" },
                  --~ timeout = 12,
                  --~ --final = true,
               --~ },
               --~ {
                  --~ --percentage = 0.1,                -- percentage that will do this behavior
                  --~ radius = 20,
                  --~ state = BehaviorState.DEFAULT,
                  --~ --anims={ "woohoo", "walk" },
                  --~ timeout = 18,
                  --~ final = true,
               --~ },
               --},
      follow_roads = true,
}

   ---------------------------------------------------------------------------------------
-- Finally, create a "school" occupant group with attached attractor & generator

occupant_group.taxi_maker = 
{
	 group_id = "0x1903",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map
	
	controllers = {
		"taxi_attract",
		"taxi_in",
		--"taxi_repulse",
		"taxi_out",
		},
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
