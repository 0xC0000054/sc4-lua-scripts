--
-- maxis.lua
--
dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua")
---- Attractor
attractor.max_pull = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 70,
	radius = 40,					-- influence radius, in meters
	automata = { "llama", "sim" },		-- automata_groups this attractor affects
   --~ lifetime = 25,
	}
-- create a generator that creates Maxis Employees --------
generator.maxis_crowd = 
{
      automata = {"sim" },						-- create 
      count = 3,
      rate =6,										-- ...once every...
      rate_scale = RateScale.PER_HOUR,	-- ...time unit...
      max_count= 10,
      radius = {2,5},    -- generate at random distances between X and Y meters away.
      use_lot_facing = true,
             behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
               {
                  radius =16,
                  state = BehaviorState.RANDOM_WALK,
                  random_walk =
                     {
                        kph = { 2, 5},
                        delay = { 1, 6 },
                        turn = { 0.35, 0.05 },
                        idle_delay = { 1, 3 },
                        idle_time = { 0.1, 4 },
                        strength = 0.5,
                        acceleration = 0.5,
                        deceleration = 0.5,
                     },
                     timeout = 18,
                  anims = {"clap","wait","tantrum","hop_clap","booyah","phooee","kissmy",},
                  final = true,
               },
            },
      follow_roads = true,
    }
 
-------- =======================================================
generator.llama_crowd = 
{
      automata = {"llama" },						-- create 
      count = 1,
      rate =6,										-- ...once every...
      rate_scale = RateScale.PER_HOUR,	-- ...time unit...
      max_count= 1,
      radius = { 2,5 },    -- generate at random distances between X and Y meters away.
      use_lot_facing = true,
        
                behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
               {
                  state = BehaviorState.RANDOM_WALK,
                  random_walk =
                     {
                        kph = { 4, 6},
                        delay = { 1, 6 },
                        turn = { 0.35, 0.05 },
                        idle_delay = { 1, 3 },
                        idle_time = { 0.1, 1 },
                        strength = 0.5,
                        acceleration = 0.5,
                        deceleration = 0.5,
                     },
                     sfx = {SFX.Automata_WallaSmall,},
                     timeout = 4,
                  final = true,
               },
            },
      follow_roads = true,
    }

   ---------------------------------------------------------------------------------------
-- Finally, create a "school" occupant group with attached attractor & generator

occupant_group.maxis = 
{
	 group_id = "0x1918",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map
	controllers = {
		"maxis_crowd",
      "llama_crowd",
	},
}

-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
