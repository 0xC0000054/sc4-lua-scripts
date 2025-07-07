--
-- bus_stop.lua
--

dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua")

----------------------------------------------------------------
attractor.bus_sims_attractor = 
{
	strength = {100},
	
	radius = 24,					-- influence radius, in meters
	automata = { "sim" },		-- automata_groups this attractor affects
	--calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day =     -- cut'n'pasted from the Bus Clock in the Automata Tuning Exemplar
   { [0] = -0.15,
      [1] = 0,
      [4.5] = 0,
      [5] = 0.2,
      [5.5] = 0.5,
      [6.5] = 0.9,
      [7.5] = 1,
      [8.5] = 1,
      [9.5] = 0.3,
      [10] = 0,
      [16] = 0,
      [16.5] = -0.6,
      [17] = -0.8,
      [18] = -0.8,
      [19] = -0.9,
      [20] = -1,
      [21] = -0.9,
      [22] = -0.45,
      [23] = -0.15,
      [24] = -0.15,
   }	,

	behavior = {					
		{	
         percentage = 0.5,
			radius = 10,
			state = BehaviorState.QUEUE,
         sfx = {SFX.Automata_WallaSmall},
         final = true,        -- destroy automaton if it ever leaves this state
		},
	},
   
   max_count = 8,
   deactivate_trigger = { effects.TRANSIT_STRIKE_ACTIVE },
}

generator.bus_stop_generator = 
{
   automata = { "bus" },
   count = 1,
   rate = 1,
   rate_scale = RateScale.PER_DAY,
   max_count = 1,
   radius = { 5, 10 },
   follow_roads = true,
   lifetime = 15,
   
   behavior = {
      {
         state = BehaviorState.DEFAULT,
         radius = 10,
         timeout = 20.0,
         final = true,
      },
   },
   
   deactivate_trigger = { effects.TRANSIT_STRIKE_ACTIVE },
   destroy_automata = true,
}

----------------------------------------------------------------
occupant_group.busstop = 
{
	group_id = "0x1926",				
	controllers = {
		"bus_sims_attractor",
      "bus_stop_generator",
	},
}


-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
