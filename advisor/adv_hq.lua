-----------------------------------------------------------------------------------------
-- This file defines advices for the the HQ 
dofile("_adv_sys.lua") 
dofile("_adv_advice.lua") 
dofile("adv_game_data.lua") 

-- helper funcition
function create_advice_hq_with_base(guid_string, base_advice)
   local a =  advices : create_advice(tonumber(guid_string, 16), base_advice)
   a.type   = advice_types . HEALTH_EDUCATION
   return a
end

-- helper funcition
function create_advice_hq(guid_string)
   local a =  create_advice_hq_with_base(guid_string, nil)
   return a
end
--
--

----------------------------------------------------------------------
-- Advice fields 

--type      = advice_types . cityplanning,
--mood      = advice_moods . NEUTRAL,
--priority  = 100,
--title        = "UNDEFINED title : from base advice structure",
--message = "UNDEFINED message : from base advice structure",
--frequency   = 35, -- in days
--timeout   = 45, -- in days
--trigger   = "1",
--once   = 1, -- trigger the advice only once
-- news_only = 0, -- set to 1 for news-flipper messages only 
-- event = 0, -- this has to be a valid event ID (see const file for the event table.)

------------ Advice record ----
a = create_advice_hq('ea355ed8')

a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_2 and game.g_num_schools < 1 and game.g_num_clinics < 1"
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = "text@0a89d144Greetings from The Dean of Health and Education"
a.message   = [[text@0a89d14dHello Mayor #name#. I’m Bettina Dean, your Health and Education Advisor. You can call me Ms. Dean. I’ll let you know when our city’s education and health needs are not being met. Right now, for example, #city# doesn’t have a single <a href="#link_id#game.tool_plop_building(building_tool_types.SMALL_SCHOOL)">school</a> or even a <a href="#link_id#game.tool_plop_building(building_tool_types.URGENT_CARE_CLINIC)">clinic</a> and folks have started moving into town. Do you want a city of sick illiterates? I know that I do not! It takes time for Sims’ health and education levels to improve, so get moving NOW!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

--Clinic strikes
a = create_advice_hq('6aabf0ff')
a.event = game_events.HEALTH_STRIKE_STARTED 
a.trigger  = "0" 
a.title   = "text@6aabf13d No Bandage Blues: #City# Clinic Workers Walk"
a.message   = [[text@4aabf1a9Mayor, I know that medical issues often end up on the bottom of your agenda, but not today. There's a general strike at #city# hospitals/clinics, and that will make our healthcare capabilities an open wound. Let's not risk quality medical care at the expense of a few dollars. Increase health funding now and return those workers to their posts before disaster occurs.]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.BAD_JOB
a.effects = effects.HEALTH_STRIKE



--No Bandage Blues: #City# Hospital Workers Walk
a = create_advice_hq('ea5e97a8')
a.event = game_events.HEALTH_STRIKE_STARTED 
a.trigger  = "game.g_health_strike>0" 
a.title   = "text@8a565562No Bandage Blues: #City# Hospital Workers Walk"
a.message   = [[text@2a565569Mayor, I know that medical issues often end up on the bottom of your agenda, but not today. There's a general strike at #city# hospitals/clinics, and that will make our healthcare capabilities an open wound. Let's not risk quality medical care at the expense of a few dollars. Increase health funding now and return those workers to their posts before disaster occurs.]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.BAD_JOB
a.effects = effects.HEALTH_STRIKE


--Teachers Take Long Recess: They Strike
a = create_advice_hq('0a5e79a1')
a.event = game_events.SCHOOL_STRIKE_STARTED 
a.trigger  = "game.g_school_strike>0"
a.title   = "text@6a56561bTeachers Take Long Recess: They Strike"
a.message   = [[text@4a56561fMayor, you may think a teacher's strike is a joke, but here's the real punch line: without teachers in our schools, our city will be filled with citizens without a brain in their heads. Maybe that's who first elected you, but that's because they couldn't read. Give your teachers the money they request, and get them back in front of our students. Teachers are the real heroes in the war on ignorance.]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.BAD_JOB
a.effects = effects.EDUCATION_STRIKE


--Librarians Strike
a = create_advice_hq('eaabfe7e')
a.event = game_events.SCHOOL_STRIKE_STARTED 
a.trigger  = "0"
a.title   = "text@8aabfe88"
a.message   = [[text@aaabfe93]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.BAD_JOB
a.effects = effects.EDUCATION_STRIKE

--Museum Strikes
a = create_advice_hq('eaac049a')
a.event = game_events.SCHOOL_STRIKE_STARTED 
a.trigger  = "0"
a.title   = "text@0aac0428"
a.message   = [[text@caac0434]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.BAD_JOB
a.effects = effects.EDUCATION_STRIKE



--Medical Staffs Might Catch No-Funding Flu
a = create_advice_hq('2a7131c7')
a.trigger  = "game.g_health_strike_chance > tuning_constants.STRIKE_LOW"
a.title   = "text@2a56556d"
a.message   = [[text@aa565572 There are rumblings of a healthcare strike in #city#, Mayor, as ugly a rumor as I know. And to think it would only take a simple sweep of your pen to produce the necessary funding to avert a strike. Should disabled grandmothers go without walkers, should premature babies suffer neglect, should pain be ignored? Don't look away from the facts, Mayor--<a href="#link_id#game.window_budget(budget_window_types.HEALTH)">fund healthcare<a/> or face the consequences.]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.BAD_JOB


--Don't Catch Cold In #City#: Good Healthcare On Vacation
a = create_advice_hq('aa71327e')
a.trigger  = "game.ga_health_grade < tuning_constants.HEALTH_GRADE_LOW and game.g_population > tuning_constants.POPULATION_STEP_3 and (game.g_num_hospitals > 0 or game.g_num_clinics >0)"
a.title   = "text@2a565578"
a.message   = [[text@ca56557b]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.BAD_JOB


--I'm OK, You're OK: Healthcare Deemed OK
a = create_advice_hq('ca713330')
a.trigger  = "game.g_health_funding_p <   tuning_constants.FUNDING_HIGH and game.g_health_funding_p >   tuning_constants.FUNDING_MEDIUM"
a.title   = "text@ca56557f"
a.message   = [[text@6a565582]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL


--Off The Charts: Healthcare Hits New Highs
a = create_advice_hq('ea7133a1')
a.trigger  = "game.g_health_funding_p >  tuning_constants.FUNDING_HIGH and game.ga_health_grade > 4 and game.g_health_coverage_p >  tuning_constants.HEALTH_POP_SERVED_HIGH"
a.title   = "text@ea565587"
a.message   = [[text@2a56558c]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.GREAT_JOB


--Playing Havoc With Health: No Hospitals In #City#
a = create_advice_hq('0a71340d')
a.trigger  = "game.g_num_hospitals < 1 and game.g_num_clinics < 1 and game.g_population > tuning_constants.POPULATION_STEP_6"
a.title   = "text@ca565590"
a.message   = [[text@6a565595]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL



--Sims Hale and Hearty, And Happy For It
a = create_advice_hq('8a7135af')
a.trigger  = "game.ga_life_exp > tuning_constants.LE_HIGH and game.g_population > tuning_constants.POPULATION_STEP_5 "
a.title   = "text@2a5655a5"
a.message   = [[text@8a5655aa]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.GREAT_JOB

--Impatient Patients Waiting For Care
a = create_advice_hq('0a713604')
a.trigger  = "game.ga_health_grade < tuning_constants.HEALTH_GRADE_LOW and game.g_num_hospitals > 0"
a.title   = "text@aa5655ae"
a.message   = [[text@8a5655b3]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
--a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL

--Sick City Clamors For Clinics
a = create_advice_hq('8a7136b9')
a.trigger  = "game.g_health_coverage_p <  tuning_constants.HEALTH_POP_SERVED_LOW and game.g_num_clinics < 1 and game.g_num_hospitals < 1 and game.g_population >  tuning_constants.POPULATION_STEP_6 + 3000"
a.title   = "text@ea5655b7"
a.message   = [[text@8a5655c0]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.BAD_JOB


--No Hospitals, No Health, No Hope
a = create_advice_hq('8a71380b')
a.trigger  = "game.g_num_hospitals < 1  and game.g_num_clinics < 1 and game.g_population > tuning_constants.POPULATION_STEP_5 and game.g_health_coverage_p < tuning_constants.HEALTH_POP_SERVED_MEDIUM"
a.title   = "text@aa5655c4"
a.message   = [[text@ea5655c7]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.BAD_JOB


--Stacks Of Cash No Help To Health
a = create_advice_hq('6a7138fe')
a.trigger  = "(game.g_num_hospitals > 0 or game.g_num_clinics > 0) and game.g_health_coverage_p <  tuning_constants.HEALTH_POP_SERVED_LOW and game.g_funds > 50000 and game.g_population > tuning_constants.POPULATION_STEP_4 "
a.title   = "text@ea5655ca"
a.message   = [[text@ea5655cf]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL


--Local Hospital Pockets Picked
a = create_advice_hq('2a71398d')
a.trigger  = "game.l_hospital_funding_l < tuning_constants.FUNDING_LOW and game.g_num_hospitals > 0 and game.l_hospital_grade_l < tuning_constants.HQ_GRADE_HIGH "
a.title   = "text@ea5655d2"
a.message   = [[text@2a5655d6]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.BAD_JOB


--Fat Wallet Has Hospital Putting On The Ritz
a = create_advice_hq('ea713a20')
a.trigger  = "game.g_num_hospitals > 1 and game.l_hospital_funding_l > tuning_constants.FUNDING_EXCESSIVE and game.l_hospital_grade_l > tuning_constants.HQ_GRADE_HIGH"
a.title   = "text@2a5655da"
a.message   = [[text@4a5655de]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL

--Bad Bugs Riddle Section of City
a = create_advice_hq('2a713a6f')
a.trigger  = "game.l_tract_life_exp_l <  tuning_constants.LE_MEDIUM_LOW and game.trend_slope(game_trends.GA_HQ, tuning_constants.TREND_SHORT) < tuning_constants.SLOPE_DOWN and game.g_income_monthly - game.g_expense_monthly > 500"
a.title   = [[text@ea5655e3]]
a.message   = [[text@4a5655e7]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL


--#City# Health Ascending; Sickness Slinking to Corner
a = create_advice_hq('ea713b19')
a.trigger  = "game.ga_health > tuning_constants.HQ_MEDIUM and game.trend_slope(game_trends.GA_HQ,tuning_constants.TREND_MEDIUM) >  tuning_constants.SLOPE_UP"
a.title   = [[text@8a5655ea]]
a.message   = [[text@2a5655f2]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.GREAT_JOB

--Sims Making Early Eternal Exits
a = create_advice_hq('6a713b8c')
a.trigger  = "game.ga_life_exp < tuning_constants.LE_LOW and game.g_population > tuning_constants.POPULATION_STEP_3 and game.trend_value(game.ga_life_exp,12) > .8 * (game.ga_life_exp)"
a.title   = [[text@ca5655f6]]
a.message   = [[text@ca5655f9]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = 30
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.BAD_JOB

--Sims Lacking In Lifespan
a = create_advice_hq('aa7134de')
a.trigger  = "game.ga_life_exp < tuning_constants.LE_MEDIUM and game.g_population > tuning_constants.POPULATION_STEP_3 and game.g_health_coverage_p < tuning_constants.HEALTH_POP_SERVED_LOW and game.ga_health_grade < tuning_constants.HQ_GRADE_MEDIUM"

a.title   = "text@6a56559a"
a.message   = [[text@ca56559f]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.BAD_JOB



--#city# Medical Coverage Improving

a = create_advice_hq('0a713c1a')
a.trigger  = "game.trend_slope(game_trends.G_POPULATION_HEALTH_COVERAGE, tuning_constants.TREND_MEDIUM) > tuning_constants.SLOPE_UP and game.ga_health_grade > 4"
a.title   = [[text@aa5655fd]]
a.message   = [[text@8a565601]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL


--Sawbones Shortage Threatens Treatments
a = create_advice_hq('0a713d14')
a.trigger  = "game.trend_slope(game_trends.G_POPULATION_HEALTH_COVERAGE, tuning_constants.TREND_MEDIUM) < tuning_constants.SLOPE_DOWN_DOWN"
a.title   = [[text@ca565605]]
a.message   = [[text@0a56560a]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL

--No Diplomas In Sight In #City#
a = create_advice_hq('aa713d86')
a.trigger  = "game.g_num_schools == 0 and game.g_population > tuning_constants.POPULATION_STEP_3"
a.title   = [[text@6a56560e]]
a.message   = [[text@aa565618]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL

--Teachers Threaten To Drop The Chalk And Walk
a = create_advice_hq('aa713e17')
a.trigger  = "game.g_school_strike_chance > tuning_constants.STRIKE_LOW"
a.title   = [[text@2a565623]]
a.message   = [[text@0a565627]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.BAD_JOB

--Schools Treading Water; Cash Means Sink Or Swim

a = create_advice_hq('4a713e74')
a.trigger  = "game.g_education_funding_p < tuning_constants.FUNDING_MEDIUM and game.g_num_educational_buildings > 0 and game.ga_school_grade < tuning_constants.ED_GRADE_HIGH"
a.title   = [[text@ca56562a]]
a.message   = [[text@8a56562f]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL

--Everybody's A Scholar In #City#
a = create_advice_hq('6a713ee8')
a.trigger  = "game.ga_school_grade > tuning_constants.ED_GRADE_LOW and game.g_population > tuning_constants.POPULATION_STEP_5 and game.g_education_coverage_p > tuning_constants.EDUC_POP_SERVED_HIGH and game.ga_education > tuning_constants.EQ_MEDIUM"
a.title   = [[text@2a565634]]
a.message   = [[text@0a565639]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.GREAT_JOB


--Even The Teachers Can't Spell At #City# Schools
a = create_advice_hq('4a883ea3')
a.trigger  = "game.ga_school_grade < tuning_constants.ED_GRADE_LOW and game.g_population > tuning_constants.POPULATION_STEP_4 and game.g_education_coverage_p > tuning_constants.EDUC_POP_SERVED_MEDIUM and game.g_education_funding_p < tuning_constants.FUNDING_LOW"
a.title   = [[text@aa56563d]]
a.message   = [[text@4a565640]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL



--A School Lacking In Tools
a = create_advice_hq('0a8848da')
a.trigger  = "0"
--disabled for EP1 & deluxe becaue was targeting private schools (which can't be acted upon)
--"game.l_school_grade_l < tuning_constants.ED_GRADE_LOW and game.g_population > tuning_constants.POPULATION_STEP_4 and game.g_num_schools > 2"
a.title   = [[text@2a565652]]
a.message   = [[text@4a565655]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL




--Sims Look, But No Books: Library Lacking
a = create_advice_hq('0a884ac1')
a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_7 and game.g_num_libraries < 1"
a.title   = [[text@8a56572b]]
a.message   = [[text@8a56572e]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL



--Dumber: Posts Or Sims? Study Shows Equal Ignorance In #City#
--ADD L_EQ_... etc
a = create_advice_hq('2a884c95')
a.trigger  = "0"
--disabled 85/03 for ep1/deluxe: constants seem wrong and confusing, and message is misleading anyway
--game.g_population > tuning_constants.POPULATION_STEP_6 and game.l_tract_eq_l < 10 and game.g_education_coverage_p > tuning_constants.EDUC_POP_SERVED_LOW"
a.title   = [[text@ea56573c]]
a.message   = [[text@8a56573f]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL

--It's All Greek To Them; Sims Illiterate

a = create_advice_hq('6a884e2c')
a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_5 and game.g_population < tuning_constants.POPULATION_STEP_7 and game.g_education_funding_p < tuning_constants.FUNDING_MEDIUM and game.g_education_coverage_p > tuning_constants.EDUC_POP_SERVED_LOW and game.ga_school_grade < tuning_constants.ED_GRADE_LOW"
a.title   = [[text@8a565743]]
a.message   = [[text@8a565748]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.BAD_JOB

--"X" Is The Signature Of An Ill-Educated Population

a = create_advice_hq('2a884ed4')
a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_7 and game.g_education_funding_p < tuning_constants.FUNDING_MEDIUM and game.g_education_coverage_p > tuning_constants.EDUC_POP_SERVED_LOW and game.ga_school_grade < tuning_constants.ED_GRADE_LOW"
a.title   = [[text@4a56574c]]
a.message   = [[text@8a565750]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.BAD_JOB

--The Misery of Mediocre Minds
a = create_advice_hq('6a884f73')
a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_6 and game.g_education_funding_p < tuning_constants.FUNDING_MEDIUM and game.g_education_coverage_p < tuning_constants.EDUC_POP_SERVED_MEDIUM and game.ga_school_grade < tuning_constants.ED_GRADE_MEDIUM"
a.title   = [[text@2a565755]]
a.message   = [[text@4a565759]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL

--Schooled Sims Get A Better Mental Grip
a = create_advice_hq('aa884fec')
a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_5 and game.g_education_funding_p > tuning_constants.FUNDING_MEDIUM and game.g_education_funding_p < tuning_constants.FUNDING_HIGH and game.g_education_coverage_p < tuning_constants.EDUC_POP_SERVED_MEDIUM and game.ga_school_grade < tuning_constants.ED_GRADE_HIGH"
a.title   = [[text@ea56575d]]
a.message   = [[text@aa565762]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL


--Swelled-Head Sims Have Brains In There
a = create_advice_hq('ca88507e')
a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_5 and game.ga_education > tuning_constants.EQ_HIGH"
a.title   = [[text@ca565766]]
a.message   = [[text@6a565769]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL

--"Duh" Not In Circulation: Sims Getting Smarter

a = create_advice_hq('2a8851ef')
a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_5 and game.ga_education > tuning_constants.EQ_HIGH and game.trend_slope(game_trends.GA_EQ, tuning_constants.TREND_MEDIUM) > tuning_constants.SLOPE_UP"
a.title   = [[text@8a56576d]]
a.message   = [[text@2a565771]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL

--Sims Mental Midgets; Not A Brain In Their Heads

a = create_advice_hq('6a8852a4')
a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_7 and game.trend_delta(game_trends.GA_EQ, tuning_constants.TREND_MEDIUM) < -13"
a.title   = [[text@6a565775]]
a.message   = [[text@0a565779]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL


--Brains By The Discount: No #City# School Shortage
a = create_advice_hq('8a885304')
a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_4 and game.trend_slope(game_trends.GA_EQ, tuning_constants.TREND_MEDIUM) > tuning_constants.SLOPE_UP and game.trend_slope(game_trends.G_R_POPULATION, tuning_constants.TREND_MEDIUM) > tuning_constants.SLOPE_UP and game.ga_education > tuning_constants.EQ_MEDIUM "
a.title   = [[text@aa56577c]]
a.message   = [[text@6a565781]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL

--#City# Slacking On School Tally
a = create_advice_hq('4a88539f')
a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_4 and game.ga_school_grade < tuning_constants.ED_GRADE_LOW "
a.title   = [[text@ca565784]]
a.message   = [[text@6a565788]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL



--Enough Hospitals To Best Any Bacteria
a = create_advice_hq('ea885517')
a.trigger  = "game.g_health_funding_p > tuning_constants.FUNDING_MEDIUM and game.g_population > tuning_constants.POPULATION_STEP_6 and game.ga_health_grade > tuning_constants.ED_GRADE_HIGH and game.g_num_hospitals > 2"
a.title   = [[text@0a56579c]]
a.message   = [[text@0a5657a0]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL


--#City# In Pain; Hoping For Hospitals
a = create_advice_hq('ca8855d7')
a.trigger  = "game.g_health_funding_p > tuning_constants.FUNDING_MEDIUM and game.g_population > tuning_constants.POPULATION_STEP_7 + 4000 and game.ga_health_grade < tuning_constants.ED_GRADE_MEDIUM"
a.title   = [[text@0a5657a5]]
a.message   = [[text@aa5657a9]] 
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.mood = advice_moods.NEUTRAL






--------------------------------------------------------------------
-- This will try to execute triggers for all registerd advices 
-- to make sure they don't have any syntactic errors.

if (_sys.config_run == 0)
then
   advices : run_triggers()
end
