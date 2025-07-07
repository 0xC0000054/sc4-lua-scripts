--
-- fire.lua
--
-- automata scripts related to fire disaster and fire tool
--

dofile("_sfx.lua")
dofile("_templates.lua")
---------

fire_fleeing_behavior = {
	radius = 16,
	state = BehaviorState.BEE_LINE,
	anims = { "panic_run" },
   sfx = { SFX.Automata_Panic },
   kph_multiply = { 3.0, 4.0 },
}

fire_fauna_fleeing_behavior = {
   radius = 16,
   state = BehaviorState.BEE_LINE,
   anims = { "panic_run" },
   avoid_roads = true,
   avoid_lots = true,
   ignore_roads = true,
   kph_multiply = { 5.0, 6.0 },
}

fire_rubbernecking_behavior = {
	radius = 32,
	state = BehaviorState.CROWD,
   anims = { "idle" },
   timeout = 30,
}

fire_fauna_rubbernecking_behavior = {
	radius = 32,
	state = BehaviorState.CROWD,
   anims = { "idle" },
   avoid_roads = true,
   avoid_lots = true,
   timeout = 30,
}

attractor.torch_repulsor =
{
	automata = { "sim", "child", "protestor" },
   
   ignore_states = {
      BehaviorState.RIOT_LEADER,
      BehaviorState.RIOT_FOLLOWER,
   },
   
	strength = { -100, -100, -100, 0 },
	radius = 45,
	
	behavior = {
		fire_fleeing_behavior,
		fire_rubbernecking_behavior,
	},
}

attractor.torch_fauna_repulsor = TTT
{
   _parent = attractor.torch_repulsor,
   automata = { "fauna" },
   behavior = {
      fire_fauna_fleeing_behavior,
      fire_fauna_rubbernecking_behavior,
   },
}

attractor.fire_repulsor =
{
	automata = { "sim", "child", "protestor" },
   
   ignore_states = {
      BehaviorState.RIOT_LEADER,
      BehaviorState.RIOT_FOLLOWER,
   },
   
	strength = { -100, 0, 20 },
	radius = 48,
	
	behavior = {
		fire_fleeing_behavior,
		fire_rubbernecking_behavior,
	},
}

attractor.fire_fauna_repulsor = TTT
{
   _parent = attractor.fire_repulsor,
   automata = { "fauna" },
   behavior = {
      fire_fauna_fleeing_behavior,
      fire_fauna_rubbernecking_behavior,
   },
}

-- create a generator that creates fleeing sims
generator.flee_building_generator = 
{
	automata = { "sim" },
	count = 1,
	rate = 1, 
	rate_scale = RateScale.PER_HOUR,
	max_count = 4,
	
	radius = { 2, 8 },
	follow_roads = true,
	
	-- behavior is always expressed as a table of tables, since there can be more than 1
	behavior = {					
		{	
			-- we set the state to defaukt, because there'll most likely be
			-- an attractor of repuslor nearby to make them flee
			state = BehaviorState.DEFAULT,
		}
	},
}


-- the code references these groups by name and creates them

-- crj: this are referenced in the effects scripts for the cursor effects, via
-- "automataEffect" entries.  This group is used not only for the torch tool but
-- for all disaster tools (tornado, volcano, quake, etc.)
occupant_group.torch_tool = 
{
   controllers = {
      "torch_repulsor",
      "torch_fauna_repulsor",
   },
}

-- crj: this is referenced by name in C++ code when creating fire disaster instances
occupant_group.fire_occupant = 
{
   controllers = {
      "fire_repulsor",
      "fire_fauna_repulsor",
      "flee_building_generator",
   },
}

