--
-- schools.lua
--

dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("vehicles.lua")
dofile("_sfx.lua")
dofile("_constants.lua")

-- create an attractor that ATTRACTS school kids
attractor.k6kids_attractor =
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 100,
	radius = 30,					-- influence radius, in meters
	automata = { "child" },		-- automata_groups this attractor affects
	calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {
			[6] = 0.0,				-- start to ramp up at 6 AM...
			[6.5] = 0.0,				-- to max attraction strength at 6:30 AM
			[7.0] = 1.0,
			[9.4] = 1.0,			-- then taper off
			[9.5] = 0.0,
			},
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {
                  state = BehaviorState.RANDOM_WALK,
                  radius = 16,
                  anims = {"run","panic_run" },
                  sfx = { SFX.Automata_KidsPlay},
                  random_walk =
                        {
                           kph = {10, 20},
                           delay = { .3, 2 },
                           turn = { 0.5, 0.1 },
                           idle_delay = { .1, 2 },
                           idle_time = { 0.1, 1 },
                           strength = 1.0,
                           acceleration = 0.2,
                           deceleration = 0.5,
                        },
                  timeout = 7,
                  ignore_roads = true,
                  ignore_paths = true,
                  final = true,
                  },
         },
}
-- create a TEMP generator that creates school kids INCOMING
generator.k6kids_in = {
		automata = { "child" },					-- create children
      occupancy_pct = 0.6,						-- generate 1% of school's occupancy...
		--count = 5,
		rate = 6,										
		rate_scale = RateScale.PER_HOUR,	-- ...game minute
		max_count=140,
		
		-- generate at random distances between 15 and 18 meters away.
		radius = { 16,22},
		calendar = { monday, tuesday, wednesday, thursday, friday },
		time_of_day = {
				[7.9] = 0.0,
				[8.5] = 1.0,			
				[8.9] = 0.1,
				[9.0] = 0.0,
				},
            
		follow_roads = true,
      priority = GeneratorPriority.HIGH,
	}
   
   
   ------------- SchoolKid REPULSOR ---------------------
attractor.k6kids_repulsor =
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
generator.k6kids_generator = 
{
      automata = { "child" },						-- create children
      occupancy_pct = 0.6,						-- generate 1% of school's occupancy...
		--count = 5,
		rate = 6,										
		rate_scale = RateScale.PER_HOUR,	-- ...game minute
      max_count=50,
      radius = { 2,8 },    -- generate at random distances between 1 and 7 meters away.
      calendar = { monday, tuesday, wednesday, thursday, friday },
      time_of_day = {
        	
            [15.3] = 0.0,	
            [15.5] = 1.0,
            [15.8] = 0.0,
            },
               behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
               {
                percentage = 0.5,
                radius = 10,
                state = BehaviorState.BEE_LINE,
               anims = {"panic_run","walk", "woohoo"},
                  sfx = {SFX.Automata_KidsPlay}, 
                  timeout = 14,
               final = true,
               },
               {
                 -- radius =16,
                  state = BehaviorState.DEFAULT,
                  timeout = 18,
                  anims = {"panic_run","walk"},
                  sfx = {SFX.Automata_KidsPlay},
                  final = true,
               },
            },
      follow_roads = true,
      priority = GeneratorPriority.HIGH,
}


   -----------------SOCCER MOM SECTION -----------------------------
---------------INCOMING MOMS SECTION  
  -- create an attractor that attracts SOCCER MOMS
attractor.soccermoms_attract = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 60,
	radius = 45,					-- influence radius, in meters
	automata = { "soccer_moms" },		-- automata_groups this attractor affects
	calendar = { monday, tuesday, wednesday, thursday, friday },
	      time_of_day = {
         [7.7] = 0.0,
         [7.8] = 0.1,			
         [8.9] = 1.0,			
         [9.0] = 0.1,
         [10.1] = 0.0,
         },
   
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	
         ---percentage = 0.3,
         radius = 8,
			state = BehaviorState.IDLE,
			timeout = 9,
         final = true,
		},
   },
}
-- create a IN generator that creates SOCCER MOMS - INCOMING
generator.soccermoms_in = {
		automata = { "soccer_moms" },					-- create children
      occupancy_pct = 0.02,						-- generate 0.02% of school's occupancy...
		rate = 1,										
		rate_scale = RateScale.PER_MINUTE,	-- ...game minute
		max_count=10,
		
		-- generate at random distances between 15 and 18 meters away.
		radius = { 16,45},
		
		-- copy times from k6kids_attractor
		calendar = { monday, tuesday, wednesday, thursday, friday },
		time_of_day = {
				[7.7] = 0.0,
				[7.8] = 0.1,			
				[7.9] = 1.0,			
				[8.3] = 0.1,
				[8.4] = 0.0,
				},
		follow_roads = true,
	}
   
    ---================ Bus IN =========================
   -- create a IN generator that creates School Buses - INCOMING
generator.k6_bus_in = {
		automata = { "school_bus" },					-- create children
      occupancy_pct = 0.02,						-- generate 0.02% of school's occupancy...
		rate = 1,										
		rate_scale = RateScale.PER_MINUTE,	-- ...game minute
		max_count=2,
		radius = { 16,35},
   	calendar = { monday, tuesday, wednesday, thursday, friday },
		time_of_day = {
				[7.7] = 0.0,
				[7.8] = 0.1,			
				[7.9] = 1.0,			
				[8.3] = 0.1,
				[8.4] = 0.0,
				},
		follow_roads = true,
		behavior = {
			{ state = BehaviorState.DEFAULT,
			  timeout = 15,
			  final = true,
			}
		},
      deactivate_trigger = { effects.EDUCATION_STRIKE_ACTIVE },
	}
   --------------------------- OUTGOING MOMS SECTION
   -- create a generator that creates soccer moms at the edge of the school
generator.soccermoms_out = 
{
      automata = { "soccer_moms" },						-- create mom cars
      occupancy_pct = 0.02,						-- generate 0.02% of school's occupancy...
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=6,
      
      -- generate at random distances between 1 and 7 meters away.
      radius = { 5,10 },
      
      calendar = { monday, tuesday, wednesday, thursday, friday },
      time_of_day = {
            [15.4] = 0.0,			
            [15.5] = 1.0,	
            [15.8] = 1.0,
            [16.0] = 0.0,
            },
               behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
                 {
                     --percentage = 0.1,                -- percentage that will do this behavior
                     --~ radius = 20,
                     state = BehaviorState.DEFAULT,
                     timeout = 18,
                     final = true,
                  },
               },
      follow_roads = true,
}

--===========BUS OUT ===========================
-- create a generator that creates School Buses at the edge of the school
generator.k6_bus_out = 
{
      automata = { "school_bus" },						-- create mom cars
      occupancy_pct = 0.02,						-- generate 0.02% of school's occupancy...
      rate = 6,										-- ...X times per...
      rate_scale = RateScale.PER_HOUR,	-- ...game hour
      max_count= 2,
      radius = { 2,10 },
     	calendar = { monday, tuesday, wednesday, thursday, friday },
      time_of_day = {
            [15.4] = 0.0,			
            [15.5] = 1.0,	
            [15.8] = 1.0,
            [16.0] = 0.0,
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

occupant_group.schoolk6 = 
{
	 group_id = "0x150F",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map
	
	controllers = {
		"k6kids_attractor",
		"k6kids_generator",
		"k6kids_in",
		"k6kids_repulsor",
      "soccermoms_attract",
		"soccermoms_in",
		"soccermoms_out",
      "k6_bus_in",               -- DO NOT change this string without also changing cSC4Vehicle.cpp!
		"k6_bus_out",              -- DO NOT change this string without also changing cSC4Vehicle.cpp!
		},
}


-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
