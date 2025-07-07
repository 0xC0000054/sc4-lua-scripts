--
-- wildlife.lua
--

dofile("_templates.lua");
dofile("pedestrians.lua");

wildlife_behavior = 
{
   state = BehaviorState.RANDOM_WALK,
   timeout = 60,
   final = true,
   ignore_roads = true,
   ignore_paths = true,
   avoid_lots = true,
   avoid_roads = true,
   random_walk =
   {
      kph = { 5, 10},
      delay = { 2, 10 },
      turn = { 0.3, 0.05 },
      idle_delay = { 5, 30 },
      idle_time = { 0.1, 1 },
      strength = 0.5,
      acceleration = 0.5,
      deceleration = 0.5,
   },
}

generator.wildlife_generator = {
	automata = { "deer", "bear", "horse", "moose","llama" },
	max_count = 2,
	count = 1,
	rate = 0.5,
	rate_scale = RateScale.PER_HOUR,
	group_count = 3,
   radius = { 1, 2 },
   random_chance = 0.02,
         time_of_day = { -- crepuscular animals!
               [4.0] = 0.1,	
               [4.5] = 0.5, 			
               [5.0] =1.0,         -- start at 5 AM...
               [6.0] = 0.2,   -- then taper off
               [7.5] = 0.01,
               [18.0] = 0.3,				
               [19.0] =1.0,         -- start at 7PM...
               [20.5] =1.0, 
               [22.0] = 0.1,   -- then taper off
         }, 
            behavior = {
               wildlife_behavior,
            },
            
   exclusive_radius = 256,
}


   

occupant_group.Fauna_generate = 
{
	 group_id = "0x100a",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map for Building Types

   controllers = {
		"wildlife_generator",
		},
   percentage = 0.2,
}
--~ verify_all_templates()