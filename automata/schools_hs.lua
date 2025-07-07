--
-- schools_hs.lua
--

dofile("_templates.lua")
dofile("vehicles.lua")
dofile("pedestrians.lua")
dofile("_constants.lua")

-- create an attractor that ATTRACTS school kids
attractor.schoolkids_attractor =
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 100,
	radius = 30,					-- influence radius, in meters
	automata = { "child" },		-- automata_groups this attractor affects
	calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {
			[6] = 0.0,				-- start to ramp up at 6 AM...
			[6.5] = 1.0,				-- to max attraction strength at 6:30 AM
			[7.0] = 1.0,
			[8.0] = 1.0,			-- then taper off
			[8.5] = 0.0,
			},
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	radius =24,
			state = BehaviorState.QUEUE,
			timeout = 12,
         final = true,
		},
      --~ {	radius =6,
			--~ state = BehaviorState.DISAPPEAR,
			--~ --timeout = 80,
         --~ --final = true,
		--~ },
	},
}
-- create a TEMP generator that creates school kids INCOMING
generator.schoolkids_in = {
		automata = { "child" },					-- create children
      occupancy_pct = 0.6,						-- generate 1% of school's occupancy...
		--count =10,
		rate = 1,										
		rate_scale = RateScale.PER_MINUTE,	-- ...game minute
		max_count= 50,
		
		-- generate at random distances between 15 and 18 meters away.
		radius = { 16,26},
		
		-- copy times from schoolkids_attractor
	calendar = { monday, tuesday, wednesday, thursday, friday },
		time_of_day = {
				[7.3] = 0.0,
				[7.8] = 0.8,			
				[8.0] = 1.0,			
				[8.2] = 0.1,
				[8.5] = 0.0,
				},
		follow_roads = true,
      priority = GeneratorPriority.HIGH,
	}
   
   ------------- SchoolKid REPULSOR ---------------------
attractor.schoolkids_repulsor =
{
	strength = -100,
	radius = 30,					-- influence radius, in meters
	automata = { "child" },		-- automata_groups this attractor affects
	calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {
			[14.0] = 0.0,
			[14.1] = 1.0,			
			[15.0] = 1.0,			-- ...go home at 3PM 
			[15.5] = 1.0,
			[18.0] = 0.0,
	},
}
-- create a generator that creates school kids OUT --------
generator.schoolkids_generator = 
{
      automata = { "child" },						-- create children
      
      occupancy_pct =0.6,						-- generate 1% of school's occupancy...
      --count = 10,
      rate =5,										-- ...once every...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count= 50,
      radius = { 4,8 },    -- generate at random distances between 1 and 7 meters away.
            -- copy times from schoolkids_attractor
	calendar = { monday, tuesday, wednesday, thursday, friday },
      time_of_day = {
            [14.8] = 0.0,			
            [15.0] = 1.0,	
            [15.3] = 1.0,
            [15.8] = 0.0,
            },
               behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
               {
                  radius =16,
                  state = BehaviorState.DEFAULT,
                  timeout = 18,
                  anims = {"panic_run","walk"},
                  final = true,
               },
            },
      follow_roads = true,
      priority = GeneratorPriority.HIGH,
}


   -----------------DRIVING KIDS SECTION -----------------------------
---------------INCOMING DRIVING KIDS SECTION  
  -- create an attractor that attracts SOCCER MOMS
attractor.drivingkids_attract = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 80,
	radius = 30,					-- influence radius, in meters
	automata = { "cheap_cars" },		-- automata_groups this attractor affects
	calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {
			[6] = 0.0,				-- start to ramp up at 6 AM...
			[8.0] = 1.0,   -- to max attraction strength at 6:30 AM
			[10.0] = 1.0,
         [10.5] = 0.0,			-- then taper off
   },
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	
         --percentage = 0.3,
         radius =12,
			state = BehaviorState.DISAPPEAR,
			timeout = 9,
         final = true,
		},
   },
}
-- create a IN generator that creates DRIVING KIDS - INCOMING
generator.drivingkids_in = {
		automata = { "cheap_cars" },					-- create children
      occupancy_pct = 0.02,						-- generate 1% of school's occupancy...
		rate = 1,										
		rate_scale = RateScale.PER_MINUTE,	-- ...game minute
		max_count=6,
		radius = { 16,45},
   	calendar = { monday, tuesday, wednesday, thursday, friday },
		time_of_day = {
				[7.8] = 0.0,
				[7.9] = 0.8,			
				[8.4] = 1.0,			
				[9.0] = 0.1,
				[9.3] = 0.0,
				},
		follow_roads = true,
	}
   ---================ Bus IN =========================
   -- create a IN generator that creates School Buses - INCOMING
generator.hs_bus_in = {
		automata = { "school_bus" },					-- create children
      occupancy_pct = 0.02,						-- generate 0.02% of school's occupancy...
		rate = 1,										
		rate_scale = RateScale.PER_MINUTE,	-- ...game minute
		max_count=2,
		radius = { 16,35},
   	calendar = { monday, tuesday, wednesday, thursday, friday },
		time_of_day = {
				[7.8] = 0.0,
				[7.9] = 0.8,			
				[8.4] = 1.0,			
				[9.0] = 0.1,
				[9.3] = 0.0,
				},
		follow_roads = true,
		behavior = {
			{ state = BehaviorState.DEFAULT,
			  timeout = 15,
			  final = true,
			},
		},
      deactivate_trigger = { effects.EDUCATION_STRIKE_ACTIVE },
	}
   --------------------------- OUTGOING DRIVING KIDS SECTION
   -- create a generator that creates soccer moms at the edge of the school
generator.drivingkids_out = 
{
      automata = { "cheap_cars" },						-- create mom cars
      occupancy_pct = 0.02,						-- generate 0.02% of school's occupancy...
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=6,
      
      -- generate at random distances between 1 and 7 meters away.
      radius = { 2,10 },
      
	calendar = { monday, tuesday, wednesday, thursday, friday },
      time_of_day = {
            [14.9] = 0.0,			
            [15.0] = 1.0,	
            [15.3] = 1.0,
            [15.8] = 0.0,
            },
               behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
                     {
                     state = BehaviorState.DEFAULT,
                     timeout = 18,
                     final = true,
                  },
               },
      follow_roads = true,
}

--===========BUS OUT ===========================
-- create a generator that creates School Buses at the edge of the school
generator.hs_bus_out = 
{
      automata = { "school_bus" },						-- create mom cars
      occupancy_pct = 0.02,						-- generate 0.02% of school's occupancy...
      rate = 6,										-- ...X times per...
      rate_scale = RateScale.PER_HOUR,	-- ...game hour
      max_count= 2,
      radius = { 2,10 },
     	calendar = { monday, tuesday, wednesday, thursday, friday },
      time_of_day = {
            [14.9] = 0.0,			
            [15.0] = 1.0,	
            [15.3] = 1.0,
            [15.8] = 0.0,
            },
               behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
                     {
                     state = BehaviorState.DEFAULT,
                     timeout = 15,
                     final = true,
                  },
               },
      follow_roads = true,
      deactivate_trigger = { effects.EDUCATION_STRIKE_ACTIVE },
}
   ---------------------------------------------------------------------------------------
-- Finally, create a "school" occupant group with attached attractor & generator

occupant_group.schoolshs = 
{
	 group_id = "0x1510",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map
	
	controllers = {
		"schoolkids_attractor",
		"schoolkids_generator",
		"schoolkids_in",
		"schoolkids_repulsor",
      "drivingkids_attract",
		"drivingkids_in",
		"drivingkids_out",
      "hs_bus_in",               -- DO NOT change this string without also changing cSC4Vehicle.cpp!
      "hs_bus_out",              -- DO NOT change this string without also changing cSC4Vehicle.cpp!
		},
}


-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--verify_all_templates()
