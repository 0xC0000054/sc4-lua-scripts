dofile('tutorial_data.lua')
dofile('tutorial_registry.lua')

-- IMPORTANT! ---------------------------------------------------------------------------------------------------------------
-- Every tutorial file must begin wtih this using uniq GUID
local tutorial_guid, task_first = "cc02d3a3", tutorialtasks.n + 1
--------------------------------------------------------------------------------------------------------------------------

--Start from a city of 20-30K population with a good cash flow; all low density and sprawling    

--Step 1 ---------------------------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_do_nothing()
---Click Continue to Begin
tutorial_button_set(a,
tutorial_buttons.kButtonSimMed)
a.no_edge_scroll = 1
a.zoomLevel = 0; --entire tile
set_camera(a, 68, 62)

a.instruction_msg = [[text@0x6c1d60ce]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 2 ---------------------------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_do_nothing()
---Click Continue to Begin
tutorial_button_set(a,
tutorial_buttons.kButtonSimMed)
a.no_edge_scroll = 1
a.zoomLevel = 0; --entire tile
set_camera(a, 68, 62)

a.instruction_msg = [[text@0x6C1D60CF]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 3 ---Build Out, Then UP ------------------------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_ask_to_dispatch_and_check(tutorial_dispatch_type.kDispatchTypeFire,
   73,36,85,53)
      --65,43,83,70)
--- note, the above action looks wrong, but it's not.  It's meant to highlight the school to allow it to be seen easier for Query purposes.
--- this was done instead of coding a new action (such as tutorial_ask_to_highlight_and_check).
---click to continue
a.no_edge_scroll = 1
tutorial_button_set(a,
tutorial_buttons.kButtonSimMed)
a.zoomLevel = 0;
set_camera(a, 68, 62)

a.instruction_msg = [[text@0x6C1D60D0]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 4 ---Build Up, then out 2 ---------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonMediumDensityResidential)
---Zone the indicated area Medium Density Residential
a.zoomLevel = 2;
a.no_edge_scroll = 1
set_camera(a, 85,43)

tutorial_button_set(a, 
tutorial_buttons.kButtonMediumDensityResidential,
tutorial_buttons.kButtonZoneResidential,
tutorial_buttons.kButtonZoneTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimMed)

a.instruction_msg = [[text@0x6C1D60D1]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 5 ---Build Up, then out 3 ---------
a = tutorial_create_task("4bd87fb8")
--a.task_action = tutorial_ask_to_zone_and_check(tutorial_zone_type.kZoneTypeMediumDensityResidential,70,48,78,65)
a.task_action = tutorial_ask_to_zone_and_check(tutorial_zone_type.kZoneTypeMediumDensityResidential,73,36,85,48)
---Zone the indicated area Medium Density Residential
a.zoomLevel = 2;
a.no_edge_scroll = 1
set_camera(a, 85,43)

tutorial_button_set(a, 
tutorial_buttons.kButtonMediumDensityResidential,
tutorial_buttons.kButtonZoneResidential,
tutorial_buttons.kButtonZoneTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimMed)

a.instruction_msg = [[text@0x6C1D60D1]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 6 ---Higher Density Needs Water ---------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonUtilsWaterPump)
---Place a large water pump building in the location shown
a.zoomLevel = 2;
set_camera(a, 86, 48)
a.no_edge_scroll = 1
tutorial_button_set(a,
tutorial_buttons.kButtonUtilsWaterPump,
tutorial_buttons.kButtonUtilsWaterBldg,
tutorial_buttons.kButtonUtilitiesTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimMed)

a.instruction_msg = [[text@0x6C1D60D2]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 7 ---Higher Density Needs Water 2 ---------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kWaterPump,76,56,76,56)
---Place a large water pump building in the location shown
a.zoomLevel = 2;
set_camera(a, 86, 48)
a.no_edge_scroll = 1
tutorial_button_set(a,
tutorial_buttons.kButtonUtilsWaterPump,
tutorial_buttons.kButtonUtilsWaterBldg,
tutorial_buttons.kButtonUtilitiesTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimMed)

a.instruction_msg = [[text@0x6C1D60D2]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 8 ---Remeber - add water---------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing()
a.zoomLevel = 2;
set_camera(a, 86, 48)
a.no_edge_scroll = 1
tutorial_button_set(a, 
tutorial_buttons.kButtonDesirability,
tutorial_buttons.kButtonDataView ,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimMed)

a.instruction_msg = [[text@0x6C1D60D3]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 9 --Higher Wealth Sims Want Services, Nice Conditions------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonDataView )
a.zoomLevel = 2;
set_camera(a, 86, 48)
a.no_edge_scroll = 1
tutorial_button_set(a, 
tutorial_buttons.kButtonDesirability,
tutorial_buttons.kButtonDataView ,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimMed)

a.instruction_msg = [[text@0x6C1D60D4]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 9a --Higher Wealth Sims Want Services, Nice Conditions------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonDesirability)
a.zoomLevel = 2;
set_camera(a, 86, 48)
a.no_edge_scroll = 1
tutorial_button_set(a, 
tutorial_buttons.kButtonDesirability,
tutorial_buttons.kButtonDataView ,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimMed)

a.instruction_msg = [[text@0x6C1D60D4]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 10 ---Desirability - R§ ------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonR3Desirability)
---Select the R§§§ Desirability view
a.zoomLevel = 0;
set_camera(a, 96, 59)
a.no_edge_scroll = 1
tutorial_button_set(a, 
tutorial_buttons.kButtonR3Desirability,
tutorial_buttons.kButtonDesirability,
tutorial_buttons.kButtonDataView ,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimMed)

a.instruction_msg = [[text@0x6C1D60D5]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 11 ---Desirability - R§§§ ----------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonBudget)
a.zoomLevel = 0;
a.no_edge_scroll = 1
tutorial_button_set(a,
tutorial_buttons.kButtonBudget,
tutorial_buttons.kButtonSimMed)
set_camera(a, 96, 59)

a.instruction_msg = [[text@0x6C1D60D6]] 
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 12 ---Desirability - R§§§ 2 ----------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_dispatch_and_check(tutorial_dispatch_type.kDispatchTypeFire,11,46,23,67)
--- note, the above action looks wrong, but it's not.  It's meant to highlight the school to allow it to be seen easier for Query purposes.
--- this was done instead of coding a new action (such as tutorial_ask_to_highlight_and_check).
a.zoomLevel = 0;
a.no_edge_scroll = 1
tutorial_button_set(a,
tutorial_buttons.kButtonSimMed)
set_camera(a, 70, 68)

a.instruction_msg = [[text@0x6C1D60D7]] 
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 13 ---Place a park ----------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonCivicParkSmallParkGreen)
---Select the park from the Civic menu and place on the flashing grid
a.zoomLevel = 2;
a.no_edge_scroll = 1
set_camera(a, 23,51)

tutorial_button_set(a,
tutorial_buttons.kButtonCivicParkSmallParkGreen,
tutorial_buttons.kButtonCivicParkRec,
tutorial_buttons.kButtonCivicTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimMed)

a.instruction_msg = [[text@0x6C1D60D8]] 
a.try_again_msg = [[text@0xaa5adc1d]] 
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 14 ---Place a park 2----------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kSmallParkGreen,19,54,19,54)
---Select the park from the Civic menu and place on the flashing grid
a.zoomLevel = 2;
a.no_edge_scroll = 1
set_camera(a, 23,51)

tutorial_button_set(a,
tutorial_buttons.kButtonCivicParkSmallParkGreen,
tutorial_buttons.kButtonCivicParkRec,
tutorial_buttons.kButtonCivicTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimMed)

a.instruction_msg = [[text@0x6C1D60D8]] 
a.try_again_msg = [[text@0xaa5adc1d]] 
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 15 ---Increasing Desirability------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing_but_blinking()
---Do nothing, continue
tutorial_button_set(a,
tutorial_buttons.kButtonSimMed)
set_camera(a, 23,51)
a.zoomLevel = 2;
a.no_edge_scroll = 1

a.instruction_msg = [[text@0x6C1D60D9]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 16 ---Increased Desirability 2 ------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonDataView)
---Select the R§§§ Desirability view
set_camera(a, 23,51)
a.zoomLevel = 2;
a.no_edge_scroll = 1
tutorial_button_set(a, 
tutorial_buttons.kButtonR3Desirability,
tutorial_buttons.kButtonDesirability,
tutorial_buttons.kButtonDataView ,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimMed)

a.instruction_msg = [[text@0x6C1D60DA]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 17 ---Increasing Desirability 3 ------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing()
tutorial_button_set(a,
tutorial_buttons.kButtonSimMed)
a.zoomLevel = 2;
set_camera(a, 23,51)
a.no_edge_scroll = 1

a.instruction_msg = [[text@0x6C1D60DB]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 18 ---Increasing Desirability 4 ------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonShowRCIDemandGraph)
---Click on RCI meter to open Demand Detail
tutorial_button_set(a,
tutorial_buttons.kButtonShowRCIDemandGraph,
tutorial_buttons.kButtonSimMed)
a.zoomLevel = 2;
set_camera(a, 23,51)
a.no_edge_scroll = 1

a.instruction_msg = [[text@0x6C1D60DC]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 19 ---The Demand Graph-----------------------------------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kCloseDataGraph)
---Close RCI graph
tutorial_button_set(a,
tutorial_buttons.kCloseDataGraph,
tutorial_buttons.kButtonSimMed)
a.zoomLevel = 2;
set_camera(a, 23,51)
a.window_offsetX = -500
a.no_edge_scroll = 1

a.instruction_msg = [[text@0x6C1D60DD]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 20 ---Invest In Your Sims - Educate Them -----------------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonK8SmallSchool)
---Place an elementary school on the flashing squares
set_camera(a, 19,59)
a.zoomLevel = 2;
a.no_edge_scroll = 1
tutorial_button_set(a,
tutorial_buttons.kButtonK8SmallSchool,
tutorial_buttons.kButtonCivicEducation,
tutorial_buttons.kButtonCivicTools, 
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimMed)

a.instruction_msg = [[text@0x6C1D60DE]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 21 ---Invest In Your Sims - Educate Them -----------------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kK8SmallSchool,10,64,11,66)
---Place an elementary school on the flashing squares
set_camera(a, 19,59)
a.zoomLevel = 2;
a.no_edge_scroll = 1
tutorial_button_set(a,
tutorial_buttons.kButtonK8SmallSchool,
tutorial_buttons.kButtonCivicEducation,
tutorial_buttons.kButtonCivicTools, 
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimMed)

a.instruction_msg = [[text@0x6C1D60DE]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 22 ---Build A High School-----------------------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonHighSchool)
---place a high school on the flashing squares
set_camera(a, 19,59)
a.zoomLevel = 2;
a.no_edge_scroll = 1
tutorial_button_set(a,
tutorial_buttons.kButtonHighSchool,
tutorial_buttons.kButtonCivicEducation,
tutorial_buttons.kButtonCivicTools, 
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimMed)

a.instruction_msg = [[text@0x6C1D60DF]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 23 ---Build A High School 2 -----------------------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kHighSchool,13,64,16,67)
---place a high school on the flashing squares
set_camera(a, 19,59)
a.zoomLevel = 2;
a.no_edge_scroll = 1
tutorial_button_set(a,
tutorial_buttons.kButtonHighSchool,
tutorial_buttons.kButtonCivicEducation,
tutorial_buttons.kButtonCivicTools, 
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimMed)

a.instruction_msg = [[text@0x6C1D60DF]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 24 ---Education takes time-----------------------------------
a = tutorial_create_task("ac0e92ca")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonSimFast)
---Select Cheetah speed
set_camera(a, 19,59)
a.zoomLevel = 2;
a.no_edge_scroll = 1
tutorial_button_set(a,
tutorial_buttons.kButtonSimFast)

a.instruction_msg = [[text@0x6C1D60E0]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 25 ---Build A Hospitall-----------------------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonHospital)
---place a hospital on the flashing squares
set_camera(a, 18,56)
a.zoomLevel = 1;
a.no_edge_scroll = 1
tutorial_button_set(a,
tutorial_buttons.kButtonHospital,
tutorial_buttons.kButtonCivicHealth,
tutorial_buttons.kButtonCivicTools, 
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimFast)

a.instruction_msg = [[text@0x6C1D60E1]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 26 ---Build A Hospitall 2 -----------------------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kHospital,33,47,36,49)
---place a hospital on the flashing squares
set_camera(a, 18,56)
a.zoomLevel =1;
a.no_edge_scroll = 1
tutorial_button_set(a,
tutorial_buttons.kButtonHospital,
tutorial_buttons.kButtonCivicHealth,
tutorial_buttons.kButtonCivicTools, 
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimFast)

a.instruction_msg = [[text@0x6C1D60E1]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 27 ---Check Desirability again ------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonDataView)
---Select the R§§§ Desirability view
set_camera(a, 18,56)
a.zoomLevel = 1;
a.no_edge_scroll = 1
tutorial_button_set(a, 
tutorial_buttons.kButtonR3Desirability,
tutorial_buttons.kButtonDesirability,
tutorial_buttons.kButtonDataView ,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimFast)

a.instruction_msg = [[text@0x6C1D60E2]]  
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 28 ---Things are looking up ---------------------------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_do_nothing()
---Click Continue
tutorial_button_set(a,
tutorial_buttons.kButtonSimFast)
a.zoomLevel = 0; 
a.no_edge_scroll = 1
set_camera(a, 45, 40)

a.instruction_msg = [[text@0x6C1D60E3]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 29 ---Check Demand Again---
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonShowRCIDemandGraph)
---Click on RCI meter to open Demand Detail
tutorial_button_set(a,
tutorial_buttons.kButtonShowRCIDemandGraph,
tutorial_buttons.kButtonSimFast)
a.zoomLevel = 0; 
set_camera(a, 45, 40)
a.no_edge_scroll = 1

a.instruction_msg = [[text@0x6C1D60E4]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

---Step 30 ---Demand is Up!-----------------------
a = tutorial_create_task("8c0e9a44")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kCloseDataGraph)
---Close RCI graph
tutorial_button_set(a,
tutorial_buttons.kCloseDataGraph,
tutorial_buttons.kButtonSimFast)
a.zoomLevel = 0;
set_camera(a, 45, 40)
a.window_offsetX = -500
a.no_edge_scroll = 1

a.instruction_msg = [[text@0x6C1D60E5]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

---Step 31 ---Keep At It --------------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing()
---exit tutorial
tutorial_button_set(a,
tutorial_buttons.kButtonSimFast)
set_camera(a, 45, 40)
a.zoomLevel = 0;
a.no_edge_scroll = 1

a.instruction_msg = [[text@0x6C1D60E7]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--IMPORTANT! ----------------------------------------------------------------------------------------------------------------------------------------------
-- Every tutorial file must end with this like using appropriate tutorial GUID.
tutorial_registry : set_task_range_and_print_info(tutorial_guid, task_first, tutorialtasks.n-task_first+1)
----------------------------------------------------------------------------------------------------------------------------------------------------------------


