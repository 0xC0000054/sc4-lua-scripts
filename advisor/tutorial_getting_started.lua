dofile('tutorial_data.lua')
dofile('tutorial_registry.lua')

-- IMPORTANT! ---------------------------------------------------------------------------------------------------------------
-- Every tutorial file must begin wtih this using uniq GUID
local tutorial_guid, task_first = "abfad020", tutorialtasks.n + 1
--------------------------------------------------------------------------------------------------------------------------

--Start from an EMPTY city, just as if a newbie player comes in fresh. Build it up to 500 or so.    


   --tutorial_buttons.kPuckButtonMayor =             "0xc988bc79"
 --  tutorial_buttons.kPuckButtonGod =                 "0x2988bc85"
 --  tutorial_buttons.kPuckButtonMySim =              "0x4988bc6a"

--OLD WELCOME
--Welcome ---------------------------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a)

a.zoomLevel = 0; --entire tile
set_camera(a, 45, 40)

a.instruction_msg = [[text@cc102679]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@8a5adc16]]



--Overview ---------------------------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kPuckButtonGod)

tutorial_button_set(a, tutorial_buttons.kPuckButtonGod)

a.zoomLevel = 0; --entire tile
set_camera(a, 45, 40)

a.instruction_msg = [[text@CC10267A]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@8a5adc16]]

--Step 1
--God Mode ---------------------------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kPuckButtonMayor)

tutorial_button_set(a, tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 0; --entire tile
set_camera(a, 45, 40)

a.instruction_msg = [[text@CC10267B]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@8a5adc16]]

--Step 2
--Mayor Mode ---------------------------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kPuckButtonMySim)

tutorial_button_set(a,tutorial_buttons.kPuckButtonMySim)

a.zoomLevel = 0; --entire tile
set_camera(a, 45, 40)

a.instruction_msg = [[text@CC10267C]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@8a5adc16]]

--Step 3
--My Sim Mode ---------------------------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a)

a.zoomLevel = 0; --entire tile
set_camera(a, 45, 40)

a.instruction_msg = [[text@CC10267D]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@8a5adc16]]


 ---Using this Tutorial ------------------------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a)
a.zoomLevel = 0;
set_camera(a, 45, 40)

a.instruction_msg = [[text@CC10267E]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 2
--Where Should We Start? ---------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kPuckButtonMayor)

tutorial_button_set(a, tutorial_buttons.kPuckButtonMayor)
a.zoomLevel = 0;
set_camera(a, 45, 40)

a.instruction_msg = [[text@CC10267F]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]




--Select Zone R-Low Tool
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonLowDensityResidential)

--a.window_offsetX = 10
--a.window_offsetY = -20
--a.no_edge_scroll = 1

a.zoomLevel = 1;
--set_camera(a, 37, 37)

tutorial_button_set(a,
tutorial_buttons.kButtonLowDensityResidential, tutorial_buttons.kButtonZoneResidential,
tutorial_buttons.kButtonZoneTools,
tutorial_buttons.kPuckButtonMayor)

a.instruction_msg = [[text@CC102680]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--Zone R-low ------------------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_ask_to_zone_and_check(tutorial_zone_type.kZoneTypeLowDensityResidential,30,87,44,107)

a.zoomLevel = 2; 


tutorial_button_set(a, 
tutorial_buttons.kButtonLowDensityResidential,
tutorial_buttons.kButtonZoneResidential,
tutorial_buttons.kButtonZoneTools,
tutorial_buttons.kPuckButtonMayor)


a.instruction_msg = [[text@CC102681]]  
a.try_again_msg = [[text@0xaa5adc1d]] 
a.congratulation_msg = [[text@0x8a5adc16]]


--Explain plop vs zone ------------------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_do_nothing()

a.zoomLevel = 1; 


tutorial_button_set(a)


a.instruction_msg = [[text@CC102683]]  
a.try_again_msg = [[text@0xaa5adc1d]] 
a.congratulation_msg = [[text@0x8a5adc16]]



--skipping this one?
--Adding an Arrow with this step
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonCoalPlant)

a.zoomLevel = 2; 
set_camera(a, 48, 98) 

tutorial_button_set(a,
tutorial_buttons.kButtonCoalPlant,
tutorial_buttons.kButtonUtilsPowerBldg,
tutorial_buttons.kButtonUtilitiesTools,
tutorial_buttons.kPuckButtonMayor)

--a.instruction_msg = [[IS THIS STEP WORKING?]]  
a.instruction_msg = [[text@CC102684]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Adding an Arrow with this step
a = tutorial_create_task("2c2ba444")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonCoalPlant)

a.zoomLevel = 2; 
set_camera(a, 48, 98) 

tutorial_button_set(a,
tutorial_buttons.kButtonCoalPlant,
tutorial_buttons.kButtonUtilsPowerBldg,
tutorial_buttons.kButtonUtilitiesTools,
tutorial_buttons.kPuckButtonMayor)

a.instruction_msg = [[text@CC102684]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--Need Power ----------
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kCoalPowerPlant
         ,45,103,48,106)

a.zoomLevel = 2; 
set_camera(a, 48, 98) 

tutorial_button_set(a,
tutorial_buttons.kButtonCoalPlant,
tutorial_buttons.kButtonUtilsPowerBldg,
tutorial_buttons.kButtonUtilitiesTools,
tutorial_buttons.kPuckButtonMayor)

a.instruction_msg = [[text@CC102684]] 
a.try_again_msg = [[text@0xaa5adc1d]] 
a.congratulation_msg = [[text@0x8a5adc16]]

--Coal Plant Good------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing_but_blinking()

tutorial_button_set(a)

a.zoomLevel = 2;
set_camera(a, 48, 98) 

a.instruction_msg = [[text@CC102685]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Adding an Arrow with this step
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonLightIndustrial)

a.zoomLevel = 1; 

tutorial_button_set(a, 
tutorial_buttons.kButtonLightIndustrial,
tutorial_buttons.kButtonZoneIndustrial,
tutorial_buttons.kButtonZoneTools,
tutorial_buttons.kPuckButtonMayor)

a.instruction_msg = [[text@CC102686]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Zone I-med-------------------------------------------------------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_ask_to_zone_and_check(tutorial_zone_type.kZoneTypeLightIndustrial
   ,31,60,41,73)

a.zoomLevel = 2; --want to see R zone for context.
--set_camera(a, 59, 37)

tutorial_button_set(a, 
tutorial_buttons.kButtonLightIndustrial,
tutorial_buttons.kButtonZoneIndustrial,
tutorial_buttons.kButtonZoneTools,
tutorial_buttons.kPuckButtonMayor)

a.instruction_msg = [[text@CC102686]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Zones Need to Be Connected ------------------------------------------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_do_nothing_but_blinking()

tutorial_button_set(a)
a.zoomLevel = 1; --too close?

a.instruction_msg = [[text@CC102687]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]



--Streets vs Roads-----------------------------------
a = tutorial_create_task("ec2ba4ef")
a.task_action = tutorial_do_nothing_but_blinking()

tutorial_button_set(a)
a.zoomLevel = 1; --too close?

a.instruction_msg = [[text@CC102689]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Adding an Arrow with this step
a = tutorial_create_task("6c2ba507")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonPlaceRoadItem)

a.zoomLevel = 1; 
set_camera(a, 43, 77) 


tutorial_button_set(a,
tutorial_buttons.kButtonPlaceRoadItem,
tutorial_buttons.kButtonPlaceRoad, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.instruction_msg = [[text@CC10268A]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Building Roads----
a = tutorial_create_task("6c2ba507")
a.task_action = tutorial_ask_to_draw_network_and_check(tutorial_network_type.kRoad , 35,74,35,87)

a.zoomLevel = 2; 
set_camera(a, 43, 77) 


tutorial_button_set(a,
tutorial_buttons.kButtonPlaceRoadItem, 
tutorial_buttons.kButtonPlaceRoad, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor)

a.instruction_msg = [[text@CC10268A]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

---Two Birds with One Zone 
a = tutorial_create_task("ea39d200")
a.task_action = tutorial_do_nothing_but_blinking()

tutorial_button_set(a)
set_camera(a, 43, 77) --same as previous

a.zoomLevel = 1;

a.instruction_msg = [[text@CC10268B]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]
--Adding an Arrow with this step
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonLowDensityCommercial)

a.zoomLevel = 2; 
set_camera(a, 32, 77) 

tutorial_button_set(a, 
tutorial_buttons.kButtonLowDensityCommercial,
tutorial_buttons.kButtonZoneCommercial,
tutorial_buttons.kButtonZoneTools,
tutorial_buttons.kPuckButtonMayor)

a.instruction_msg = [[text@CC10268C]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

------Zone C-low----- 
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_zone_and_check(tutorial_zone_type.kZoneTypeLowDensityCommercial
   ,31,74,34,86)

a.zoomLevel = 2; 
set_camera(a, 32, 77) 

tutorial_button_set(a, 
tutorial_buttons.kButtonLowDensityCommercial,
tutorial_buttons.kButtonZoneCommercial,
tutorial_buttons.kButtonZoneTools,
tutorial_buttons.kPuckButtonMayor)

a.instruction_msg = [[text@CC10268C]]  
a.try_again_msg = [[text@0xaa5adc1d]] 
a.congratulation_msg = [[text@0x8a5adc16]]

--Now we're in business
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing_but_blinking()

tutorial_button_set(a)

a.zoomLevel = 2; 

a.instruction_msg = [[text@CC10268D]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Moving Around (Zoom In) 

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonZoomIn)

tutorial_button_set(a,
tutorial_buttons.kButtonZoomIn)

a.zoomLevel = 2;  --same as previous

a.instruction_msg = [[text@CC10268E]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Zoom Out 
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing_but_blinking()

tutorial_button_set(a,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2; --same as previous

a.instruction_msg = [[text@CC10268F]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Scroll -----------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing_but_blinking()

tutorial_button_set(a,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2; --same as previous

a.instruction_msg = [[text@CC102690]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Speed Control (pause)---------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonSimPause)

tutorial_button_set(a,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.no_edge_scroll = 1
a.zoomLevel = 2;

a.instruction_msg = [[text@CC102691]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--Game Paused ----
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonSimSlow)

tutorial_button_set(a,
tutorial_buttons.kButtonSimSlow)

a.zoomLevel = 2;
a.no_edge_scroll = 1

a.instruction_msg = [[text@CC102693]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]
--Education is Important -------------- -------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing_but_blinking()


tutorial_button_set(a, 
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;

a.instruction_msg = [[text@CC102694]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Adding an Arrow with this step
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonK8SmallSchool)

tutorial_button_set(a,
tutorial_buttons.kButtonK8SmallSchool,
tutorial_buttons.kButtonCivicEducation,
tutorial_buttons.kButtonCivicTools, 
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)
a.zoomLevel = 2;

a.instruction_msg = [[text@CC102695]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Build an Elementary School --------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kK8SmallSchool
         ,27,97,29,98)
tutorial_button_set(a,
tutorial_buttons.kButtonK8SmallSchool,
tutorial_buttons.kButtonCivicEducation,
tutorial_buttons.kButtonCivicTools, 
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)
a.zoomLevel = 2;

a.instruction_msg = [[text@CC102695]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Services -------------- ------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing_but_blinking()


tutorial_button_set(a, 
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;

a.instruction_msg = [[text@CC102696]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--Fire!----------------------------------------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_trigger_fire(45,103,48,106)
--   ,45,103,48,106)
tutorial_button_set(a,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;
set_camera(a, 60, 101) 

a.instruction_msg = [[text@CC102697]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--Adding an Arrow with this step
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonSmallFireStation)

tutorial_button_set(a,
tutorial_buttons.kButtonSmallFireStation,
tutorial_buttons.kButtonCivicFire,
tutorial_buttons.kButtonCivicTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 3;

a.instruction_msg = [[text@CC102698]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 41 --- Add a Fire Station  ------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kSmallFireStation
   ,29,74,30,74)

tutorial_button_set(a,
tutorial_buttons.kButtonSmallFireStation,
tutorial_buttons.kButtonCivicFire,
tutorial_buttons.kButtonCivicTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 3;

a.instruction_msg = [[text@CC102698]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Dispatch Fire Truck--------------------------------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonFireDispatch)

tutorial_button_set(a,
tutorial_buttons.kButtonFireDispatch,
tutorial_buttons.kButtonDisasterTools,
tutorial_buttons.kButtonRotateCounterClockwise,
tutorial_buttons.kButtonRotateClockwise,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 3; --good zoom?
set_camera(a, 48, 101) --good spot?

a.instruction_msg = [[text@CC102699]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


-- Step 43 --- Fire Dispatch Continued  -------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_dispatch_and_check(tutorial_dispatch_type.kDispatchTypeFire,
   44,102,49,107)
   --coal plant at: 45,103,48,106
tutorial_button_set(a,
tutorial_buttons.kButtonFireDispatch,
tutorial_buttons.kButtonDisasterTools,
tutorial_buttons.kButtonRotateCounterClockwise,
tutorial_buttons.kButtonRotateClockwise,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 3;
set_camera(a,48,101)

a.instruction_msg = [[text@CC10269A]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--Waiting for fire to finish !?!?
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_wait_for_fire_finished()

tutorial_button_set(a,
tutorial_buttons.kButtonFireDispatch,
tutorial_buttons.kButtonDisasterTools,
tutorial_buttons.kButtonRotateCounterClockwise,
tutorial_buttons.kButtonRotateClockwise,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;
set_camera(a,48,101)

a.instruction_msg = [[text@CC10269B]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]



--Click Advisors panel
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonAdvisor)

a.zoomLevel = 1; 

tutorial_button_set(a,
tutorial_buttons.kButtonAdvisor,tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.instruction_msg = [[text@CC10269C]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--7 advisors
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonAdvisorCityPlanner)

a.zoomLevel = 1; 

tutorial_button_set(a,tutorial_buttons.kButtonAdvisorCityPlanner,
tutorial_buttons.kButtonAdvisor,tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.instruction_msg = [[text@CC10269D]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--City Planner
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing_but_blinking()

a.zoomLevel = 1; 

tutorial_button_set(a,tutorial_buttons.kButtonAdvisorCityPlanner,
tutorial_buttons.kButtonAdvisor,tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.instruction_msg = [[text@CC10269E]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


---- Last step ------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing()


tutorial_button_set(a,
tutorial_buttons.kButtonDisasterTools,
tutorial_buttons.kButtonRotateCounterClockwise,
tutorial_buttons.kButtonRotateClockwise,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;

a.instruction_msg = [[text@CC10269F]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]




--IMPORTANT! ----------------------------------------------------------------------------------------------------------------------------------------------
-- Every tutorial file must end with this like using appropriate tutorial GUID.
tutorial_registry : set_task_range_and_print_info(tutorial_guid, task_first, tutorialtasks.n-task_first+1)
----------------------------------------------------------------------------------------------------------------------------------------------------------------



