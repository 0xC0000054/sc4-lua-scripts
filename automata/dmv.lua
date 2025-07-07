--
-- dmv.lua
--

dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua")

----------------------------------------------------------------
attractor.dmv_sims_attractor = 
{
	strength = {50},
	
	radius = 24,					-- influence radius, in meters
	automata = { "sim" },		-- automata_groups this attractor affects
	--calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {
			[7] = 0.0,				
			[8] = 0.8,				
			[8.5] = 0.8,			
			[9.0] = 0.8,
			[14.9] = 0.5,			
			[16.0] = 0.5,			
			[17.0] = 0.0,
			
	},
	
	behavior = {					
		{	
			radius = 18,
			state = BehaviorState.QUEUE,
         sfx = {SFX.Automata_WallaMedium},
         timeout = 30,
         final = true,        -- destroy automaton if it ever leaves this state
		},
	},
}
--------------------------------------------------------------------------
-- create a generator that creates sims
generator.dmv_sims_generator = 
{
	automata = { "sim" },					
	
	count = 1,
	rate = 12,
	rate_scale = RateScale.PER_MINUTE,
	max_count=40,
	
   follow_roads = true,
	radius = { 8, 12 },
	
	--calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {
			[7] = 0.0,				
			[8] = 0.8,				
			[8.5] = 0.8,			
			[9.0] = 1.0,
			[14.9] = 0.5,			
			[16.5] = 0.2,			
			[17.0] = 0.0,
   },
}
------------------------------------------------------
occupant_group.dmv = 
{
	group_id = "0x1905",				
	controllers = {
		"dmv_sims_attractor",
		"dmv_sims_generator",
	},
}


-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
