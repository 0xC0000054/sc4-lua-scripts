--
-- _templates.lua
--
-- Table definitions to perform type & required field checking on tables
--

dofile("_system.lua")

--------------------------------------
-- prevent this file from being included multiple times
if not rawget(globals(), "_templates_lua") then
_templates_lua = 1

dofile ("_keycodes.lua")

--------------------------------------
-- constants

sunday = 0
monday = 1
tuesday = 2
wednesday = 3
thursday = 4
friday = 5
saturday = 6

	-- used in "event" field of templates.generator_trigger
	-- change that template table when you make changes here
TriggerEvent = {
	CONSTRUCTION_COMPLETE = 0,				-- trigger when building completes construction
	BUILDING_ABANDONED = 1,					-- trigger when building goes to abandoned state
}

	-- used in "rate_scale" field of templates.generator_trigger
	-- change that template table when you make changes here
RateScale = {
	PER_MINUTE = 0,
	PER_HOUR = 1,
	PER_DAY = 2,
	PER_WEEK = 3,
}

	-- used in "state" field of templates.automata_behavior table
BehaviorState = {
	DEFAULT = 0,					-- resume default behavior (e.g. walk or drive along road paths)
	DISAPPEAR = 1,				-- fade out
	BEE_LINE = 2,					-- break from paths and head straight towards/away from attractor
	CROWD = 3,					-- stop at current location, watch attractor
	QUEUE = 4,						-- line up along closest path and wait
	STRIKE = 6,					-- striking sim behavior
	IDLE = 7,						-- wait for some event
	RIOT_LEADER = 8,					-- move in random directions in riot mode
	RIOT_FOLLOWER = 9,					-- follow another automaton in riot leader mode
   SCRIPTED = 10,                -- tick behavior implemented by a lua script
   RANDOM_WALK = 11,       -- move in random directions
	IGNITE_OCCUPANT = 12, -- used for arsonist automata, USE WITH CAUTION :)
   PLOP_JUMP = 15,         -- jump in response to a building plop (special purpose event)
   PLAYER_DRIVE = 16,      -- controlled by player
   BUMPED = 17,               -- collided with another automaton
   MAGNET = 18,               -- pulled towards (or away from) attractor, regardless of elevation
   COLLIDE = 20,			-- vehicle is controlled by particle collision system
   PULLOVER = 21,			-- vehicle pulls to the side and stops
}

	-- zone type, wealth, & purpose filters for automata families
ZoneTypes = {
	residential = 1,
	commercial = 2,
	industrial = 3,
	res = 1,			-- abbrevs; same as above
	com = 2,
	ind = 3,								
}
WealthTypes = {
	low = 1,
	medium = 2,
	high = 3,
}
PurposeTypes = {
	residence = 1,
	services = 2,
	office = 3,
	tourism = 4,
	agriculture = 5,
	processing = 6,
	manufacturing = 7,
	high_tech = 8
}

GeneratorPriority = 
{
   NORMAL     = 0,
   LOW        = 25,
   MEDIUM     = 50,
   HIGH       = 75,
   HIGHEST    = 255,
}

	-- frequently-used GUIDs
GUIDExemplars 				= "0xa079ce1b"
GUIDCivicBuildings 			= "0x07bddf1c"
GUIDResidentialBuildings	= "0x67bddf0c"
GUIDCommercialBuildings	= "0x47bddf12"
GUIDIndustrialBuildings		= "0xa7bddf17"
GUIDUtilityBuildings			= "0xc8dbccba"
GUIDLandmarkBuildings		= "0xc8dbccba"
GUIDFloraExemplars			= "0xe83e0437"
GUIDModelType				= "0x5ad0e817"		-- a 3D model resource
GUIDModelGroup				= "0xbadb57f1"		-- a 3D model resource
GUIDSpriteType				= "0x29a5d1ec"		-- an animated sprite
GUIDSpriteGroup				= "0x49a593e7"		-- an animated sprite

	-- GUID helper functions

-- return a GUID for a 3D Model given an instance ID (as a string):   e.g.  res_model("0xABCD0001")
function res_model(instance_id)
	return { GUIDModelType, GUIDModelGroup, instance_id }
end

-- return a GUID for an Animated Sprite model given an instance ID (as a string):  e.g. sprite_model("0xABCD0002")
function sprite_model(instance_id)
	return { GUIDSpriteType, GUIDSpriteGroup, instance_id }
end

--------------------------------------


--------------------------------------

-- GUID used in fields that require an exemplar or other ID.  Numbers must be in the form of strings
-- example { "0xABCD0000", "0xABCD0002", "0x00000001" }
templates.GUID = { "string", "string", "string" }		-- type, group, and instance ID

-- contains a list of 1 or more automata types or type names.
-- Special type names "vehicle", "pedestrian", "aircraft", "watercraft" are defined to attract all automata of
-- that type.  
-- example:  
--       "sim"                                     -- creates normal pedestrians
--       { "police_car", "fire_engine" }  	-- attracts police cars AND fire engines
templates.automata_family_names = type_list("string")

-- An occupant group defines a set of occupants that should have some common properties or common
-- behavior.  For example, "occupant_group.school" can contain a list of attractors and generators for
-- school kids.  Any time a school building is created, it will also create those attractors & generators
templates.occupant_group =
{
	-- a GUID for this group, so it can be used in exemplars.  Occupant group GUIDs are defined in ingred.ini
	-- in the "occupant groups" value map.  This should be a 32-bit hex number, expressed as a string
	-- Example: group_id = "0xABCD0000",
	group_id = "string",
	
	-- list of attractors and/or generators attached to these occupants, specified by name
	-- Example: controllers = { "schoolkids_attractor", "schoolkids_generator" },
	controllers = type_list( "string" ),

	-- filter for occupants that belong to this controller_group.
	percentage = "number",										-- only include this percentage (0.1) of occupants
																		-- (e.g. percentage=0.1 will apply this group to 10% of school buildings)
}

-- automata_group is a special type of occupant group for automata.  Examples would be "crime_sims" or "school_kids"
templates.automata_group = TTT
{
	-- all properties of occupant_group are also valid for automata_group
	_parent = templates.occupant_group,
	
	-- contains a list of named animations and offsets.  The offsets are appended to the automaton's base
	-- model GUID to get a new GUID
	-- example: { walk = 1, run = 2, flee = "0x03" }   (to use hex numbers, you have to surround them with quotes "")
	--  if base model GUID is 0xABCD0000, then "walk" will switch to model 0xABCD0001, "run" will switch to
	--  model 0xABCD0002, etc.
	anims = subset_of( { "string", "number" } ),

	-- optional list of models that can be used for this group.  Most automata models will have a corresponding exemplar
	-- property that lists what automata groups the model belongs to; this section just allows a scripter to include models
	-- in the group without setting up an exemplar for each one.
	models = type_list(templates.GUID),
	
	-- GUID for the C++ class to create when creating instances of this group
	class_id = "string",
	
   -- Road Vehicles Only: a list of one or more automata group names.  Any vehicle created from this group
   -- will have this list of trailer vehicles following it, like a train.
   -- Any automta group with the trailers property must also have its class_id set to that of
   -- cSC4TrailerVehicle ("0x4a5b69ed")
   trailers = type_list( "string" ),
   
   -- min/max default speed of the automaton, in kph
   kph = type_list("number"),
   
   -- drive parameters for special groups
   airplane = "table",
   helicopter = "table",
   
   -- player drive parameters for this group
   playerdrive = "table",
   
   -- bitmap image id to use for city-mission indicators
   csi_image = "string",
   
   -- a GUID for the occupant group that can be used to create this buildings
   -- e.g., patrol cars' source building are police stations
   source_building = "string",
   
   -- table of visual effects that will be turned on and off in response to keypresses
   -- during player drive
   -- format:
   --   key_effects = {
   --       { cmd = drive_command, fx = "effect_name", bone = "bone_name", hold = <true/false>, one_shot = <true/false>, override = <true/false> },
   --   }
   -- e.g. 
   --       { cmd = drive_command.SPECIAL, fx = "spray_foam", bone = "bone_spray_foam", hold = true },
   -- 
   -- If the "bone" is not given, it will be the same as "fx".
   -- If "hold" is not given, it will be FALSE (the key is toggled on and off instead of being held down)
   -- If "one_shot" is given, the command will generate a new effect every time the key is pressed (overrides "hold")
   -- If "override" is given, only what's specified in the key_effects entry will happen for that key and the default behavior
   -- will be ignored.  E.g. the default behavior for "drive_command.SPECIAL" for vehicles is honking the horn
   -- 
   key_effects = "table",
}

-- time of day maps an hour on the 24 hour clock (a number from 0 - 24) to a multiplier from (0 - 1)
-- Values form a curve over time
-- example: { [6.5] = 0.0, [7] = 0.3, [8] = 1.0, [9] = 0.3, [9.5] = 0.0 }  -- creates peak activity at 8 AM
templates.time_of_day = type_list( "number" )


-- calendar defines a set of days of the week a controller is active.  (the game has no real concept of "days",
-- controllers assume that the game starts on sunday and every 7th day is a new week.)
-- example: { monday, tuesday, wednesday, thursday, friday }		-- active on weekdays only
templates.calendar = value_table( { sunday, monday, tuesday, wednesday, thursday, friday, saturday } )

-- parameters for random walk behavior
-- see particle effects documentation for a better explanation of some of these parameters
templates.random_walk_parameters =
{
   delay = type_list("number"),                -- min/max time in seconds between direction changes

   -- works identically to the "turn" parameter for random walk in the particle effects system
   -- in short, "variation" specifies a fraction of a turn to the left or right, and "offset" modifies that variation
   turn = type_list("number"),                  -- { variation } or { variation, offset }
   
   strength = type_list("number"),           -- min/max strength of random walk force, in relation to attraction force
   idle_delay = type_list("number"),      -- min/max time in seconds between idles.
   idle_time = type_list("number"),        -- min/max time in seconds to idle
   deceleration = "number",                        -- time in seconds to decelerate from default speed to idle
   
   kph = type_list("number"),                   -- LEGACY for script compatibility -- use kph in automata_behavior instead
   acceleration = "number",                        -- LEGACY for script compatibility -- use acceleration in automata_behavior instead
}

-- defines a behavior "state" for an automaton.
templates.automata_behavior =
{
	-- state for the automaton to take.  Must be one of the BehaviorState predefined values (@ top of this file)
	state = required_field(value_table(BehaviorState)),
	
	anims = type_list("string"),				-- animation(s) to play, by name.  These are defined in automata family "anims"
   sfx = type_list("string"),             -- 1 or more sound effect trackID's (in hex) to play when automaton enters this state
	percentage = "number",					-- from 0.0-1.0, percent chance of using this behavior
	radius = "number",						-- radius from the attractor/generator in which this behavior applies
	priority = "number",						-- if more than 1 behavior applies, the one with HIGHER priority wins
   timeout = "number",                 -- how long state should last, in real-time seconds
   final = "boolean",                -- if true, then the automaton should fade out if it ever leaves this state
   
   ignore_paths = "boolean",      -- if true, automaton will ignore road paths
   ignore_roads = "boolean",      -- if true, automaton will not be bound to the road network
   ignore_terrain = "boolean",    -- if true, automaton's altitude will not be clamped to terrain
   ignore_attractors = "boolean",    -- if true, automaton will ignore attractors/repulsors while in this state
   avoid_lots = "boolean",              -- if true, automaton will fade out as soon as it detects it's on a lot
   avoid_roads = "boolean",             -- if true, automaton will fade out as soon as it detects it's on a road
   kph_multiply = type_list("number"), -- multiplied by default movement speed while in this state (a single number or a range, e.g. { 2.0 } or { 2.0, 5.0 })
   kph = type_list("number"),              -- absolute speed while in this state (a single number or a min/max range)
   acceleration = "number",                        -- time in seconds to accelerate to requested kph
   
   path_offset = "number",             -- automata will be offset this many meters from their path.  If positive, offset is towards center of tile, negative is towards edge of tile
   
   random_walk = templates.random_walk_parameters,       -- define parameters for the random walk behavior
}

-- Common properties for automata controllers (attractors & generators)

templates.controller = 
{
   -- controller will destroy itself after this many seconds (in real time, NOT 24-hour clock time)
   lifetime = "number",
   
   -- delay, in seconds, between creation of the controller and its activation (useful for tying to effects scripts)
   delay = "number",
   
   -- true or false.  If true, automata will be attracted to/generated from the center point of the front side of the 
   -- occupant's lot.  Default behavior (if this is false) is that automata are attracted to/generated from the center point
   -- of the occupant itself, from all sides of the lot.
   use_lot_facing = "boolean",
   
   -- true or false.  If true, automata will be generated from/attracted to the center point of the lot, instead
   -- of keeping themselves outside the lot boundaries
   use_lot_center = "boolean",
   
   -- true or false.  If true, controller source point and radius will be relative to the occupant or controller position and will
   -- ignore lot boundaries
   ignore_lot = "boolean",
   
   -- true or false.  If true, controller will only affect ground automata
   -- act only on ground automata
   ground_only = "boolean",
   
   -- one or more sound effect trackID's (in hex) to play when controller is made active.  If multiple are
   -- supplied, will randomly choose 1 to play.
   sfx = type_list("string"),
   
   -- if true, controllers created from this template will not be saved with a saved game
   transient = "number",

   -- one or more GUIDs for global effect triggers, as hex strings.  These triggers are associated with advice
   -- messages in the advisor scripts.  The controller will be on when any of its associated triggers is true, off when any
   -- of its triggers is false.
   effect_trigger = type_list("string"),

   -- identical to effect_trigger, except the active state is reversed.  The controller will be OFF when any of its associated
   -- triggers is true, or ON when all of its associated triggers are false.
   deactivate_trigger = type_list("string"),

   -- maximum automata affected by this controller at any one time
	max_count = "number",
   
   -- list of behavior state numbers from the BehaviorState table.  Acts as an additional filter
   -- to the "automata" table; automata that are in any of these states will NOT be affected by
   -- this controller.  (See fire.lua repulsors for an example; they ignore riot states.)
   ignore_states = type_list("number"),
   
   -- don't allow any controllers of this template to be created within x meters of another existing instance
   exclusive_radius = "number",
   
   -- if true, controller stays active even when it's not visible on-screen
   persist_offscreen  = "boolean",
}


-- Attractors are attached to an occupant in the city and attract or repel automata within
-- their influence radius

templates.attractor = TTT
{
   _parent = templates.controller,
   
	-- overall strength value, from 0 to 100.  Negative values repel.
	-- If a single number, that strength remains constant over the radius of attraction
	-- If a list of numbers (e.g. { 80, 0 } or {80, 75, 0 }), strength falls off over distance
	strength = required_field(type_list("number")),
	
	radius = required_field("number"),					-- radius of influence, in meters

	-- list of automata family names that this attractor affects.
	automata = required_field(templates.automata_family_names),

	-- strength based on time of day.  Output values are from 0-1.  If omitted, attractor is at full strength always
	time_of_day = templates.time_of_day,	
	
	-- days of the week this attractor is active.  If omitted, attractor is active every day.
	calendar = templates.calendar,
	
	-- one or more behaviors to take when automata get within (or outside of) radius of attractor
	-- each behavior will be applicable when the automata is within that behavior's "radius"
	behavior = type_list(templates.automata_behavior),
   
}

templates.vector = { "number", "number", "number" }

-- A Generator is attached to an occupant and creates automata at specified intervals

templates.generator = TTT
{
   _parent = templates.controller,
   
	automata = templates.automata_family_names,		-- types of automata this generator creates

	-- count properties determine how any automata are created each time the generator is triggered.  Choose one:
	count = "number",					-- a constant number, e.g. count = 1
	occupancy_pct = "number",		-- from 0.0 - 1.0, a percentage of the attached building's occupancy
	population_pct = "number",		-- from 0.0 - 1.0, a percentage of the overall city population

   -- generator will destroy itself after it's created this many automata
   lifetime_count = "number",
   
	-- rate properties determine how often the generator is triggered
	rate = "number",									-- gets triggered x times...
	rate_scale = value_table(RateScale),		-- ...per minute, hour, or day
															-- see RateScale table at top of file
															-- NOTE: Anything less than 1/PER_WEEK is unreliable!
	
	-- triggers the generator when some event occurs on its attached occupant.  use instead of rate
	event = value_table(TriggerEvent),			-- see TriggerEvent table at top of file

	time_of_day = templates.time_of_day,		-- percent chance of triggering (0.0-1.0), based on time of day
	calendar = templates.calendar,				-- days this generator is active.  If omitted, active every day
							
	-- Randomly modifies the chance of triggering.  This value can be 1 or 2 numbers between 0.0 and 1.0
	-- example: random_chance = 0.5			-- will generate 50% of the time
	--			 random_chance = { 0.2, 0.4 }		-- will generate between 20% to 40% of the time
	-- This property has no effect on its own; combine it with other properties to get random effects
	random_chance = type_list("number"),

	-- distance away from generator to create automata.  This can be a single number or a range of
	-- numbers (e.g.  radius = 10,    radius = { 10, 50 })
	-- if this generator is linked to a time_of_day clock, then negative values in the clock will cause
	-- the automata to be generated towards the inside of this range, while positive values will create
	-- them towards the outside of the range (so that they will mimic an attached attractor)
	radius = required_field(type_list("number")),

	-- Initial behavior for generated automata.  If more than one behavior is specified, will choose randomly between
	-- them based on each behavior's "percentage" field.  If no behaviors are specified, each automaton will use its
	-- default behavior.
	behavior = type_list(templates.automata_behavior),

   -- if true, automata will be generated only on road tiles.
   follow_roads = "boolean",
   follow_rail = "boolean",
   
   -- if true, automata created by this generator will be destroyed when the generator is removed or
   -- deactivated
   destroy_automata = "boolean",
   
   -- Applies to generators that have multiple automata groups.  When creating automata, the generator
   -- will create up to group_count of one group before randomly choosing a new group.
   -- If group_count is specified, then group_count will be used for max_count as well (any specified
   -- value for max_count will be ignored.)
   -- can be a single number or a min/max range to choose randomly.  e.g.  group_count = 5,     group_count = { 5, 10 },
   group_count = type_list("number"),
   
   -- sets priority of generated automata.  automata with lower priority will be deleted if necessary
   -- to create the new ones.  Use constants in the GeneratorPriority table.  Default is LOW, which means
   -- that generated automata by default will have a higher priority than street traffic & crime sims
   priority = "number",
}


templates.attractor_list = type_list( templates.attractor )
templates.generator_list = type_list( templates.generator )
templates.occupant_group_list = type_list( templates.occupant_group )
templates.automata_group_list = type_list( templates.automata_group )

--------------------
-- end sentry
end 