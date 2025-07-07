--
-- police_stations.lua   This is the small station lua
--

dofile("_templates.lua")
dofile("vehicles.lua")
dofile("pedestrians.lua")
---------- Police Car Attractor - what keeps em in the hood!
attractor.police_attract = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 60,
	radius = 50,					-- influence radius, in meters
	automata = { "patrol_car" },		-- automata_groups this attractor affects
	
}
-- create a generator that creates police cars
generator.patrol_car_generator = 
{
	automata = { "patrol_car" },					
   count = 1,
	rate = 6,
	rate_scale = RateScale.PER_HOUR,
	max_count=2,
	radius = { 8, 12 },
   behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	
			state = BehaviorState.DEFAULT,
			timeout = 60,
         final = true,
		},
   },
	follow_roads = true,
   deactivate_trigger = { effects.POLICE_STRIKE_ACTIVE },
   destroy_automata=true,
}
-- create a generator that creates police peds
generator.patrol_ped_generator = 
{
	automata = { "policeman" },					
   count = 1,
	rate = 1,
	rate_scale = RateScale.PER_HOUR,
	max_count=3,
	radius = { 2, 12 },
	follow_roads = true,
   deactivate_trigger = { effects.POLICE_STRIKE_ACTIVE },
   destroy_automata=true,
}
--================================================
occupant_group.policesmall = 
{
	group_id = "0x150E",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map
	controllers = {
		"patrol_car_generator",
      "police_attract",
		"patrol_ped_generator",
      },
}

occupant_group.policesmallkiosk = 
{
	group_id = "0x1516",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map
	controllers = {
	"patrol_ped_generator",
      },
}


-- keep this as the last line and uncomment it to check your work
--~ verify_all_templates()


