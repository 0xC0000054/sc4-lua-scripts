--
-- convention.lua
--

dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua")

--~ attractor.convention_pull = 
--~ {
	--~ strength = 40,
		--~ radius = 40,					-- influence radius, in meters
	--~ automata = { "sim" },		-- automata_groups this attractor affects
	--~ --calendar = { monday, tuesday, wednesday, thursday, friday },
	--~ time_of_day = {
			--~ [7] = 0.0,				
			--~ [8] = 0.8,				
			--~ [8.5] = 0.8,			
			--~ [9.0] = 0.8,
			--~ [12.9] = 0.5,			
			--~ [15.0] = 1.0,			
			--~ [17.0] = 0.2,
			--~ [18.0] = 0.0,
	--~ },
	--~ use_lot_facing = true,           -- sims will be attracted to the front of the building
--~ }

-- create a generator that creates school kids
generator.convention_maker = 
{
	radius = { 3, 5 },
	automata = { "firefighter", "policeman", "construction_sim",
   "businessperson", "education_worker", "medical_worker", "protestor", 
   "protestor"  },
	max_count = 50,
	count = 1,
	rate = 1,
	rate_scale = RateScale.PER_MINUTE,
	group_count = 50,
      use_lot_facing = true,
      follow_roads = true,
            behavior = {					
                  {	
                  state = BehaviorState.CROWD,
                  sfx = {SFX.Automata_WallaSmall, SFX.Automata_WallaMedium},
                  timeout = 60.0,       
                  final = true,        -- destroy automaton if it ever leaves this state
                  },
             },
	--calendar = { monday, tuesday, wednesday, thursday, friday },
      time_of_day = {
               [7] = 0.0,				
               [8] = 0.8,				
               [8.5] = 0.8,			
               [9.0] = 0.8,
               [14.9] = 0.5,			
               [15.0] = 0.5,			
               [17.0] = 0.2,
               [18.0] = 0.0,
         },
}
---====================================================
occupant_group.convention = 
{
	group_id = "0x1921",				
	controllers = {
		"convention_maker",
	},
}


-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
