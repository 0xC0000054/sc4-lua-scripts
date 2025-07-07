--
-- strikers.lua
--

dofile("_templates.lua")
dofile("_sfx.lua")
dofile("_constants.lua")

occupant_group.striking_fire = 
{
	controllers = {
		--~ "vehicle_disappear",
		"fire_strike_gen_1",
      "fire_strike_gen_2",
		"fire_strike_gen_3",
	},
}

occupant_group.striking_police = 
{
	controllers = {
      --~ "vehicle_disappear",
      "police_strike_gen_1",
		"police_strike_gen_2",
		"police_strike_gen_3",
	},
}

occupant_group.striking_health = 
{
	controllers = {
		--~ "vehicle_disappear",
      "health_strike_gen_1",
		"health_strike_gen_2",
		--~ "health_strike_gen_3",
	},
}

occupant_group.striking_education = 
{
	controllers = {
		--~ "vehicle_disappear",
      "education_strike_gen_1",
		"education_strike_gen_2",
		"education_strike_gen_3",
	},
}

occupant_group.strikable_transit = 
{
	group_id = "0x1A04",
	controllers = {
		--~ "vehicle_disappear",
      --~ "transit_strike_gen_1",
		"transit_strike_gen_2",
		--~ "transit_strike_gen_3",
	},
}


-------------------------------------------------------------------------------
-- BASE STRIKE ATTRACTORS
-------------------------------------------------------------------------------
attractor.vehicle_disappear = 
{  automata = {"civilian_cars"},  --only civ cars, not gov cars.
strength = 1,
radius = 30,
behavior = 
{
   {state = BehaviorState.DISAPPEAR,
   timeout = 5,
   final=true,
   },
},
}

-------------------------------------------------------------------------------
-- BASE STRIKE GENERATORS
-------------------------------------------------------------------------------

generator.base_strike_gen = TTT
{
	count = 1,
	rate = 1, 
	rate_scale = RateScale.PER_MINUTE,
	
	radius = { 0, 15 },
	
---	time_of_day = {
---		[5] = 0.0,
---		[6] = 1.0,
---		[20] = 1.0,
---		[21] = 0.0,
---	},

	destroy_automata = true,
   priority = automata_priority.HIGHEST,
}

--
-- standing strikers - this should be the stand group
--
generator.base_strike_gen_1 = TTT
{
	_parent = generator.base_strike_gen,

	max_count = 8,

	-- behavior is always expressed as a table of tables, since there can be more than 1
	behavior = {					
		{	
			radius = 32,
			state = BehaviorState.CROWD,
			anims = {"strike_stand_1", "strike_stand_2"},
			sfx = {SFX.Automata_StrikeSmall},
			timeout = 90,
			final = true,
		},
	},
}

--
-- walking strikers - should be the Single Peds, not group
--
generator.base_strike_gen_2 = TTT -- These walk in the road - 
{
	_parent = generator.base_strike_gen,

	max_count = 12,
   use_lot_facing = true,
   follow_roads = true,
	-- behavior is always expressed as a table of tables, since there can be more than 1
	behavior = {					
		{	
			radius = 32,
			state = BehaviorState.STRIKE,
			anims = {"strike_walk_1", "strike_walk_2", "strike_walk_3", "strike_walk_bullhorn"},
			sfx = {SFX.Automata_StrikeSmall},
         timeout = 30,
         final = true,
         path_offset = 2.0,
		},
	},
}

--
-- striking crowds
--
generator.base_strike_gen_3 = TTT
{
	_parent = generator.base_strike_gen,

	max_count = 3,
	
	-- behavior is always expressed as a table of tables, since there can be more than 1
	behavior = {					
		{	
			radius = 32,
			state = BehaviorState.CROWD,
			sfx = {SFX.Automata_StrikeSmall},
         timeout = 90,
         final = true,
		},
	},
}


-------------------------------------------------------------------------------
-- FIRE ==========================================================
-------------------------------------------------------------------------------

generator.fire_strike_gen_1 = TTT
{
	_parent = generator.base_strike_gen_1,
	automata = { "firefighter" },
}

generator.fire_strike_gen_2 = TTT
{
	_parent = generator.base_strike_gen_2,
	automata = { "firefighter" },
}

generator.fire_strike_gen_3 = TTT
{
	_parent = generator.base_strike_gen_3,
	automata = { "fire_strike_group" },
}


-------------------------------------------------------------------------------
-- POLICE 
-------------------------------------------------------------------------------

generator.police_strike_gen_1 = TTT
{
	_parent = generator.base_strike_gen_1,
	automata = { "policeman" },
}

generator.police_strike_gen_2 = TTT
{
	_parent = generator.base_strike_gen_2,
	automata = { "policeman" },
}

generator.police_strike_gen_3 = TTT
{
	_parent = generator.base_strike_gen_3,
	automata = { "police_strike_group" },
}

-------------------------------------------------------------------------------
-- HEALTH   =====================================================
-------------------------------------------------------------------------------

generator.health_strike_gen_1 = TTT
{
	_parent = generator.base_strike_gen_1,
	automata = { "medic_strike_stand_group" },
}

generator.health_strike_gen_2 = TTT
{
	_parent = generator.base_strike_gen_2,
	automata = { "medical_worker" },
}

generator.health_strike_gen_3 = TTT
{
	_parent = generator.base_strike_gen_3,
	automata = { "medic_strike_walk_group" },
}


-------------------------------------------------------------------------------
-- EDUCATION
-------------------------------------------------------------------------------

generator.education_strike_gen_1 = TTT
{
	_parent = generator.base_strike_gen_1,
	automata = { "edu_strike_stand_group" },
   }

generator.education_strike_gen_2 = TTT
{
	_parent = generator.base_strike_gen_2,
	automata = { "education_worker" },
}

generator.education_strike_gen_3 = TTT
{
	_parent = generator.base_strike_gen_3,
	automata = { "education_worker" },
}

-------------------------------------------------------------------------------
-- TRANSIT  =====================================================
-------------------------------------------------------------------------------

-- there's no art for standing and/or group transit strikers, so 
-- use the walking strike group, transit_strike_gen_2 ONLY
--
-- NOTE: instances of transit_strike_gen_1 and transit_strike_gen_3 can
-- exist in some savegame files, so I'm including them here just as 
-- duplicates of transit_strike_gen_2

generator.transit_strike_gen_1 = TTT 
{
	_parent = generator.base_strike_gen_2,
	automata = { "transit_worker" },
	effect_trigger = { effects.TRANSIT_STRIKE_ACTIVE },
}

generator.transit_strike_gen_2 = TTT
{
	_parent = generator.base_strike_gen_2,
	automata = { "transit_worker" },
	effect_trigger = { effects.TRANSIT_STRIKE_ACTIVE },
}

generator.transit_strike_gen_3 = TTT
{
	_parent = generator.base_strike_gen_2,
	automata = { "transit_worker" },
	effect_trigger = { effects.TRANSIT_STRIKE_ACTIVE },
}

--~ verify_all_templates()

