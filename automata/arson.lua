--
-- hearse.lua
--

dofile("_templates.lua")

automata_group.arsonist = 
{
	group_id = "0x4119",
	class_id = "0x896e75af", -- cSC4Pedestrian
}

generator.arsonist_gen =
{
	automata = { "arsonist" },
	rate = 1,										
	rate_scale = RateScale.PER_MINUTE,
	max_count=1,
		
	-- generate at random distances between 15 and 18 meters away.
	radius = { 48, 80 },
	follow_roads = true,
}

attractor.arsonist_att =
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 100,
	radius = 64,					-- influence radius, in meters
	automata = { "arsonist" },		-- automata_groups this attractor affects

	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{
			radius =16,
			state = BehaviorState.IGNITE_OCCUPANT,
			final = true,
		},
	},
}


occupant_group.arson_target = 
{
--	group_id = "0x1502",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map

	controllers = {
		"arsonist_gen",
		"arsonist_att",
	}

}
	


-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--verify_all_templates()
