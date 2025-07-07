--
-- disasters.lua
-- 
-- Disaster-related automata scripts 
--

dofile("_sfx.lua");
dofile("_templates.lua");
----------

attractor.disaster_repulsor =
{
	automata = { "sim", "child", "protestor" },
   strength = -100,
   radius = 130,
   behavior = {
      {
         radius = 80,
         state = BehaviorState.BEE_LINE,
         anims = { "panic_run" },
         sfx = { SFX.Automata_Panic },
         kph_multiply = { 2.0, 3.0 },
      },
      {
         radius = 130,
         state = BehaviorState.CROWD,
         anims = { "idle" },
      },
	},
}

attractor.disaster_fauna_repulsor = 
{
   automata = { "fauna" },
   strength=-100,
   radius = 130,
   behavior = {
      {
         radius = 80,
         state = BehaviorState.BEE_LINE,
         anims = { "panic_run" },
         kph_multiply = { 3.0,4.0 },
         ignore_roads = true,
      },
      {
         radius = 130,
         state = BehaviorState.CROWD,
         anims = { "idle" },
      },
   },
}

------------------------------------------------------------
--tanks
-----------------------------------------------------------
attractor.tank_repulsor =
{
	automata = { "sim", "child", "protestor" },
   strength = -100,
   radius = 130,
   behavior = {
      {
         radius = 80,
         state = BehaviorState.BEE_LINE,
         anims = { "panic_run" },
         sfx = { SFX.Automata_Panic },
         kph_multiply = { 2.0, 3.0 },
      },
      {
         radius = 130,
         state = BehaviorState.CROWD,
         anims = { "idle" },
      },
	},
}

attractor.tank_fauna_repulsor = 
{
   automata = { "fauna" },
   strength=-100,
   radius = 130,
   behavior = {
      {
         radius = 80,
         state = BehaviorState.BEE_LINE,
         anims = { "panic_run" },
         kph_multiply = { 3.0,4.0 },
         ignore_roads = true,
      },
      {
         radius = 130,
         state = BehaviorState.CROWD,
         anims = { "idle" },
      },
   },
}

occupant_group.tank_repulser = 
{
   controllers = {
      "tank_repulsor", "tank_fauna_repulsor",
   }
}

------------------------
-- Earthquake
------------------------
attractor.quake_repulsor =
{
	_parent = attractor.disaster_repulsor,
	radius = 60,
}
attractor.quake_fauna_repulsor = 
{
   _parent = attractor.disaster_fauna_repulsor,
   radius = 60,
}

occupant_group.quake_disaster = 
{
   controllers = {
      "quake_repulsor",
      "quake_fauna_repulsor",
   }
}

------------------------
-- Tornado
------------------------
attractor.tornado_repulsor = 
{
   _parent = attractor.disaster_repulsor,
   radius = 150,
}
attractor.tornado_fauna_repulsor = 
{
   _parent = attractor.disaster_fauna_repulsor,
   radius = 150,
}

occupant_group.tornado_disaster = 
{
   controllers = {
      "tornado_repulsor",
      "tornado_fauna_repulsor",
   }
}

------------------------
-- Volcano
------------------------
attractor.volcano_repulsor = 
{
   _parent = attractor.disaster_repulsor,
   radius = 150,
}
attractor.volcano_fauna_repulsor = 
{
   _parent = attractor.disaster_fauna_repulsor,
   radius = 150,
}

occupant_group.volcano_disaster = 
{
   controllers = {
      "volcano_repulsor",
      "volcano_fauna_repulsor",
   }
}

------------------------
-- Giant Robot
------------------------
attractor.giant_robot_repulsor = 
{
   _parent = attractor.disaster_repulsor,
   radius = 150,
}
attractor.giant_robot_fauna_repulsor = 
{
   _parent = attractor.disaster_fauna_repulsor,
   radius = 150,
}

occupant_group.giant_robot_disaster = 
{
   controllers = {
      "giant_robot_repulsor",
      "giant_robot_fauna_repulsor",
   }
}

------------------------
-- UFO Disaster Small Ships
------------------------
attractor.UFO_repulsor = 
{
	automata = { "sim", "child", "protestor" },
   strength = -100,
   radius = 130,
   behavior = {
      {
         radius = 80,
         state = BehaviorState.BEE_LINE,
         anims = { "panic_run" },
         sfx = { SFX.Automata_Panic },
         kph_multiply = { 2.0, 3.0 },
      },
      {
         radius = 130,
         state = BehaviorState.CROWD,
         anims = { "idle" },
      },
	},
}


attractor.UFO_fauna_repulsor = 
{
   automata = { "fauna" },
   strength=-100,
   radius = 130,
   behavior = {
      {
         radius = 80,
         state = BehaviorState.BEE_LINE,
         anims = { "panic_run" },
         kph_multiply = { 3.0,4.0 },
         ignore_roads = true,
      },
      {
         radius = 130,
         state = BehaviorState.CROWD,
         anims = { "idle" },
      },
   },
}


occupant_group.UFO_disaster = 
{
   controllers = {
      "UFO_repulsor",
      "UFO_fauna_repulsor",
   }
}

attractor.disaster_stun =
{
   automata = { "vehicle" },
   strength= 40,
   radius = 100,
   ignore_lot = true,
   persist_offscreen = true,
   behavior = {
      {
         radius = 100,
         state = BehaviorState.IDLE,
      },
   },
}

attractor.UFO_attractor = 
{
	automata = { "sim", "child", "protestor" },
   strength = 50,
   radius = 100,
   ignore_lot = true,
   persist_offscreen = true,
   behavior = {
      {
         radius = 100,
         state = BehaviorState.BEE_LINE,
      },
	},
}

occupant_group.UFO_StunAndAttract = 
{
   controllers = {
      "disaster_stun",
      "UFO_attractor",
   }
}

attractor.UFO_Riot = 
{
	automata = { "sim" },
   strength = 0,
   radius = 600,
   behavior = {
      {
         radius = 600,
         state = BehaviorState.RIOT_FOLLOWER,
         anims = { "riot_looting" },
      },
      {
         radius = 600,
         state = BehaviorState.RIOT_FOLLOWER,
         anims = { "riot_throw" },
      },
	},
}
occupant_group.UFO_Rioting = 
{
   controllers = {
      "UFO_Riot"
   }
}

attractor.UFO_Abduction = 
{
   automata = { "sim", "child" },
   strength = 100,
   radius = 75,
   ignore_lot = true,
   persist_offscreen = true,
   delay = 25,
   max_count = 150,
   
   behavior = {
      {
         radius = 100,
         state = BehaviorState.MAGNET,
         kph = 4500,
         anims = { "woohoo" },
         ignore_paths = true,
         ignore_terrain = true,
         ignore_roads = true,
         ignore_attractors = true,
         timeout=40,
         final=true
      },
   }
}
attractor.UFO_Abduct_Cars = 
{
   automata = { "vehicle", "fauna", "sim" },
   strength = 100,
   radius = 90,
   ignore_lot = true,
   persist_offscreen = true,
   delay = 25,
   max_count = 20,
   behavior = {
      {
         radius = 100,
         state = BehaviorState.MAGNET,
         kph = 4000,
         ignore_paths = true,
         ignore_terrain = true,
         ignore_roads = true,
         ignore_attractors = true,
         timeout = 40,
         final= true
      },
   }
}
occupant_group.UFO_Abduction_Group = 
{
   controllers = {
      "UFO_Abduction", "UFO_Abduct_Cars",
   }
}

attractor.UFO_Drive_Abduction = TTT
{
   _parent = attractor.UFO_Abduction,
   delay = 0,
   radius = 60,
}

attractor.UFO_Drive_Abduct_Cars = TTT
{
   _parent = attractor.UFO_Abduct_Cars,
   delay = 0,
   radius = 60,
}

occupant_group.UFO_Drive_Abduction_Group = TTT
{
   controllers = {
      "UFO_Drive_Abduction", "UFO_Drive_Abduct_Cars",
   }
}

--Car Abduction

attractor.Car_Abduction = 
{
   automata = { "sim", "child" },
   strength = 100,
   radius = 75,
   ignore_lot = true,
   persist_offscreen = true,
   delay = 25,
   max_count = 150,
   
   behavior = {
      {
         radius = 100,
         state = BehaviorState.MAGNET,
         kph = 4500,
         anims = { "woohoo" },
         ignore_paths = true,
         ignore_terrain = true,
         ignore_roads = true,
         ignore_attractors = true,
         timeout=5,
         final=true
      },
   }
}
attractor.Car_Abduct_Cars = 
{
   automata = { "vehicle" },
   strength = 100,
   radius = 90,
   ignore_lot = true,
   persist_offscreen = true,
   delay = 25,
   max_count = 10,
   behavior = {
      {
         radius = 100,
         state = BehaviorState.MAGNET,
         kph = 4000,
         ignore_paths = true,
         ignore_terrain = true,
         ignore_roads = true,
         ignore_attractors = true,
         timeout = 5,
         final= true
      },
   }
}
occupant_group.Car_Abduction_Group = 
{
   controllers = {
      "Car_Abduction", "Car_Abduct_Cars",
   }
}

attractor.Car_Drive_Abduction = TTT
{
   _parent = attractor.Car_Abduction,
   delay = 0,
   radius = 60,
}

attractor.Car_Drive_Abduct_Cars = TTT
{
   _parent = attractor.Car_Abduct_Cars,
   delay = 0,
   radius = 60,
}

occupant_group.Car_Drive_Abduction_Group = TTT
{
   controllers = {
      "Car_Drive_Abduction", "Car_Drive_Abduct_Cars",
   }
}
--~ verify_all_templates()