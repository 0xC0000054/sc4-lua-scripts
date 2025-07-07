--
-- nuclear.lua

dofile("doggy.lua")
dofile("_templates.lua")
dofile("pedestrians.lua")
dofile("_sfx.lua")
dofile("vehicles.lua")
dofile("strikers.lua")
dofile("reward.lua")
-----=============================================
-- create an attractor that ATTRACTS 
attractor.protestor_pull =
{
	-- attraction strength from -100 to 100 (negative values repel)
	strength = 100,
	radius = 60,					-- influence radius, in meters
   --use_lot_facing = true,
   --=== using police strikers temporarily until real protestors come in
	automata = {"protestor",  "transit_worker","education_worker","sim"}, 		-- automata_groups this attractor affects
   lifetime = 90,
   behavior = {
	     
         {
         --percentage = 0.4,
         state = BehaviorState.DEFAULT,
         radius= 20,
         anims={"strike_walk_1","strike_walk_2","strike_walk_3","strike_walk_bullhorn", },
  			sfx = {SFX.Automata_StrikeMedium,SFX.Automata_BooLarge1,SFX.Automata_StrikeMedium},
         timeout = 40,
         final = true,
      },
		{
         state = BehaviorState.DEFAULT,
         radius=37,
         timeout = 15,
         --~ anims = {"kissmy", "riot_shake_fist"},
  			sfx = {SFX.Automata_StrikeSmall, SFX.Automata_BooSmall},
         --final = true,
      },
   },
}
-----============================================
generator.protester_generator = 
{
   automata = {"education_worker","protestor", "transit_worker","sim", "education_worker"},
	count = 13,
   rate =1,										-- ...once every...
   rate_scale = RateScale.PER_MINUTE,	  -- ...game minute
	max_count = 50,
	radius = {26,45},
   lifetime = 170,
	--event = TriggerEvent.CONSTRUCTION_COMPLETE,
   destroy_automata = true,
	follow_roads = true,
}


---===========================================================
occupant_group.nimby =			
 {
	group_id = "0X1928", -- NIMBY occupant group
	controllers = {
		"protester_generator",
    	"protestor_pull",
     "tv_pull",
		"tv_in",
      "dog_pull",
		"dog_make",
      "vehicle_disappear",
      },
 }
 
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
