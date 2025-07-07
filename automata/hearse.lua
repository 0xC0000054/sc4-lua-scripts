--
-- hearse.lua
--

dofile("_templates.lua")
dofile("vehicles.lua")
   -----------------hearse SECTION -----------------------------
attractor.hearse_attract = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 60,
	radius = 60,					-- influence radius, in meters
	automata = { "hearse" },		-- automata_groups this attractor affects
	--calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {        --- push hearse out and back a few times a day.
			[0.0] = 0.0,				
         [3.0] =-1.0,         -- 
			[6.0] = 0.0,			-- 
         [8.0] =1.0,         -- 
			[10.0] = -1.0,			-- 				
         [12.0] = 1.0,
         [15.0] =-1.0,         -- 
         [18.0] = 0.0,			-- 
         [21.0] =1.0,         -- 
			
   },
	--behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		--~ {	
         --~ radius =16,
			--~ state = BehaviorState.QUEUE,
			--~ timeout = 9.0,
         --~ final = true,
		--~ },
   --},
}
attractor.mourner_attract = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 60,
	radius = 16,					-- influence radius, in meters
	automata = { "civilian_cars" },		-- automata_groups this attractor affects
	--calendar = { monday, tuesday, wednesday, thursday, friday },
	--~ time_of_day = {        --- push trucks out and back a few times a day.
			--~ [0.0] = 0.0,				
         --~ [3.0] =-1.0,         -- 
			--~ [6.0] = 0.0,			-- 
         --~ [9.0] =1.0,         -- 
			--~ [12.0] = 0.0,			-- 				
         --~ [15.0] =-1.0,         -- 
         --~ [18.0] = 0.0,			-- 
         --~ [21.0] =1.0,         -- 
			
--},
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	
         percentage = 0.1,
         radius =16,
			state = BehaviorState.DEFAULT,
			--timeout = 9.0,
         --final = true,
         --~ anims = {headlights,   ---hoping to get this, right now does not work - Wombat
         --~ }
		},
   },
}
-- create a generator that creates hearse trucks at the edge of the lot.
generator.hearse_out = 
{
      automata = { "hearse" },						-- create hearse trucks
      --occupancy_pct = 0.1,						-- generate 1% of school's occupancy...
      count = 1,
      rate =3,										-- ...X times per...
      rate_scale = RateScale.PER_HOUR,	-- ...game minute
      max_count=1,
      
      -- generate at random distances between 1 and 7 meters away.
      radius = { 12,18 },
      
      --~ --calendar = { monday, tuesday, wednesday, thursday, friday },
      time_of_day = {
            [10.0] = 0.0,			
            [10.1] = 1.0,	
            [10.2] = 0.0,	
            [15.0] = 0.0,
            [15.1] = 1.0,
            [15.2] = 0.0,			
            },
           follow_roads = true,
}

   ---------------------------------------------------------------------------------------
-- Finally, create a "school" occupant group with attached attractor & generator

occupant_group.cemetary =   ---- this is the building group name
{
	 group_id = "0x1700",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	
	controllers = {
		"hearse_attract",
		"hearse_out",
      "mourner_attract",
		},
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--verify_all_templates()
