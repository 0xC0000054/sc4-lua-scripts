--
-- crowd.lua
--

dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua")

   -----------------crowd SECTION -----------------------------
-- create a attractor that pulls crowd  at the edge of the lot.
attractor.crowd_pull = 
{
      strength = {60},
      radius = 50,					-- influence radius, in meters
      automata = { "sim" },		-- automata_groups this attractor affects
      lifetime = 120,
      behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {	
         radius =20,
         percentage = 0.3,
         state = BehaviorState.CROWD,
         sfx = {SFX.Automata_WallaMedium},
         timeout = 120,
         final = true,
         },
      },
}
--=============== Generator =============================
generator.crowd_sims = 
{
      automata = { "sim" },						-- create crowd sims
      count = 21,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_MINUTE,	-- ...game minute
      max_count= 60,
      radius = { 25,30 },
      lifetime = 60,
      follow_roads = true,
}  ---------------------------------------------------------------------------------------
-- Finally, create a "school" occupant group with attached attractor & generator

occupant_group.crowd = 
{
	--~ group_id = "0x150E",		-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	controllers = {
		"crowd_sims",
      "crowd_pull",
		},
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--verify_all_templates()
