-- jailbreak.lua
--
dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("vehicles.lua")
dofile("_sfx.lua")


-------============================================
-- create a Generator that creates jailbreak OUT --------
generator.zoo_out = {
      --~ automata = { "prisoners" },						-- create X pedestrian group
            automata = { "fauna","fauna","fauna","fauna","fauna","fauna","policeman"},						-- create X pedestrian group

      count = 7,
      rate =5,										-- ...once every...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=50,
      radius = { 1,3 },    -- generate at random distances between 1 and 7 meters away.
      lifetime = 60,
      --~ use_lot_facing = true,

       behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
                 {
                  percentage = .9,
                  state = BehaviorState.RANDOM_WALK,
                  anims = { "run" },
                  sfx = { SFX.Automata_Panic, SFX.Automata_ZooWalla, SFX.Automata_ZooWalla },
                  timeout = 5,
                  ignore_roads = true,
                  ignore_paths = true,
                  final = true,
                  },
                  {
                  state = BehaviorState.DEFAULT,
                  anims = { "run" },
                  sfx = { SFX.Automata_Panic, SFX.Automata_ZooWalla, SFX.Automata_ZooWalla },
                  timeout = 6,
                  ignore_roads = true,
                  ignore_paths = true,
                  final = true,
                  },
            },        
}


---------------------------------------------------------------------------------------

-- don't change the name of this group without also changing cSC4ParkManager.cpp!
occupant_group.zoomanji = 
{
	 --group_id = "0x1702",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map
   	controllers = {
		"zoo_out",
      "copcar_pull",
		},
}

-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--verify_all_templates()
