--
-- watercraft.lua
--
-- Defines common watercraft automata groups
--
-- Automata "group_id" is an occupant group GUID.  They are defined in ingred.ini "occupant groups" section and in cISC4Automata.h
--
-- The "class_id" field for an automata group is only necessary if that automata group requires a new C++ class.
-- Most groups will default to the parent type and create a default cSC4Watercraft.
--


dofile("_templates.lua")
dofile("_constants.lua")
------------

automata_group.watercraft = 
{
	group_id = "0x4004",
	class_id = "0x096e75f5",
	csi_image = "0x0c0305c3", 
	
	anims = {
	},
	
  WatercraftDriveParams = TTT
   {
	   --Motion constants
      DecelPerSecond         = 0.007,
      TurnsPerSecond         = 0.001,
      RestoreTurnsPerSecond  = 6.0, --How fast the boat rights itself
      DecaySpeedPerSecond   = 0.05, --How much the boats slows down on its own
      BaseForwardTurnRadius  = 50.0, --Initial turn radius going forward
      BaseBackwardTurnRadius = 50.0, --Initial turn radius going backwards
      SpeedModifier                  = 0.2,
      SwitchTurnDirectionsModifier   = 5.0,
      MaxTurn                        = 2.0, --MinTurn is -MaxTurn
      MaxSpeedChangePerMillisecond   = 0.01,

	      --Crash sequence constants
      CrashSequenceMillisecondMax             = 8000.0, --How long the crashing sequences will take
      CrashPitchTotal                         = (kPI / 4.0),  --How much at most the boat will pitch during a crash
      CrashClimableTerrainAngleThreshold      = (60.0 * kAngle1Degree), --90 - this number is the largest angle of terrain climable
      CrashRunAgroundSpeedReductionModifier   = 0.95, --Each tick the speed is reduced by this value when running aground
      CrashRunAgroundRollTotal                = (125.0 * kAngle1Degree), --How far at most the boat will roll when running aground
      CrashMaxAltitudeIncrease                = 10.0, --How high the boat will be allowed to climb each tick during running aground
      CrashSpeedAnimateCollisionThreshold     = 0.50, --The speed percentage neccesary for crashes to occur
      CrashSpeedInanimateCollisionThreshold   = 0.25,
      CrashAnimateCollisionSpeedScalingFactor = 0.75,

	      --Player drive reponse constants
      MinAcceleration                = -2000.0, --milliseconds
      MaxAcceleration                = 3000.0, --milliseconds
      ReverseInertialTime            = 150.0, --milliseconds
      ForwardInertialTime            = 0.0, --milliseconds

	      --AI constants
      AIMaxSpeedChangePerMillisecond = 0.001,
      AIMaxTurnChangePerMillisecond  = 0.001,
      AICrashSpeedAnimateCollisionThreshold   = 0.10,
      AICrashSpeedInanimateCollisionThreshold   = 0.5,

		--Motion indicator constants
      ForwardMotionPitchMaxAngle = 18.0 * kAngle1Degree, --ForwardMotionPitchModifier is ForwardMotionPitchMaxAngle / MaxSpeed
      SideMotionPitchMaxAngle    = 15.0 * kAngle1Degree,   --SideMotionPitchModifier is SideMotionPitchMaxAngle / MaxTurn
      TurnInPlacePerSec          = 2.0,
      MaxMillisecondDelta        = 100.0,

	      --Ferry constants
      FerryQueueDistance         = 150.0,  -- The distance at which the ferry requests docking permissions, and if not granted will wait if possible.
      FerryDockDistance          = 60.0,    -- The distance at which the ferry will begin its docking sequence (should not be less than 50).
      FerryMaxDockingOrientationChangePerMillisecond = .1,
      FerryMaxDockingPositionChangePerMillisecond    = .01,
   },
 	
	
   
   playerdrive = TTT
   {
      MinZoom = 4,      -- range 1-6
      StartingZoom = 5,
      --MaxSpeed = kVelocity1KPH * 75,
      AccelPerSecond = kVelocity1KPH * 0.5,
      DecelPerSecond = kVelocity1KPH * 0.5,
      OffRoadSpeedModifier = 0.7,
      MaxTurnAngle = kPI / 2,
      OffRoadTurnAngleRange = { kPI / 10, kPI / 6 },
      TurnPerSec = kPI / 2,
      RestoreTurnPerSec = kPI,
      TurnAngleThreshhold = kPI / 12,
      GripPercentage = 0.9,
      GuardrailDotTolerance = 0.2,
      GuardrailDistance = 2.0,
      GuardrailPercentage = 0.9,
      RelativeDensity = 1.0,
   },
}

automata_group.watercraftsmall = 
{
	group_id = "0x4412",
	class_id = "0x096e75f5",
   csi_image = "0x0c0305c3", 
	
	anims = {
	},
     
  WatercraftDriveParams = TTT
   {
      _parent = automata_group.watercraft.WatercraftDriveParams, 
      AccelPerSecond         = 0.1,
      DecelPerSecond         = 0.007,
      TurnsPerSecond         = 0.01,
      BaseForwardTurnRadius  = 15.0, --Initial turn radius going forward
      BaseBackwardTurnRadius = 30.0, --Initial turn radius going backwards

      ForwardMotionPitchMaxAngle = 5.0 * kAngle1Degree,
      SideMotionPitchMaxAngle    = 20.0 * kAngle1Degree,
      MaxSpeed                       = 0.14,
      MinSpeed                       = -0.1,
   },
 	  

   playerdrive = TTT
   {
      _parent = automata_group.watercraft.playerdrive, 
      MaxSpeed = 0.14, --Must be the same as in WatercraftDriveParams so the speedometer will work
      AccelPerSecond = kVelocity1KPH * 0.5,
      DecelPerSecond = kVelocity1KPH * 0.5,
      OffRoadSpeedModifier = 0.7,
      MaxTurnAngle = kPI / 2,
      OffRoadTurnAngleRange = { kPI / 10, kPI / 6 },
      TurnPerSec = kPI / 2,
      RestoreTurnPerSec = kPI,
      TurnAngleThreshhold = kPI / 12,
      GripPercentage = 0.9,
      GuardrailDotTolerance = 0.2,
      GuardrailDistance = 2.0,
      GuardrailPercentage = 0.9,
      CollisionDecelerate = kVelocity1KPH * 0.07,
   },
}

automata_group.watercraftmedium= 
{
	group_id = "0x4413",
	class_id = "0x096e75f5",
   csi_image = "0x0c0305c3", 
	
	anims = {
	},
   
   
  WatercraftDriveParams = TTT
   {
      _parent = automata_group.watercraft.WatercraftDriveParams, 
      AccelPerSecond         = 0.1,
      DecelPerSecond         = 0.003,
      TurnsPerSecond         = 0.001,
      BaseForwardTurnRadius  = 20.0, --Initial turn radius going forward
      BaseBackwardTurnRadius = 40.0, --Initial turn radius going backwards

      ForwardMotionPitchMaxAngle = 1.0 * kAngle1Degree,
      SideMotionPitchMaxAngle    = 3.0 * kAngle1Degree,
      MaxSpeed                       = 0.10,
      MinSpeed                       = -0.05,
   },
 	  
   
   
   
   
   playerdrive = TTT
   {
      _parent = automata_group.watercraft.playerdrive, 
      MaxSpeed = 0.10, --Must be the same as in WatercraftDriveParams so the speedometer will work
      AccelPerSecond = kVelocity1KPH * 0.5,
      DecelPerSecond = kVelocity1KPH * 0.5,
      OffRoadSpeedModifier = 0.7,
      MaxTurnAngle = kPI / 2,
      OffRoadTurnAngleRange = { kPI / 10, kPI / 6 },
      TurnPerSec = kPI / 2,
      RestoreTurnPerSec = kPI,
      TurnAngleThreshhold = kPI / 12,
      GripPercentage = 0.9,
      GuardrailDotTolerance = 0.2,
      GuardrailDistance = 2.0,
      GuardrailPercentage = 0.9,
      CollisionDecelerate = kVelocity1KPH * 0.07,
   },
}

automata_group.watercraftlarge = 
{
	group_id = "0x4414",
	class_id = "0x096e75f5",
   csi_image = "0x0c0305c3", 
	
	anims = {
	},
   
   
  WatercraftDriveParams = TTT
   {
      _parent = automata_group.watercraft.WatercraftDriveParams,
      AccelPerSecond         = 0.1,
      DecelPerSecond         = 0.001,
      TurnsPerSecond         = 0.0001,
      BaseForwardTurnRadius  = 50.0, --Initial turn radius going forward
      BaseBackwardTurnRadius = 50.0, --Initial turn radius going backwards

      ForwardMotionPitchMaxAngle = 1.0 * kAngle1Degree,
      SideMotionPitchMaxAngle    = 1.0 * kAngle1Degree,
      MaxSpeed                       = 0.05,
      MinSpeed                       = -0.03,
   },
 	  
   
   
   playerdrive = TTT
   {
      _parent = automata_group.watercraft.playerdrive, 
      MaxSpeed = 0.05, --Must be the same as in WatercraftDriveParams so the speedometer will work
      AccelPerSecond = kVelocity1KPH * 0.5,
      DecelPerSecond = kVelocity1KPH * 0.5,
      OffRoadSpeedModifier = 0.7,
      MaxTurnAngle = kPI / 2,
      OffRoadTurnAngleRange = { kPI / 10, kPI / 6 },
      TurnPerSec = kPI / 2,
      RestoreTurnPerSec = kPI,
      TurnAngleThreshhold = kPI / 12,
      GripPercentage = 0.9,
      GuardrailDotTolerance = 0.2,
      GuardrailDistance = 2.0,
      GuardrailPercentage = 0.9,
      CollisionDecelerate = kVelocity1KPH * 0.07,
   },
}

automata_group.watercraft_marina = 
{
	group_id = "0x4416",
        source_building = "0x1941",      -- Marina
}

automata_group.watercraft_towable = 
{
	group_id = "0x4417",
}

automata_group.watercraft_OpenWater = 
{
	group_id = "0x4418",
        source_building = "0x1941",      -- Marina
}




automata_group.ferry_boat = 
{
	_parent = automata_group.watercraftmedium,
	group_id = "0x4400",
   source_building = "0x1308",      -- Ferry terminal
}

automata_group.speed_boat = 
{
	_parent = automata_group.watercraftsmall,
	group_id = "0x4401",
   source_building = "0x1941",      -- Marina
}

automata_group.passengerferry_boat = 
{
	_parent = automata_group.watercraftmedium,
	group_id = "0x4402",
   source_building = "0x1309",      -- Passenger Ferry terminal
}

automata_group.metalwhale = 
{
	_parent = automata_group.watercraftmedium,
	group_id = "0x4415",
   source_building = "0x1939",   --area 5.1
   
    WatercraftDriveParams = TTT
   {
      _parent = automata_group.watercraft.WatercraftDriveParams, 
      AccelPerSecond         = 0.1,
      DecelPerSecond         = 0.003,
      TurnsPerSecond         = 0.001,
      BaseForwardTurnRadius  = 15.0, --Initial turn radius going forward
      BaseBackwardTurnRadius = 30.0, --Initial turn radius going backwards

      ForwardMotionPitchMaxAngle = 1.0 * kAngle1Degree,
      SideMotionPitchMaxAngle    = 3.0 * kAngle1Degree,
      MaxSpeed                       = 0.14,
      MinSpeed                       = -0.05,
   },
 	  
   
   
   
   
   playerdrive = TTT
   {
      _parent = automata_group.watercraft.playerdrive, 
      MaxSpeed = 0.14, --Must be the same as in WatercraftDriveParams so the speedometer will work
      AccelPerSecond = kVelocity1KPH * 0.5,
      DecelPerSecond = kVelocity1KPH * 0.5,
      OffRoadSpeedModifier = 0.7,
      MaxTurnAngle = kPI / 2,
      OffRoadTurnAngleRange = { kPI / 10, kPI / 6 },
      TurnPerSec = kPI / 2,
      RestoreTurnPerSec = kPI,
      TurnAngleThreshhold = kPI / 12,
      GripPercentage = 0.9,
      GuardrailDotTolerance = 0.2,
      GuardrailDistance = 2.0,
      GuardrailPercentage = 0.9,
      CollisionDecelerate = kVelocity1KPH * 0.07,
   },
   
   
         key_effects = {
     { cmd = drive_command.ALTERNATE,  fx = "whalewater", hold = true },
   },	
	
}
automata_group.yacht = 
{
	_parent = automata_group.watercraftmedium,
	group_id = "0x4406",
   source_building = "0x1941",      -- Marina
   
        WatercraftDriveParams = TTT
   {
      _parent = automata_group.watercraft.WatercraftDriveParams, 
      BaseForwardTurnRadius  = 20.0,
      MaxSpeed                       = 0.14,
      ForwardMotionPitchMaxAngle = 1.0 * kAngle1Degree,

   },
   
      playerdrive = TTT
   {
      _parent = automata_group.watercraft.playerdrive, 
      MaxSpeed = 0.14, --Must be the same as in WatercraftDriveParams so the 
   },
   
}

automata_group.sailcat = 
{
	_parent = automata_group.watercraftsmall,
	group_id = "0x4407",
   
        WatercraftDriveParams = TTT
   {
      _parent = automata_group.watercraft.WatercraftDriveParams, 

      MaxSpeed                       = 0.01,
      ForwardMotionPitchMaxAngle = 1.0 * kAngle1Degree,

   },
 	 
         playerdrive = TTT
   {
      _parent = automata_group.watercraft.playerdrive, 
      MaxSpeed = 0.01, --Must be the same as in WatercraftDriveParams so the 
   },     
}

automata_group.motorboat = 
{
	_parent = automata_group.watercraftsmall,
	group_id = "0x4408",
   source_building = "0x1941",      -- Marina
}

automata_group.offshore = 
{
	_parent = automata_group.watercraftsmall,
	group_id = "0x4409",
   source_building = "0x1941",      -- Marina
}

   


automata_group.cargo = 
{
	_parent = automata_group.watercraftlarge,
	group_id = "0x440a",
   
}


automata_group.fishingboat = 
{
	_parent = automata_group.watercraftmedium,
	group_id = "0x440c",
   source_building = "0x1941",      -- Marina
   key_effects = {
     { cmd = drive_command.ALTERNATE, fx = "fishing", hold = false, },
}

}

automata_group.luxsailboat = 
{
	_parent = automata_group.watercraftsmall,
	group_id = "0x440d",
   
        WatercraftDriveParams = TTT
   {
      _parent = automata_group.watercraft.WatercraftDriveParams, 

      MaxSpeed                       = 0.01,
      ForwardMotionPitchMaxAngle = 1.0 * kAngle1Degree,

   },
   
            playerdrive = TTT
   {
      _parent = automata_group.watercraft.playerdrive, 
      MaxSpeed = 0.01, --Must be the same as in WatercraftDriveParams so the 
   },   
   
}

automata_group.sailboat = 
{
	_parent = automata_group.watercraftsmall,
	group_id = "0x440e",
   
        WatercraftDriveParams = TTT
   {
      _parent = automata_group.watercraft.WatercraftDriveParams, 

      MaxSpeed                       = 0.01,
      ForwardMotionPitchMaxAngle = 1.0 * kAngle1Degree,

   },
   
         playerdrive = TTT
   {
      _parent = automata_group.watercraft.playerdrive, 
      MaxSpeed = 0.01, --Must be the same as in WatercraftDriveParams so the 
   },   
   
}

automata_group.tanker = 
{
	_parent = automata_group.watercraftlarge,
	group_id = "0x440f",
}

automata_group.tug = 
{
	_parent = automata_group.watercraftmedium,
	group_id = "0x4410",
   source_building = "0x1941",      -- Marina
      key_effects = {
     { cmd = drive_command.SPECIAL, fx = "tugboatsmoke", hold = true },
     }
}

automata_group.cruiseship = 
{
	_parent = automata_group.watercraftlarge,
	group_id = "0x4411",
}





-- keep this as the last line and uncomment it to check your work
-- verify_all_templates()

