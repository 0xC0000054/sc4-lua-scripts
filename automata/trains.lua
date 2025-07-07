--
-- trains.lua   This is the small station lua
--

dofile("_templates.lua")
dofile("vehicles.lua")

--~ -- test generator to create freight trains
generator.track_checker_generator = 
{
	automata = { "train_track_checker" },					
   count = 1,
	rate = 1,
	rate_scale = RateScale.PER_HOUR,
	max_count=1,
	radius = { 8, 12 },
   behavior = {
		{	
			state = BehaviorState.DEFAULT,
			timeout = 30,
         final = true,
		},
   },
	follow_rail = true,
   destroy_automata=true,
}

--================================================
occupant_group.freight_train_station = 
{
	group_id = "0x1300",			
	controllers = {
		"track_checker_generator",
   },
}


-- keep this as the last line and uncomment it to check your work
--~ verify_all_templates()


