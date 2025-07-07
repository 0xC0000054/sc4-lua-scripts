--
-- construction.lua
--
-- construction-related generators
--

dofile("_templates.lua")
------

-- creates construction vehicles (cement mixers)
generator.construction_vehicle_generator = 
{
	automata = { "cement_mixer" },					
   count = 1,
	rate = 1,
	rate_scale = RateScale.PER_HOUR,
	max_count=1,
	radius = { 32, 64 },
   behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	
			state = BehaviorState.DEFAULT,
			timeout = 30,
         final = true,
		},
   },
	follow_roads = true,
   destroy_automata=true,
}

attractor.construction_vehicle_attractor = 
{
   automata = { "cement_mixer" },
   strength = 90,
   radius = 85,
   behavior = {
      {
         radius = 16,
         state = BehaviorState.IDLE,
         timeout = 2,
         final = true,
      },
   },
}

occupant_group.construction_prop = 
{
	group_id = "0x5007",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map
	controllers = {
		"construction_vehicle_generator",
      "construction_vehicle_attractor",
   },
   percentage = 0.2,
}

