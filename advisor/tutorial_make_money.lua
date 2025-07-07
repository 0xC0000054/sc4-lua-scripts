dofile('tutorial_data.lua')
dofile('tutorial_registry.lua')

-- IMPORTANT! ---------------------------------------------------------------------------------------------------------------
-- Every tutorial file must begin wtih this using uniq GUID
local tutorial_guid, task_first = "0bfdb71b", tutorialtasks.n + 1
--------------------------------------------------------------------------------------------------------------------------

--start with 2000 pop, 50K simoleans in bank, school, what other buildings, and in PAUSE mode----




--- Step 1 --- WELCOME 
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a)

a.zoomLevel = 0;
set_camera(a, 60, 50) 

a.instruction_msg = [[text@CC1026B4]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--Step 2------------
--Bleeding Money------------------------------------------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonBudget)

tutorial_button_set(a,tutorial_buttons.kButtonBudget,tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 1;
set_camera(a, 87,82) 

a.instruction_msg = [[text@CC1026B5]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]



--$ per month------------------------------------------
a = tutorial_create_task("0c0c327f")
a.task_action = tutorial_do_nothing()
--switch it to make a big arrow blinking at the right spot?
--a.task_action = tutorial_draw_arrow_at(tutorial_buttons.kButtonExpandBudget2,0,0)

tutorial_button_set(a,tutorial_buttons.kButtonBudget,tutorial_buttons.kPuckButtonMayor)

a.zoomLevel = 1;
set_camera(a, 87,82)
--<font color="#3F4967">

a.instruction_msg = [[text@CC1026B6]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@8a5adc16]]


--- Step 4 --- 
--Query School -------------------------------------------------------------------

a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonQueryTools)

tutorial_button_set(a,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2; --zoom in on school
set_camera(a, 110,99) --jump to school

a.instruction_msg = [[text@CC1026B7]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 5 ---
--Reduce Local School Funding------------------------------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_dispatch_and_check(tutorial_dispatch_type.kDispatchTypeFire,
   106,100,107,101)
--trick above to highlight school

   
tutorial_button_set(a,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

set_camera(a, 110,99)
a.zoomLevel = 2;
a.window_offsetX = -500

a.instruction_msg = [[text@CC1026B8]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--- Step 6 --- 
-- Query Clinic ------------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonQueryTools)

tutorial_button_set(a,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kButtonSimPause,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2; --zoom in on clinic
set_camera(a, 108,103) --jump to clinic

a.instruction_msg = [[text@CC1026B9]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]



--Step 6
--Reduce Local Clinic Funding------------------------------------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_ask_to_dispatch_and_check(tutorial_dispatch_type.kDispatchTypeFire,
   104,104,104,105)
   --trick above to highlight clinic for query click
 
   
tutorial_button_set(a,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

set_camera(a, 108,103) --jump to clinic
a.zoomLevel = 2;
a.window_offsetX = -500


a.instruction_msg = [[text@CC1026BA]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 7
--Take a look at budget again
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 1; --
set_camera(a, 106,78) --
--<img src="sc4://image/46a006b0/14416330_IncomeExpense_Budget.PNG">
a.instruction_msg = [[text@CC1026BB]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--Step 8
--Too Much, Too Soon  ------------------------------------------------------------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kButtonQueryTools,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2; 
set_camera(a, 85,60) 

a.instruction_msg = [[text@CC1026BC]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--Select Demolish tool-----------
a = tutorial_create_task("2c0c2e14")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonDemolish)

tutorial_button_set(a,
tutorial_buttons.kButtonDemolish,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 3; 
set_camera(a, 74,56) 

a.instruction_msg = [[text@CC1026BD]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]



--Demolish Water Pump-----------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_ask_to_demolish_and_check(70,58,70,58) -- coords of water pump

tutorial_button_set(a,
tutorial_buttons.kButtonDemolish,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 4; --good zoom for this step?
set_camera(a, 72,57) --can see water pump?

a.instruction_msg = [[text@CC1026BE]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Watch pump demolish NEW STEP-----------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 4; 
set_camera(a, 72,57) --can see water pump

a.instruction_msg = [[text@0c1e7725]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--This step adds an arrow
--Select Demolish tool-----------
a = tutorial_create_task("2c0c2e14")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonDemolish)

tutorial_button_set(a,
tutorial_buttons.kButtonDemolish,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2; 
set_camera(a, 95,80) 


a.instruction_msg = [[text@CC1026BF]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

-- Too Much, Too Soon, Demolish Fire Station  -------
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_ask_to_demolish_and_check(91,83,92,85) 

tutorial_button_set(a,
tutorial_buttons.kButtonDemolish,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2; --good zoom for this step?
set_camera(a, 95,80) --can see fire and police stations? 


a.instruction_msg = [[text@CC1026BF
 <HTML><HEAD></HEAD>
<BODY background="sc4://image/46a006b0/14416264_html_TextBG_General.png">
<font color="#3F4967" face="Arta" size="4"> 
Remove Fire Station
<p>
<i>
The fire coverage and police protection in this town are top notch, but guess what? They're costing you a bunch of money each month and you don't really need them yet. 
<br> </i> Remember: 
<i>
<br> - Place your first small Fire Station when you have your first fire, not before.
<br> - Place your first small Police Station when crime starts to become a problem.
<br>
</i> Select the Demolish tool and click on the Fire Station. 
</FONT></BODY>
<!-- legacy id=0xca8d8595 winflag_visible=no winflag_enabled=no href="sc4://action/next_tutorial" -->
</HTML>]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--This step adds an arrow
--Select Demolish tool-----------
a = tutorial_create_task("2c0c2e14")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonDemolish)

tutorial_button_set(a,
tutorial_buttons.kButtonDemolish,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2; --good zoom for this step?
set_camera(a, 87,82) --can see fire and police stations?


a.instruction_msg = [[text@CC1026C0]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

-- Demolish Police Station
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_ask_to_demolish_and_check(87,85,89,87) --coords of POLICE station

tutorial_button_set(a,
tutorial_buttons.kButtonDemolish,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2; --good zoom for this step?
set_camera(a, 87,82) --can see fire and police stations?


a.instruction_msg = [[text@CC1026C0
 <HTML><HEAD></HEAD>
<BODY background="sc4://image/46a006b0/14416264_html_TextBG_General.png">
<font color="#3F4967" face="Arta" size="4"> 
Demolish Police Station
<p>
<i>
Crime won't be a problem in this town until it grows a bit bigger. With a larger population we could probably afford a police station. But we're not there yet.
<p>
</i>
Select the Demolish tool and click on the Police Station to demolish it. 
</FONT></BODY>
<!-- legacy id=0xca8d8595 winflag_visible=no winflag_enabled=no href="sc4://action/next_tutorial" -->
</HTML>]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--This step adds an arrow
--Select Demolish tool-----------
a = tutorial_create_task("2c0c2e14")
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonDemolish)

tutorial_button_set(a,
tutorial_buttons.kButtonDemolish,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2; 
set_camera(a, 106,56) 


a.instruction_msg = [[text@CC1026C1]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

-- Demolish Landmark
a = tutorial_create_task("4bd87fb8")
a.task_action = tutorial_ask_to_demolish_and_check(100,57,107,62) --put in coords of Landmark

tutorial_button_set(a,
tutorial_buttons.kButtonDemolish,
tutorial_buttons.kPuckButtonMayor,
tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 2; 
set_camera(a, 106,56) 


a.instruction_msg = [[text@CC1026C1
<HTML><HEAD></HEAD>
<BODY background="sc4://image/46a006b0/14416264_html_TextBG_General.png">
<font color="#3F4967" face="Arta" size="4"> 
Demolish Landmark
<p>
<i>
The California Plaza is certainly a lovely building, but guess what?
<p> It is costing us $100 a month. Landmarks beautify a city and even help commercial desirability. But they don't make sense when we're losing money every month.
<p> Time to take it down.
<p>
</i>
Click on Demolish tool and then click on California Plaza to demolish it. 
</FONT></BODY>
<!-- legacy id=0xca8d8595 winflag_visible=no winflag_enabled=no href="sc4://action/next_tutorial" -->
</HTML>]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]

--Step 14
--Positive Cash Flow  ------------------------------------------------------------
a = tutorial_create_task("4bd87fb8")
--a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonExpandTaxes1)
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonExpandBudget2)
--is this the right expand button to use? Can it figure out the flashing to get to it? 
--kButtonExpandBudget1: expand arrow
--kButtonExpandBudget2:  budget panel
--kButtonExpandBudget3:  Monthly Budget text


--Had a.task_action = tutorial_draw_arrow_at(tutorial_buttons.kButtonExpandBudget5,0,0) in my old attempt.
-- need this to get out of taxes window: tutorial_buttons.kButtonTaxesAccept

tutorial_button_set(a, tutorial_buttons.kButtonBudget, tutorial_buttons.kPuckButtonMayor,  tutorial_buttons.kButtonExpandBudget1, tutorial_buttons.kButtonExpandBudget2, tutorial_buttons.kButtonExpandBudget3, tutorial_buttons.kButtonExpandBudget4, tutorial_buttons.kButtonExpandBudget5, tutorial_buttons.kButtonExpandBudget6,tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 1; 
set_camera(a, 106,56) --same as landmark

a.instruction_msg = [[text@CC1026C2
<HTML><HEAD></HEAD>
<BODY background="sc4://image/46a006b0/14416264_html_TextBG_General.png">
<font color="#3F4967" face="Arta" size="4"> 
Postive Cash Flow
<p>
<i> Hey Mayor, take a look at the budget now. Our monthly income is FINALLY more than we're spending. 
<p> </i> We did it!<i> We balanced the budget and we're making some money.
<p> But let's look at one more thing: </i>Taxes<i>.
This is where the city gets almost all of its income. 
<p>
Click the Budget Panel to expand it.
</FONT></BODY>
<!-- legacy id=0xca8d8595 winflag_visible=no winflag_enabled=no href="sc4://action/next_tutorial" -->
</HTML>]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]
--change the above to "no" "no, once I get the expand budget thing working XXX

--ADD in "Grow our Population" step? I don't think so....
-- zone more R, hit speed 3, watch the budget, click to continue


--Look at tax income  ------------------------------------------------------------
a = tutorial_create_task("4bd87fb8")

--a.task_action = tutorial_do_nothing()
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonExpandTaxes1)
--is this the right expand button to use? Can it figure out the flashing to get to it? Or do I need to break it up into:
-- 1. Expand budget
-- 2. Expand taxes

a.window_offsetX = -530
--a.window_offsetY = -20

tutorial_button_set(a, tutorial_buttons.kButtonBudget, tutorial_buttons.kPuckButtonMayor,  tutorial_buttons.kButtonExpandBudget1, tutorial_buttons.kButtonExpandTaxes1, tutorial_buttons.kButtonZoomIn, tutorial_buttons.kButtonZoomOut)

a.zoomLevel = 1; 
set_camera(a, 106,56) --same as landmark

a.instruction_msg = [[text@CC1026C3
 <HTML><HEAD></HEAD>
<BODY background="sc4://image/46a006b0/14416264_html_TextBG_General.png">
<font color="#3F4967" face="Arta" size="4"> 
Income from Taxes
<p>
<i> Look at the money we are earning from the Residential (R), Commericial (C), and Industrial (I) sectors.
<p>
</i> Remember: Taxes are your main source of money.
<i>
<p> Clicking on the little eye next to the taxes opens up the tax details. That is where you can change all the tax rates. 
<p>
</i>
Click on the little eye next to the taxes to continue.
</FONT></BODY>
<!-- legacy id=0xca8d8595 winflag_visible=no winflag_enabled=no href="sc4://action/next_tutorial" -->
</HTML>]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--Look at the large new tax window  ------------------------------------------------------------
a = tutorial_create_task("4bd87fb8")

--a.task_action = tutorial_do_nothing()
a.task_action = tutorial_check_button_clicked(tutorial_buttons.kButtonAcceptTaxes)

--a.window_offsetX = -530
--a.window_offsetY = -20

tutorial_button_set(a, tutorial_buttons.kButtonBudget, tutorial_buttons.kPuckButtonMayor,  tutorial_buttons.kButtonAcceptTaxes,  tutorial_buttons.kButtonZoomIn, tutorial_buttons.kButtonZoomOut, kButtonExpandTaxes1)

a.zoomLevel = 1; 
set_camera(a, 106,56) --same as landmark

a.instruction_msg = [[text@CC1026C4
 <HTML><HEAD></HEAD>
<BODY background="sc4://image/46a006b0/14416264_html_TextBG_General.png">
<font color="#3F4967" face="Arta" size="4"> 
Tax Rates
<p>
<i> This is the window where you can change ALL of the tax rates. The higher the tax rate and the higher population, the more money the city earns. But be careful, if you raise taxes too much it can scare folks off. <br> Lowering taxes for a certain group can make your city more attractive to that group. For example, when your city is better educatated you might want to discourage Dirty Industry (I-D) by raising the tax rates for that group.
<p>
</i>
Click Accept to close the tax window.
</FONT></BODY>
<!-- legacy id=0xca8d8595 winflag_visible=no winflag_enabled=no href="sc4://action/next_tutorial" -->
</HTML>]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]


--- Last Step-------------
a = tutorial_create_task("0a39f624")
a.task_action = tutorial_do_nothing()

tutorial_button_set(a, tutorial_buttons.kPuckButtonMayor, tutorial_buttons.kButtonZoomIn,
tutorial_buttons.kButtonZoomOut, tutorial_buttons.kButtonTaxesAccept)

a.zoomLevel = 1; 
set_camera(a, 106,56)

a.instruction_msg = [[text@CC1026C5 <HTML><HEAD></HEAD>
<BODY background="sc4://image/46a006b0/14416264_html_TextBG_General.png">
<font color="#3F4967" face="Arta" size="4"> 
Good Work! You've completed this tutorial.
<p>
<i> 
Remember these steps in a new city, and you'll be rolling in cash in no time:
<br> - Make local funding match your needs
<br> - Don't build structures until you need them
<br> - Taxes are your main source of income
<p> Try playing this city and building it up to 20,000 Sims! Hint: Start by zoning some more Residential zones.
<p>
</i>Click Exit Tutorial<i>.  You may continue playing this city or return to the Region View to play another city.
</FONT></BODY>
<!-- legacy id=0xca8d8595 winflag_visible=no winflag_enabled=no href="sc4://action/next_tutorial" -->
</HTML>]]
a.try_again_msg = [[text@0xaa5adc1d]]
a.congratulation_msg = [[text@0x8a5adc16]]



--- Step 3 --- ZONING -Low first, high later -----------------------------------------------------------------------------
--a = tutorial_create_task("0a39f624")
--a.task_action = tutorial_check_button_clicked(tutorial_buttons.kPuckButtonMayor)

--tutorial_button_set(a,
--tutorial_buttons.kPuckButtonMayor)

--a.zoomLevel = 0;

--a.instruction_msg = [[<HTML><HEAD></HEAD>
--<BODY background="sc4://image/46a006b0/14416264_html_TextBG_General.png">
--<font color="#3F4967" face="Arta" size="4"> 
--Zoning -Low first, high later
--Looks like the mayor of this town didn't play the "Getting Started" Tutorial. Although its too late to do anything about it now, notice how the whole city is zoned at High Density. This costs FIVE times as much as zoning at Low Density. Not to mention that at the population we have right now, we won't get any big buildings for many years to come. What a waste of Simoleans.
--Remember: First, Zone Low. Later, Zone High.

--</FONT></BODY>
--<!-- legacy id=0xca8d8595 winflag_visible=no winflag_enabled=no href="sc4://action/next_tutorial" -->
--</HTML> ]]
--a.try_again_msg = [[text@0xaa5adc1d]]
--a.congratulation_msg = [[text@0x8a5adc16]]

--IMPORTANT! ----------------------------------------------------------------------------------------------------------------------------------------------
-- Every tutorial file must end with this like using appropriate tutorial GUID.
tutorial_registry : set_task_range_and_print_info(tutorial_guid, task_first, tutorialtasks.n-task_first+1)
----------------------------------------------------------------------------------------------------------------------------------------------------------------