--
-- landmark_queue.lua
--

dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua")

attractor.queue_sims_attractor = 
{
	strength = 40,
   use_lot_facing = true,           -- sims will be attracted to the front of the building
	radius = 20,					-- influence radius, in meters
	automata = { "sim" },		-- automata_groups this attractor affects
	--calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {
			[9.1] = 0.0,				
			[9.5] = 0.8,			
			[10.0] = 0.8,
			[12.9] = 0.5,			
			[15.0] = 1.0,			
			[17.0] = 0.2,
			[18.0] = 0.0,
	},
	behavior = {					
		{	
			radius = 18,
			state = BehaviorState.QUEUE,
         sfx = {SFX.Automata_WallaSmall, SFX.Automata_WallaMedium},
         timeout = 40.0,       
         final = true,        -- destroy automaton if it ever leaves this state
		},
	},
}

-- create a generator that creates school kids
generator.queue_sims_generator = 
{
	automata = { "sim" },					
	
	count = 11,
	rate = 8,
	rate_scale = RateScale.PER_HOUR,
	max_count=40,
	
   follow_roads = true,
	radius = { 14, 28 },
	
	--calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {
			[8] = 0.0,				
			[9] = 0.8,				
			[9.5] = 0.8,			
			[10.0] = 0.8,
			[12.9] = 0.5,			
			[15.0] = 1.0,			
			[17.0] = 0.2,
			[18.0] = 0.0,
	},
}
---====================================================
occupant_group.landmark_queue = 
{
	group_id = "0x150c",				
	controllers = {
		"queue_sims_attractor",
		"queue_sims_generator",
	},
}


-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
