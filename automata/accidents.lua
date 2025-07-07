--
-- accidents.lua
--
-- automata scripts related to traffic accidents
--

dofile("_sfx.lua")
dofile("_templates.lua")

--

occupant_group.collision_tool = 
{
   controllers = {
	"automata_collision",
   },
}

automata_collide_behavior = {
	radius = 32,
	state = BehaviorState.COLLIDE,
      timeout = 8,
      final = true,
}

attractor.automata_collision =
{
	automata = { "vehicle" },
   
	strength = { -100, -100, -100, 0 },
	radius = 32,
      ignore_lot = true, 
	ground_only = true,
	
	behavior = {
		automata_collide_behavior,
	},
}

--

occupant_group.pullover_tool = 
{
   controllers = {
	"automata_pullover",
   },
}

attractor.automata_pullover =
{
	automata = { "vehicle" },
   
	strength = { -100, -100, -100, 0 },
	radius = 32,
      ignore_lot = true, 
	ground_only = true,
	
	behavior = {
		{
			radius = 32,
			state = BehaviorState.PULLOVER,
			final = true,
		},
	},
}

--
------------------
--crowd gather
------------------
generator.accident_crowd = 
{
      automata = { "sim", "child" },						-- create crowd sims
      count = 30,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count= 40,
      radius = {20,44},
      lifetime = 20,
      follow_roads = true,
}  

attractor.accident_attract = 
{
   automata = { "sim", "child" },
   strength = 100,
   radius = 100,
   lifetime = 30,
   ignore_lot = true,
   persist_offscreen = true,
   behavior = {
      {
         radius = 100,
         state = BehaviorState.BEE_LINE,
         kph_multiply = { 2.0, 3.0 },
         timeout = 30,
      },
      {
         radius = 30,
         state = BehaviorState.CROWD,
         anims = { "idle" },
         timeout = 50,
      },
	},
}

occupant_group.traffic_accident_2 = 
{
   controllers = {
	"traffic_accident_collision_2",
	"accident_crowd",
	"accident_attract",
   },
}

attractor.traffic_accident_collision_2 =
{
   automata = { "vehicle" },
   
   strength = { -100, -100, -100, 0 },
   radius = 32,
   ground_only = true,
	
   behavior =
   {
      {
         -- radius can be clipped by adjusting overall attractor radius
	   radius = 160,
	   state = BehaviorState.COLLIDE,
	   final = true,
	}
   },
}
