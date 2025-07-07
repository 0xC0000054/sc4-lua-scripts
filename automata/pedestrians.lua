--
-- pedestrians.lua
--
-- Defines common ped automata groups
--
-- Automata "group_id" is an occupant group GUID.  They are defined in ingred.ini "occupant groups" section and in cISC4Automata.h
--
--

--------------------------------------
-- prevent this file from being included multiple times
if not rawget(globals(), "_pedestrians_lua") then
_pedestrians_lua = 1


dofile("_templates.lua")
------------

automata_group.pedestrian = TTT
{
	group_id = "0x4001",
	class_id = "0x896e75af",		-- the class ID for C++.  Most groups won't need to override this

	anims = {
		walk = 0,
		riot_looting = "0x1000",
		riot_throw = "0x1100",
		riot_shake_fist = "0x1200",
		wait = "0x0C00",
		woohoo = "0x0700",
		whoop = "0x0A00",
		hop_clap = "0x0B00",
		clap = "0x0900",
		booyah = "0x0800",
		panic_run = "0x0D00",
      run = "0x0E00",
		tantrum = "0x0600",
		reject = "0x0400",
		phooee = "0x0500",
		noway = "0x0300",
		kissmy = "0x0200",
		booer = "0x0100",
		strike_stand_1 = "0x1300",
		strike_stand_2 = "0x1400",
		strike_walk_1 = "0x1500",
		strike_walk_2 = "0x1600",
		strike_walk_3 = "0x1700",
		strike_walk_bullhorn = "0x1800",
      idle = "0x0C00",
      -------EP1 Rush Hour Additional Anims------
      choking = "0x1900",
      mugging = "0x1A00", 
      --MySim_highwheeler-bike = "0x2200",
      --MySim_jetpack = "0x2300",
      --MySim_llama-segway = "0x2400",
      --MySim_motor-razor-scooter = "0x2500",
      --MySim_palanquin = "0x2600",
      --MySim_pogo = "0x2700",
      --MySim_razor-scooter = "0x2800",
      --MySim_recumbant-bike = "0x2900",
      --MySim_rickshaw = "0x3000",
      --MySim_roadbike = "0x3100",
      --MySim_rollerblade = "0x3200",
      --MySim_skateboard = "0x3300",
      --MySim_skateboard01 = "0x3400",
      --MySim_speedskate = "0x3500",
      --MySim_stickup = "0x3600",
      --emt_stretcher-empty-run = "0x3700",
      --emt_stretcher-full-run = "0x3800",
      --emt_stretcher-pickup = "0x3900",
      --emt_stretcher-pickup-body = "0x4000",
      --ut_directing-traffic-left = "0x4100",
      --ut_directing-traffic-right = "0x4200",
      --ut_dockinglines-bow-stern-dock = "0x4300",
      --ped_throw-life-saver = "0x4400",
      --ped_ferry-swim = "0x4500",
      --police_lgt-male-beat-cop-walk = "0x4600",
      --CC_road-pipe-idle01 = "0x4700",
      --CC_road-pipe-idle02 = "0x4800",
      --CC_road-pipe-idle03 = "0x4900",
      --CC_road-pipe-idle04 = "0x5000",
      --CC_road-pipe-repair = "0x5100",
      --CC_road-pipe-repair-fillin = "0x5200",
      --airport_flagman-tarmac-right = "0x5300",
      --airport_flagman-tarmac-left = "0x5400",
      --police_lgt-male-beat-cop-directTraffic-forward = "0x5500",
      --police_lgt-male-beat-cop-directTraffic-left = "0x5600",
      --police_lgt-male-beat-cop-directTraffic-right = "0x5700",
      --police_lgt-male-beat-cop-directTraffic-stop = "0x5800",
            },
}

automata_group.sim =TTT				-- general-purpose pedestrian traffic (no special-case animations or costumes)
{	_parent = automata_group.pedestrian,
   group_id = "0x4107",}

automata_group.child =TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4100",}

automata_group.fire_crew =TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4104",}

automata_group.firefighter = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4103",}

automata_group.fire_strike_group =TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x410A",}

automata_group.policeman = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x410D",}

automata_group.police_strike_group = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4108",}

automata_group.construction_sim = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4101",}

automata_group.crime_sim = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4102",
   class_id = "0xaa09dc28",}

automata_group.protestor = TTT
{   _parent = automata_group.pedestrian,
   group_id = "0x4106",}

automata_group.riot_one_shot =TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x410b",
   class_id = "0xaa09dc28",}

automata_group.fauna = TTT
{ _parent = automata_group.pedestrian,
   group_id = "0x410e",
	class_id = "0x896e75af",}		-- cSC4Pedestrian}

automata_group.prisoners =TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4112",}

automata_group.edu_strike_stand_group = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4113",}

--~ automata_group.edu_strike_walk_group = --currently no art for this group
--~ {	_parent = automata_group.pedestrian,
	--~ group_id = "0x4114",}

automata_group.medic_strike_stand_group = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4115",}

automata_group.medic_strike_walk_group = 
{	_parent = automata_group.pedestrian,
	group_id = "0x4116",}

--~ automata_group.transit_strike_stand = --currently no art for this group
--~ {	_parent = automata_group.pedestrian,
	--~ group_id = "0x4117",}

--~ automata_group.transit_strike_walk = --currently no art for this group
--~ {	_parent = automata_group.pedestrian,
	--~ group_id = "0x4118",}

automata_group.arsonist = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4119",}

automata_group.businessperson = TTT
{	_parent = automata_group.sim,          -- let business people act as general commute traffic
	group_id = "0x4120",}

automata_group.chimp = TTT
{	_parent = automata_group.fauna,
	group_id = "0x4121",}

automata_group.dog = TTT
{	_parent = automata_group.fauna,
	group_id = "0x4122",}

automata_group.llama = TTT
{	_parent = automata_group.fauna,
	group_id = "0x4123",}

automata_group.education_worker = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4124",}

automata_group.medical_worker = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4125",}

automata_group.transit_worker = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4126",}

automata_group.chimp_x = TTT
{	_parent = automata_group.fauna,
	group_id = "0x4127",}

automata_group.fauna_wild = TTT
{	_parent = automata_group.fauna,
	group_id = "0x4128",}

automata_group.army_joggers = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4129",}

automata_group.chain_gang = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4130",
   controllers = {"beatcop_make","prisoner_sneak","prisoners_push",
      },}

automata_group.army_jumpjacks = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4131",}

automata_group.army_runinplace = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4132",}

automata_group.deer = TTT
{ _parent = automata_group.fauna,
   group_id = "0x4133",}
   
automata_group.bear = TTT
{ _parent = automata_group.fauna,
   group_id = "0x4134",}

automata_group.elephant = TTT
{ _parent = automata_group.fauna,
   group_id = "0x4135",}
   
automata_group.giraffe = TTT
{ _parent = automata_group.fauna,
   group_id = "0x4136",}
   
automata_group.horse = TTT
{ _parent = automata_group.fauna,
   group_id = "0x4137",}
   
automata_group.lion = TTT
{ _parent = automata_group.fauna,
   group_id = "0x4138",}
   
automata_group.moose = TTT
{ _parent = automata_group.fauna,
   group_id = "0x4139",}
   
automata_group.polarbear = TTT
{ _parent = automata_group.fauna,
   group_id = "0x4140",}
   
automata_group.rhino = TTT
{ _parent = automata_group.fauna,
   group_id = "0x4141",}
    
automata_group.prisoner_cop_magnet = TTT
{ _parent = automata_group.pedestrian,
   group_id = "0x4142",
       controllers = {"copcar_pull","copped_pull"},   }  
       
automata_group.army_sims = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4143",}

   automata_group.tv_peds = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4144",
   --~ controllers = {"money_attractor"},
   }
   
   automata_group.zombie = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4145",
   --~ controllers = {"money_attractor"},
   }
   
   automata_group.mower_dude = TTT
{	_parent = automata_group.pedestrian,
	group_id = "0x4146",
   --~ controllers = {"money_attractor"},
   }

   automata_group.carjacking_sims = TTT
{ _parent = automata_group.pedestrian,
   group_id = "0x4148",
   }

   automata_group.mysim_walk_male = TTT 
{ _parent = automata_group.pedestrian,
   group_id = "0x4149",
   }

   automata_group.mysim_walk_female = TTT
{ _parent = automata_group.pedestrian,
   group_id = "0x414a",
   }
   
-- keep this as the last line and uncomment it to check your work
--~ verify_all_templates()


-- end include check
end   
