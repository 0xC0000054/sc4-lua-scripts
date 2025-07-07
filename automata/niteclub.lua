--
-- niteclub.lua
--

dofile("_templates.lua")
dofile("vehicles.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua")
-------------------------Peds SECTION
------------------------------------------------------------------------
-- create an attractor that ATTRACTS
attractor.niteclub_peds_pull = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 30,
	radius = 50,					-- influence radius, in meters
	automata = { "sim" },		-- automata_groups this attractor affects
   --use_lot_facing = true,
      ignore_lot = true,
      time_of_day = {
			[20.0] = 0.0,				
			[20.5] = 1.0,				
			[23.0] = 1.0,
			[23.1] = 0.0,
			},
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
            {	
      percentage = 0.01,
      radius =26,
			state = BehaviorState.DEFAULT,
			timeout = 10,
         --final = true,
         --~ sfx = {SFX.Automata_WallaMedium},
      },
            { 
         percentage = 0.3,	
         radius =18,
			state = BehaviorState.QUEUE,
			timeout = 60,
         final = true,
         sfx = {SFX.Automata_WallaSmall,},
		},
      
      },
}
-- create a  generator that creates Peds INCOMING
generator.niteclub_peds_in = {
		automata = { "sim" },					-- create children
		count =5,
		rate = 1,										
		rate_scale = RateScale.PER_MINUTE,	-- ...game minute
		max_count=30,
      ignore_lot = true,
		-- generate at random distances between 15 and 18 meters away.
		radius = { 16,26},
      time_of_day = {
			[20.0] = 0.0,				
			[20.5] = 1.0,				
			[23.0] = 1.0,
			[23.1] = 0.0,
				},
            	
		follow_roads = true,
	}
   
   ------------- niteclub Ped REPULSOR ---------------------
attractor.niteclub_peds_push =
{
	strength = -100,
	radius = 30,					-- influence radius, in meters
	automata = { "sim" },		-- automata_groups this attractor affects
   ignore_lot = true,
   time_of_day = {
			[01.0] = 0.0,
			[01.1] = -0.5,			
			[02.5] = -1.0,
			[04.0] = 0.0,
	},
      --~ behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
                  --~ {
                     --~ percentage = 0.1,
                     --~ radius = 12,
                     --~ state = BehaviorState.BEE_LINE,
                     --~ anims={ "woohoo", "walk" },
                     --~ Automata_CheerSmall
                     --~ timeout = 6,
                     --~ --final = true,
                  --~ },

      --~ },
}
-- create a generator that creates niteclub_peds OUT --------
generator.niteclub_peds_out = 
{
      automata = { "sim" },						-- create children
      count = 5,
      rate =1,										-- ...once every...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=50,
      radius = { 8,10 },    -- generate at random distances between 1 and 7 meters away.
         ignore_lot = true,
         follow_roads = true,
              time_of_day = {
                  [01.0] = 0.0,
                  [01.5] = 0.10,			
                  [01.7] = 1.0,
                  [02.8] = 0.0,
               },
               behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
               {
                  state = BehaviorState.RANDOM_WALK,
                  anims={ "woohoo", "walk","reject", "hop_clap","walk" },                  
                  random_walk =
                        {
                           kph = { 5, 10},
                           delay = { 2, 10 },
                           turn = { 0.1, 0.05 },
                           idle_delay = { 1, 4 },
                           idle_time = { 0.1, 0.2 },
                           strength = 0.5,
                           acceleration = 0.5,
                           deceleration = 0.5,
                        },
                  sfx = {SFX.Automata_WallaSmall, SFX.Automata_CheerSmall, SFX.Automata_RiotSmall},                  
                  timeout = 10,
                  ignore_roads = true,
                  ignore_paths = true,
                  final = true,         
               },
            },  
}            
   -----------------niteclub Cars SECTION -----------------------------
---------------INCOMING Cars SECTION  
  -- create an attractor that attracts Cars
attractor.niteclub_cars_pull = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 70,
	radius = 40,					-- influence radius, in meters
	automata = { "civilian_cars" },		-- automata_groups this attractor affects
      time_of_day = {
			[20.0] = 0.0,				
			[20.5] = 1.0,				
			[23.0] = 1.0,
			[23.1] = 0.0,
         },
         ignore_lot = true,
      behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {	
            percentage = 0.1,
            radius =20,
            state = BehaviorState.DISAPPEAR,
            timeout = 16,
            final = true,
         },
      },
}
-- create a IN generator that creates college  carsS - INCOMING
generator.niteclub_cars_in = {
		automata = { "civilian_cars" },					-- create children
		count =1,
		rate = 1,										
		rate_scale = RateScale.PER_MINUTE,	-- ...game minute
		max_count=10,
		
		-- generate at random distances between 15 and 18 meters away.
		radius = { 16,35 },
         ignore_lot = true,		
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
generator.niteclub_cars_out = 
{
      automata = { "civilian_cars" },						-- create mom cars
      count = 7,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=10,
      
      -- generate at random distances between 1 and 7 meters away.
      radius = { 12,20 },
          ignore_lot = true,     
              time_of_day = {
                  [01.0] = 0.0,
                  [01.5] = 0.10,			
                  [01.7] = 1.0,
                  [02.8] = 0.0,
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

occupant_group.niteclub = 
{
	 group_id = "0x1908",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map for Building Types

   controllers = {
		"niteclub_peds_pull",
		"niteclub_peds_in",
		"niteclub_peds_push",
		"niteclub_peds_out",
      "niteclub_cars_pull",
		"niteclub_cars_in",
		"niteclub_cars_out",
		},
}

-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
