--
-- crowd_sm_stand.lua
--

dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua")

   -----------------crowd SECTION -----------------------------
---Attractor Section ==============================
--~ attractor.sim_pull = 
--~ {
	--~ -- attraction strength from -100 to 100 (negative values repel)
	--~ strength = 10,
	--~ radius = 30,					-- influence radius, in meters
	--~ automata = { "sim" },		-- automata_groups this attractor affects
--~ }
--=============== Generator =============================
generator.crowd_sm_stand = 
{
      automata = { "sim"},						-- create crowd sims
      count = 2,
      rate =5,										-- ...X times per...
      rate_scale = RateScale.PER_HOUR,	-- ...game minute
      max_count= 15,
      radius = { 1, 3 },

         --~ ignore_lot = true, 
         time_of_day = {
         [8.1] = 0.0,   -- 
         [9.5] = 1.0,   -- 
          [19.5] = 1.0,   -- 
         [21.0] = 0.0,   -- 
         },

       behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {
                  state = BehaviorState.IDLE,
                  sfx = { SFX.Automata_WallaSmall},
                                    timeout = 15,
                  final = true,
                  },
      },
}  
---------------------------------------------------------------------------------------
-- Finally, create an  occupant group with attached attractor & generator

occupant_group.crowd_small_stand = 
{
	group_id = "0x1927",		-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	controllers = {
		"crowd_sm_stand",
		},
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
