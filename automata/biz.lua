--
-- biz.lua
--

dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua")

-- create a generator that creates biz peeps
generator.biz_gen_walk = 
{
	automata = { "businessperson" },					
   count = 3,
	rate = 1,
   rate_scale = RateScale.PER_MINUTE,	-- ...game minute
	max_count=10,
	follow_roads = true,
   use_lot_facing = true,
	radius = { 2, 4 },
	behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {	
            state = BehaviorState.DEFAULT,
            timeout = 16,
            final = true,
         },
      },
	--~ --calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {
			[7] = 0.0,				
			[8] = 0.8,				
			[8.5] = 0.8,			
			[9.0] = 0.8,
			[14.9] = 0.5,			
			[15.0] = 0.5,			
			[17.0] = 0.2,
			[18.0] = 0.0,
	},
}
---======= Gen Standing Peeps
generator.biz_gen_stand = 
{
	automata = { "businessperson" },					
   count = 3,
	rate = 1,
   rate_scale = RateScale.PER_MINUTE,	-- ...game minute
	max_count=20,
	follow_roads = true,
   use_lot_facing = true,
	radius = { 2, 4 },
	 behavior = {					-- behavior is always expressed as a table of tables, since there can be more than 1
         {	
            anims = { "idle", },
            state = BehaviorState.IDLE,
            sfx = {SFX.Automata_WallaSmall},
            timeout = 16,
            final = true,
         },
      },
	--~ --calendar = { monday, tuesday, wednesday, thursday, friday },
	time_of_day = {
			[7] = 0.0,				
			[8] = 0.8,				
			[8.5] = 0.8,			
			[9.0] = 0.8,
			[14.9] = 0.5,			
			[15.0] = 0.5,			
			[17.0] = 0.2,
			[18.0] = 0.0,
	},
}
---====================================================
occupant_group.biz_sims = 
{
	group_id = "0X1913",				
	controllers = {
		"biz_gen_walk",
		"biz_gen_stand",
   },
}


-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
