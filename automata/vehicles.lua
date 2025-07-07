--
-- vehicles.lua
--
-- Defines common vehicle automata groups
--
-- Automata "group_id" is an occupant group GUID.  They are defined in ingred.ini "occupant groups" section and in cISC4Automata.h
--
--
-- The "class_id" field for an automata group is only necessary if that automata group requires a new C++ class.
-- Most groups will default to the parent type and create a default cSC4Vehicle.  Compare "moving_van" to "fire_engine", for example.
--

--------------------------------------
-- prevent this file from being included multiple times
if not rawget(globals(), "_vehicles_lua") then
_vehicles_lua = 1


dofile("_templates.lua")
dofile("_constants.lua")

kOffRoadSlow = 0.3
kOffRoadMedium = 0.4
kOffRoadFast = 1

kSpeedExotic = 120
kSpeedSporty = 105
kSpeedNormal = 80
kSpeedTruck = 70
kSpeedBus = 65
------------

automata_group.vehicle = TTT
{
	group_id = "0x4002",
	class_id = "0x896e714a",
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator

   key_effects = {
     { cmd = drive_command.SPECIAL, fx = "honkhorn", hold = true },
   },
   
   playerdrive = TTT
   {
      MinZoom = 4,      -- range 1-6   
      StartingZoom = 6,      
      MaxSpeed = kVelocity1KPH * kSpeedNormal,
      MinSpeed = kVelocity1KPH * -20,
      AccelPerSecond = kVelocity1KPH * 0.2,
      DecelPerSecond = kVelocity1KPH * 0.5,
      DecaySpeedPerSec = kVelocity1KPH * 50.0,
      OffRoadSpeedModifier = kOffRoadMedium,
      MaxTurnAngle = kPI / 8,
      OffRoadTurnAngleRange = { kPI / 3, kPI / 6 },
      TurnPerSec = kPI*1.25,
      RestoreTurnPerSec = kPI * 2,
      TurnAngleThreshhold = kPI / 12,
      GripPercentage = 0.9,
      GuardrailDotTolerance = 0.2,
      GuardrailDistance = 2.0,
      GuardrailPercentage = 0.9,
      RelativeDensity = 1.0,
      MaxTapDuration = 250, --milliseconds, anything less than this is considered a tap
      HitPoints = 150,
      TankTurnInPlace = .00025, --tank turn in place factor
   },
}

automata_group.bus =TTT
{
	_parent = automata_group.vehicle,
	group_id = "0x4200",
   class_id = "0xaa9f4a3d",      -- cSC4Bus
   source_building = "0x1301",      -- kOccupantGroupBuildingBus
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
         	
   playerdrive = TTT  {
   	_parent = automata_group.vehicle.playerdrive, 
      MaxSpeed = kVelocity1KPH * kSpeedBus,
	   AccelPerSecond = kVelocity1KPH * 0.02,
      DecelPerSecond = kVelocity1KPH * 0.5,
      OffRoadSpeedModifier = kOffRoadSlow,
      HitPoints = 350,
      RelativeDensity = 2.0,
	},   
}

automata_group.fire_engine =TTT
{
	_parent = automata_group.vehicle,
   group_id = "0x4202",
	class_id = "0xaa222b83",
   source_building = "0x1502",      -- kOccupantGroupBuildingFire
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
         	playerdrive = TTT  {
   	_parent = automata_group.vehicle.playerdrive, 
        MaxSpeed = kVelocity1KPH * kSpeedSporty,
	AccelPerSecond = kVelocity1KPH * 0.02,
      OffRoadSpeedModifier = kOffRoadMedium,
      HitPoints = 400,
      RelativeDensity = 2.0,
	},
}

automata_group.garbage_truck = TTT
{
	_parent = automata_group.vehicle,
	group_id = "0x4205",
   source_building = "0x1406",       -- kOccupantGroupBuildingLandfillZone
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
   	playerdrive = TTT  {
   	_parent = automata_group.vehicle.playerdrive, 
	AccelPerSecond = kVelocity1KPH * 0.02,
      DecelPerSecond = kVelocity1KPH * 0.5,
      OffRoadSpeedModifier = kOffRoadSlow,
      HitPoints = 350,
	},   
}

automata_group.police_vehicle =TTT
{
   _parent = automata_group.vehicle,
	group_id = "0x4207",
	class_id = "0x4a222b98",
   csi_image = "0x4bb1305f",         -- bitmap used for city mission indicator
   source_building = "0x1942",       -- kOccupantGroupBuildingPoliceCarMaker
   playerdrive = TTT{
      _parent = automata_group.vehicle.playerdrive,
      MaxSpeed = kVelocity1KPH * kSpeedSporty,
	AccelPerSecond = kVelocity1KPH * 0.03,
      DecelPerSecond = kVelocity1KPH * 0.5,
      OffRoadSpeedModifier = kOffRoadMedium,
      HitPoints = 300,
   },
}

automata_group.patrol_car = TTT
{
   _parent = automata_group.police_vehicle,
   group_id = "0x4228",
   csi_image = "0x4bb1305f",  
   source_building = "0x1942",       -- kOccupantGroupBuildingPoliceCarMaker
   playerdrive = TTT  {
      _parent = automata_group.vehicle.playerdrive, 
      MaxSpeed = kVelocity1KPH * kSpeedSporty,
      AccelPerSecond = kVelocity1KPH * 0.03,
      DecelPerSecond = kVelocity1KPH * 0.5,
      OffRoadSpeedModifier = kOffRoadMedium,
      HitPoints = 300,
	},
}

automata_group.police_van = TTT
{
   _parent = automata_group.police_vehicle,
   group_id = "0x4231",
   csi_image = "0x4bb1305f",  
   source_building = "0x150D",       -- kOccupantGroupBuildingPoliceBig
   playerdrive = TTT  {
      _parent = automata_group.vehicle.playerdrive, 
      MaxSpeed = kVelocity1KPH * kSpeedSporty,
      AccelPerSecond = kVelocity1KPH * 0.03,
      DecelPerSecond = kVelocity1KPH * 0.5,
      OffRoadSpeedModifier = kOffRoadMedium,
      HitPoints = 350,
	},
}

automata_group.taxi =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x420C",
   source_building = "0x1508",       -- kOccupantGroupBuildingAirport
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
   playerdrive = TTT  {
      _parent = automata_group.vehicle.playerdrive, 
      AccelPerSecond = kVelocity1KPH * 0.03,
      DecelPerSecond = kVelocity1KPH * 0.5,
      OffRoadSpeedModifier = kOffRoadMedium,
      HitPoints = 250,
	},
}

automata_group.school_bus =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x420F",
   source_building = "0x1503", 
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
   playerdrive = TTT  {
     	_parent = automata_group.vehicle.playerdrive, 
      MaxSpeed = kVelocity1KPH * kSpeedBus,
      AccelPerSecond = kVelocity1KPH * 0.02,
      DecelPerSecond = kVelocity1KPH * 0.5,
      OffRoadSpeedModifier = kOffRoadSlow,
      HitPoints = 350,
      RelativeDensity = 2.0,
   }
}

automata_group.mayor_limo =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x422b",
   class_id = "0x4c0dd224",  -- cSC4MayorLimo
   source_building = "0x1938",      -- kOccupantGroupBuildingMayorHouse      
  csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator   
   playerdrive = TTT  {
      _parent = automata_group.vehicle.playerdrive, 
      MaxSpeed = kVelocity1KPH * kSpeedNormal,
      AccelPerSecond = kVelocity1KPH * 0.03,
      DecelPerSecond = kVelocity1KPH * 0.5,
      OffRoadSpeedModifier = kOffRoadMedium,
      HitPoints = 300,
      RelativeDensity = 2.0,
	}, 

   -- note this just starts/stops the effect, but additional work is done in the cSC4MayorLimo class
   key_effects = {
     { cmd = drive_command.SPECIAL, fx = "money_shower", hold = true },
   },
}

automata_group.ambulance =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x4211",
   source_building = "0x1904",      -- kOccupantGroupBuildingAmbulanceMaker
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
   class_id = "0x6c1acde1",         -- cSC4EmergencyVehicle
   playerdrive = TTT  {
      _parent = automata_group.vehicle.playerdrive, 
      MaxSpeed = kVelocity1KPH * kSpeedSporty,
      AccelPerSecond = kVelocity1KPH * 0.03,
      DecelPerSecond = kVelocity1KPH * 0.5,
      OffRoadSpeedModifier = kOffRoadMedium,
      HitPoints = 300,
	},
}
automata_group.toxic_carrier =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x4212",
   source_building = "0x1405",      -- kOccupantGroupBuildingToxicDump
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
   playerdrive = TTT  {
   	_parent = automata_group.vehicle.playerdrive, 
      MaxSpeed = kVelocity1KPH * kSpeedTruck,
      AccelPerSecond = kVelocity1KPH * 0.02,
      DecelPerSecond = kVelocity1KPH * 0.5,
      OffRoadSpeedModifier = kOffRoadSlow,
      HitPoints = 350,
	},   

   key_effects = {
     { cmd = drive_command.SPECIAL, fx = "toxicwaste", hold = true },
   },	
   
   }
automata_group.hearse =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x4213",
   source_building = "0x1700",      -- kOccupantGroupBuildingCemetary
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
      playerdrive = TTT  {
   	_parent = automata_group.vehicle.playerdrive, 
      MaxSpeed = kVelocity1KPH * kSpeedNormal,
      AccelPerSecond = kVelocity1KPH * 0.03,
      DecelPerSecond = kVelocity1KPH * 0.5,
      OffRoadSpeedModifier = kOffRoadMedium,
      HitPoints = 250,
	},   
   controllers = {
      "mourner_attract",
   },
}

automata_group.train = TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x4005",
   csi_image = "0",
   
   playerdrive = TTT
   {
      _parent = automata_group.vehicle.playerdrive,
      MinZoom = 3,      -- range 1-6
      StartingZoom = 4,
      TrainDerailmentThrottleDuration = 5000,
      TrainFullThrottlePitchMax = 10,
      MaxSpeed = kVelocity1KPH * kSpeedSporty,
	AccelPerSecond = kVelocity1KPH * 0.02,
      DecelPerSecond = kVelocity1KPH * 0.5,
      HitPoints = 7000,
      RelativeDensity = 10.0,
   },
}



automata_group.freight_train = TTT
{
   _parent = automata_group.train,
   group_id = "0x4203",
   class_id = "0x4a416254",      -- cSC4TrainCar
   source_building = "0x1306",      -- Freightrail
   csi_image = "0",
}


automata_group.commute_train = TTT
{
   _parent = automata_group.train,
   group_id = "0x4201",
   class_id = "0x4a416254",      -- cSC4TrainCar
   source_building = "0x1305",      -- Passengerrail
   csi_image = "0",
}

automata_group.subway = TTT
{
   _parent = automata_group.train,
   group_id = "0x4208",
   class_id = "0x4a416254",      -- cSC4TrainCar
   csi_image = "0",
}

automata_group.freight_train_engine = TTT
{
   _parent = automata_group.train,
   group_id = "0x4216",
   class_id = "0x8a41625a",                -- cSC4Train
   source_building = "0x1306",      -- Freightrail
   csi_image = "0x0c0305c6",
}

automata_group.steam_train = TTT
{
   _parent = automata_group.freight_train_engine,
   group_id = "0x4230",
   source_building = "0x1306",      -- Freightrail
   csi_image = "0x0c0305c6",
      key_effects = {
      { cmd = drive_command.SPECIAL, fx = "SteamTrainSmoke", hold = true },
   },   
}

-- freight engine that's not a steam train
automata_group.standard_freight_engine = TTT
{
   _parent = automata_group.freight_train_engine,
   group_id = "0x4233",
   source_building = "0x1306",      -- Freight Rail bldg
   csi_image = "0x0c0305c6",
}

automata_group.commute_train_engine =TTT
{
   _parent = automata_group.train,
   group_id = "0x4215",
   class_id = "0x8a41625a",                -- cSC4Train
   source_building = "0x1305",      -- Passengerrail
   csi_image = "0x0c0305c6",
}

automata_group.subway_engine =TTT
{
   _parent = automata_group.train,
   group_id = "0x4217",
   class_id = "0x8a41625a",                -- cSC4Train
   csi_image = "0",
}
automata_group.el_train_engine =TTT
{
   _parent = automata_group.train,
   group_id = "0x422c",
   class_id = "0x4c22ae53",                -- cSC4MassTransitTrain
   csi_image = "0x0c0305c6",
}
automata_group.el_train = TTT
{
   _parent = automata_group.train,
   group_id = "0x422d",
   class_id = "0x4a416254",      -- cSC4TrainCar
   csi_image = "0",
}
automata_group.tv_reporter =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x4218",
   source_building = "0x1910",      -- kOccupantGroupTVstation
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
         	playerdrive = TTT  {
   	_parent = automata_group.vehicle.playerdrive, 
        MaxSpeed = kVelocity1KPH * kSpeedNormal,
	AccelPerSecond = kVelocity1KPH * 0.02,
      DecelPerSecond = kVelocity1KPH * 0.5,
      HitPoints = 250,
	},
   

   -- this is just an empty key_effects entry to override the one in automata_group.vehicle,
   -- so that holding the space bar won't cause sims to run away
   key_effects = {
   },
}

automata_group.freight_train_caboose = TTT
{
   _parent = automata_group.train,
   group_id = "0x421A",
   class_id = "0x4a416254",                -- cSC4TrainCar
}

automata_group.subway_tunneler =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x421D",
   class_id = "0x4a416254",      -- cSC4TrainCar
}

-- single vehicle that runs along train tracks, generated by train stations
automata_group.train_track_checker = TTT
{
   _parent = automata_group.train,
   group_id = "0x4235",
   class_id = "0x8a41625a",
}

automata_group.armytruck =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x421E",
   source_building = "0x1914",      -- kOccupantGroupBuildingArmyBase
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
}
automata_group.armymissiletruck =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x421F",
   source_building = "0x1915",      -- kOccupantGroupBuildingArmyMissileRange
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
   	playerdrive = TTT  {
   	_parent = automata_group.vehicle.playerdrive, 
        MaxSpeed = kVelocity1KPH * kSpeedTruck,
	AccelPerSecond = kVelocity1KPH * 0.02,
      DecelPerSecond = kVelocity1KPH * 0.5,
      OffRoadSpeedModifier = kOffRoadMedium,
      HitPoints = 350,
      RelativeDensity = 2.0,
	},   
}
automata_group.armytank =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x4220",
   class_id = "0xebe0dcad",      -- cSC4Tank
   source_building = "0x1914",      -- kOccupantGroupBuildingArmyBase
   csi_image = "0x0c0305c5",
   	playerdrive = TTT  {
   	_parent = automata_group.vehicle.playerdrive, 
        MaxSpeed = kVelocity1KPH * kSpeedBus,
	AccelPerSecond = kVelocity1KPH * 0.02,
      DecelPerSecond = kVelocity1KPH * 0.5,
      OffRoadSpeedModifier = kOffRoadFast,
      HitPoints = 1500,
      RelativeDensity = 10.0,

	},   
   
}

automata_group.crime_vehicle =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x4227",
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
}

automata_group.getaway_van =TTT
{
   _parent = automata_group.crime_vehicle,
   group_id="0x4226",
   class_id="0xea863423",        -- cSC4GetawayVan
   source_building = "0x1001",   -- any commercial building
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
}

automata_group.carjacked_vehicle = TTT
{
   _parent = automata_group.crime_vehicle,
   group_id = "0x4229",
   class_id = "0xcbb32b0a",      -- cSC4CarjackedVehicle
   source_building = "0x1000",   -- any residential building
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
}

--~ automata_group.armytruckleader =
--~ {
   --~ _parent = automata_group.vehicle,
   --~ group_id = "0x4221",
    --~ controllers = {
		--~ "armytruck_attract",
		--~ },
--~ }

automata_group.semi_truck = TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x4222",
   class_id = "0x4a5b69ed",      -- cSC4TrailerVehicle
   trailers = { "semi_trailer" },
}

automata_group.semi_trailer = TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x4223",
}

automata_group.CC_Dumptruck =   TTT    -- network construction crew
{
   _parent = automata_group.vehicle,
   group_id = "0x4224",
}

automata_group.CC_Grader =         TTT -- network construction crew
{
   _parent = automata_group.vehicle,
   group_id = "0x4225",
}

automata_group.IceCreamTruck =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x422a", 
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
   source_building = "0x1000",   -- any residential building
     key_effects = {
     { cmd = drive_command.SPECIAL, fx = "icecream", hold = false },
   },	
}

automata_group.monorail_engine = TTT
{
   _parent = automata_group.train,
   group_id = "0x422e",
   class_id = "0x4c22ae53",                -- cSC4MassTransitTrain
   source_building = "0x1307",       -- monorail
   csi_image = "0x0c0305c6",
}

automata_group.monorail = TTT
{
   _parent = automata_group.train,
   group_id = "0x422f",
   class_id = "0x4a416254",      -- cSC4TrainCar
}


automata_group.freight_truck = TTT
{
	_parent = automata_group.vehicle,
	group_id = "0x4204",
}


automata_group.moving_van = TTT
{
	_parent = automata_group.vehicle,
	group_id = "0x4206",
}


automata_group.my_sim_vehicle =TTT
{
   group_id = "0x4009",
   class_id = "0x896e714a",      -- cSC4Vehicle
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
}
automata_group.soccer_moms =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x420A",
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
}
automata_group.civilian_cars =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x420B",
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
}


automata_group.rich_cars =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x420D",
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
}
automata_group.cheap_cars =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x420E",
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
   source_building = "0x1001",   -- any commercial building
}


automata_group.limo =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x4210",
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
}


automata_group.recycle_truck =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x4214",
   source_building = "0x1404",      -- kOccupantGroupBuildingRecycle
}


automata_group.farm_vehicles =TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x4219",
   csi_image = "0x4bb1305d",         -- bitmap used for city mission indicator
}


automata_group.u_haul_leader = TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x421B",
   class_id = "0x4a5b69ed",         -- cSC4TrailerVehicle
   trailers = { "u_haul_trailer" },
}

automata_group.u_haul_trailer = TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x421C",
}

automata_group.cement_mixer = TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x4232",
}

automata_group.expensive_sports_car = TTT
{
   _parent = automata_group.vehicle,
   group_id = "0x4234",
   playerdrive = TTT  {
      _parent = automata_group.vehicle.playerdrive,
      MaxSpeed = kVelocity1KPH * kSpeedExotic,
      RelativeDensity = 0.9,
   }
}

-- keep this as the last line and uncomment it to check your work
--verify_all_templates()

-- end include check
end
