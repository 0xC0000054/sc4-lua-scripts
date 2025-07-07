--
-- attractors.lua
--
-- Definitions of common global attractor templates
--
dofile("_sfx.lua")
dofile("_templates.lua")
------

attractor.money_attractor =
{
	automata = { "sim",  },
	strength =100,
	radius = 64,
	
	behavior = {
      {
         radius=32,
         state=BehaviorState.BEE_LINE,
         anims = { "panic_run" },
      },
      {
         radius = 64,
         state = BehaviorState.CROWD,
         anims = { "idle" },
      },
	},
}

attractor.copcar_pull =
{	strength = 100,
   radius = 120,					-- influence radius, in meters
   automata = { "patrol_car"},						-- create X pedestrian group
      lifetime = 110,
   behavior = {	
      {	state = BehaviorState.IDLE,
			radius = 5,
         timeout = 7,		},   },  }

attractor.copped_pull =
{	strength = 100,
   radius = 60,					-- influence radius, in meters
   automata = {"policeman" },						-- create X pedestrian group
      lifetime = 210,
  behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
                 {
                  state = BehaviorState.RANDOM_WALK,
                  anims = {"run"},
                  --~ sfx = { SFX.Automata_Panic},
                  random_walk =
                        {
                           kph = { 19},
                           delay = { 2, 10 },
                           turn = { 0.3, 0.05 },
                           strength = 0.5,
                           acceleration = 0.5,
                           deceleration = 0.5,
                        },
                  ignore_roads = true,
                  ignore_paths = true,
                  },
        },  
}

-- attached to the placement_effects scripts in plop_effects.fx.
-- Causes sims within a radius of a plopped building to do a brief hop as the screen shakes
attractor.sim_plop_jump =
{
   automata = { "sim", "child" },
   strength = 50,
   radius = 30,
   lifetime = 1.0,    
   behavior = {
      {
         state = BehaviorState.PLOP_JUMP,
      },
   },
}

--verify_all_templates()