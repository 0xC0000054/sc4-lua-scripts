--
-- reward.lua
--

dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("vehicles.lua")
dofile("_sfx.lua")
--~ dofile("tv_magnet.lua")
   -----------------crowd SECTION -----------------------------
-- create a attractor that pulls crowd  at the edge of the lot.
attractor.reward_pull = 
{
      strength = 65,
      radius = 50,					-- influence radius, in meters
      automata = { "sim", },		-- automata_groups this attractor affects
      lifetime = 30,
      behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {	
         radius = 36,
         --~ percentage = 0.1,
         state = BehaviorState.BEE_LINE,
         sfx = {SFX.Automata_CheerSmall,},
         anims = {"run","clap","walk","walk","booyah"},
         },
         {	
         radius = 4,
         --~ percentage = 0.3,
         state = BehaviorState.CROWD,
         sfx = {SFX.Automata_CheerLarge1,},
         anims = {"hop_clap","clap","woohoo","whoop","booyah"},
         timeout = 25,
         final = true,
         },
         {	
         radius = 2,
         --~ percentage = 0.3,
         state = BehaviorState.IDLE,
         sfx = {SFX.Automata_CheerLarge1,},
         anims = {"hop_clap","clap","woohoo","whoop","booyah"},
         timeout = 25,
         final = true,
         },
      },
}
--=============== Generator =============================
generator.reward_sims = 
{
      automata = { "sim",},						-- create crowd sims
      --~ count = 30,
      population_pct = 0.01,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count= 100,
      radius = {15,24 },
      lifetime = 15,
      use_lot_facing = true,
      --~ follow_roads = true,
}  

---TV Gen & Attractor Section ==============================
attractor.tv_pull = 
{
	-- attraction strength from -100 to 100 (negative values repel)
   effect_trigger = { "0x0A89DFD4" },
   strength = 100,
	radius = 50,					-- influence radius, in meters
	automata = { "tv_reporter" },		-- automata_groups this attractor affects
   lifetime = 30,
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{
         radius =14,
			state = BehaviorState.IDLE,
			timeout = 65,
         final = true,
		},
  },
}
-- create a generator that creates tv_magnet trucks at the edge of the lot.
generator.tv_in = 
{
      automata = { "tv_reporter" },						-- create tv_magnet trucks
      effect_trigger = { "0x0A89DFD4" },
      count = 1,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=1,
      lifetime = 10,
      -- generate at random distances between 1 and 7 meters away.
      radius = { 20,32 },
      follow_roads = true,
}

-- create a generator that creates tv_ped  at the edge of the lot.
generator.tv_peds_reward_in = 
{
      automata = { "tv_peds" },						-- create tv_magnet trucks
      effect_trigger = { "0x0A89DFD4" },
      count = 1,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=1,
      lifetime = 90,
      -- generate at random distances between 1 and 7 meters away.
      radius = { 3,6 },
behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{
         radius =14,
			state = BehaviorState.IDLE,
			timeout = 65,
         final = true,
		},
  }, 
 follow_roads = true,
}
---------------------------------------------------------------------------------------
-- Finally, create a controller reference to an occupant group with attached attractors & generators

occupant_group.reward = 
{
	group_id = "0x150B",		-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	controllers = {
		"reward_sims",
      "reward_pull",
      "tv_pull",
		"tv_in",
      "tv_peds_reward_in",
      		--~ "sim_pull",
		},
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
