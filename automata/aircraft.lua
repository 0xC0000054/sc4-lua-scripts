--
-- aircraft.lua
--
-- Defines common aircraft automata groups
--
-- Automata "group_id" is an occupant group GUID.  They are defined in ingred.ini "occupant groups" section and in ISC4OccupantGroups.h
--
-- The "class_id" field for an automata group is only necessary if that automata group requires a new C++ class.
-- Most groups will default to the parent type and create a default cSC4Aircraft.
--

--------------------------------------
-- prevent this file from being included multiple times
if not rawget(globals(), "_aircraft_lua") then
_aircraft_lua = 1


dofile("_templates.lua")
dofile("_constants.lua")
dofile("_keycodes.lua")

------------

automata_group.aircraft = TTT
{
	group_id = "0x4003",
	class_id = "0xc96e75dc",
   csi_image = "0x0c0305c4",     -- bitmap Id for situation indicator

	anims = {
	},
}

automata_group.helicopter = TTT
{
   _parent = automata_group.aircraft,
   group_id = "0x4300",
   class_id = "0x8ba98eda",
   csi_image = "0x4bb1305e",
   
   -- The "helicopter" change rates describe limits imposed by the physics of the aircraft
   -- The "playerdrive" rates describe the translation a keypress to a real aircraft control
   helicopter = TTT
   {
      Mass = 300,
      Power = 120000, 
      SpeedMultiplier = 0.7,   --must be [0, 1]
      MaxSpeed = kVelocity1KPH * 125,   --clamps to this speed (not a multipler)
      DragFactor = 1600,
      RotationalDragFactor = 400,
      BankMax = kAngle1Degree * 40,
      BankChangeRate = kAngle1Degree * 40,      --degrees per second
      PitchMax = kAngle1Degree * 35,
      PitchChangeRate = kAngle1Degree * 35,    --degrees per second
      YawRateMax = kAngle1Degree * 80,              --degrees per second
      BankMultiplier = 1,                             --no units, just a scaling factor
      PitchMultiplier = 0.9                              --no units, just a scaling factor
   },
   
   playerdrive = TTT
   {
      MinZoom = 3,      -- range 1-6
      StartingZoom = 5,      
      MaxSpeed = kVelocity1KPH * 125,  --clamps to this speed (not a multipler)
      AccelRate = 20,   --percent per second, will take 100/x seconds to reach full throttle
      BankRate = 50,     --percent per second
      ClimbRate = 60,   --percent per second
      ReturnToCenterFactor = 3,    --when returning the joystick to the center, move faster
      HitPoints = 100,  --used to color the plumb bob (NOT USED)
   },
}

automata_group.planes = TTT
{
   _parent = automata_group.aircraft,
   group_id = "0x4302",
   class_id = "0xcbeb4f62",
   csi_image = "0x0c0305c4", 
   
   -- The "airplane" change rates describe limits imposed by the physics of the aircraft
   -- The "playerdrive" rates describe  the translation a keypress to a real aircraft control
   airplane = TTT
   {
      Mass = 300,                               -- (100)
      WingArea = 35,                            -- (1)
      TakeOffSpeed = kVelocity1KPH * 100,       -- (90)
      MaxSpeed = kVelocity1KPH * 300,           -- (540)
      ElevatorMax = kAngle1Degree * 30,         -- controls pitch max (30)
      ElevatorChangeRate = kAngle1Degree * 30,  -- controls pitch rate (divide into ElevatorMax) (7)
      AileronMax = kAngle1Degree * 55,          -- controls roll max (45)
      AileronChangeRate = kAngle1Degree * 80,   -- controls roll rate (divide into AileronMax) (22.5)
      RudderMax = kAngle1Degree * 30,           -- controls yaw max (30)
      RudderChangeRate = kAngle1Degree * 30,    -- controls yaw rate (divide into RudderMax) (2.5)
      ThrottleMax = 30000,                      -- (10000)
      ThrottleChangeRate = 30000,               -- (10000)
      FlapsMax = 0.3,                           -- 1 + x is the lift multiplier during climb and landing (0.4)
      FlapsChangeRate = 0.06,                   -- flaps change rate per second (divide into FlapsMax) (0.04)
      StallAngle = kAngle1Degree * 20,          -- if angle of attack is above this, the wings start to lose lift (30)
      LiftFactorLevelFlight = 0.015,            -- multiplier on lift when angle of attack is zero (0.001)
      LiftFactorMaxClimb = 0.15,                -- multiplier on lift when angle of attack equals the stall angle (0.02)
      LiftFactorFullStall = 0                   -- multiplier on lift if angle of attack were >= 90 degrees (0)
   },
   
   playerdrive = TTT
   {
      MinZoom = 3,                     -- range 1-6   
      StartingZoom = 4,                -- range 1-6
      MaxSpeed = kVelocity1KPH * 300,  -- (300)
      AccelRate = 40,                  -- percent per second, will take 100/x seconds to reach full throttle (40)
      BankRate = 80,                   -- ailerons (20)
      RudderRate = 40,                 -- turning without banking (20)
      ClimbRate = 75,                  -- elevators     100=1 sec (100)
      DiveRate = 50,                   -- elevators (50)
      FlapClimbRate = 20,              -- (20)
      FlapDiveRate = 10,               -- (10)
      TrimRate = 8,                    -- auto adjust elevators to maintain altitude (10)
      MaxTrim = 20,                    -- percent of ElevatorMax (20)
      MinThrottle = 50,                -- percent of ThrottleMax (30)
      LandingThrottle = 50,            -- usually the same as MinThrottle (30)
      LandingElevator = 1,             -- (10)
      ReturnToCenterFactor = 3,         -- a multipler; when returning the joystick to the center, move faster (3)
      HitPoints = 100  --used to color the plumb bob (NOT USED)
   },
}


automata_group.stuntplane = TTT
{
	_parent = automata_group.planes,
	group_id = "0x4311",
   source_building = "0x1517",   --landing strip

  airplane = TTT
   {
      Mass = 300,
      WingArea = 37,
      TakeOffSpeed = kVelocity1KPH * 90,
      MaxSpeed = kVelocity1KPH * 300,
      ElevatorMax = kAngle1Degree * 30,
      ElevatorChangeRate = kAngle1Degree * 30,
      AileronMax = kAngle1Degree * 65,
      AileronChangeRate = kAngle1Degree * 90,
      RudderMax = kAngle1Degree * 30,
      RudderChangeRate = kAngle1Degree * 30,
      ThrottleMax = 30000,
      ThrottleChangeRate = 30000,
      FlapsMax = 0.3,
      FlapsChangeRate = 0.06,
      StallAngle = kAngle1Degree * 30,          
      LiftFactorLevelFlight = 0.015,              
      LiftFactorMaxClimb = 0.15,                 
      LiftFactorFullStall = 0                   
   },
      playerdrive = TTT
   {
      MinZoom = 3,                     -- range 1-6   
      StartingZoom = 5,                -- range 1-6
      MaxSpeed = kVelocity1KPH * 300,  -- (300)
      AccelRate = 40,                  -- percent per second, will take 100/x seconds to reach full throttle (40)
      BankRate = 100,                  -- ailerons (20)
      RudderRate = 50,                 -- turning without banking (20)
      ClimbRate = 75,                  -- elevators     100=1 sec (100)
      DiveRate = 50,                   -- elevators (50)
      FlapClimbRate = 20,              -- (20)
      FlapDiveRate = 10,               -- (10)
      TrimRate = 8,                    -- auto adjust elevators to maintain altitude (10)
      MaxTrim = 20,                    -- percent of ElevatorMax (20)
      MinThrottle = 40,                -- percent of ThrottleMax (30)
      LandingThrottle = 40,            -- usually the same as MinThrottle (30)
      LandingElevator = 1,             -- (10)
      ReturnToCenterFactor = 3         -- a multipler; when returning the joystick to the center, move faster (3)
   },
}

automata_group.military_helicopter = TTT
{
	_parent = automata_group.helicopter,
	group_id = "0x4307",
   source_building = "0x1914",   --army base
   
--   key_effects = {
--     { cmd = drive_command.SPECIAL, fx = "helicoptermissle", one_shot = true, override = false },
--   },
   helicopter = TTT
   {
      Mass = 300,
      Power = 120000, 
      SpeedMultiplier = 0.7,   --must be [0, 1]
      MaxSpeed = kVelocity1KPH * 125,
      DragFactor = 1000,
      RotationalDragFactor = 400,
      BankMax = kAngle1Degree * 50,
      BankChangeRate = kAngle1Degree * 40,      --degrees per second
      PitchMax = kAngle1Degree * 55,
      PitchChangeRate = kAngle1Degree * 120,    --degrees per second
      YawRateMax = kAngle1Degree * 80,              --degrees per second
      BankMultiplier = .9,                             --no units, just a scaling factor
      PitchMultiplier = .7                              --no units, just a scaling factor
   },
   
   playerdrive = TTT
   {
      MinZoom = 3,      -- range 1-6
      StartingZoom = 5,      
      MaxSpeed = kVelocity1KPH * 125,
      AccelRate = 20,   --percent per second, will take 100/x seconds to reach full throttle
      BankRate = 100,     --percent per second
      ClimbRate = 60,   --percent per second
      ReturnToCenterFactor = 3,    --when returning the joystick to the center, move faster
      HitPoints = 100,  --used to color the plumb bob (NOT USED)
   },
}

automata_group.police_helicopter = TTT
{
	_parent = automata_group.helicopter,
	group_id = "0x4301",
   source_building = "0x1515",   --deluxe police station
}

automata_group.news_helicopter = TTT
{
	_parent = automata_group.helicopter,
	group_id = "0x4304",
   source_building = "0x1910",   --tv station
}

automata_group.medical_helicopter = TTT
{
	_parent = automata_group.helicopter,
	group_id = "0x4305",
   source_building = "0x151A",   --large health
}

automata_group.ufo = TTT
{
	_parent = automata_group.helicopter,
	group_id = "0x4308",
   source_building = "0x1939",   --area 5.1
   csi_image = "0x4bb13060",  
   key_effects = {
--     { cmd = drive_command.SPECIAL, fx = "ufolaser", one_shot = true, override = false },
     { cmd = drive_command.ALTERNATE,  fx = "ufoabduction", hold = true },
   },	
   helicopter = TTT
   {
      Mass = 300,
      Power = 120000, 
      SpeedMultiplier = 0.7,   --must be [0, 1]
      MaxSpeed = kVelocity1KPH * 125,
      DragFactor = 1000,
      RotationalDragFactor = 400,
      BankMax = kAngle1Degree * 50,
      BankChangeRate = kAngle1Degree * 40,      --degrees per second
      PitchMax = kAngle1Degree * 55,
      PitchChangeRate = kAngle1Degree * 120,    --degrees per second
      YawRateMax = kAngle1Degree * 80,              --degrees per second
      BankMultiplier = .2,                             --no units, just a scaling factor
      PitchMultiplier = .2                              --no units, just a scaling factor
   },
   
   playerdrive = TTT
   {
      MinZoom = 3,      -- range 1-6
      StartingZoom = 5,      
      MaxSpeed = kVelocity1KPH * 125,
      AccelRate = 20,   --percent per second, will take 100/x seconds to reach full throttle
      BankRate = 100,     --percent per second
      ClimbRate = 60,   --percent per second
      ReturnToCenterFactor = 3,    --when returning the joystick to the center, move faster
      HitPoints = 100,  --used to color the plumb bob (NOT USED)
   },
}


automata_group.fire_plane = TTT
{
	_parent = automata_group.planes,
	group_id = "0x4303",
   source_building = "0x1518",   --deluxe fire station
   
      airplane = TTT
   {
      Mass = 1200,                              -- (100)
      WingArea = 100,                           -- (1)
      TakeOffSpeed = kVelocity1KPH * 180,       -- (90)
      MaxSpeed = kVelocity1KPH * 300,           -- (540)
      ElevatorMax = kAngle1Degree * 25,         -- controls pitch max (30)
      ElevatorChangeRate = kAngle1Degree * 25,  -- controls pitch rate (divide into ElevatorMax) (7)
      AileronMax = kAngle1Degree * 45,          -- controls roll max (45)
      AileronChangeRate = kAngle1Degree * 60,   -- controls roll rate (divide into AileronMax) (22.5)
      RudderMax = kAngle1Degree * 30,           -- controls yaw max (30)
      RudderChangeRate = kAngle1Degree * 30,    -- controls yaw rate (divide into RudderMax) (2.5)
      ThrottleMax = 100000,                     -- (10000)
      ThrottleChangeRate = 100000,              -- (10000)
      FlapsMax = 0.3,                           -- 1 + x is the lift multiplier during climb and landing (0.4)
      FlapsChangeRate = 0.06,                   -- flaps change rate per second (divide into FlapsMax) (0.04)
      StallAngle = kAngle1Degree * 15,          -- if angle of attack is above this, the wings start to lose lift (30)
      LiftFactorLevelFlight = 0.015,            -- multiplier on lift when angle of attack is zero (0.001)
      LiftFactorMaxClimb = 0.15,                -- multiplier on lift when angle of attack equals the stall angle (0.02)
      LiftFactorFullStall = 0                   -- multiplier on lift if angle of attack were >= 90 degrees (0)
   },
   
   playerdrive = TTT
   {
      MinZoom = 3,                     -- range 1-6   
      StartingZoom = 5,                -- range 1-6
      MaxSpeed = kVelocity1KPH * 300,  -- (300)
      AccelRate = 40,                  -- percent per second, will take 100/x seconds to reach full throttle (40)
      BankRate = 80,                   -- ailerons (20)
      RudderRate = 40,                 -- turning without banking (20)
      ClimbRate = 40,                  -- elevators     100=1 sec (100)
      DiveRate = 30,                   -- elevators (50)
      FlapClimbRate = 20,              -- (20)
      FlapDiveRate = 10,               -- (10)
      TrimRate = 8,                    -- auto adjust elevators to maintain altitude (10)
      MaxTrim = 20,                    -- percent of ElevatorMax (20)
      MinThrottle = 50,                -- percent of ThrottleMax (30)
      LandingThrottle = 50,            -- usually the same as MinThrottle (30)
      LandingElevator = 1,             -- (10)
      ReturnToCenterFactor = 3         -- a multipler; when returning the joystick to the center, move faster (3)
   },
}

automata_group.crop_duster = TTT
{
	_parent = automata_group.planes,
	group_id = "0x4306",
   source_building = "0x1517",   --landing strip
   
   key_effects = {
      { cmd = drive_command.SPECIAL, fx = "cropdust", hold = true, },
   },
}

automata_group.fighter_plane = TTT
{
	_parent = automata_group.planes,
	group_id = "0x4312",
   source_building = "0x1939",   --area 5.1
   
--   key_effects = {
--      { cmd = drive_command.SPECIAL, fx = "jetbomb", one_shot = true },
--   },
	
}

automata_group.sky_diver = TTT
{
	_parent = automata_group.planes,
	group_id = "0x4313",
   source_building = "0x1517",   --landing strip
      key_effects = {
      { cmd = drive_command.SPECIAL, fx = "skydive", hold = false, one_shot = true, override = true },
   },
	
}

   




-- keep this as the last line and uncomment it to check your work
--verify_all_templates()

-- end include check
end