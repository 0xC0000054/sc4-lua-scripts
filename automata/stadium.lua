--
-- stadium.lua
--

dofile("_templates.lua")
dofile("vehicles.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua")
-------------------------Peds SECTION
------------------------------------------------------------------------
-- create an attractor that ATTRACTS
attractor.stadium_peds_pull = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 60,
	radius = 100,					-- influence radius, in meters
	automata = { "sim" },		-- automata_groups this attractor affects
      calendar = {sunday,saturday},
      time_of_day = {
			[11.0] = 0.0,				
			[11.5] = 1.0,				
			[13.0] = 1.0,
			[13.5] = 0.0,
         [18.0] = 0.0,				
			[18.5] = 1.0,				
			[19.0] = 1.0,
			[19.5] = 0.0,
         },
         use_lot_facing = true,
	}
-- create a  generator that creates Peds INCOMING=======================
generator.stadium_peds_in = {
		automata = { "sim" },					-- create children
		count =15,
		rate = 8,										
		rate_scale = RateScale.PER_HOUR,	-- ...game minute
		max_count=60,
		radius = { 16,20},
     --~ calendar = {sunday,saturday},
		time_of_day = {
			[10.0] = 0.0,				
			[10.5] = 1.0,				
			[12.0] = 1.0,
			[12.5] = 0.0,
         [17.0] = 0.0,				
			[17.5] = 1.0,				
			[18.0] = 1.0,
			[18.5] = 0.0,
         },
         behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
                  { 
                  --~ percentage = 0.5,	
                  state = BehaviorState.QUEUE,
                  sfx = {SFX.Automata_WallaSmall},
                  timeout = 60,
                  final = true,
               },
               --~ {	radius =36,
                  --~ state = BehaviorState.CROWD,
                  --~ timeout = 3,
                  --~ final = true,
               --~ },
         },
         --~ use_lot_facing = true,
		follow_roads = true,
	}
   
   ------------- Stadium Ped REPULSOR ---------------------
attractor.stadium_peds_push =
{
	strength = -100,
	radius = 30,					-- influence radius, in meters
	automata = { "sim" },		-- automata_groups this attractor affects
   --~ calendar = {sunday,saturday},
	time_of_day = {
			[16.0] = 0.0,				
			[16.5] = 1.0,				
			[17.0] = 1.0,
			[17.5] = 0.0,
         [22.0] = 0.0,				
			[22.5] = 1.0,				
			[23.0] = 1.0,
			[23.5] = 0.0,
         },
      behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {
            percentage = 0.1,
            radius = 12,
            state = BehaviorState.BEE_LINE,
            anims={ "woohoo", "walk" },
            timeout = 6,
            --final = true,
         },
      },
}
-- create a generator that creates stadium_peds OUT --------
generator.stadium_peds_out = 
{
      automata = { "sim" },						-- create children
      count = 60,
      rate =1,										-- ...once every...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count=60,
      radius = { 2,4 },    -- generate at random distances between 1 and 7 meters away.
      use_lot_facing = true,
      --~ calendar = {sunday,saturday},
      time_of_day = {
			[16.0] = 0.0,				
			[16.5] = 1.0,				
			[17.0] = 1.0,
			[17.5] = 0.0,
         [22.0] = 0.0,				
			[22.5] = 1.0,				
			[23.0] = 1.0,
			[23.5] = 0.0,
         },
               behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
               {
                  --radius =16,
                  state = BehaviorState.DEFAULT,
                  timeout = 18,
                  anims={ "woohoo", "walk" },
                  final = true,
               },
               --~ {
                  --~ --percentage = 0.1,
                  --~ radius = 12,
                  --~ state = BehaviorState.BEE_LINE,
                  --~ anims={ "woohoo", "walk" },
                  --~ timeout = 10,
                  --~ --final = true,
               --~ },
            },
      follow_roads = true,
}
   ---------------------------------------------------------------------------------------
-- Finally, create a "school" occupant group with attached attractor & generator

occupant_group.stadium = 
{
	 group_id = "0x1906",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map for Building Types
	
	controllers = {
		"stadium_peds_pull",
		"stadium_peds_in",
		"stadium_peds_push",
		"stadium_peds_out",
		},
}

-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
