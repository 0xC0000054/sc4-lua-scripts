--
-- worship.lua
--

dofile("_templates.lua")
dofile("vehicles.lua")
dofile("pedestrians.lua")
-------------------------Peds SECTION
------------------------------------------------------------------------
-- create an attractor that ATTRACTS
attractor.worship_peds_pull = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 10,
	radius = 30,					-- influence radius, in meters
	automata = { "sim", "child" },		-- automata_groups this attractor affects
      calendar = {sunday,saturday},
      time_of_day = {
			[8] = 0.0,				
			[9.5] = 1.0,				
			[10.0] = 1.0,
			[10.1] = 0.0,
			},
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		--~ {	
         --~ percentage = 0.4,            ---percentage that will assume this behavior
         --~ radius =26,
			--~ state = BehaviorState.BEE_LINE,
			--~ timeout = 9,
      --~ },
      {	radius =16,
			state = BehaviorState.CROWD,
			timeout = 1.8,
         final = true,
         ignore_roads = true,
         ignore_paths = true,
		},
	},
}
-- create a  generator that creates Peds INCOMING
generator.worship_peds_in = {
		automata = {"sim", "child"  },					-- create children
		count = 7,
		rate = .5,										
		rate_scale = RateScale.PER_MINUTE,	-- ...game minute
		max_count=30,
		
		-- generate at random distances between 15 and 18 meters away.
		radius = { 16,26},
    calendar = {sunday,saturday},
      time_of_day = {
			[8] = 0.0,				
			[9.5] = 1.0,				
			[10.0] = 1.0,
			[10.1] = 0.0,
				},
		follow_roads = true,
	}
   
   ------------- worship Ped REPULSOR ---------------------
attractor.worship_peds_push =
{
	strength = -100,
	radius = 30,					-- influence radius, in meters
	automata = { "sim", "child",  },		-- automata_groups this attractor affects
   calendar = {sunday,saturday},
	time_of_day = {
			[11.0] = 0.0,
			[12.1] = 1.0,			
			[12.5] = 1.0,
			[13.0] = 0.0,
	},
      --~ behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
                  --~ {
                     --~ percentage = 0.1,
                     --~ radius = 12,
                     --~ state = BehaviorState.BEE_LINE,
                     --~ --anims={ "woohoo", "walk" },
                     --~ timeout = 6.0,
                     --~ --final = true,
                  --~ },

      --~ },
}
-- create a generator that creates worship_peds OUT --------
generator.worship_peds_out = 
{
      automata = {"sim", "child"  },						-- create children
      count = 30,
      rate =1,										-- ...once every...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count= 50,
      radius = { 5,9 },    -- generate at random distances between 1 and 7 meters away.

      calendar = {sunday,saturday},
      time_of_day = {
         [11.0] = 0.0,
			[12.1] = 1.0,			
			[12.5] = 1.0,
			[13.0] = 0.0,
            },
               behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
               {
                  --radius =16,
                  state = BehaviorState.DEFAULT,
                  timeout = 18.0,
                  --anims={ "woohoo", "walk" },
                  final = true,
               },
            },
      follow_roads = true,
}


   -----------------worship Cars SECTION -----------------------------
---------------INCOMING Cars SECTION  
  -- create an attractor that attracts Cars
attractor.worship_cars_pull = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 70,
	radius = 40,					-- influence radius, in meters
	automata = { "civilian_cars" },		-- automata_groups this attractor affects
	      calendar = {sunday,saturday},
      time_of_day = {
			[8] = 0.0,				
			[9.5] = 1.0,				
			[10.0] = 1.0,
			[10.1] = 0.0,
         },
      behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {	
            percentage = 0.1,
            radius =20,
            state = BehaviorState.DISAPPEAR,
            timeout = 6.0,
            final = true,
         },
      },
}
-- create a IN generator that creates college  carsS - INCOMING
generator.worship_cars_in = {
		automata = { "civilian_cars" },					-- create children
		count =1,
		rate = 1,										
		rate_scale = RateScale.PER_MINUTE,	-- ...game minute
		max_count=10,
		
		-- generate at random distances between 15 and 18 meters away.
		radius = { 16,35},
		
      calendar = {sunday,saturday},
      time_of_day = {
			[8] = 0.0,				
			[9.8] = 1.0,				
			[10.0] = 1.0,
			[10.1] = 0.0,
			},
		follow_roads = true,
	}
   
   --------------------------- OUTGOING Cars SECTION
  
   ---------------------------------------------------------------------------------------
-- Finally, create a "school" occupant group with attached attractor & generator

occupant_group.worship = 
{
	 group_id = "0x1907",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map for Building Types
	
	controllers = {
		"worship_peds_pull",
		"worship_peds_in",
		"worship_peds_push",
		"worship_peds_out",
      "worship_cars_pull",
		"worship_cars_in",
		--"worship_cars_out",
		},
}

-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--verify_all_templates()
