dofile ('_adv_sys.lua')

---------------------------------------------------------------------------------------------
-- Data and constants used by tutorials
--    

tutorialtasks = { n = 0 } -- main tutorial task table

tutorial_decal_color_type = {}
   tutorial_decal_color_type.DECAL_YELLOW = "selection_yellow"
   tutorial_decal_color_type.DECAL_GREEN = "selection_green"
   tutorial_decal_color_type.DECAL_BLUE = "selection_blue"
   tutorial_decal_color_type.DECAL_RED = "selection_red"


-- the following is going to be the guids for the tutorial cities. 
-- (SC4000Projects\SC4000Data\Tutorial)
tutorial_file_guids = {}

tutorial_file_guids[1] = "0x8a5b7a6c"
tutorial_file_guids[2] = "0xea5d6dc8"
tutorial_file_guids[3] = "0x6a5d6dd4"
tutorial_file_guids[4] = "0xcc02d3a3"
tutorial_file_guids[5] = "0x2c12d0e9"

-- the constants for zone_type.  Coming from 'SC4App/SC4App Interface/ISC4ZoneManager.h'
-- Must not change the following constants.
tutorial_zone_type = { }
   tutorial_zone_type.kZoneTypeUndefined               =  0
   tutorial_zone_type.kZoneTypeLowDensityResidential   =  1
   tutorial_zone_type.kZoneTypeMediumDensityResidential=  2
   tutorial_zone_type.kZoneTypeHighDensityResidential  =  3
	tutorial_zone_type.kZoneTypeLowDensityCommercial    =  4
   tutorial_zone_type.kZoneTypeMediumDensityCommercial =  5
   tutorial_zone_type.kZoneTypeHighDensityCommercial   =  6
	tutorial_zone_type.kZoneTypeResourceIndustrial      =  7
   tutorial_zone_type.kZoneTypeLightIndustrial         =  8
	tutorial_zone_type.kZoneTypeHeavyIndustrial         =  9
	tutorial_zone_type.kZoneTypeMilitary                = 10
	tutorial_zone_type.kZoneTypeAirport                 = 11
	tutorial_zone_type.kZoneTypeSeaport                 = 12
   tutorial_zone_type.kZoneTypeSpaceport               = 13
   tutorial_zone_type.kZoneTypeLandfill                = 14
   tutorial_zone_type.kZoneTypePloppedBuilding      = 15 -- // This is what user-plopped buildings are zoned as.
   tutorial_zone_type.kZoneTypeCount                   = 16

tutorial_building_type = {}
   tutorial_building_type.kOilPowerPlant = "0x1f420000"
   tutorial_building_type.kCoalPowerPlant = "0x1f4d0000"
   tutorial_building_type.kNaturalPowerPlant = "0x1f430000"
   tutorial_building_type.kK8SmallSchool = "0x03140000"
   tutorial_building_type.kK8LargeSchool = "0x03850000"
   tutorial_building_type.kHighSchool = "0x03170000"
   tutorial_building_type.kSmallFireStation = "0x03100000"
   tutorial_building_type.kLargeFireStation = "0x030b0000"
   tutorial_building_type.kWaterTower ="0x1f4a0000"
   tutorial_building_type.kWaterPump ="0x1f490000"
   tutorial_building_type.kLargeWaterPump ="0x03870000"
   tutorial_building_type.kPoliceStation = "0x030f0000"
   tutorial_building_type.kSolarPowerPlant = "0x1f440000"
   --tutorial_building_type.kMediumParkGreen  = "0x0e110000"
   tutorial_building_type.kSmallParkGreen  = "0x4a635a8a"
   tutorial_building_type.kHospital = "0x03130000"
   tutorial_building_type.kLargeFerry = "0x03820000"
   tutorial_building_type.kElevRailStation = "0x03830000"
   tutorial_building_type.kElevRailSubXfr = "0x0ADE0000"
   tutorial_building_type.kMonorailStation = "0x038D0000"
   tutorial_building_type.kTollBooth = "0x1F5E0000"

tutorial_dispatch_type = {}
   tutorial_dispatch_type.kDispatchTypePolice = 0
   tutorial_dispatch_type.kDispatchTypeFire = 1
   tutorial_dispatch_type.kDispatchTypeCoastGuard = 2
   tutorial_dispatch_type.kDispatchTypeCropDusting = 3
   tutorial_dispatch_type.kDispatchTypeMySim = 4

tutorial_network_type = { }
      tutorial_network_type.kRoad = 0
      tutorial_network_type.kRail = 1
      tutorial_network_type.kHighway = 2
      tutorial_network_type.kStreet = 3 
		tutorial_network_type.kPipe = 4
      tutorial_network_type.kPowerLine = 5
      tutorial_network_type.kAvenue = 6
		tutorial_network_type.kSubway = 7
		tutorial_network_type.kElevRail = 8
		tutorial_network_type.kMonoRail = 9
		tutorial_network_type.kGroundHighway = 10
      tutorial_network_type.kNumNetworkTypes = 11

tutorial_buttons = {}
   tutorial_buttons.kButtonDemolish                            = "0xe999c820"
   tutorial_buttons.kButtonDezone              =  0
   tutorial_buttons.kButtonLowDensityResidential   =  "0x01"
   tutorial_buttons.kButtonMediumDensityResidential=  "0x02"
   tutorial_buttons.kButtonHighDensityResidential  =  "0x03"
	tutorial_buttons.kButtonLowDensityCommercial    =  "0x04"
   tutorial_buttons.kButtonMediumDensityCommercial =  "0x05"
   tutorial_buttons.kButtonHighDensityCommercial   =  "0x06"
	tutorial_buttons.kButtonResourceIndustrial      =  "0x07"
   tutorial_buttons.kButtonLightIndustrial         =  "0x08"
	tutorial_buttons.kButtonHeavyIndustrial         =  "0x09"
   tutorial_buttons.kButtonCoalPlant   = "0x02000002"
   tutorial_buttons.kButtonOilPlant   = "0x02000003"
   tutorial_buttons.kButtonNaturalPlant   = "0x0a32dbff"
   tutorial_buttons.kButtonSmallFireStation = "0xa9dd1e4c"
   tutorial_buttons.kButtonLargeFireStation = "0x01000007"
   tutorial_buttons.kButtonK8SmallSchool = "0x89dd094e"
   tutorial_buttons.kButtonK8LargeSchool = "0x4bafbfc1"
   tutorial_buttons.kButtonLargeFerry = "0x0b96ae64"
   tutorial_buttons.kButtonElevRailStation = "0x4bafba9f"
   tutorial_buttons.kButtonElevRailSubXfr = "0xcbf3412d"
   tutorial_buttons.kButtonMonorailStation = "0xebfb01d2"
   tutorial_buttons.kButtonTollBooth = "0xebf9a440"
   tutorial_buttons.kButtonHighSchool = "0x4a2af441"
   tutorial_buttons.kButtonHospital = "0xea273867"
   tutorial_buttons.kButtonLargeFerry = "0x0b96ae64"
   tutorial_buttons.kButtonRouteQuery = "0x8b96b73e"
   tutorial_buttons.kButtonBudget = "0x00000041"
   tutorial_buttons.kButtonLandscapeTools = "0x8991ee08"
   tutorial_buttons.kButtonSignsAndLabels = "0xab9537b7"
   tutorial_buttons.kButtonSigns = "0x0b954123"
   tutorial_buttons.kButtonLabels = "0xcb95412c"
   tutorial_buttons.kButtonDemolishSigns = "0xaba7ed0a"
   tutorial_buttons.kButtonToggleSigns = "0xeb9541eb"
   tutorial_buttons.kButtonZoneTools = "0x0991ee13"
   tutorial_buttons.kButtonTransportationTools = "0xa994824d"
   tutorial_buttons.kButtonUtilitiesTools = "0xe991ee2f"
   tutorial_buttons.kButtonCivicTools = "0x0991ee39"
   tutorial_buttons.kButtonDisasterTools = "0x6991ee42"
   tutorial_buttons.kButtonFireDispatch = "0x69a30679"   
   tutorial_buttons.kButtonQueryTools = "0x99887766"
   tutorial_buttons.kButtonDezone = "0x00000030"
   tutorial_buttons.kButtonZoneResidential= "0x29920899"
   tutorial_buttons.kButtonZoneIndustrial = "0xc998af00"
   tutorial_buttons.kButtonZoneCommercial = "0xa998af42"
   tutorial_buttons.kButtonZoneLandfill   = "0x2992349a"
   tutorial_buttons.kButtonZoneAirport           = "0xe99234b3" 
   tutorial_buttons.kButtonPlaceRoadItem = "0x8c329937"
   tutorial_buttons.kButtonPlaceRoad = "0x6999bf56"
   tutorial_buttons.kButtonPlaceAvenue = "0x2b730c5b"
   tutorial_buttons.kButtonPlaceRail = "0x00000029"
   tutorial_buttons.kButtonPlaceElevRail = "0x2b79e398"
   tutorial_buttons.kButtonPlaceMonoRail = "0x4be099de"
   tutorial_buttons.kButtonPlaceHighway = "0x00000031"
   tutorial_buttons.kButtonPlaceGroundHighway = "0x0be0998f"
   tutorial_buttons.kButtonPlacePowerLine = "0x00000032"
   tutorial_buttons.kButtonPlumbing = "0x00000039"
   tutorial_buttons.kButtonBusStop = "0xe99237b4"
   tutorial_buttons.kButtonPipe = "0x2992f72c"
   tutorial_buttons.kButtonSubway = "0x299237bf"
   tutorial_buttons.kButtonPlacePark = "0x00000003"
   tutorial_buttons.kButtonRotateCounterClockwise = "0x8a4fbaea"
   tutorial_buttons.kButtonRotateClockwise = "0x2a4fbb08"
   tutorial_buttons.kButtonZoomIn = "0x4992046a"
   tutorial_buttons.kButtonZoomOut = "0xe9920494"
   tutorial_buttons.kButtonSimPause = "0xc998bb81"
   tutorial_buttons.kButtonSimSlow = "0x6a4fbb31"
   tutorial_buttons.kButtonSimMed  = "0x4a4fbb60"
   tutorial_buttons.kButtonSimFast = "0x8998bbdf"
   tutorial_buttons.kButtonUtilsWaterBldg     = "0x00000039"
   tutorial_buttons.kButtonUtilsWaterPump     = "0x03000002"
   tutorial_buttons.kButtonUtilsLargeWaterPump     = "0xabafac26"
   tutorial_buttons.kButtonUtilsWaterTower    = "0x03000001"
   tutorial_buttons.kButtonUtilsWaterTreatment= "0xe9de868e"
   tutorial_buttons.kButtonUtilsPowerBldg     = "0x00000035"
   tutorial_buttons.kButtonUtilsPowerBldgCoal = "0xc9de863f"
   tutorial_buttons.kButtonUtilsPowerBldgOil  = "0x49de8646"
   tutorial_buttons.kButtonUtilsPowerBldgNuclear = "0x69de864e"
   tutorial_buttons.kButtonUtilsGarbageBldg   = "0x00000040"
   tutorial_buttons.kButtonUtilsGarbageBldg1  = "0x69de8708"
   tutorial_buttons.kButtonUtilsGarbageBld32  = "0x69de870f"
   tutorial_buttons.kButtonUtilsGarbageBldg3  = "0x29de8717"
   tutorial_buttons.kButtonCivicPolice        = "0x00000037"
   tutorial_buttons.kButtonCivicPolice1       = "0x89de874a"
   tutorial_buttons.kButtonCivicPolice2       = "0x49de8753"
   tutorial_buttons.kButtonCivicPolice3       = "0x29de875a"
   tutorial_buttons.kButtonCivicFire          = "0x00000038"
   tutorial_buttons.kButtonCivicHealth        = "0x89dd5405"
   tutorial_buttons.kButtonCivicEducation     = "0x00000042"
   tutorial_buttons.kButtonCivicParkRec       = "0x00000003"
   tutorial_buttons.kButtonCivicParkMedParkGreen      = "0x4a635a8b"
   tutorial_buttons.kButtonCivicParkSmallParkGreen      = "0x4a635a8a"
   tutorial_buttons.kButtonCivicLandmark      = "0x09930709"
   tutorial_buttons.kButtonCivicReward        = "0x00000034"
   tutorial_buttons.kButtonReconcile = "0x4a551a6b"
   tutorial_buttons.kButtonCauseDisaster = "0x69b9324a"
   tutorial_buttons.kButtonControlDisaster = "0x09dce910"
   tutorial_buttons.kButtonTerrainEffects = "0x8a32dddb"
   tutorial_buttons.kButtonTerraform = "0x49e95d2b"
   tutorial_buttons.kButtonErode = "0x0aa44502"
   tutorial_buttons.kButtonMountain =               "0x6a33e1ba"
   tutorial_buttons.kButtonSteepValley =         "0x6a33e168"
   tutorial_buttons.kButtonFaunaWildAnimal = "0xea353064"
   tutorial_buttons.kButtonGodMountain = "0xc99231da"
   tutorial_buttons.kButtonGodValley = "0x152231f3"
   tutorial_buttons.kButtonGodFlora = "0x899231e6"
   tutorial_buttons.kButtonGodFauna = "0x6a3d638c"
   tutorial_buttons.kButtonGodLevel = "0x29923215"
   tutorial_buttons.kButtonGodDayNight          = "0xa9ed5617"
   tutorial_buttons.kButtonGodDayNightCycle   = "0xca35cb74"
   tutorial_buttons.kButtonGodDayOnly            = "0xca35cb76"
   tutorial_buttons.kButtonGodNightOnly        = "0xca35cb78"
   tutorial_buttons.kButtonGodTornado            = "00000006"
   tutorial_buttons.kButtonAdvisor                  = "0x49edf9b7"
   tutorial_buttons.kButtonAdvisorCityPlanner                  = "0xca15c7cf"
   tutorial_buttons.kButtonDataView                = "0x99887755"
   tutorial_buttons.kButtonBudget                     = "0x00000041"
   tutorial_buttons.kButtonGraph                       = "0x15200002"
   tutorial_buttons.kButtonOpinion                   = "0x15200003"
   tutorial_buttons.kButtonBuildingStyle       = "0xabc54125"
   tutorial_buttons.kButtonExpandBuildingStyle     = "0xcbc61567"
   tutorial_buttons.kButtonShrinkBuildingStyle     = "0xebc619fd"
   tutorial_buttons.kButtonSelectChicagoStyle     = "0x00002000"
   tutorial_buttons.kButtonSelectNewYorkStyle     = "0x00002001"
   tutorial_buttons.kButtonSelectHoustonStyle     = "0x00002002"
   tutorial_buttons.kButtonSelectEuroStyle     = "0x00002003"
   tutorial_buttons.kButtonYearSpinner             = "0xabc61550"
   tutorial_buttons.kButtonAlternateYears     = "0xebc61560"
   tutorial_buttons.kButtonAllAtOnce           = "0xcbc61559"
   tutorial_buttons.kButtonMayorRating           = "0x0a51201d"
   tutorial_buttons.kButtonRCILowCommercial = "0xea5650ca"
   tutorial_buttons.kButtonRCIIndustrial       = "0xea5650cd"
   tutorial_buttons.kButtonDataViewOptionGroup           = "0xaa32bce6"--"0x00000075" --"0x8a2871b2" -- "0xaa2871f7"
   tutorial_buttons.kButtonPoliceStation       = "0x01000005"
   tutorial_buttons.kButtonSolarPowerPlant = "0xca32df6d"
   tutorial_buttons.kPuckButtonMayor =             "0xc988bc79"
   tutorial_buttons.kPuckButtonGod =                 "0x2988bc85"
   tutorial_buttons.kPuckButtonMySim =              "0x4988bc6a"
   tutorial_buttons.kPuckButtonOptions =         "0x8988bc94"
   tutorial_buttons.kButtonShowRCIDemandGraph  = "0xaa9211b3"
   tutorial_buttons.kButtonWaterTransportation       = "0xa99234a6"
      
   -- My Sim Buttons 
   tutorial_buttons.kButtonMySimAddButton = "0xea1f1dba"
   tutorial_buttons.kButtonMySimFirstMySim = "0x8a1f1dc3"
   tutorial_buttons.kButtonMySimSearch = "0xca1f1e9b"
   tutorial_buttons.kButtonMySimRemove = "0xaa1f1ea3"
   tutorial_buttons.kButtonMySimBack     =  "0xaa1f1e85"
   tutorial_buttons.kButtonEarnedVehicles     =  "0xabb27a7a"
   tutorial_buttons.kButtonEarnedVehiclesLand     =  "0xebfac717"
   tutorial_buttons.kButtonEarnedVehiclesSea     =  "0xebfac719"
   tutorial_buttons.kButtonEarnedVehiclesAir     =  "0xebfac718"
   tutorial_buttons.kButtonEarnedVehiclesMIOnOff     =  "0xebfac720"
   
   -- Budget expension buttons
   tutorial_buttons.kButtonExpandBudget1 = "0xaa3ac40e"
   tutorial_buttons.kButtonExpandBudget2 = "0xaa3ac50e"
   tutorial_buttons.kButtonExpandBudget3 = "0x4a8879cb"
   tutorial_buttons.kButtonExpandBudget4 = "0xaa3ac40f"
   tutorial_buttons.kButtonExpandBudget5 = "0xaa3ac50f"
   tutorial_buttons.kButtonExpandBudget6 = "0x4a8879db"
   tutorial_buttons.kButtonExpandTaxes1 =   "0xaa3ac500" 
    tutorial_buttons.kButtonAcceptTaxes =   "0xaa4c353b" 
 
   -- Data map expension buttons
   tutorial_buttons.kButtonExpandDataView1 = "0x4a32ca92"
   tutorial_buttons.kButtonExpandDataView2 = "0xea8b80a6"
   tutorial_buttons.kButtonExpandDataView3 = "0xa32cacd4"
   tutorial_buttons.kButtonExpandDataView4 = "0xea8b80a8"
   tutorial_buttons.kButtonExpandDataView5 = "0xea8b80a7"
   tutorial_buttons.kButtonExpandDataView6 = "0x0a32cac3"
   tutorial_buttons.kButtonDesirability = "0x00005005"
   tutorial_buttons.kButtonR1Desirability = "0x00006001"
   tutorial_buttons.kButtonR3Desirability = "0x00006003"
   tutorial_buttons.kCloseDataMap = "0xa32cacd4"
   tutorial_buttons.kCloseDataGraph = "0x0a8b7e00"
                                                                                  
--//const Uint32 kButtonMySim(0xe9dce8ed);

-- function constants
tutorial_function_index = {}
   tutorial_function_index.UNDEFINED = 0

-- Functions that ask users to do some task
-- and check if users succeeds or not
--   ASK_TO_ZONE_AND_CHECK = 1,
   tutorial_function_index.ASK_TO_ZONE_AND_CHECK = 1
   tutorial_function_index.ASK_TO_DRAW_NETWORK_AND_CHECK = 2
   tutorial_function_index.ASK_TO_PLOP_AND_CHECK = 3
   tutorial_function_index.CHECK_BUTTON_CLICKED = 4
   tutorial_function_index.ASK_TO_DEMOLISH = 5
   tutorial_function_index.ASK_TO_SET_VALUE = 6
   tutorial_function_index.ASK_TO_DEZONE_AND_CHECK = 7
   tutorial_function_index.ASK_TO_DISPATCH_AND_CHECK = 8
                        
-- Functions that will do the action for users.
-- may not be included in lua script,
-- but for now just leave it here.
   tutorial_function_index.TRIGGER_FIRE = 9
   tutorial_function_index.BLINK_UI_BUTTON = 10
   tutorial_function_index.DO_NOTHING = 11
   tutorial_function_index.kWAIT_FOR_FIRE_FINISHED = 12
   tutorial_function_index.kWAIT_FOR_POPULATION_GROWTH = 13
   tutorial_function_index.kMOVE_IN_MYSIMS = 14
   tutorial_function_index.kDO_NOTHING_BUT_BLINKING = 15
   tutorial_function_index.kDRAW_ARROW_FOR_WINDOW = 16
   tutorial_function_index.ASK_TO_DRAW_POWERLINE_AND_CHECK = 17
  
function set_camera(object, XCoord, ZCoord) 
   object.cameraX = XCoord;
   object.cameraZ = ZCoord;
end

function set_decal_color (object,  decal_color) 
   object.decal_color = decal_color
end

-- the following is the model of each task actions.
function tutorial_dummy_task_action() 
   local task = 
      {
         function_index = tutorial_function_index.UNDEFINED,
         startX = 0,
         startZ = 0,
         endX = 0,
         endZ = 0,
         guid = 0,
         target_guid = 0,
         extraData = 0,
      }
   return task
end

-- creating the functions to create the task actions
-- all the data will be read as signed int.
function tutorial_ask_to_zone_and_check(zone_type, startX, startZ,endX,endZ)
   local data = tutorial_dummy_task_action()
   data.function_index = tutorial_function_index.ASK_TO_ZONE_AND_CHECK
   data.startX = startX
   data.startZ = startZ
   data.endX = endX
   data.endZ = endZ
   data.extraData = zone_type
   set_camera(data, (startX+endZ)/2, (startZ+endZ)/2-8 )
   return data
end

function tutorial_ask_to_draw_network_and_check(network_type , startX, startZ, endX, endZ)
   local data = tutorial_dummy_task_action()
   data.function_index = tutorial_function_index.ASK_TO_DRAW_NETWORK_AND_CHECK
   if(network_type == tutorial_network_type.kPowerLine) 
   then 
      data.function_index = tutorial_function_index.ASK_TO_DRAW_POWERLINE_AND_CHECK
   end
   data.startX = startX
   data.startZ = startZ
   data.endX = endX
   data.endZ = endZ
   data.extraData = network_type
   data.target_guid = 0
   return data
end

function tutorial_ask_to_dispatch_and_check(dispatch_type , startX, startZ, endX, endZ)
   local data = tutorial_dummy_task_action()
   data.function_index = tutorial_function_index.ASK_TO_DISPATCH_AND_CHECK
   data.startX = startX
   data.startZ = startZ
   data.endX = endX
   data.endZ = endZ
   data.extraData = dispatch_type
   data.target_guid = 0
   return data
end

-- drawing an arrow for a window. x, y is the position relative to the window.
function tutorial_draw_arrow_at(t_guid,  x , y )
   local data = tutorial_dummy_task_action()
   data.function_index =    tutorial_function_index.kDRAW_ARROW_FOR_WINDOW
   data.startX = x
   data.startZ = y
   data.target_guid = t_guid
   return data
end

function tutorial_do_nothing()
   local data = tutorial_dummy_task_action()
   data.function_index = tutorial_function_index.DO_NOTHING
   return data
end

function tutorial_do_nothing_but_blinking()
   local data = tutorial_dummy_task_action()
   data.function_index = tutorial_function_index.kDO_NOTHING_BUT_BLINKING
   return data
end

function tutorial_wait_for_fire_finished()
   local data = tutorial_dummy_task_action()
   data.function_index = tutorial_function_index.kWAIT_FOR_FIRE_FINISHED
   return data
end

function tutorial_trigger_fire(startX, startZ, endX, endZ)
   local data = tutorial_dummy_task_action()
   data.function_index = tutorial_function_index.TRIGGER_FIRE
   data.startX = startX
   data.startZ = startZ
   data.endX = endX
   data.endZ = endZ
   return data
end

function tutorial_wait_for_population_growth(population_num)
   local data = tutorial_dummy_task_action()
   data.function_index = tutorial_function_index.kWAIT_FOR_POPULATION_GROWTH
   data.extraData = population_num
   return data
end

-- currently only one buttons at a time.
function tutorial_check_button_clicked(button_guid)
   local data = tutorial_dummy_task_action()
   data.function_index = tutorial_function_index.CHECK_BUTTON_CLICKED
   data.extraData = 1
   data.target_guid = button_guid
   return data
end

-- currently only one buttons at a time.
function tutorial_check_button_clicked_no_arrow(button_guid)
   local data = tutorial_check_button_clicked(button_guid)
   data.extraData = 0
   return data
end

function tutorial_ask_to_plop_and_check (building_type,startx,startz,endx,endz)
   local data = tutorial_dummy_task_action()
   data.function_index = tutorial_function_index.ASK_TO_PLOP_AND_CHECK 
   data.startX = startx
   data.startZ = startz
   data.endX = endx
   data.endZ = endz
   data.target_guid = building_type
   set_camera(data, (startx+endx)/2, (startz+endz)/2-3 )
   return data
end

function tutorial_ask_to_demolish_and_check (startx,startz,endx,endz)
   local data = tutorial_dummy_task_action()
   data.function_index = tutorial_function_index.ASK_TO_DEMOLISH
   data.startX = startx
   data.startZ = startz
   data.endX = endx
   data.endZ = endz
   set_camera(data, (startx+endx)/2, (startz+endz)/2-3 )
   return data
end

function move_in_mysims (nIndex,startx,startz,endx,endz)
   local data = tutorial_dummy_task_action()
   data.function_index = tutorial_function_index.kMOVE_IN_MYSIMS
   data.startX = startx
   data.startZ = startz
   data.endX = endx
   data.endZ = endz
   data.extraData = nIndex
   return data
end


-- currently only six buttons at a time.
function tutorial_button_set(object , ...)
   local buttons = {}
   for k = 1, getn(arg)   
   do
      local v = rawget(arg, k)
      if (v == nil or type(v) ~= "string") 
         then v = "0x00000000" end
      buttons[k] = v
   end
   object.target_buttons = buttons
end

--the basic task structure.

--tutorial_base_task = 
--{
--   task_actions = tutorial_askToPlopAndCheck("powerPlant",100,100),
--   instruction_msg = "DEFAULT Instructin msg",
--   try_again_msg = "PLEASE TRY AGAIN",
--   congratulation_msg = "Congratulation!!! You have completed this task"
--}

-- tutorailtasks._basetask = tutorial_base_task
-- all the tutorial tasks will be stored here



-- helper function to create each tutorial task.
function tutorialtasks:create_tutorial_task(_guid)
   local index = getn(self) + 1
   local data = 
      {
         guid = _guid,  
         csi  = 0,
         zoomLevel = 0,
         cameraX = 0,
         cameraZ = 0,
         window_offsetX = 0,
         window_offsetY = 0,
         no_edge_scroll = 0, 
         task_action = tutorial_dummy_task_action()
      }
 
   self[index] = data -- data is the actual data stored in tutorial task list
   self.n = self.n + 1 -- increase table count

   return data       
end
   


-- global function that creates task.
function tutorial_create_task(guid)   
   local a = tutorialtasks:create_tutorial_task(guid)   
   return a   
end    

