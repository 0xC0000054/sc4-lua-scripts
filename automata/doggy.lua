--
-- doggy.lua
--

dofile("_templates.lua")
dofile("pedestrians.lua")
   -----------------tv_magnet SECTION -----------------------------
attractor.dog_pull = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 100,
	radius = 35,					-- influence radius, in meters
	automata = { "dog" },		-- automata_groups this attractor affects
   lifetime = 225,
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{
         radius =16,
			state = BehaviorState.BEE_LINE,
		},
      {
         radius =2,
			state = BehaviorState.IDLE,
			anims = {"woohoo"},
         timeout = 30,
         final = true,
		},
  },
}
-- create a generator that creates tv_magnet trucks at the edge of the lot.
generator.dog_make = 
{
      automata = { "dog" },						-- create tv_magnet trucks
      count = 1,
      rate =6,										-- ...X times per...
      rate_scale = RateScale.PER_HOUR,	-- ...game minute
      max_count=1,
      --~ lifetime = 125,
      radius = { 16,16 }, 
      lifetime_count = 1,
      follow_roads = true,
}

   ---------------------------------------------------------------------------------------
-- Finally, create an  occupant group with attached attractor & generator

occupant_group.dogmagnet =   ---- this is the building group name
{
	 group_id = "0x1919",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	percentage = 0.1,
	controllers = {
		"dog_pull",
		"dog_make",
		},
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
