--
-- fireworks_crowd.lua
--
dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua")

-----------------crowd SECTION -----------------------------
-- create a attractor that pulls crowd  at the edge of the lot.
--~ attractor.fireworks_crowd_pull = 
--~ {
      --~ strength = 65,
      --~ radius = 50,					-- influence radius, in meters
      --~ automata = { "sim", },		-- automata_groups this attractor affects
      --~ lifetime = 10,

--~ }
--=============== Generator =============================
generator.fireworks_crowd_sims = 
{
      automata = { "sim",},						-- create crowd sims
      count = 200,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count= 200,
      radius = {1,44 },
      sfx = {SFX.Automata_CheerLarge1},
      lifetime = 50,
      use_lot_facing = true,
      behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {	
         state = BehaviorState.CROWD,
         anims = {"hop_clap","clap","woohoo","whoop","booyah"},
         --~ sfx = {SFX.Automata_CheerLarge1},
         timeout = 50,
         final = true,
         },
      },
}  
generator.fireworks_crowd_sim_audio = 
{
      automata = { "sim",},						-- create crowd sims
      count = 1,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count= 1,
      radius = {1,4 },
      sfx = {SFX.Automata_CheerLarge1},
      lifetime = 50,
      use_lot_facing = true,
      behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {	
         state = BehaviorState.CROWD,
         anims = {"hop_clap","clap","woohoo","whoop","booyah"},
         sfx = {SFX.Automata_CheerLarge1},
         timeout = 50,
         final = true,
         },
      },
}  ---------------------------------------------------------------------------------------
-- Finally, create a controller reference to an occupant group with attached attractors & generators

occupant_group.fireworks_crowd = --needs to be called from code
{
	--~ group_id = "0x150B",		-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	controllers = {
		"fireworks_crowd_sim_audio",
      "fireworks_crowd_sims",
		},
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
