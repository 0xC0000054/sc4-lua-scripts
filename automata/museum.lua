--
-- museum.lua
--

dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("vehicles.lua")

-- create an attractor that ATTRACTS museum_patron
attractor.museum_patron_attractor =
{
	strength = 80,       -- attraction strength from -100 to 100 (negative values repel)
	radius = 32,					-- influence radius, in meters
	automata = { "sim" },		-- automata_groups this attractor affects
	--calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {
			[9.7] = 0.0,
				[9.8] = 1.0,			
				[10.3] = 1.0,			
				[10.4] = 0.0,
			},
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	radius =17,
			state = BehaviorState.QUEUE,
			timeout = 3,
         final = true,
		},
      --~ {	radius =6,
			--~ state = BehaviorState.DISAPPEAR,
			--~ --timeout = 100,
         --~ --final = true,
		--~ },
	},
}
--===============================================
-- create a TEMP generator that creates museum patron INCOMING
   generator.museum_patron_in = {
		automata = { "sim" },					-- create children
      --occupancy_pct = 0.1,						-- generate 1% of school's occupancy...
		count = 5,
		rate = .5,										
		rate_scale = RateScale.PER_MINUTE,	-- ...game minute
		max_count=40,
		
		-- generate at random distances between 15 and 18 meters away.
		radius = { 16,26},
		--calendar = { monday, tuesday, wednesday, thursday, friday },
		
      time_of_day = {
				[9.7] = 0.0,
				[9.8] = 1.0,			
				[10.3] = 1.0,			
				[10.4] = 0.0,
				},
		follow_roads = true,
}

--====================================================
-- create a generator that creates museum patrons OUT --------
generator.museum_patron_out = 
{
      automata = { "sim" },						-- create children
      --occupancy_pct = 0.1,						-- generate 1% of school's occupancy...
      count = 30,
      rate =1,										-- ...once every...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=50,
      radius = { 2,8 },    -- generate at random distances between 1 and 7 meters away.
            -- copy times from k6kids_attractor
      --calendar = { monday, tuesday, wednesday, thursday, friday },
         time_of_day = {
            [13.7] = 0.0,
				[13.8] = 1.0,			
				[14.3] = 1.0,			
				[14.4] = 0.0,
          },
          behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
            --{
             --percentage = 0.1,
             -- radius = 10,
             -- state = BehaviorState.BEE_LINE,
             --  anims={ "woohoo", "walk" },
             -- timeout = 40,
             --final = true,
            --},
            {
              -- radius =16,
               state = BehaviorState.DEFAULT,
               timeout = 9,
               --~ anims={ "woohoo", "walk" },
               final = true,
            },
         },
      follow_roads = true,
}


   -----------------MUSEUM BUS SECTION -----------------------------
---------------INCOMING BUS SECTION  
  -- create an attractor that attracts museum_bus
attractor.museum_bus_attract = 
{
	strength = 50,       -- attraction strength from -100 to 100 (negative values repel)
	radius = 45,					-- influence radius, in meters
	automata = { "school_bus" },		-- automata_groups this attractor affects
	--calendar = { monday, tuesday, wednesday, thursday, friday },
	      time_of_day = {
				[9.7] = 0.0,
				[9.8] = 1.0,			
				[10.3] = 1.0,			
				[10.4] = 0.0,
				},

   
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	
         ---percentage = 0.3,
         radius = 15,
			state = BehaviorState.IDLE,
			timeout = 6,
         final = true,
		},
   },
}
-- create a IN generator that creates museum_bus - INCOMING
generator.museum_bus_in = {
		automata = { "school_bus" },					-- create children
      --occupancy_pct = 0.1,						-- generate 1% of school's occupancy...
		count =1,
		rate = 1,										
		rate_scale = RateScale.PER_MINUTE,	-- ...game minute
		max_count=6,
		
		-- generate at random distances between 15 and 18 meters away.
		radius = { 16,45},
		
		--calendar = { monday, tuesday, wednesday, thursday, friday },
		time_of_day = {
				[9.7] = 0.0,
				[9.8] = 1.0,			
				[10.3] = 1.0,			
				[10.4] = 0.0,
      },
		follow_roads = true,
	}
   
   --------------------------- OUTGOING MOMS SECTION
  attractor.museum_bus_repulse = {
	strength = 50,       -- attraction strength from -100 to 100 (negative values repel)
	radius = 45,					-- influence radius, in meters
	automata = { "school_bus" },		-- automata_groups this attractor affects
	--calendar = { monday, tuesday, wednesday, thursday, friday },
	      time_of_day = {
				[13.7] = 0.0,
				[13.8] = -1.0,			
				[14.3] = -1.0,			
				[14.4] = 0.0,
				},

   
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	
         ---percentage = 0.3,
         radius = 12,
			state = BehaviorState.IDLE,
			timeout = 6,
         --final = true,
		},
   },
}
-- create a generator that creates museum_bus at the edge of the building
generator.museum_bus_out = 
{
      automata = { "school_bus" },						-- create mom cars
      --occupancy_pct = 0.1,						-- generate 1% of school's occupancy...
      count = 2,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=6,
      
      -- generate at random distances between 1 and 7 meters away.
      radius = { 1,10 },
      
      --calendar = { monday, tuesday, wednesday, thursday, friday },
      time_of_day = {
            [13.7] = 0.0,
				[13.8] = 1.0,			
				[14.3] = 1.0,			
				[14.4] = 0.0,
            },
               --~ behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
                  --~ {
                  --~ --percentage = 0.1,                -- percentage that will do this behavior
                  --~ radius = 05,12
                  --~ state = BehaviorState.DEFAULT,
                  --~ --anims={ "woohoo", "walk" },
                  --~ timeout = 180,
                  --~ final = true,
                  --~ },
               --~ },
      follow_roads = true,
}

   ---------------------------------------------------------------------------------------
-- Finally, create a "museum" occupant group with attached attractor & generator

occupant_group.museum = 
{
	 group_id = "0x1506",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map
	
	controllers = {
		"museum_patron_attractor",
		"museum_patron_in",
		"museum_patron_out",
		"museum_bus_attract",
      "museum_bus_in",
		"museum_bus_repulse",
		"museum_bus_out",
		},
}


-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--verify_all_templates()
