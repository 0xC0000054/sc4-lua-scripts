-- college.lua
--
dofile("_templates.lua")
dofile("vehicles.lua")
dofile("pedestrians.lua")
-------------------------COLLEGE KIDS SECTION
------------------------------------------------------------------------
-- create an attractor that ATTRACTS
attractor.collegekids_attractor = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 60,
	radius = 30,					-- influence radius, in meters
	automata = { "sim" },		-- automata_groups this attractor affects
	calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {
			[6] = 0.0,				-- start to ramp up at 6 AM...
			[8.5] = 1.0,				-- to max attraction strength at 6:30 AM
			[13.0] = 1.0,			-- then taper off
			[13.5] = 0.0,
			},
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	
         percentage = 0.1,            ---percentage that will assume this behavior
         radius =16,
			state = BehaviorState.BEE_LINE,
			timeout = 0.9,
         final = true,
		},
      {	radius =6,
			state = BehaviorState.DISAPPEAR,
			timeout = 0.9,
         final = true,
		},
	},
}
-- create a generator that creates college kids INCOMING
generator.collegekids_in = {
		automata = { "sim" },					-- create children
      occupancy_pct = 0.1,						-- generate 1% of school's occupancy...
		--count =200,
		rate = .5,										
		rate_scale = RateScale.PER_MINUTE,	-- ...game minute
		max_count=30,
		
		-- generate at random distances between 15 and 18 meters away.
		radius = { 16,26},
      calendar = { monday, tuesday, wednesday, thursday, friday },
		time_of_day = {
				[8.8] = 0.0,
				[8.9] = 0.5,			
				[10.2] = 1.0,			
				[11.5] = 0.1,
            [15.2] = 1.0,			
				[17.5] = 0.1,
				[18.0] = 0.0,
				},
		follow_roads = true,
	}
   
   ------------- CollegeKid REPULSOR ---------------------

-- create a generator that creates COLLEGE kids OUT --------
generator.collegekids_generator = 
{
      automata = { "sim" },						-- create sims
      
      occupancy_pct = 0.1,						-- generate 1% of school's occupancy...
      --count = 60,
      rate =1,										-- ...once every...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=10,
      radius = { 0,9 },    -- generate at random distances between 1 and 7 meters away.
      calendar = { monday, tuesday, wednesday, thursday, friday },
      time_of_day = {
            [14.8] = 0.0,			
            [18.0] = 1.0,	
            [19.6] = 1.0,
            [19.8] = 0.0,
            },
               behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
               {
                  radius =16,
                  state = BehaviorState.DEFAULT,
                  timeout = 1.8,
                  --~ anims={ "woohoo", "walk" },
                  final = true,
               },
            },
      follow_roads = true,
}


   -----------------college  cars SECTION -----------------------------
---------------INCOMING college  cars SECTION  
  -- create an attractor that attracts collegecars
attractor.collegecars_attract = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 70,
	radius = 30,					-- influence radius, in meters
	automata = { "civilian_cars" },		-- automata_groups this attractor affects
	calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {
			[6] = 0.0,				-- start to ramp up at 6 AM...
			[9.5] = 1.0,				-- to max attraction strength at 6:30 AM
			[10.0] = 1.0,			-- then taper off
			[10.5] = 0.0,		-- then taper off
   },
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	
         radius =10,
			state = BehaviorState.DISAPPEAR,
			timeout = 0.6,
         final = true,
		},
   },
}
-- create a IN generator that creates college  carsS - INCOMING
generator.collegecars_in = {
		automata = { "civilian_cars" },					
      occupancy_pct = 0.1,						-- generate 1% of school's occupancy...
		--count =1,
		rate = 1,										
		rate_scale = RateScale.PER_MINUTE,	-- ...game minute
		max_count=6,
		
		-- generate at random distances between 15 and 18 meters away.
		radius = { 16,45},
		calendar = { monday, tuesday, wednesday, thursday, friday },
		time_of_day = {
				[9] = 0.0,				-- start to ramp up at 6 AM...
			[9.5] = 1.0,				-- to max attraction strength at 6:30 AM
			[10.0] = 1.0,			-- then taper off
			[10.5] = 0.0,		-- then taper off
				},
		follow_roads = true,
	}
   
   --------------------------- OUTGOING college  carsS SECTION
 -- create a generator that creates collegecars at the edge of the school
generator.collegecars_out = 
{
      automata = { "civilian_cars" },						-- create mom cars
      occupancy_pct = 0.1,						-- generate 1% of school's occupancy...
      --count = 1,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=6,
      
      -- generate at random distances between 1 and 7 meters away.
      radius = { 2,10 },
      calendar = { monday, tuesday, wednesday, thursday, friday },
      time_of_day = {
            [14.8] = 0.0,			
            [18.0] = 1.0,	
            [20.6] = 1.0,
            [21.8] = 0.0,
            },
               behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
               {
                  --percentage = 0.1,                -- percentage that will do this behavior
                  radius = 20,
                  state = BehaviorState.DEFAULT,
                  --anims={ "woohoo", "walk" },
                  timeout = 1.8,
                  final = true,
               },
               },
      follow_roads = true,
}

   ---------------------------------------------------------------------------------------
-- Finally, create a "school" occupant group with attached attractor & generator

occupant_group.college = 
{
	 group_id = "0x1504",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map
	
	controllers = {
		"collegekids_attractor",
		"collegekids_generator",
		"collegekids_in",
      "collegecars_attract",
		"collegecars_in",
		"collegecars_out",
		},
}

-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--verify_all_templates()
