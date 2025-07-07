dofile('tutorial_data.lua')
dofile('tutorial_registry.lua')

-- IMPORTANT! ---------------------------------------------------------------------------------------------------------------
-- Every tutorial file must begin wtih this using uniq GUID
local tutorial_guid, task_first = "2c12d0e9", tutorialtasks.n + 1
--------------------------------------------------------------------------------------------------------------------------

--Start with a city that contains room for all the new transportation options.


--Step 1
--Intro ---------------------------
a = tutorial_create_task("cc131b46")
a.task_action = tutorial_do_nothing()
---Click Continue to Begin
tutorial_button_set(a)
a.no_edge_scroll = 1
a.zoomLevel = 0; --entire tile
set_camera(a, 68, 62)

a.instruction_msg = [[text@0xac1d5e29]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 2
--Intro ---------------------------
a = tutorial_create_task("CC131B47")
a.task_action = tutorial_do_nothing()
---Click Continue to Begin
tutorial_button_set(a)

a.instruction_msg = [[text@0xAC1D5E2A]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 3 --- Choose the route query  ---------------------------------------------------------

a = tutorial_create_task("CC131B48")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonRouteQuery)

tutorial_button_set(a,
tutorial_buttons.kButtonRouteQuery)

a.zoomLevel = 1;
set_camera(a, 21, 102)

a.instruction_msg = [[text@0xAC1D5E2B]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 4 --- Use the route query  ---------------------------------------------------------

a = tutorial_create_task("CC131B4E")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kButtonRouteQuery)

a.zoomLevel = 2;

a.instruction_msg = [[text@0xAC1D5E2C]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 5 --- Select an elevated rail station  ---------------------------------------------------------

a = tutorial_create_task("CC131B51")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonElevRailStation)

tutorial_button_set(a,
tutorial_buttons.kButtonElevRailStation, 
tutorial_buttons.kButtonSubway, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 3;
set_camera(a, 37, 102)

a.instruction_msg = [[text@0xAC1D5E2D]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 6 --- Place an elevated rail station  ---------------------------------------------------------

a = tutorial_create_task("CC131B51")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kElevRailStation, 37, 102, 39, 102)

tutorial_button_set(a,
tutorial_buttons.kButtonElevRailStation, 
tutorial_buttons.kButtonSubway, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 3;
set_camera(a, 37, 102)

a.instruction_msg = [[text@0xAC1D5E2D]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 7 --- Select an elevated rail line  ---------------------------------------------------------

a = tutorial_create_task("CC131B52")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonPlaceElevRail)

tutorial_button_set(a,
tutorial_buttons.kButtonPlaceElevRail, 
tutorial_buttons.kButtonSubway, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 2;
set_camera(a, 26, 102)

a.instruction_msg = [[text@0xAC1D5E2E]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 8 --- Place an elevated rail line  ---------------------------------------------------------

a = tutorial_create_task("CC131B52")
a.task_action = tutorial_ask_to_draw_network_and_check(tutorial_network_type.kElevRail , 16, 102, 37, 102)

tutorial_button_set(a,
tutorial_buttons.kButtonPlaceElevRail, 
tutorial_buttons.kButtonSubway, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 2;
set_camera(a, 26, 102)

a.instruction_msg = [[text@0xAC1D5E2E]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 9 --- Select an elevated rail to subway transfer station  ---------------------------------------------------------

a = tutorial_create_task("CC131B53")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonElevRailSubXfr)

tutorial_button_set(a,
tutorial_buttons.kButtonElevRailSubXfr, 
tutorial_buttons.kButtonSubway, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 3;
set_camera(a, 14, 102)

a.instruction_msg = [[text@0xAC1D5E2F]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 10 --- Place an elevated rail to subway transfer station  ---------------------------------------------------------

a = tutorial_create_task("CC131B53")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kElevRailSubXfr, 14, 102, 16, 102)

tutorial_button_set(a,
tutorial_buttons.kButtonElevRailSubXfr, 
tutorial_buttons.kButtonSubway, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 3;
set_camera(a, 14, 102)

a.instruction_msg = [[text@0xAC1D5E2F]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 11 --- Select subway rail line  ---------------------------------------------------------

a = tutorial_create_task("CC131B52")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonSubway)

tutorial_button_set(a,
tutorial_buttons.kButtonSubway, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 2;
set_camera(a, 11, 102)

a.instruction_msg = [[text@0xAC1D5E30]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 12 --- Connect subway rail line  ---------------------------------------------------------

a = tutorial_create_task("CC131B52")
a.task_action = tutorial_ask_to_draw_network_and_check(tutorial_network_type.kSubway , 8, 102, 14, 102)

tutorial_button_set(a,
tutorial_buttons.kButtonSubway, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 2;
set_camera(a, 11, 102)

a.instruction_msg = [[text@0xAC1D5E30]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 13 --- Congratulations on mass transit  ---------------------------------------------------------

a = tutorial_create_task("CC131B52")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a)

a.zoomLevel = 2;
set_camera(a, 22, 102)

a.instruction_msg = [[text@0xAC1D5E31]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 14 --- Select a monorail station  ---------------------------------------------------------

a = tutorial_create_task("CC131B54")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonMonorailStation)

tutorial_button_set(a,
tutorial_buttons.kButtonMonorailStation, 
tutorial_buttons.kButtonPlaceRail, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 3;
set_camera(a, 37, 90)

a.instruction_msg = [[text@0xAC1D5E32]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 15 --- Place a monorail station  ---------------------------------------------------------

a = tutorial_create_task("CC131B54")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kMonorailStation, 36, 90, 38, 90)

tutorial_button_set(a,
tutorial_buttons.kButtonMonorailStation, 
tutorial_buttons.kButtonPlaceRail, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 3;
set_camera(a, 37, 90)

a.instruction_msg = [[text@0xAC1D5E32]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 16 --- Select another monorail station  ---------------------------------------------------------

a = tutorial_create_task("CC131B54")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonMonorailStation)

tutorial_button_set(a,
tutorial_buttons.kButtonMonorailStation, 
tutorial_buttons.kButtonPlaceRail, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 3;
set_camera(a, 6, 90)

a.instruction_msg = [[text@0xAC1D5E33]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 17 --- Place another monorail station  ---------------------------------------------------------

a = tutorial_create_task("CC131B54")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kMonorailStation, 5, 90, 7, 90)

tutorial_button_set(a,
tutorial_buttons.kButtonMonorailStation, 
tutorial_buttons.kButtonPlaceRail, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 3;
set_camera(a, 6, 90)

a.instruction_msg = [[text@0xAC1D5E33]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 18  --- Select monorail rail line  ---------------------------------------------------------

a = tutorial_create_task("CC131B55")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonPlaceMonoRail)

tutorial_button_set(a,
tutorial_buttons.kButtonPlaceMonoRail,
tutorial_buttons.kButtonPlaceRail, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 2;
set_camera(a, 22, 90)

a.instruction_msg = [[text@0xAC1D5E34]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 19  --- Connect monorail rail line to the stations  ---------------------------------------------------------

a = tutorial_create_task("CC131B55")
a.task_action = tutorial_ask_to_draw_network_and_check(tutorial_network_type.kMonoRail , 7, 90, 36, 90)

tutorial_button_set(a,
tutorial_buttons.kButtonPlaceMonoRail,
tutorial_buttons.kButtonPlaceRail, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 2;
set_camera(a, 22, 90)

a.instruction_msg = [[text@0xAC1D5E34]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 20 --- Congratulations on monorail  ---------------------------------------------------------

a = tutorial_create_task("CC131B52")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a)

a.zoomLevel = 2;
set_camera(a, 22, 90)

a.instruction_msg = [[text@0xAC1D5E35]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 21 --- Select an avenue  ---------------------------------------------------------

a = tutorial_create_task("CC131B49")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonPlaceAvenue)

tutorial_button_set(a,
tutorial_buttons.kButtonPlaceAvenue, 
tutorial_buttons.kButtonPlaceRoad, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 2;
set_camera(a, 21, 108)

a.instruction_msg = [[text@0xAC1D5E36]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 22 --- Place an avenue  ---------------------------------------------------------

a = tutorial_create_task("CC131B49")
a.task_action = tutorial_ask_to_draw_network_and_check(tutorial_network_type.kAvenue , 13,108,30,109)

tutorial_button_set(a,
tutorial_buttons.kButtonPlaceAvenue, 
tutorial_buttons.kButtonPlaceRoad, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 2;

a.instruction_msg = [[text@0xAC1D5E36]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 23 --- Congrats on avenue placement  ---------------------------------------------------------

a = tutorial_create_task("CC131B4F")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a)
a.zoomLevel = 2;
set_camera(a, 21, 102)

a.instruction_msg = [[text@0xAC1D5E37]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 24 --- Select Toll booth  ---------------------------------------------------------

a = tutorial_create_task("CC131B56")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonTollBooth)

tutorial_button_set(a,
tutorial_buttons.kButtonTollBooth,
tutorial_buttons.kButtonSubway, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 3;
set_camera(a, 22, 108)

a.instruction_msg = [[text@0xAC1D5E38]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 25 --- Place Toll booth  ---------------------------------------------------------

a = tutorial_create_task("CC131B56")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kTollBooth, 22, 108, 23, 109)

tutorial_button_set(a,
tutorial_buttons.kButtonTollBooth,
tutorial_buttons.kButtonSubway, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 3;
set_camera(a, 22, 108)

a.instruction_msg = [[text@0xAC1D5E38]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 26 --- Congrats on toll booth placement  ---------------------------------------------------------

a = tutorial_create_task("CC131B57")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a)
a.zoomLevel = 2;
set_camera(a, 22, 108)

a.instruction_msg = [[text@0xAC1D5E39]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

-- Step 27 ---Ferry Intro ------------------------
a = tutorial_create_task("CC131B4A")
a.task_action = tutorial_do_nothing()
a.no_edge_scroll = 1
tutorial_button_set(a)
a.zoomLevel = 1;
set_camera(a, 82, 89)

a.instruction_msg = [[text@0xAC1D5E3A]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

-- Step 28 --Select 1st Ferry Terminal---------
a = tutorial_create_task("CC131B4B")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonLargeFerry)
a.zoomLevel = 2;
a.no_edge_scroll = 1
set_camera(a, 70, 93)

tutorial_button_set(a, 
tutorial_buttons.kButtonLargeFerry,
tutorial_buttons.kButtonWaterTransportation,
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.instruction_msg = [[text@0xAC1D5E3B]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

-- Step 29 --Place 1st Ferry Terminal---------
a = tutorial_create_task("CC131B4B")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kLargeFerry, 67, 99, 71, 101)
a.zoomLevel = 2;
a.no_edge_scroll = 1
set_camera(a, 70, 93)

tutorial_button_set(a, 
tutorial_buttons.kButtonLargeFerry,
tutorial_buttons.kButtonWaterTransportation,
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.instruction_msg = [[text@0xAC1D5E3B]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

-- Step 30 --select 2nd Ferry Terminal ---------
a = tutorial_create_task("CC131B4C")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonLargeFerry)
a.zoomLevel = 2;
a.no_edge_scroll = 1
set_camera(a, 93, 107)

tutorial_button_set(a, 
tutorial_buttons.kButtonLargeFerry,
tutorial_buttons.kButtonWaterTransportation,
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.instruction_msg = [[text@0xAC1D5E3C]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

-- Step 31 --place 2nd Ferry Terminal ---------
a = tutorial_create_task("CC131B4C")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kLargeFerry, 93, 114, 97, 116)
a.zoomLevel = 2;
a.no_edge_scroll = 1
set_camera(a, 93, 107)

tutorial_button_set(a, 
tutorial_buttons.kButtonLargeFerry,
tutorial_buttons.kButtonWaterTransportation,
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.instruction_msg = [[text@0xAC1D5E3C]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

-- Step 32 --Residential Development Results ---------------------------
a = tutorial_create_task("CC131B4D")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonSimFast)

tutorial_button_set(a,
tutorial_buttons.kButtonSimFast)
a.no_edge_scroll = 1
a.zoomLevel = 1;
set_camera(a, 82, 89)

a.instruction_msg = [[text@0xAC1D5E3D]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

-- Step 33 --Slow it back down ---------------------------
a = tutorial_create_task("CC131B50")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonSimMed)

tutorial_button_set(a,
tutorial_buttons.kButtonSimMed)
a.no_edge_scroll = 1
a.zoomLevel = 1;
set_camera(a, 82, 89)

a.instruction_msg = [[text@0xAC1D5E3E]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

-- Step 34 -- Select avenue tool for bridge placement ---------------------------
a = tutorial_create_task("CC131B5A")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonPlaceAvenue)

tutorial_button_set(a,
tutorial_buttons.kButtonPlaceAvenue, 
tutorial_buttons.kButtonPlaceRoad, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)
a.no_edge_scroll = 1
a.zoomLevel = 1;
set_camera(a, 77, 69)

a.instruction_msg = [[text@0xAC1D5E3F]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 35 --- Place a bridge  ---------------------------------------------------------

a = tutorial_create_task("CC131B58")
a.task_action = tutorial_ask_to_draw_network_and_check(tutorial_network_type.kAvenue , 58, 80, 115, 81)
a.window_offsetX = -530

tutorial_button_set(a,
tutorial_buttons.kButtonPlaceAvenue, 
tutorial_buttons.kButtonPlaceRoad,
tutorial_buttons.kButtonRoadTools,
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.no_edge_scroll = 1
a.zoomLevel = 1;
set_camera(a, 77, 69)

a.instruction_msg = [[text@0xAC1D5E40]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 36 --- Congrats on bridge placement  ---------------------------------------------------------

a = tutorial_create_task("CC131B59")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a)
a.zoomLevel = 1;
set_camera(a, 77, 69)

a.instruction_msg = [[text@0xAC1D5E41]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

-- Step 37 -- select large elementary school ---------
a = tutorial_create_task("CC131B5B")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonK8LargeSchool)
a.zoomLevel = 2;
a.no_edge_scroll = 1
set_camera(a, 16, 106)

tutorial_button_set(a, 
tutorial_buttons.kButtonK8LargeSchool,
tutorial_buttons.kButtonCivicEducation,
tutorial_buttons.kButtonCivicTools,
tutorial_buttons.kPuckButtonMayor)

a.instruction_msg = [[text@0xAC1D5E42]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

-- Step 38 -- place large elementary school ---------
a = tutorial_create_task("CC131B5B")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kK8LargeSchool, 14, 105, 17, 107)
a.zoomLevel = 2;
a.no_edge_scroll = 1
set_camera(a, 16, 106)

tutorial_button_set(a, 
tutorial_buttons.kButtonK8LargeSchool,
tutorial_buttons.kButtonCivicEducation,
tutorial_buttons.kButtonCivicTools,
tutorial_buttons.kPuckButtonMayor)

a.instruction_msg = [[text@0xAC1D5E42]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

-- Step 39 -- select large water pump ---------
a = tutorial_create_task("CC131B5C")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonUtilsLargeWaterPump)
a.zoomLevel = 3;
a.no_edge_scroll = 1
set_camera(a, 5, 121)

tutorial_button_set(a, 
tutorial_buttons.kButtonUtilsLargeWaterPump,
tutorial_buttons.kButtonUtilsWaterBldg,
tutorial_buttons.kButtonUtilitiesTools,
tutorial_buttons.kPuckButtonMayor)

a.instruction_msg = [[text@0xAC1D5E43]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

-- Step 40 -- place large water pump ---------
a = tutorial_create_task("CC131B5C")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kLargeWaterPump, 4, 121, 5, 121)
a.zoomLevel = 3;
a.no_edge_scroll = 1
set_camera(a, 5, 121)

tutorial_button_set(a, 
tutorial_buttons.kButtonUtilsLargeWaterPump,
tutorial_buttons.kButtonUtilsWaterBldg,
tutorial_buttons.kButtonUtilitiesTools,
tutorial_buttons.kPuckButtonMayor)

a.instruction_msg = [[text@0xAC1D5E43]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 41 --- Intro to Building style selector  ---------------------------------------------------------

a = tutorial_create_task("CC131B5D")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonBuildingStyle)

tutorial_button_set(a,
tutorial_buttons.kButtonBuildingStyle,
tutorial_buttons.kPuckButtonMayor)
a.zoomLevel = 1;
set_camera(a, 77, 69)

a.instruction_msg = [[text@0xAC1D5E44]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 42 --- Expand Building style selector  ---------------------------------------------------------

a = tutorial_create_task("CC131B5F")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonExpandBuildingStyle)

tutorial_button_set(a,
tutorial_buttons.kButtonExpandBuildingStyle,
tutorial_buttons.kButtonBuildingStyle,
tutorial_buttons.kButtonYearSpinner,
tutorial_buttons.kButtonAlternateYears,
tutorial_buttons.kButtonAllAtOnce,
tutorial_buttons.kPuckButtonMayor)
a.zoomLevel = 1;
set_camera(a, 77, 69)

a.instruction_msg = [[text@0xAC1D5E45]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 43 --- Building Style Selector  ---------------------------------------------------------

a = tutorial_create_task("CC131B5E")
a.task_action = tutorial_do_nothing()
a.window_offsetX = -530

tutorial_button_set(a,
tutorial_buttons.kButtonSelectChicagoStyle,
tutorial_buttons.kButtonSelectNewYorkStyle,
tutorial_buttons.kButtonSelectHoustonStyle,
tutorial_buttons.kButtonSelectEuroStyle,
tutorial_buttons.kButtonYearSpinner,
tutorial_buttons.kButtonAlternateYears,
tutorial_buttons.kButtonAllAtOnce)
a.zoomLevel = 1;
set_camera(a, 77, 69)

a.instruction_msg = [[text@0xAC1D5E46]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 44 --- Shrink Building style selector  ---------------------------------------------------------

a = tutorial_create_task("CC131B60")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonShrinkBuildingStyle)
a.window_offsetX = -530

tutorial_button_set(a,
tutorial_buttons.kButtonShrinkBuildingStyle,
tutorial_buttons.kButtonBuildingStyle,
tutorial_buttons.kPuckButtonMayor)
a.zoomLevel = 1;
set_camera(a, 77, 69)

a.instruction_msg = [[text@0xAC1D5E47]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 45 --- Signs and labels  ---------------------------------------------------------

a = tutorial_create_task("CC131B61")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonSigns)

tutorial_button_set(a,
tutorial_buttons.kButtonSigns,
tutorial_buttons.kButtonSignsAndLabels,
tutorial_buttons.kButtonLandscapeTools,
tutorial_buttons.kPuckButtonMayor)
a.zoomLevel = 1;
set_camera(a, 39, 103)

a.instruction_msg = [[text@0xAC1D5E48]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

-- Step 46 --- Place a sign  ---------------------------------------------------------

a = tutorial_create_task("CC131B62")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kButtonSigns,
tutorial_buttons.kButtonSignsAndLabels,
tutorial_buttons.kButtonLandscapeTools,
tutorial_buttons.kPuckButtonMayor)
a.zoomLevel = 2;
set_camera(a, 39, 103)

a.instruction_msg = [[text@0xAC1D5E49]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 47 --- Choose label tool  ---------------------------------------------------------

a = tutorial_create_task("CC131B63")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonLabels)

tutorial_button_set(a,
tutorial_buttons.kButtonLabels,
tutorial_buttons.kButtonSignsAndLabels,
tutorial_buttons.kButtonLandscapeTools,
tutorial_buttons.kPuckButtonMayor)
a.zoomLevel = 3;
set_camera(a, 39, 103)

a.instruction_msg = [[text@0xAC1D5E4A]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

-- Step 48 --- Place a label  ---------------------------------------------------------

a = tutorial_create_task("CC131B64")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kButtonLabels,
tutorial_buttons.kButtonSignsAndLabels,
tutorial_buttons.kButtonLandscapeTools,
tutorial_buttons.kPuckButtonMayor)
a.zoomLevel = 3;
set_camera(a, 39, 103)

a.instruction_msg = [[text@0xAC1D5E4B]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 49 --- Delete sign/label tool  ---------------------------------------------------------

a = tutorial_create_task("CC131B65")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonDemolishSigns)

tutorial_button_set(a,
tutorial_buttons.kButtonDemolishSigns,
tutorial_buttons.kButtonSignsAndLabels,
tutorial_buttons.kButtonLandscapeTools,
tutorial_buttons.kPuckButtonMayor)
a.zoomLevel = 2;
set_camera(a, 39, 103)

a.instruction_msg = [[text@0xAC1D5E4C]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

-- Step 50 --- Delete sign/label tool  ---------------------------------------------------------

a = tutorial_create_task("CC131B66")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kButtonDemolishSigns,
tutorial_buttons.kButtonSignsAndLabels,
tutorial_buttons.kButtonLandscapeTools,
tutorial_buttons.kPuckButtonMayor)
a.zoomLevel = 3;
set_camera(a, 39, 103)

a.instruction_msg = [[text@0xAC1D5E4D]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 51 --- Toggle sign/label tool  ---------------------------------------------------------

a = tutorial_create_task("CC131B67")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonToggleSigns)

tutorial_button_set(a,
tutorial_buttons.kButtonToggleSigns,
tutorial_buttons.kButtonSignsAndLabels,
tutorial_buttons.kButtonLandscapeTools,
tutorial_buttons.kPuckButtonMayor)
a.zoomLevel = 2;
set_camera(a, 39, 103)

a.instruction_msg = [[text@0xAC1D5E4E]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 52 --- Toggle sign/label tool part II  ---------------------------------------------------------

a = tutorial_create_task("CC131B68")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kButtonToggleSigns,
tutorial_buttons.kButtonSignsAndLabels,
tutorial_buttons.kButtonLandscapeTools,
tutorial_buttons.kPuckButtonMayor)
a.zoomLevel = 2;
set_camera(a, 39, 103)

a.instruction_msg = [[text@0xAC1D5E4F]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 53 --- U Drive It Part I  ---------------------------------------------------------

a = tutorial_create_task("CC131B68")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a)
a.zoomLevel = 0;
set_camera(a, 39, 103)

a.instruction_msg = [[text@0x4c2d48b0]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 54 --- U Drive It Part III  ---------------------------------------------------------

a = tutorial_create_task("CC131B68")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a)
a.zoomLevel = 0;
set_camera(a, 39, 103)

a.instruction_msg = [[text@0x4c2d48b1]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 55 --- U Drive It Part IV  ---------------------------------------------------------

a = tutorial_create_task("CC131B68")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonEarnedVehiclesMIOnOff)

tutorial_button_set(a,
tutorial_buttons.kButtonEarnedVehicles,
tutorial_buttons.kButtonEarnedVehiclesMIOnOff,
tutorial_buttons.kPuckButtonMySim)
a.zoomLevel = 0;
set_camera(a, 39, 103)

a.instruction_msg = [[text@0x4c2d48b2]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 56 --- U Drive It Part V  ---------------------------------------------------------

a = tutorial_create_task("CC131B68")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonEarnedVehiclesLand)

tutorial_button_set(a,
tutorial_buttons.kButtonEarnedVehicles,
tutorial_buttons.kButtonEarnedVehiclesLand,
tutorial_buttons.kPuckButtonMySim)
a.zoomLevel = 0;
set_camera(a, 39, 103)

a.instruction_msg = [[text@0x4c2d48b3]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 57 --- U Drive It Part VI  ---------------------------------------------------------

a = tutorial_create_task("CC131B68")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kButtonEarnedVehicles,
tutorial_buttons.kButtonEarnedVehiclesLand,
tutorial_buttons.kButtonEarnedVehiclesSea,
tutorial_buttons.kButtonEarnedVehiclesAir,
tutorial_buttons.kPuckButtonMySim)
a.zoomLevel = 0;
set_camera(a, 39, 103)

a.instruction_msg = [[text@0x4c2d48b4]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 58 --- Get Your Cities On the Move ---------------------------------------------------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing()
---exit tutorial
tutorial_button_set(a)
set_camera(a, 56, 68)
a.zoomLevel = 0;
a.no_edge_scroll = 1

a.instruction_msg = [[text@0xAC1D5E50]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--IMPORTANT! ----------------------------------------------------------------------------------------------------------------------------------------------
-- Every tutorial file must end with this like using appropriate tutorial GUID.
tutorial_registry : set_task_range_and_print_info(tutorial_guid, task_first, tutorialtasks.n-task_first+1)
----------------------------------------------------------------------------------------------------------------------------------------------------------------


