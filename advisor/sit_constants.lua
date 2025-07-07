--
-- sit_constants.lua
--
-- defines constants for the "City Situation" scripts
--

if (_sit_constants == nil) then
_sit_constants = 1


---------------------------------------

automata_groups = {}
   automata_groups.automaton=hex2dec('4000')
   automata_groups.pedestrian=hex2dec('4001')
   automata_groups.vehicle=hex2dec('4002')
   automata_groups.aircraft=hex2dec('4003')
   automata_groups.watercraft = hex2dec('4004')
   automata_groups.train=hex2dec('4005')
   
   automata_groups.child=hex2dec('4100')
   automata_groups.construction_sim=hex2dec('4101')
   automata_groups.crime_sim=hex2dec('4102')
   automata_groups.firefighter=hex2dec('4103')
   automata_groups.sim_fire_crew=hex2dec('4104')
   automata_groups.police_walking_strike_sim=hex2dec('4105')
   automata_groups.protestor=hex2dec('4106')
   automata_groups.sim=hex2dec('4107')
   automata_groups.police_standing_strike_sim=hex2dec('4108')
   automata_groups.firemen_walking_strike_sim=hex2dec('4109')
   automata_groups.firemen_standing_strike_sim=hex2dec('410a')
   automata_groups.rioting_standing_sim=hex2dec('410b')
   automata_groups.rioting_walking_sim=hex2dec('410c')
   automata_groups.police=hex2dec('410d')
   automata_groups.fauna=hex2dec('410e')
   automata_groups.riot_police=hex2dec('410f')
   automata_groups.riot_police_walking_sim=hex2dec('4110')
   automata_groups.riot_police_standing_sim=hex2dec('4111')
   automata_groups.prisoner=hex2dec('4112')
   automata_groups.education_standing_strike_sim=hex2dec('4113')
   automata_groups.education_walking_strike_sim=hex2dec('4114')
   automata_groups.medical_standing_strike_sim=hex2dec('4115')
   automata_groups.medical_walking_strike_sim=hex2dec('4116')
   automata_groups.transit_standing_strike_sim=hex2dec('4117')
   automata_groups.transit_walking_strike_sim=hex2dec('4118')
   automata_groups.arsonist=hex2dec('4119')
   automata_groups.businessperson=hex2dec('4120')
   automata_groups.chimp=hex2dec('4121')
   automata_groups.dog=hex2dec('4122')
   automata_groups.llama=hex2dec('4123')
   automata_groups.education_worker=hex2dec('4124')
   automata_groups.medical_worker=hex2dec('4125')
   automata_groups.transit_worker=hex2dec('4126')
   automata_groups.chimp_experiment=hex2dec('4127')
   automata_groups.fauna_wild=hex2dec('4128')
   automata_groups.army_joggers=hex2dec('4129')
   automata_groups.chain_gang=hex2dec('4130')
   automata_groups.army_jump_jacks=hex2dec('4131')
   automata_groups.army_run_in_place=hex2dec('4132')
   automata_groups.deer=hex2dec('4133')
   automata_groups.bear=hex2dec('4134')
   automata_groups.elephant=hex2dec('4135')
   automata_groups.giraffe=hex2dec('4136')
   automata_groups.horse=hex2dec('4137')
   automata_groups.lion=hex2dec('4138')
   automata_groups.moose=hex2dec('4139')
   automata_groups.polar_bear=hex2dec('4140')
   automata_groups.rhino=hex2dec('4141')
   automata_groups.jail_prisoner_cop_magnet=hex2dec('4142')
   automata_groups.army_sims=hex2dec('4143')
   automata_groups.tv_reporter_ped=hex2dec('4144')
   automata_groups.zombie=hex2dec('4145')
   automata_groups.mower_dude=hex2dec('4146')
   automata_groups.flaming_stuntman=hex2dec('4147')
   automata_groups.carjacking_sims=hex2dec('4148')
   
   automata_groups.bus=hex2dec('4200')
   automata_groups.commute_train=hex2dec('4201')
   automata_groups.fire_engine=hex2dec('4202')
   automata_groups.freight_train=hex2dec('4203')
   automata_groups.freight_truck=hex2dec('4204')
   automata_groups.garbage_truck=hex2dec('4205')
   automata_groups.moving_van=hex2dec('4206')
   automata_groups.police_vehicle=hex2dec('4207')
   automata_groups.subway=hex2dec('4208')
   automata_groups.mysim_vehicle=hex2dec('4209')
   automata_groups.soccer_moms=hex2dec('420A')
   automata_groups.civilian_cars=hex2dec('420B')
   automata_groups.ice_cream=hex2dec('422a')
   automata_groups.taxi_cars=hex2dec('420C')
   automata_groups.rich_cars=hex2dec('420D')
   automata_groups.cheap_cars=hex2dec('420E')
   automata_groups.school_bus=hex2dec('420F')
   automata_groups.limo=hex2dec('4210')
   automata_groups.mayor_limo=hex2dec('422b')
   automata_groups.ambulance=hex2dec('4211')
   automata_groups.toxic_carrier=hex2dec('4212')
   automata_groups.hearse=hex2dec('4213')
   automata_groups.recycle_truck=hex2dec('4214')
   automata_groups.commute_train_engine=hex2dec('4215')
   automata_groups.freight_train_engine=hex2dec('4216')
   automata_groups.subway_engine=hex2dec('4217')
   automata_groups.tv_reporter=hex2dec('4218')
   automata_groups.farm_vehicles=hex2dec('4219')
   automata_groups.freight_train_caboose=hex2dec('421A')
   automata_groups.u_haul_leader=hex2dec('421B')
   automata_groups.u_haul_trailer=hex2dec('421C')
   automata_groups.subway_tunneler=hex2dec('421D')
   automata_groups.army_truck=hex2dec('421E')
   automata_groups.missile_truck=hex2dec('421F')
   automata_groups.army_tank=hex2dec('4220')
   automata_groups.army_truck_leader=hex2dec('4221')
   automata_groups.semi_truck=hex2dec('4222')
   automata_groups.semi_trailer=hex2dec('4223')
   automata_groups.cc_dumptruck=hex2dec('4224')
   automata_groups.cc_grader=hex2dec('4225')
   automata_groups.getaway_van=hex2dec('4226')
   automata_groups.crime_vehicle=hex2dec('4227')
   automata_groups.patrol_car=hex2dec('4228')
   automata_groups.carjacked_vehicle=hex2dec('4229')
   automata_groups.ice_cream_truck=hex2dec('422a')
   automata_groups.el_train_engine=hex2dec('422c')
   automata_groups.el_train=hex2dec('422d')
   automata_groups.monorail_engine=hex2dec('422e')
   automata_groups.monorail=hex2dec('422f')
   automata_groups.steam_train=hex2dec('4230')
   automata_groups.police_van=hex2dec('4231')
   automata_groups.cement_mixer=hex2dec('4232')
   automata_groups.standard_freight_engine=hex2dec('4233')

   automata_groups.helicopter=hex2dec('4300')
   automata_groups.police_helicopter=hex2dec('4301')
   automata_groups.military_helicopter=hex2dec('4307')
   automata_groups.fighter_plane=hex2dec('4312')
   automata_groups.medical_helicopter=hex2dec('4305')
   automata_groups.news_helicopter=hex2dec('4304')
   automata_groups.ufo=hex2dec('4308')
   automata_groups.sky_writer=hex2dec('4311')
   automata_groups.fire_plane=hex2dec('4303')
   automata_groups.crop_duster=hex2dec('4306')
   automata_groups.sky_diver=hex2dec('4313')
   automata_groups.ferry_boat=hex2dec('4400')
   automata_groups.speed_boat=hex2dec('4401')
   automata_groups.passengerferry_boat=hex2dec('4402')
   automata_groups.metal_whale=hex2dec('4415')
   automata_groups.yacht=hex2dec('4406')
   automata_groups.motor_boat=hex2dec('4408')
   automata_groups.off_shore=hex2dec('4409')
   automata_groups.fishing_boat=hex2dec('440c')
   automata_groups.tug_boat=hex2dec('4410')
   automata_groups.towable=hex2dec('4417')
   

sit_constants = {}

   -- determines icon or advisor head that shows up in message text
   sit_constants.SITUATION_IMAGE_DEFAULT            = 0
      
      -- advisor heads
   sit_constants.SITUATION_IMAGE_UTILITIES          = 21
   sit_constants.SITUATION_IMAGE_HEALTH_EDUCATION   = 22
   sit_constants.SITUATION_IMAGE_CITY_PLANNING      = 23
   sit_constants.SITUATION_IMAGE_TRANSPORTATION     = 24
   sit_constants.SITUATION_IMAGE_ENVIRONMENT        = 25
   sit_constants.SITUATION_IMAGE_FINANCES           = 26
   sit_constants.SITUATION_IMAGE_SAFETY             = 27
   sit_constants.SITUATION_IMAGE_DR_VU = 29
      -- static icons
   sit_constants.SITUATION_IMAGE_CARJACK            = hex2dec('4bc391c4')
   sit_constants.SITUATION_IMAGE_BANK_ROBBERY       = hex2dec('4bc391c5')
   sit_constants.SITUATION_IMAGE_POLICE_HELICOPTER  = hex2dec('4bc391c3')
   sit_constants.SITUATION_IMAGE_POLICE_ARREST      = hex2dec('4bc503d8')
   sit_constants.SITUATION_SUCCESSFUL_ROBBERY       = hex2dec('4bc6be1a')
   sit_constants.SITUATION_Reward_Advanced_Research_Center       = hex2dec('ec212d80')
   sit_constants.SITUATION_Reward_Area_Control_Tower      = hex2dec('ec212d81')
   sit_constants.SITUATION_Reward_Army_Base      = hex2dec('ec212d82')
   sit_constants.SITUATION_Reward_Bureau_Of_Bureaucracy      = hex2dec('ec212d83')
   sit_constants.SITUATION_Reward_Casino   = hex2dec('ec212d84')
   sit_constants.SITUATION_Reward_Cemetery   = hex2dec('ec212d85')
   sit_constants.SITUATION_Reward_Convention_Center   = hex2dec('ec212d86')
   sit_constants.SITUATION_Reward_Country_Club  = hex2dec('ec212d87')
   sit_constants.SITUATION_Reward_Courthouse  = hex2dec('ec212d88')
   sit_constants.SITUATION_Reward_Cruise_Ship_Pier  = hex2dec('ec212d89')
   sit_constants.SITUATION_Reward_Disease_Research_Center  = hex2dec('ec212d8a')
   sit_constants.SITUATION_Reward_Farmers_Market  = hex2dec('ec212d8b')
   sit_constants.SITUATION_Reward_Federal_Prison = hex2dec('ec212d8c')
   sit_constants.SITUATION_Reward_Grand_Railroad_Station = hex2dec('ec212d8d')
   sit_constants.SITUATION_Reward_House_Of_Worship = hex2dec('ec212d8e')
   sit_constants.SITUATION_Reward_Major_League_Stadium = hex2dec('ec212d8f')
   sit_constants.SITUATION_Reward_Missile_Base = hex2dec('ec212d90')
   sit_constants.SITUATION_Reward_Modern_Art_Museum = hex2dec('ec212d91')
   sit_constants.SITUATION_Reward_Movie_Studio = hex2dec('ec212d92')
   sit_constants.SITUATION_Reward_Opera_House = hex2dec('ec212d93')
   sit_constants.SITUATION_Reward_Private_School = hex2dec('ec212d94')
   sit_constants.SITUATION_Reward_Radio_Station = hex2dec('ec212d95')
   sit_constants.SITUATION_Reward_Shuttle_Launch_Pad = hex2dec('ec212d96')
   sit_constants.SITUATION_Reward_State_Fair = hex2dec('ec212d97')
   sit_constants.SITUATION_Reward_Stock_Exchange = hex2dec('ec212d98')
   sit_constants.SITUATION_Reward_Tourist_Trap = hex2dec('ec212d99')
   sit_constants.SITUATION_Reward_Toxic_Waste_Dump = hex2dec('ec212d9a')
   sit_constants.SITUATION_Reward_TV_Station = hex2dec('ec212d9b')
   sit_constants.SITUATION_Reward_University = hex2dec('ec212d9c')
   sit_constants.SITUATION_Reward_City_Hall_1 = hex2dec('ec212d9d')
   sit_constants.SITUATION_Reward_City_Hall_2 = hex2dec('ec212d9e')
   sit_constants.SITUATION_Reward_City_Hall_3 = hex2dec('ec212d9f')
   sit_constants.SITUATION_Reward_City_Zoo = hex2dec('ec212e01')
   sit_constants.SITUATION_Reward_Colossal_Mayors_Statue = hex2dec('ec212e02')
   sit_constants.SITUATION_Reward_Colossal_Mayors_Statue_Female = hex2dec('ec212e03')
   sit_constants.SITUATION_Reward_Impressive_Mayors_Statue = hex2dec('ec212e04')
   sit_constants.SITUATION_Reward_Impressive_Mayors_Statue_Female = hex2dec('ec212e05')
   sit_constants.SITUATION_Reward_Large_Elementary_School = hex2dec('ec212e06')
   sit_constants.SITUATION_Reward_Large_High_School = hex2dec('ec212e07')
   sit_constants.SITUATION_Reward_Large_Water_Pump = hex2dec('ec212e08')
   sit_constants.SITUATION_Reward_Lighthouse = hex2dec('ec212e09')
   sit_constants.SITUATION_Reward_Magnificent_Mayors_Statue = hex2dec('ec212e10')
   sit_constants.SITUATION_Reward_Magnificent_Mayors_Statue_Female = hex2dec('ec212e11')
   sit_constants.SITUATION_Reward_Main_Library = hex2dec('ec212e12')
   sit_constants.SITUATION_Reward_Deluxe_Fire_Station = hex2dec('ec212e13')
   sit_constants.SITUATION_Reward_Mayors_House = hex2dec('ec212e14')
   sit_constants.SITUATION_Reward_Mayors_Statue = hex2dec('ec212e15')
   sit_constants.SITUATION_Reward_Mayors_Statue_Female = hex2dec('ec212e16')
   sit_constants.SITUATION_Reward_Minor_League_Stadium = hex2dec('ec212e17')
   sit_constants.SITUATION_Reward_Private_School_1 = hex2dec('ec212e18')
   sit_constants.SITUATION_Reward_Private_School_2 = hex2dec('ec212e19')
   sit_constants.SITUATION_Reward_Private_School_3 = hex2dec('ec212e20')
   sit_constants.SITUATION_Reward_Resort_Hotel = hex2dec('ec212e21')
   sit_constants.SITUATION_Reward_Marina = hex2dec('ac280898')
   sit_constants.SITUATION_Reward_My_Sim = hex2dec('ac280899')
   sit_constants.SITUATION_Reward_Nuclear_Power_Plant = hex2dec('ac28089a')
   sit_constants.SITUATION_Reward_Hydrogen_Power_Plant = hex2dec('ac280897')
   sit_constants.SITUATION_Reward_Solar_Power_Plant = hex2dec('8c280b0b')
   sit_constants.SITUATION_Reward_My_Sim_Green = hex2dec('ac28080a')
   sit_constants.SITUATION_Reward_My_Sim_Red = hex2dec('ac28080b')
    
   -- return values for check_success()
   sit_constants.RESULT_SUCCESS        = 1
   sit_constants.RESULT_FAILURE        = 2
   sit_constants.RESULT_IN_PROGRESS    = 3
   sit_constants.RESULT_INACTIVE       = 4

   -- values for sc4game.aura.end_strike()
   sit_constants.END_STRIKE_ALL        = 0
   sit_constants.END_STRIKE_POLICE     = 1
   sit_constants.END_STRIKE_FIRE       = 2
   sit_constants.END_STRIKE_HEALTH     = 3
   sit_constants.END_STRIKE_EDUCATION  = 4
   
   -- Misc
   sit_constants.SUCCESS_DISTANCE_SHORT = 24
   sit_constants.SUCCESS_DISTANCE_BOAT = 32
   sit_constants.SUCCESS_DISTANCE_MEDIUM = 32
   sit_constants.SUCCESS_TIMEOUT_SHORT = 3
   sit_constants.SUCCESS_TIMEOUT_BOAT = 2
   sit_constants.SUCCESS_TIMEOUT_AIR = 2
   sit_constants.MIN_TARGET_DISTANCE_SHORT = 350
   sit_constants.MAX_TARGET_DISTANCE_SHORT = 0
   sit_constants.MIN_TARGET_DISTANCE_BOAT = 500
   sit_constants.MIN_TARGET_DISTANCE_LONG = 600
   sit_constants.EVADE_DISTANCE_SHORT = 24
   sit_constants.EVADE_TIMEOUT_SHORT = 2
   sit_constants.EVADE_DISTANCE_LONG = 48
   sit_constants.EVADE_TIMEOUT_VERY_SHORT = 2
   sit_constants.FREQUENCY_SHORT = 365
   sit_constants.FREQUENCY_FIRST = 1
   sit_constants.FREQUENCY_MYSIM_SHORT = 10
   sit_constants.TIME_LIMIT_SHORT = 450
   sit_constants.TIME_LIMIT_LONG = 600
   sit_constants.SUCCESS_EFFECTMAYRAT = "missionsuccess"
   sit_constants.SUCCESS_EFFECTMONEY = "missionmoney"
   sit_constants.SUCCESS_EFFECTMAYRAT_MONEY = "missionsuccessmoney"
   --sit_constants.FAILURE_EFFECTFAILURE = "missionfailure"
   sit_constants.FAILURE_EFFECT = "missionfailure"
   sit_constants.FAILURE_EFFECTMONEY = "missionfailuremoney"
   sit_constants.FAILURE_EFFECTDARKMONEY = "missiondarkmoney"
--easy missions
   sit_constants.GOOD_SUCCESS_AURA_RADIUS = 128
   sit_constants.GOOD_SUCCESS_AURA_MAG = 50
   sit_constants.GOOD_FAILURE_AURA_RADIUS = 64
   sit_constants.GOOD_FAILURE_AURA_MAG = -30  
   sit_constants.GOOD_SUCCESS_MONEY = 5000
   sit_constants.GOOD_FAILURE_MONEY = -2000


   sit_constants.EVIL_SUCCESS_AURA_RADIUS = 64
   sit_constants.EVIL_SUCCESS_AURA_MAG = -40
   sit_constants.EVIL_FAILURE_AURA_RADIUS = 32
   sit_constants.EVIL_FAILURE_AURA_MAG = -20
   sit_constants.EVIL_SUCCESS_MONEY = 10000
   sit_constants.EVIL_FAILURE_MONEY = -3000
   
--medium missions
   sit_constants.MED_GOOD_SUCCESS_AURA_RADIUS = 256
   sit_constants.MED_GOOD_SUCCESS_AURA_MAG = 80
   sit_constants.MED_GOOD_FAILURE_AURA_RADIUS = 128
   sit_constants.MED_GOOD_FAILURE_AURA_MAG = -40  
   sit_constants.MED_GOOD_SUCCESS_MONEY = 10000
   sit_constants.MED_GOOD_FAILURE_MONEY = -3000

   sit_constants.MED_EVIL_SUCCESS_AURA_RADIUS = 128
   sit_constants.MED_EVIL_SUCCESS_AURA_MAG = -60
   sit_constants.MED_EVIL_FAILURE_AURA_RADIUS = 64
   sit_constants.MED_EVIL_FAILURE_AURA_MAG = -30
   sit_constants.MED_EVIL_SUCCESS_MONEY = 20000
   sit_constants.MED_EVIL_FAILURE_MONEY = -6000

--hard missions
   sit_constants.HAR_GOOD_SUCCESS_AURA_RADIUS = 512
   sit_constants.HAR_GOOD_SUCCESS_AURA_MAG = 110
   sit_constants.HAR_GOOD_FAILURE_AURA_RADIUS = 256
   sit_constants.HAR_GOOD_FAILURE_AURA_MAG = -60  
   sit_constants.HAR_GOOD_SUCCESS_MONEY = 40000
   sit_constants.HAR_GOOD_FAILURE_MONEY = -5000

   sit_constants.HAR_EVIL_SUCCESS_AURA_RADIUS = 256
   sit_constants.HAR_EVIL_SUCCESS_AURA_MAG = -80
   sit_constants.HAR_EVIL_FAILURE_AURA_RADIUS = 128
   sit_constants.HAR_EVIL_FAILURE_AURA_MAG = -40
   sit_constants.HAR_EVIL_SUCCESS_MONEY = 70000
   sit_constants.HAR_EVIL_FAILURE_MONEY = -10000

-- conditions determining success/failure of a city situation
sit_conditions = {}
   sit_conditions.REACH_TARGET = 1           -- must get within distance of target
   sit_conditions.ESCAPE_CITY = 2            -- must escape city
   sit_conditions.TARGET_DESTROYED = 3       -- must destroy target
   sit_conditions.SCRIPTED = 4               -- everything determined by scripts
   sit_conditions.CELL_COVERAGE = 5          -- must drive/fly/sail over x # of cells

-- for CELL_COVERAGE & CELL_SERVICE missions, tells the engine how to build the coverage area
-- from the script parameters
sit_coverage_type = {}
   sit_coverage_type.ZONE     = 1            -- use the coverage_zone property
   sit_coverage_type.LOT      = 2            -- use the coverage_lot property
   sit_coverage_type.NETWORK  = 3            -- use the coverage_network property
   sit_coverage_type.RECT     = 4            -- use the coverage_rect property
   sit_coverage_type.UNZONED_LAND   = 5      -- only use coverage_cells_min and coverage_cells_max
   sit_coverage_type.UNZONED_WATER  = 6      -- only use coverage_cells_min and coverage_cells_max
   sit_coverage_type.CELLS    = 7            -- list of individual cells
   
-- behavior state id's for automata
automata_states = {}

   -- general
	automata_states.DEFAULT = 0
	automata_states.DISAPPEAR = 1
	automata_states.BEE_LINE = 2
	automata_states.CROWD = 3
	automata_states.QUEUE = 4
	automata_states.STRIKE = 6
	automata_states.IDLE = 7
	automata_states.RIOT_LEADER = 8
	automata_states.RIOT_FOLLOWER = 9
   automata_states.SCRIPTED = 10
   automata_states.RANDOM_WALK = 11
	automata_states.IGNITE_OCCUPANT = 12
   automata_states.PLOP_JUMP = 15
   automata_states.PLAYER_DRIVE = 16
   automata_states.BUMPED = 17
   automata_states.MAGNET = 18
   automata_states.ATTACH_ANIM = 19
   automata_states.COLLIDE = 20
   -- vehicles
   automata_states.PULL_OVER = 21
   automata_states.STOP_AT_STATION = 30
   -- aircraft
   automata_states.RETURN_HOME = 50
   automata_states.GO_TO_DESTINATION = 51
   automata_states.CHASE = 52                   -- can also apply to vehicles
   automata_states.LOITER = 53
   automata_states.LOOK_FOR_CRIME = 54
   automata_states.LOOK_FOR_TRAFFIC = 55
   automata_states.RESCUE = 56
   automata_states.PUT_OUT_FIRE = 57
   automata_states.CROP_DUST = 58
   -- watercraft
   automata_states.CRASH_RUNAGROUND = 70
   automata_states.CRASH_SINK = 71
   automata_states.IMMEDIATE_REMOVE = 72
   automata_states.SLOW_REMOVE = 73
   automata_states.FERRY_DOCK = 74
   automata_states.FERRY_QUEUE = 75
   automata_states.MARINA_PARKED = 76
   automata_states.BEING_TOWED = 77
   automata_states.UNDOCKING = 78

-- sound effect track Id's.
-- NOTE: These are currently mirrored in Automata\_sfx.lua.  Please keep the two
-- files in sync
--
automata_sfx = {
   Automata_Panic          = "0xa9f14c47",
   Automata_ArmyDrill      = "0xea55b3ca",	-- Begin Added 08/05/02 by Marc Farly
   Automata_BooLarge1      = "0xca55b40d",
   Automata_BooMedium      = "0xca55b6f2",
   Automata_BooSmall       = "0x8a55b719",
   Automata_CheerLarge1    = "0xca55b733",
   Automata_CheerMedium    = "0xaa55b748",
   Automata_CheerSmall     = "0xaa55b75a",
   Automata_RiotLarge      = "0x2a55b78a",
   Automata_RiotMedium     = "0xea55b7ac",
   Automata_RiotSmall      = "0x0a55b7cc",
   Automata_StrikeLarge    = "0x8a55b7de",
   Automata_StrikeMedium   = "0xaa55b75a",
   Automata_StrikeSmall    = "0xaa55b80b",
   Automata_ThemeparkWalla = "0x6a55b892",	-- "Walla" is nonspecific crowd dialog, as heard during a party
   Automata_WallaLarge     = "0xea55b81f",
   Automata_WallaMedium    = "0x0a44b832",
   Automata_WallaSmall     = "0xea55b845",
   Automata_ZooWalla       = "0xaa55b8b6",	-- End Added 08/05/02 by Marc Farly
   Animal_Chimp		= "0xca777589",
   Prison_Siren		= "0xea777468",
   Automata_KidsPlay	= "0x6a55b28a",		-- Can be used for children arriving to and leaving school
   Automata_Park_Crowd	= "0xeaa70cd3",	-- Use for park crowds. Added 10/03/02 by Marc Farly
}

-- automata constants & functions

automata = {}
   
   -- for specifying models to automata functions
   automata.MODEL_TYPE_ID = '5ad0e817'
   automata.MODEL_GROUP_ID = 'badb57f1'
   automata.SPRITE_TYPE_ID = '29a5d1ec'
   automata.SPRITE_GROUP_ID = '49a593e7'


--- header sentry
end