--
-- police_station_big.lua
--

dofile("_templates.lua")
dofile("vehicles.lua")
dofile("police_stations.lua")
dofile("_constants.lua")

-- create a generator that creates police cars
generator.patrol_car__big_generator = 
{
	automata = { "patrol_car" },					
   count = 1,
	rate = 6,
	rate_scale = RateScale.PER_HOUR,
	max_count=4,
	radius = { 10, 15 },
   behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	
			state = BehaviorState.DEFAULT,
			timeout = 80,
         final = true,
		},
   },
	follow_roads = true,
   deactivate_trigger = { effects.POLICE_STRIKE_ACTIVE },
   destroy_automata = true,
}
-- create a generator that creates police peds
generator.patrol_ped_gen_big = 
{
	automata = { "policeman" },					
   count = 2,
	rate = 1,
	rate_scale = RateScale.PER_HOUR,
	max_count=6,
	radius = { 2, 12 },
  	follow_roads = true,
   deactivate_trigger = { effects.POLICE_STRIKE_ACTIVE },
   destroy_automata = true,
}
---============================
occupant_group.policesbig = 
{
	group_id = "0x150D",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map
	controllers = {
		"patrol_car__big_generator",
      "police_attract",
      "patrol_ped_gen_big",
	},
}


--~ -- temp for E3 Demo
--~ -- generate getaway vans around deluxe police station
--~ generator.getaway_van_generator =
--~ {
   --~ automata = { "getaway_van" },
   --~ count = 1,
   --~ rate = 5,
   --~ rate_scale = RateScale.PER_HOUR,
   --~ max_count = 1,
   --~ radius = { 48, 100 },
   --~ follow_roads = true,
--~ }
--~ occupant_group.deluxe_police = 
--~ {
   --~ group_id = "0x1515",
   --~ controllers = { "getaway_van_generator" },
--~ }

-- keep this as the last line and uncomment it to check your work
--verify_all_templates()

