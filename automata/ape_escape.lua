-- apebreak.lua
--
dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("vehicles.lua")
dofile("_sfx.lua")
dofile("tv_magnet.lua")
dofile("attractors.lua")

-------============================================
-- Repeller
attractor.ape_push = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = {-100},
	radius = 8,					-- influence radius, in meters
	automata = { "chimp", "chimp_x", },		-- automata_groups this attractor affects
   lifetime = 85,
	}
-- create a Generator that creates jailbreak OUT --------
generator.ape_out = {
      automata = { "chimp", "chimp_x",},						-- create X pedestrian group
      count = 13,
      rate =5,										-- ...once every...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=100,
      radius = { 3,4 },    -- generate at random distances between 1 and 7 meters away.
      lifetime = 60,
      --~ use_lot_facing = true,
      --~ effect_trigger = "0x4a6170b4",         -- "effects.ZOO_ESCAPE" in adv_const.lua
      behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
                 {
                  state = BehaviorState.RANDOM_WALK,
                  random_walk =
                     {
                        kph = { 15, 25},
                        delay = { 2, 6 },
                        turn = { 0.95, 0.05 },
                        idle_delay = { 1, 3 },
                        idle_time = { 0.1, 1 },
                        strength = 0.5,
                        acceleration = 0.5,
                        deceleration = 0.5,
                     },
                  anims = {"run", "panic_run" },
                  sfx = { SFX.Automata_Panic, SFX.Animal_Chimp},
                  timeout = 75,
                  ignore_roads = true,
                  ignore_paths = true,
                  final = true,
                  },
            },        
}
---------------------------------------------------------------------------------------
-- Finally, create a "jailbreak" occupant group with attached attractor & generator
occupant_group.ape_escape = 
{
	 --~ group_id = "0x1917",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map
   	controllers = {
		"ape_out",
      "ape_push",
      "copcar_pull",
		"tv_magnet_attract",
		"tv_magnet_in",
      },
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
