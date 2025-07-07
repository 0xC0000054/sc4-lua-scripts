--
-- ambulance.lua
--

dofile("_templates.lua")
dofile("vehicles.lua")
   -----------------ambulance SECTION -----------------------------
-- create a generator that creates ambulance trucks at the edge of the lot.
generator.ambulance_out = 
{
      automata = { "ambulance" },						-- create ambulance trucks
      count = 1,
      rate =1,										-- ...X times per...
      rate_scale = RateScale.PER_HOUR,	-- ...game minute
      max_count= 1,
      radius = { 5,10 },
      follow_roads = true,

   behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {	
            --percentage = 0.3,
            radius =12,
            state = BehaviorState.IDLE,
            timeout = 1.2,

         },
   },
   deactivate_trigger = { effects.HEALTH_STRIKE_ACTIVE },
   destroy_automata = true,
}---------------------------------------------------------------------------------------
-- Finally, create a "school" occupant group with attached attractor & generator

occupant_group.ambulancemaker =   ---- this is the building group name
{
	 group_id = "0x1904",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	controllers = {
		"ambulance_out",              -- DO NOT change this string without also changing cSC4Vehicle.cpp!
		},
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--verify_all_templates()
