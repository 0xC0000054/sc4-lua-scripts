--
-- examples
--
-- This example shows how to create an example automata_group, attractor, generator, and occupant_group.
--
-- General script notes:
-- 1) Generally, you use a table { } to denote that a field has more than one value.
--    e.g.   radius = 10,    range = { 10, 20 },
-- Many fields give you the option of including a single value or a table of multiple values, so usually
--  radius = { 10 }    and     radius = 10      are interchangeable
-- 
-- 2) Remember to separate fields with commas.  There's usually no harm in putting an extra comma
-- where it's not needed, but leaving the comma out will generate a script error.
--
-- 3) When you need to specify a hexadecimal number (0xABCDEF000), put quotes "" around it to treat it
-- like a string.  Decimal numbers can be entered without quotes.
--
-- 4) If a field name is a number (for example, the 24-hour clock times in the time_of_day field), use square
-- brackets around the field name:
-- e.g. time_of_day = {   [3] = 1.0,  [12] = 0.5 }
--
-- 5) The file _templates.lua contains the specifications for every table in the scripts, with some notes.
--

dofile("_templates.lua")

-- set up common animations for all pedestrians
automata_group.pedestrian = 
{
	group_id = "0x8a1e1740",				-- this should be a GUID defined in ingred.ini's "occupant groups" value map
	
	anims = {
		walk = 0,
		wait = "0x0C",
		woohoo = "0x07",
		whoop = "0x0A",
		hop_clap = "0x0B",
		clap = "0x09",
		booyah = "0x08",
		panic_run = "0x0D",
		tantrum = "0x06",
		reject = "0x04",
		phooee = "0x05",
		noway = "0x03",
		kissmy = "0x02",
		booer = "0x01",
	},

	-- this is a class ID defined in C++.  Most pedestrian groups won't need to override this.
	class_id = "0x896e75af",				
}

-- a subset of pedestrian automata, containing child models
automata_group.child = TTT{
	-- this special field "_parent" points to another group that already exists.  Everything
	-- that applies to "pedestrian" also applies to "child".
	_parent = automata_group.pedestrian,
	
	group_id = "0x6a1e174d",				-- this should be a GUID defined in ingred.ini's "occupant groups" value map

	-- specify additional models to use when creating "child" automata.  Usually, each model will have an
	-- examplar that specifies which groups it belongs to.  This list just allows you to associate new models
	-- with a group without first creating an exemplar
	models = {
		sprite_model("0x0001000"),
		sprite_model("0x0002000"),
		sprite_model("0x0003000")
	},
}


-- create an attractor that attracts and repels school kids
attractor.schoolkids_attractor = 
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = { 80, 0 },			-- this example falls off to 0 at max radius
	-- strength = 80,						-- this example would be at constant strength 80 throughout the radius
	-- strength = { -80, -80, -80, 20 },	-- and this example repels for 3/4 of the radius, then attracts at the outer edge
	
	radius = 50,					-- influence radius, in meters
	automata = { "child" },		-- automata_groups this attractor affects
	calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {
			[7] = 0.0,				-- start to ramp up at 7 AM...
			[8] = 1.0,				-- to max attraction strength at 8 AM
			[8.5] = 0.3,			-- then taper off
			[9.0] = 0.0,
			[14.9] = 0.0,			-- suddenly...
			[15.0] = -1.0,			-- ...go home at 3PM (negative values repel)
			[15.5] = 0.0
	},
	
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
		{	
			radius = 15,									-- when automata are within 10 meters...
			state = BehaviorState.DISAPPEAR, 		-- they should disappear as if going into the building
		},
		{
			radius = 30,									-- when automata are within 30 meters...
			state = BehaviorState.BEE_LINE,		-- they should break from paths and head straight towards the building
		},
	},
}

-- create a generator that creates school kids
generator.schoolkids_generator = 
{
	automata = { "child" },						-- create children
	
	occupancy_pct = 0.2,						-- generate 20% of school's occupancy...
	rate = 2,										-- ...two times...
	rate_scale = RateScale.PER_MINUTE,	-- ...per game minute
	
	-- generate at random distances between 10 and 50 meters away.
	-- if this generator is linked to a time_of_day clock, then negative values will cause the
	-- automata to be generated towards the inside of the range, and positive values will create
	-- them towards the outside of the range (so that they will mimic an attached attractor)
	radius = { 10, 50 },
	
	-- copy times from schoolkids_attractor
	calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {
			[7] = 0.0,				-- start to ramp up at 7 AM...
			[8] = 1.0,				-- to max attraction strength at 8 AM
			[8.5] = 0.3,			-- then taper off
			[9.0] = 0.0,
			[14.9] = 0.0,			-- suddenly...
			[15.0] = -1.0,			-- ...go home at 3PM (negative values repel)
			[15.5] = 0.0
	},
}


-- Finally, create a "school" occupant group.  Each occupant that belongs to this group will have
-- a "schoolkids_attractor" and "schoolkids_generator" attached to it.

occupant_group.school = 
{
	group_id = "0x8a1ddfb4",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map
	
	-- alternatively, you could create an occupant group without giving it its own GUID or changing a property in
	-- the exemplars.  Since all school buildings have the "school coverage radius" property, you could uncomment the
	-- following line.
	-- Any time an occupant is created and it has that property, then it will be made a part of the "school" occupant
	-- group and have a "schoolkids_attractor" and "schoolkids_generator" attached to it
	--
	-- property_check = { "0x691b42b3" },		-- "School Coverage Radius"
	
	controllers = {
		"schoolkids_attractor",
		"schoolkids_generator"
	},
}


-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
