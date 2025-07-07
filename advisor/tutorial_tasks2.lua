dofile('tutorial_data.lua')
dofile('tutorial_registry.lua')

-- IMPORTANT! ---------------------------------------------------------------------------------------------------------------
-- Every tutorial file must begin wtih this using uniq GUID
local tutorial_guid, task_first = "ea5d6dc8", tutorialtasks.n + 1
--------------------------------------------------------------------------------------------------------------------------

--- Step 1 --- Introduction ------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
-- for now just move in to any available house
a.task_action = tutorial_do_nothing()

tutorial_button_set(a)

a.zoomLevel = 0;

a.instruction_msg = [[text@0x8a5adc24]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]


--- Step 2 ---------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a)

a.zoomLevel = 0;

a.instruction_msg = [[text@0x8a5adc2a]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]


--- Step 3 -------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a)

a.zoomLevel = 0;

a.instruction_msg = [[text@0xaa5ae470]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]


--- Step 4 -----------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonTerraform)

tutorial_button_set(a,
tutorial_buttons.kButtonTerraform,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 0;

a.instruction_msg = [[text@0x8a5ae472]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]


--- Step 5 ------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonMountain)

tutorial_button_set(a,
tutorial_buttons.kButtonMountain,
tutorial_buttons.kButtonGodMountain,
tutorial_buttons.kButtonTerraform,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 0;

a.instruction_msg = [[text@0x8a5ae474]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]

--- Step 6 ------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action =  tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kButtonMountain,
tutorial_buttons.kButtonGodMountain,
tutorial_buttons.kButtonTerraform,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 0;

a.instruction_msg = [[text@0x8a5ae474]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]


--- Step 7 ------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action =  tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kButtonMountain,
tutorial_buttons.kButtonGodMountain,
tutorial_buttons.kButtonTerraform,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 0;

a.instruction_msg = [[text@0xaa5adc30]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]


--- Step 8 -------------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonSteepValley)

tutorial_button_set(a,
tutorial_buttons.kButtonSteepValley,
tutorial_buttons.kButtonGodValley,
tutorial_buttons.kButtonTerraform,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 0;

a.instruction_msg = [[text@0x8a5ae4ab]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]

--- Step 9 -------------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action =  tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kButtonSteepValley,
tutorial_buttons.kButtonGodValley,
tutorial_buttons.kButtonTerraform,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 0;

a.instruction_msg = [[text@0x8a5ae4ab]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]


--- Step 10 ----------------------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonErode)

tutorial_button_set(a,
tutorial_buttons.kButtonErode,
tutorial_buttons.kButtonTerrainEffects,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 0;

a.instruction_msg = [[text@0x8a5ae72d]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]

--- Step 11 ----------------------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action =  tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kButtonErode,
tutorial_buttons.kButtonTerrainEffects,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 0;

a.instruction_msg = [[text@0x8a5ae72d]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]


--- Step 12 ------------------------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonGodFlora)

tutorial_button_set(a,
tutorial_buttons.kButtonGodFlora,
tutorial_buttons.kButtonTerraform,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 3;

a.instruction_msg = [[text@0x8a5ae4b0]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]

--- Step 13 ------------------------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action =  tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kButtonGodFlora,
tutorial_buttons.kButtonTerraform,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 3;

a.instruction_msg = [[text@0x8a5ae4b0]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]


--- Step 14 ---------------------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonFaunaWildAnimal)

tutorial_button_set(a,
tutorial_buttons.kButtonFaunaWildAnimal,
tutorial_buttons.kButtonGodFauna,
tutorial_buttons.kButtonTerraform,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 4;

a.instruction_msg = [[text@0x8a5ae4b6]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]

--- Step 15 ---------------------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action =  tutorial_do_nothing_but_blinking()

tutorial_button_set(a,
tutorial_buttons.kButtonFaunaWildAnimal,
tutorial_buttons.kButtonGodFauna,
tutorial_buttons.kButtonTerraform,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 4;

a.instruction_msg = [[text@0x8a5ae4b6]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]

--- Step 16  ---------------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonGodNightOnly)

tutorial_button_set(a,
tutorial_buttons.kButtonGodDayNight,    
tutorial_buttons.kButtonGodDayOnly,
tutorial_buttons.kButtonGodDayNightCycle,
tutorial_buttons.kButtonGodNightOnly,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 3;

a.instruction_msg = [[text@0x8a5ae723]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]

--- Step 16  ---------------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonGodDayNightCycle)

tutorial_button_set(a,
tutorial_buttons.kButtonGodDayNight,    
tutorial_buttons.kButtonGodDayOnly,
tutorial_buttons.kButtonGodDayNightCycle,
tutorial_buttons.kButtonGodNightOnly,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 3;

a.instruction_msg = [[text@0x8a5ae723]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]

--- Step 16  ---------------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonGodDayOnly)

tutorial_button_set(a,
tutorial_buttons.kButtonGodDayNight,    
tutorial_buttons.kButtonGodDayOnly,
tutorial_buttons.kButtonGodDayNightCycle,
tutorial_buttons.kButtonGodNightOnly,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 3;

a.instruction_msg = [[text@0x8a5ae723]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]

--- Step 16  ---------------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action =  tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kButtonGodDayNight,    
tutorial_buttons.kButtonGodDayOnly,
tutorial_buttons.kButtonGodDayNightCycle,
tutorial_buttons.kButtonGodNightOnly,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 3;

a.instruction_msg = [[text@0x8a5ae723]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]


--- Step 18 --------------------------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonCauseDisaster)

tutorial_button_set(a,
tutorial_buttons.kButtonCauseDisaster,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x8a5ae727]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]


--- Step 19 ------------------------------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonGodTornado)

tutorial_button_set(a,
tutorial_buttons.kButtonGodTornado,
tutorial_buttons.kButtonCauseDisaster,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x8a5ae729]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]

--- Step 19 ------------------------------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kButtonGodTornado,
tutorial_buttons.kButtonCauseDisaster,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2;

a.instruction_msg = [[text@0x8a5ae729]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]


--- Step 20 --------------------------------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonReconcile)

tutorial_button_set(a,
tutorial_buttons.kButtonReconcile,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 0;

a.instruction_msg = [[text@0x4a91e4c6]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]


--- Step 21 ---------------------------------------------------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kPuckButtonGod,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 0;

a.instruction_msg = [[text@0x8a5ae72b]]
a.try_again_msg = [[text@ea4ad695]]
a.congratulation_msg = [[text@8a5adc16]]

--IMPORTANT! ----------------------------------------------------------------------------------------------------------------------------------------------
-- Every tutorial file must end with this like using appropriate tutorial GUID.
tutorial_registry : set_task_range_and_print_info(tutorial_guid, task_first, tutorialtasks.n-task_first+1)
----------------------------------------------------------------------------------------------------------------------------------------------------------------



