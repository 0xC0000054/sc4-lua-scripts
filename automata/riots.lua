--
-- strikers.lua
--

dofile("_templates.lua")

-- create a generator that creates rioters
generator.riot_leader_0 = 
{
	automata = { "sim" },
	count = 1,
	rate = 1, 
	rate_scale = RateScale.PER_MINUTE,
	max_count = 16,
	
	radius = { 0, 8 },
	follow_roads = true,
	
	time_of_day = {
			[6] = 1.0,
			[21] = 0.0
	},

	-- behavior is always expressed as a table of tables, since there can be more than 1
	behavior = {					
		{	
			radius = 32,
			state = BehaviorState.RIOT_FOLLOWER,
			anims = { "riot_shake_fist" },
			sfx = {SFX.Automata_RiotSmall},
			final = true,
		}
	},
}

-- NOTE: the generator is ADDED to the above generator when a leader reaches stage 2
generator.riot_leader_2 = 
{
	automata = { "sim" },
	count = 1,
	rate = 1, 
	rate_scale = RateScale.PER_MINUTE,
	max_count = 16,
	
	radius = { 0, 8 },
	follow_roads = true,
	
	time_of_day = {
			[6] = 1.0,
			[21] = 0.0
	},

	-- behavior is always expressed as a table of tables, since there can be more than 1
	behavior = {					
		{	
			radius = 32,
			state = BehaviorState.RIOT_FOLLOWER,
			anims = { "riot_looting" },
			sfx = {SFX.Automata_RiotLarge},
			final = true,
		},
		{	
			radius = 32,
			state = BehaviorState.RIOT_FOLLOWER,
			anims = { "riot_throw" },
			sfx = {SFX.Automata_RiotMedium},
			final = true,
		}
	},
}

-- NOTE: the generator is ADDED to the above generator when a leader reaches stage 3
generator.riot_leader_3 = 
{
	automata = { "riot_one_shot" },
	count = 1,
	rate = 1, 
	rate_scale = RateScale.PER_MINUTE,
	max_count = 2,
	
	radius = { 0, 8 },
	follow_roads = true,
	
	time_of_day = {
			[6] = 1.0,
			[21] = 0.0
	},

	-- behavior is always expressed as a table of tables, since there can be more than 1
	behavior = {					
		{	
			radius = 32,
			state = BehaviorState.IDLE,
		    timeout = 5,
			final = true,
         ignore_attractors=true,
		},
	},
}

attractor.riot_police_repulsor =
{
	automata = { "sim" },
	strength = -100,
	radius = 20,
	
	behavior = {
		{
			state = BehaviorState.BEE_LINE,
         final = true,
		}
	},
}

