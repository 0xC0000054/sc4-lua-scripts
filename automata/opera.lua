--
-- opera.lua
--

dofile("_templates.lua")
dofile("vehicles.lua")
dofile("pedestrians.lua")
-------------------------Peds SECTION
------------------------------------------------------------------------
-- create an attractor that ATTRACTS
attractor.opera_peds_pull = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 60,
	radius = 50,					-- influence radius, in meters
	automata = { "sim" },		-- automata_groups this attractor affects
      calendar = {friday,saturday},
      time_of_day = {
			[20.0] = 0.0,				
			[20.5] = 1.0,				
			[23.0] = 1.0,
			[23.1] = 0.0,
			},
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	
         percentage = 0.4,            ---percentage that will assume this behavior
         radius =26,
			state = BehaviorState.BEE_LINE,
			timeout = 9,
      },
      { percentage = 0.5,	
         radius =16,
			state = BehaviorState.QUEUE,
			timeout = 29,
         final = true,
		},
      {	radius =6,
			state = BehaviorState.CROWD,
			timeout = 29,
         final = true,
		},
	},
}
-- create a  generator that creates Peds INCOMING
generator.opera_peds_in = {
		automata = { "sim" },					-- create children
		count =200,
		rate = .5,										
		rate_scale = RateScale.PER_MINUTE,	-- ...game minute
		max_count=30,
		
		-- generate at random distances between 15 and 18 meters away.
		radius = { 16,26},
      calendar = {friday,saturday},
      time_of_day = {
			[20.0] = 0.0,				
			[20.5] = 1.0,				
			[23.0] = 1.0,
			[23.1] = 0.0,
				},
		follow_roads = true,
	}
   
   ------------- opera Ped REPULSOR ---------------------
attractor.opera_peds_push =
{
	strength = -100,
	radius = 30,					-- influence radius, in meters
	automata = { "sim" },		-- automata_groups this attractor affects
      calendar = {sunday,saturday},
	time_of_day = {
			[01.0] = 0.0,
			[01.1] = 1.0,			
			[01.5] = 1.0,
			[02.0] = 0.0,
	},
      behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
                  {
                     percentage = 0.1,
                     radius = 12,
                     state = BehaviorState.BEE_LINE,
                     anims={ "woohoo", "walk" },
                     timeout = 6,
                     --final = true,
                  },

      },
}
-- create a generator that creates opera_peds OUT --------
generator.opera_peds_out = 
{
      automata = { "sim" },						-- create children
      count = 11,
      rate =1,										-- ...once every...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=30,
      radius = { 0,9 },    -- generate at random distances between 1 and 7 meters away.

      calendar = {sunday,saturday},
      time_of_day = {
  			[01.0] = 0.0,
			[01.1] = 1.0,			
			[01.5] = 1.0,
			[02.0] = 0.0,
            },
               behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
               {
                  --radius =16,
                  state = BehaviorState.DEFAULT,
                  timeout = 18,
                  anims={ "woohoo", "walk" },
                  final = true,
               },
            },
      follow_roads = true,
}


   -----------------opera Cars SECTION -----------------------------
---------------INCOMING Cars SECTION  
  -- create an attractor that attracts Cars
attractor.opera_cars_pull = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 70,
	radius = 40,					-- influence radius, in meters
	automata = { "rich_cars","limo" },		-- automata_groups this attractor affects
      calendar = {friday,saturday},
      time_of_day = {
			[20.0] = 0.0,				
			[20.5] = 1.0,				
			[23.0] = 1.0,
			[23.1] = 0.0,
         },
      behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {	
            percentage = 0.1,
            radius =20,
            state = BehaviorState.DISAPPEAR,
            timeout = 6,
            final = true,
         },
      },
}
-- create a IN generator that creates college  carsS - INCOMING
generator.opera_cars_in = {
		automata = { "rich_cars","limo" },					-- create children
		count =1,
		rate = 1,										
		rate_scale = RateScale.PER_MINUTE,	-- ...game minute
		max_count=10,
		
		-- generate at random distances between 15 and 18 meters away.
		radius = { 16,35},
		
      calendar = {friday,saturday},
      time_of_day = {
			[20.0] = 0.0,				
			[20.5] = 1.0,				
			[23.0] = 1.0,
			[23.1] = 0.0,
			},
		follow_roads = true,
	}
   
   --------------------------- OUTGOING Cars SECTION
  -- create a generator that creates collegecars at the edge of the school
generator.opera_cars_out = 
{
      automata = { "rich_cars","limo" },						-- create mom cars
      count = 1,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=6,
      
      -- generate at random distances between 1 and 7 meters away.
      radius = { 6,10 },
      
      calendar = {sunday,saturday},
      time_of_day = {
         [01.0] = 0.0,
			[01.1] = 1.0,			
			[01.8] = 1.0,
			[02.0] = 0.0,
      },
      behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
               {
                  --percentage = 0.1,                -- percentage that will do this behavior
                  radius = 20,
                  state = BehaviorState.DEFAULT,
                  timeout = 18,
                  final = true,
               },
      },
      follow_roads = true,
}

   ---------------------------------------------------------------------------------------
-- Finally, create an  occupant group with attached attractor & generator

occupant_group.opera = 
{
	 group_id = "0x1909",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map for Building Types

   controllers = {
		"opera_peds_pull",
		"opera_peds_in",
		"opera_peds_push",
		"opera_peds_out",
      "opera_cars_pull",
		"opera_cars_in",
		"opera_cars_out",
		},
}

-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--verify_all_templates()
