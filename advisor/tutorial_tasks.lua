dofile('tutorial_data.lua')
dofile('tutorial_registry.lua')

-- IMPORTANT! ---------------------------------------------------------------------------------------------------------------
-- Every tutorial file must begin wtih this using uniq GUID
local tutorial_guid, task_first = "8a5b7a6c", tutorialtasks.n + 1
--------------------------------------------------------------------------------------------------------------------------

--- Step 1 --- Introduction ------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
-- for now just move in to any available house
a.task_action = tutorial_do_nothing()
-- setting butttons enabled at this task.
tutorial_button_set(a
)
a.zoomLevel = 0;
set_camera(a, 45, 40)


a.instruction_msg = [[text@0x0a611599]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@8a5adc16]]


--- Step 2 --- Intro Cont'd  ------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a)

a.zoomLevel = 2;
set_camera(a, 65, 44)

a.instruction_msg = [[text@0x8a5ab2e2]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 3 --- Zoom Control ---------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonZoomIn)

tutorial_button_set(a,
tutorial_buttons.kButtonZoomIn)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x2a5ab2eb]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 4 --- Zoom Control Cont'd ------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing_but_blinking()

tutorial_button_set(a,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x2a611857]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 5 --- Scrolling --------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing_but_blinking()

tutorial_button_set(a,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;

a.instruction_msg = [[text@0xaa61184d]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step  6 --- Play with Time  ---------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonSimSlow)

tutorial_button_set(a,
tutorial_buttons.kButtonSimSlow)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x2a5ab377]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step  6.1 --- Play with Time  :: skip the first toggle of the Pause button   ----------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonSimPause)

tutorial_button_set(a,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x0a61161a]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 7 --- Play with Time (cont'd) ---------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonSimPause)

tutorial_button_set(a,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x0a61161a]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 8 --- Explain Sim Speed --------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing_but_blinking()

tutorial_button_set(a,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonZoomOut,
tutorial_buttons.kButtonZoomIn)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x8a611615]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step  9 --- Query Objects ----------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonQueryTools)

tutorial_button_set(a,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 3;
set_camera(a, 60, 44)

a.instruction_msg = [[text@0x2a5ab2f4]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 10 --- Query Objects ---------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing_but_blinking()

tutorial_button_set(a,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 3;

a.instruction_msg = [[text@0x2a5ab308]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 11 --- Adding Power -------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kNaturalPowerPlant
         ,66,60,69,63)

tutorial_button_set(a,
tutorial_buttons.kButtonNaturalPlant,
tutorial_buttons.kButtonUtilsPowerBldg,
tutorial_buttons.kButtonUtilitiesTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 3;
set_camera(a, 68, 60)

a.instruction_msg = [[text@0x2a5ab316]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 12 --- Explain Power --------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing_but_blinking()

tutorial_button_set(a,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 3;

a.instruction_msg = [[text@0x8a5ab2fd]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 13  --- Adding Water -----------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kWaterTower
         ,73,43,73,43)

tutorial_button_set(a,
tutorial_buttons.kButtonUtilsWaterTower,
tutorial_buttons.kButtonUtilsWaterBldg,
tutorial_buttons.kButtonUtilitiesTools, 
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)
   
a.zoomLevel = 2;

a.instruction_msg = [[text@0x8a5ab320]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 14  --- About water ----------------------------------------------------------------------------------------

a = tutorial_create_task("6a389535")
a.task_action = tutorial_do_nothing()

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

a.instruction_msg = [[text@0x6a61160e]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 15 --- About Zoning---------------------------------------------------------------------------------

a = tutorial_create_task("6a389535")
a.task_action = tutorial_do_nothing()

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

a.instruction_msg = [[text@0x8a5ab32a]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 16 --- Zone Residential ---------------------------------------------------------------------------------------

a = tutorial_create_task("6a389535")
a.task_action = tutorial_ask_to_zone_and_check(tutorial_zone_type.kZoneTypeMediumDensityResidential
   ,81,45,92,59)

tutorial_button_set(a, 
tutorial_buttons.kButtonMediumDensityResidential,
tutorial_buttons.kButtonZoneResidential,
tutorial_buttons.kButtonZoneTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;
set_camera(a, 92, 48)
--- set_camera(a , (a.task_action.startX+a.task_action.endX)/2-1,
--- (a.task_action.startZ+a.task_action.endZ)/2+2)

a.instruction_msg = [[text@0x8a5ab332]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 17 --- About Residential ------------------------------------------------------------------------------------

a = tutorial_create_task("6a389535")
a.task_action = tutorial_do_nothing()

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

a.instruction_msg = [[text@0x2a611606]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 18 --- Zone Industrial -----------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_zone_and_check(tutorial_zone_type.kZoneTypeHeavyIndustrial
   ,66,45,74,59)

tutorial_button_set(a,
tutorial_buttons.kButtonHeavyIndustrial,
tutorial_buttons.kButtonZoneIndustrial,
tutorial_buttons.kButtonZoneTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;
set_camera(a, 73, 48)

a.instruction_msg = [[text@0x8a5ab33b]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 19 --- Zone Commercial ----------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_zone_and_check(tutorial_zone_type.kZoneTypeLowDensityCommercial
   ,75,45,80,53)

tutorial_button_set(a,
tutorial_buttons.kButtonLowDensityCommercial ,
tutorial_buttons.kButtonZoneCommercial,
tutorial_buttons.kButtonZoneTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;
set_camera(a, 81, 45)

a.instruction_msg = [[text@0x8a5ab344]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 20 --- RCI 1  -----------------------------------------------------------------------------------------------
a = tutorial_create_task("0a39f624")

a.task_action = tutorial_draw_arrow_at(tutorial_buttons.kButtonRCIIndustrial,0,0)

tutorial_button_set(a,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x8a5ab34c]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 21 --- Play with Time  ---------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonSimMed)

tutorial_button_set(a,
tutorial_buttons.kButtonSimMed)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x6a6115ff]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 22 --- Mayor Options ---------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x8a5aec60]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 23 --- More Services ---------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing_but_blinking()

tutorial_button_set(a,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x8a5ab359]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 24 --- More Services ----------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing_but_blinking()

tutorial_button_set(a,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x8a5ab35f]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 25 --- Add a Road --------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked_no_arrow(tutorial_buttons.kButtonPlaceRoadItem)

tutorial_button_set(a,
tutorial_buttons.kButtonPlaceRoadItem,
tutorial_buttons.kButtonPlaceRoad,
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x8a5ab367]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 26 --- Add a Road Continued  ---------------------------------------------------------

a = tutorial_create_task("ea39d200")
a.task_action = tutorial_ask_to_draw_network_and_check(tutorial_network_type.kRoad , 72,60,92,60)

tutorial_button_set(a,
tutorial_buttons.kButtonPlaceRoadItem, 
tutorial_buttons.kButtonPlaceRoad, 
tutorial_buttons.kButtonTransportationTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x8a5aec5e]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 27 --- Explain Roads ---------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing_but_blinking()

tutorial_button_set(a,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x8a5ab36f]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 28 --- K8 School -------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing_but_blinking()

tutorial_button_set(a,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x6a60bde9]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 29 --- K8 School Cont'd ----------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kK8SmallSchool
         ,76,41,77,43)

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
   
a.zoomLevel = 1;

a.instruction_msg = [[text@0xaa5aec29]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 30 --- Explain School Coverage ----------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonQueryTools)

tutorial_button_set(a,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 1;

a.instruction_msg = [[text@0x8a5aec27]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step  31 --- Explain School Coverage--------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_dispatch_and_check(tutorial_dispatch_type.kDispatchTypeFire,
   75,40,78,44)

--- note, the above action looks wrong, but it's not. It's meant to highlight the school to allow it to be seen easier for Query purposes.
--- this was done instead of coding a new action (such as tutorial_ask_to_highlight_and_check).
tutorial_button_set(a,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 1;

a.instruction_msg = [[text@0xaa5aec26]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 32 --- Sims Opinion Polls -------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_draw_arrow_at(tutorial_buttons.kButtonOpinion,300,90)

tutorial_button_set(a,
tutorial_buttons.kButtonOpinion, 
tutorial_buttons.kPuckButtonMayor,  
tutorial_buttons.kButtonZoomIn,  
tutorial_buttons.kButtonZoomOut,  
tutorial_buttons.kButtonSimSlow)

a.zoomLevel = 3;

a.instruction_msg = [[text@0xaa5ae76a]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@6a4ad76a]]


--- Step  33 --- Mayor Rating ---------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_draw_arrow_at(tutorial_buttons.kButtonMayorRating,-25,10)

tutorial_button_set(a,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonMayorRating,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed
)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x8a5ae76d]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@6a4ad76a]]


--- Step 34 --- Budget -----------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing()
tutorial_button_set(a,  
tutorial_buttons.kPuckButtonMayor,  
tutorial_buttons.kButtonZoomIn,  
tutorial_buttons.kButtonZoomOut,  
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed
)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x8a5aec24]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@6a4ad76a]]


--- Step 35 ---Budget Details ---------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonBudget)
tutorial_button_set(a,  
tutorial_buttons.kButtonBudget,  
tutorial_buttons.kPuckButtonMayor,  
tutorial_buttons.kButtonZoomIn,  
tutorial_buttons.kButtonZoomOut,  
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x8a5aec1f]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@6a4ad76a]]


--- Step 36 --- More Budget Details -----------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action =  tutorial_draw_arrow_at(tutorial_buttons.kButtonBudget,320,20)

tutorial_button_set(a,  
tutorial_buttons.kButtonBudget,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonExpandBudget1,
tutorial_buttons.kButtonExpandBudget2,
tutorial_buttons.kButtonExpandBudget3,
tutorial_buttons.kButtonExpandBudget4,
tutorial_buttons.kButtonExpandBudget5,
tutorial_buttons.kButtonExpandBudget6
)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x8a5aec22]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@6a4ad76a]]


--- Step 37 --- Data Views --------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonDataView)

tutorial_button_set(a,
tutorial_buttons.kButtonDataView,
tutorial_buttons.kButtonBudget,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonExpandBudget1,
tutorial_buttons.kButtonExpandBudget2,
tutorial_buttons.kButtonExpandBudget3,
tutorial_buttons.kButtonExpandBudget4,
tutorial_buttons.kButtonExpandBudget5,
tutorial_buttons.kButtonExpandBudget6
)

a.zoomLevel = 2;

a.instruction_msg = [[text@0xea610133]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@6a4ad76a]]


--- Step 38 --- Data View Continued -------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
--a.task_action = tutorial_draw_arrow_at(tutorial_buttons.kButtonDataViewOptionGroup,-100,-10)
a.task_action = tutorial_draw_arrow_at("0x00005007",0,-50)

tutorial_button_set(a,
tutorial_buttons.kButtonDataViewOptionGroup,
tutorial_buttons.kButtonDataView,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonExpandDataView1,
tutorial_buttons.kButtonExpandDataView2,
tutorial_buttons.kButtonExpandDataView3,
tutorial_buttons.kButtonExpandDataView4,
tutorial_buttons.kButtonExpandDataView5,
tutorial_buttons.kButtonExpandDataView6
)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x8a5ae9f7]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@6a4ad76a]]


--- Step 39 --- Parks, Deals, Rewards -----------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action =  tutorial_do_nothing()

tutorial_button_set(a,  
tutorial_buttons.kButtonBudget,
tutorial_buttons.kButtonDataView,
tutorial_buttons.kButtonDataViewOptionGroup,
tutorial_buttons.kButtonOpinion, 
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonExpandBudget1,
tutorial_buttons.kButtonExpandBudget2,
tutorial_buttons.kButtonExpandBudget3,
tutorial_buttons.kButtonExpandBudget4,
tutorial_buttons.kButtonExpandBudget5,
tutorial_buttons.kButtonExpandBudget6,
tutorial_buttons.kButtonExpandDataView1,
tutorial_buttons.kButtonExpandDataView2,
tutorial_buttons.kButtonExpandDataView3,
tutorial_buttons.kButtonExpandDataView4,
tutorial_buttons.kButtonExpandDataView5,
tutorial_buttons.kButtonExpandDataView6
)

a.zoomLevel = 2;

---new GUID needed
a.instruction_msg = [[text@0xca5ae9f5]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@6a4ad76a]]


--- Step 40 --- Fire Starts  -------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_trigger_fire(66,60,69,63)

tutorial_button_set(a,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 3;
set_camera(a, 90, 60)

a.instruction_msg = [[text@0x8a5adbdb]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 41 --- Add a Fire Station  ------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_plop_and_check(tutorial_building_type.kSmallFireStation
   ,80,42,80,43)

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

a.instruction_msg = [[text@0x8a5adbe8]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 42 --- Fire Dispatch  ------------------------------------------------------------------------------

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

a.zoomLevel = 4;
set_camera(a,68,60)

a.instruction_msg = [[text@0xaa5adbf4]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 43 --- Fire Dispatch Continued  -------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_dispatch_and_check(tutorial_dispatch_type.kDispatchTypeFire,
   65,59,70,64)

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

a.zoomLevel = 4;
set_camera(a,68,60)

a.instruction_msg = [[text@0x8a5adbff]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 44 --- Wait for Fire to Be Put Out  -----------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_wait_for_fire_finished()

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

a.zoomLevel = 4;

a.instruction_msg = [[text@0x8a5adc07]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Step 45 --- Conclusion  ------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kButtonRotateCounterClockwise,
tutorial_buttons.kButtonRotateClockwise,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonSimSlow,
tutorial_buttons.kButtonSimFast,
tutorial_buttons.kButtonSimMed,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 1;
set_camera(a , 73,43 )

a.instruction_msg = [[text@0x8a5adc0e]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--IMPORTANT! ----------------------------------------------------------------------------------------------------------------------------------------------
-- Every tutorial file must end with this like using appropriate tutorial GUID.
tutorial_registry : set_task_range_and_print_info(tutorial_guid, task_first, tutorialtasks.n-task_first+1)
----------------------------------------------------------------------------------------------------------------------------------------------------------------





