--
-- armybase_jumpjacks.lua
--

dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua") 
-----------------armybase SECTION -----------------------------



---================================================
generator.inbase_stand = 
{
      automata = { "army_jumpjacks","army_runinplace" },						-- create crowd sims
      count = 1,
      rate =6,										-- ...X times per...
      random_chance = 0.3,
      rate_scale = RateScale.PER_DAY,	-- ...game minute
      max_count= 5,
      radius = { 1, 2 },
         ignore_lot = true,      
     time_of_day = {
         [6.1] = 0.0,   -- 
         [6.5] = 1.0,   -- 
          [18.] = 1.0,   -- 
         [18.1] = 0.0,   -- 
         },
      --~ sfx = {SFX.Automata_ArmyDrill},  --- For the Generator itself
      --~ lifetime = 60,
       behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {
                  state = BehaviorState.IDLE,
                  sfx = { SFX.Automata_ArmyDrill},
                  --~ random_walk =
                        --~ {
                           --~ kph = { .001,0.01},
                           --~ delay = { 100, 500 },
                           --~ turn = { 0.0125, 0.0125 },
                           --~ idle_delay = { 1, 2 },
                           --~ idle_time = { 100, 1000 },
                           --~ strength = 0.5,
                           --~ acceleration = 0.2,
                           --~ deceleration = 0.5,
                        --~ },
                  timeout = 20,
                  ignore_roads = true,
                  ignore_paths = true,
                  final = true,
                  },
      },
}  
   ---------------------------------------------------------------------------------------
-- Finally, create an occupant group with attached attractor & generator

occupant_group.armybase_jumpjacks =   ---- this is the building group name
{
	 group_id = "0x1932",			-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	
	controllers = {
      "inbase_stand",
      },
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
