--
-- landmark_ogle.lua
--

dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua")

attractor.ogle_sims_attractor = 
{
	strength = 40,
	radius = 4,					-- influence radius, in meters
	automata = { "sim" },		-- automata_groups this attractor affects
	--calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {
			[8] = 0.0,				
			[9] = 1.0,				
			[17.0] = 1.0,
			[18.0] = 0.0,
	},
		behavior = {					
      {		
         percentage = .5,
         radius = 2,
         state = BehaviorState.RANDOM_WALK,
            random_walk =
                           {
                              kph = { 4, 5},
                              delay = { 0.5, 3 },
                              turn = { 0.1, 0.35 },
                              idle_delay = { .1, 1 },
                              idle_time = { 0.8, 9.2 },
                              strength = 0.5,
                              acceleration = 0.2,
                              deceleration = 0.5,
                           },
            timeout = 20.0,       
            ignore_roads = false,
            ignore_paths = false,
            final = true,        -- destroy automaton if it ever leaves this state
		},
   },
   --~ use_lot_facing = true,           -- sims will be attracted to the front of the building
}

-- create a generator that creates 
generator.ogle_sims_generator = 
{
	automata = { "sim" },					
	count = 11,
	rate = 4,
	rate_scale = RateScale.PER_HOUR,
	max_count=40,
	
   follow_roads = true,
	radius = { 1, 2 },
	
	--calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {
			[7] = 0.0,				
			[8] = 1.0,				
			[17.0] = 1.0,
			[18.0] = 0.0,
	},
      behavior = 
      {					
         --~ {		
            --~ percentage = 0.5,
            --~ radius = 2,
            --~ state = BehaviorState.CROWD,
            --~ anims = {"idle"},
            --~ sfx = {SFX.Automata_WallaSmall},
            --~ timeout = 20.0,       
            --~ final = true,        -- destroy automaton if it ever leaves this state
         --~ },
         {	percentage = 0.5,
            radius = 2,
            state = BehaviorState.RANDOM_WALK,
            random_walk =
                           {
                              kph = { 5, 7},
                              delay = { 0.5, 3 },
                              turn = { 0.1, 0.35 },
                              idle_delay = { .1, 2 },
                              idle_time = { 0.8, 19.2 },
                              strength = 0.5,
                              acceleration = 0.2,
                              deceleration = 0.5,
                           },
            timeout = 20.0,       
            ignore_roads = false,
            ignore_paths = false,
            final = true,        -- destroy automaton if it ever leaves this state
         },
      },
}
---====================================================
occupant_group.landmark_ogle = 
{
	group_id = "0x1935",				
	controllers = {
		--~ "ogle_sims_attractor",
		"ogle_sims_generator",
	},
}


-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
