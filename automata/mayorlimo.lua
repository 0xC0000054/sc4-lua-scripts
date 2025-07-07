--
--

dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("vehicles.lua")
dofile("_sfx.lua")

   -----------------Mayor Pull SECTION -----------------------------
-- create a attractor that pulls crowd  at the edge of the lot.
attractor.mayorlimo_pull = 
{
      strength = 100,
      radius = 36,					-- influence radius, in meters
      automata = { "sim", "protestor"},		-- automata_groups this attractor affects
      ignore_lot = true,
      behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {	
         radius = 36,
         --~ percentage = 0.1,
         state = BehaviorState.BEE_LINE,
         sfx = {SFX.Automata_CheerSmall,},
         anims = {"run","walk"},
         },
         {	
         radius = 5,
         state = BehaviorState.CROWD,
         sfx = {SFX.Automata_CheerLarge1,},
         anims = {"hop_clap","clap","woohoo","whoop","booyah"},
         timeout = 10,
         final = true,
         },

      },
}
--=============== Generator =============================
generator.mayorlimo_sims = 
{
      automata = { "sim",},						-- create crowd sims
      count = 2,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count= 10,
      radius = {20,36 },
      ignore_lot = true,
      follow_roads = true,
}  
---------------------------------------------------------------------------------------
-- Finally, create a controller reference to an occupant group with attached attractors & generators

occupant_group.mayorlimo = 
{
-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	controllers = {
		"mayorlimo_sims",
      "mayorlimo_pull",
		},
}


   -----------------ICECREAM Pull SECTION -----------------------------
-- create a attractor that pulls crowd  at the edge of the lot.
attractor.ice_cream_pull1 = 
{
      strength = 100,
      radius = 36,					-- influence radius, in meters
      automata = { "child", },		-- automata_groups this attractor affects
      ignore_lot = true,
      behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {	
         radius = 36,
         --~ percentage = 0.1,
         state = BehaviorState.BEE_LINE,
         sfx = {SFX.Automata_CheerSmall,},
         anims = {"run","walk"},
         },
         {	
         radius = 5,
         state = BehaviorState.CROWD,
         sfx = {SFX.Automata_CheerLarge1,},
         anims = {"hop_clap","clap","woohoo","whoop","booyah"},
         timeout = 10,
         final = true,
         },

      },
}
--=============== Generator =============================
generator.ice_cream_sims1 = 
{
      automata = { "child",},						-- create crowd sims
      count = 2,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count= 10,
      radius = {20,36 },
      ignore_lot = true,
      follow_roads = true,
}  
---------------------------------------------------------------------------------------
-- Finally, create a controller reference to an occupant group with attached attractors & generators

occupant_group.icecream_draw = 
{
-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	controllers = {
		"ice_cream_sims1",
      "ice_cream_pull1",
		},
}
---------------------------------------------------------------
--honkhorn
-----------------------------------------------------------
attractor.honkhorn_repulsor =
{
	automata = { "sim", "child", "protestor" },
   strength = -100,
   radius = 130,
   behavior = {
      {
         radius = 16,
         state = BehaviorState.BEE_LINE,
         anims = { "panic_run" },
         sfx = { SFX.Automata_Panic },
         kph_multiply = { 2.0, 3.0 },
      },
      {
         radius = 16,
         state = BehaviorState.CROWD,
         anims = { "idle" },
      },
	},
}

attractor.honkhorn_fauna_repulsor = 
{
   automata = { "fauna" },
   strength=-100,
   radius = 16,
   behavior = {
      {
         radius = 16,
         state = BehaviorState.BEE_LINE,
         anims = { "panic_run" },
         kph_multiply = { 3.0,4.0 },
         ignore_roads = true,
      },

   },
}

occupant_group.honkhorn_repulser = 
{
   controllers = {
      "honkhorn_repulsor", "honkhorn_fauna_repulsor",
   }
}
---------------------------------------------
---------------------------------------------------------------
--helicopter near ground
-----------------------------------------------------------

attractor.heli_fauna_repulsor = 
{
   automata = { "fauna" },
   strength=-100,
   radius = 36,
   behavior = {
      {
         radius = 36,
         state = BehaviorState.BEE_LINE,
         anims = { "panic_run" },
         kph_multiply = { 3.0,4.0 },
         ignore_roads = true,
      },

   },
}

occupant_group.heli_repulser = 
{
   controllers = {
      "heli_fauna_repulsor",
   }
}

---------------------------------------------------------------
--waterhose
-----------------------------------------------------------
attractor.waterhose_repulsor =
{
	automata = { "sim", "child", "protestor" },
   strength = -100,
   radius = 130,
   behavior = {
      {
         radius = 8,
         state = BehaviorState.BEE_LINE,
         anims = { "panic_run" },
         sfx = { SFX.Automata_Panic },
         kph_multiply = { 2.0, 3.0 },
      },
      {
         radius = 8,
         state = BehaviorState.CROWD,
         anims = { "idle" },
      },
	},
}

attractor.waterhose_fauna_repulsor = 
{
   automata = { "fauna" },
   strength=-100,
   radius = 8,
   behavior = {
      {
         radius = 8,
         state = BehaviorState.BEE_LINE,
         anims = { "panic_run" },
         kph_multiply = { 3.0,4.0 },
         ignore_roads = true,
      },

   },
}

occupant_group.waterhose_repulser = 
{
   controllers = {
      "waterhose_repulsor", "waterhose_fauna_repulsor",
   }
}

