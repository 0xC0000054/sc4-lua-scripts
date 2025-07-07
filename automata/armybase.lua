--
-- armybase.lua
--

dofile("_templates.lua")
dofile("vehicles.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua") 
-----------------armybase SECTION -----------------------------

-- create a generator that creates armybase trucks at the edge of the lot.
generator.armybase_out = 
{
      automata = { "armytruck", "armytruckleader", },						-- create armybase trucks
      count = 2,
      rate =4,										-- ...X times per...
      rate_scale = RateScale.PER_DAY,	-- ...game minute
      max_count=5,
      use_lot_facing = true,
      radius = { 10,19 },
       time_of_day = {
         [5.1] = 0.0,   -- 
         [6.5] = 1.0,   -- 
          [14.5] = 1.0,   -- 
         [17.0] = 0.0,   -- 
         },
      follow_roads = true,
      use_lot_facing = true,
      destroy_automata = true,
     behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	
			state = BehaviorState.DEFAULT,
			timeout = 60,
         final = true,
      },      
   },         
}

attractor.armytank_pull = 
{
	strength = 90,
	radius = 60,					-- influence radius, in meters
	automata = { "armytank"},		-- automata_groups this attractor affects
}

-- create a generator that creates armybase trucks at the edge of the lot.
generator.armytank_out = 
{
      automata = { "armytank" },						-- create armybase trucks
      count = 2,
      rate =3,										-- ...X times per...
      rate_scale = RateScale.PER_HOUR,	-- ...game minute
      max_count=4,
      use_lot_facing = true,
      radius = { 10,19 },
      follow_roads = true,
      destroy_automata = false,
     behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	
			state = BehaviorState.DEFAULT,
			timeout = 290,
         final = true,
      },      
   },         
}





-- create a generator that creates army joggers at the edge of the lot.
generator.armyjoggers_out = 
{
      automata = { "army_joggers" },						-- create armybase trucks
      --~ random_chance = 0.3,
      count = 2,
      rate =6,										-- ...X times per...
      rate_scale = RateScale.PER_HOUR,	-- ...game minute
      max_count=2,
      time_of_day = {
         [4.1] = 0.0,   -- 
         [4.5] = 1.0,   -- 
         [6.0] = 0.0,   -- 
         [14.1] = 0.0,   -- 
         [14.5] = 1.0,   -- 
         [15.0] = 0.0,   -- 
         },
         radius = { 5,9 },
      follow_roads = true,
      use_lot_facing = true,
      destroy_automata = true,
      behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	
			state = BehaviorState.DEFAULT,
			sfx = {SFX.Automata_ArmyDrill},
         timeout = 30,
         final = true,
		},
   },      
}

   ---------------------------------------------------------------------------------------
-- Finally, create a "school" occupant group with attached attractor & generator

occupant_group.armybase =   ---- this is the building group name
{
	 group_id = "0x1914",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	
	controllers = {
      "armybase_out",
      "armyjoggers_out",
	 "armytank_pull",
	  "armytank_out",
        },
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
