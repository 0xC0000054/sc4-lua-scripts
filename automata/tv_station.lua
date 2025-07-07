--
-- tv_station.lua
--

dofile("_templates.lua")
dofile("vehicles.lua")

-- create a generator that creates tv_reporter cars
generator.tv_reporter_generator = 
{
	automata = { "tv_reporter" },					
   count = 1,
	rate = 2,
	rate_scale = RateScale.PER_HOUR,
	max_count=3,
	   
	radius = { 12, 18 },
	--~ time_of_day = {
			--~ [7.0] = 0.4,				
			--~ [7.1] = 1.0,			
			--~ [20.8] = 1.0,
         --~ [20.9] = 0.4,
	--~ },
   follow_roads = true,
}

occupant_group.tv_station = 
{
	group_id = "0x1910",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map
	controllers = {
		"tv_reporter_generator",
	},
}

-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
