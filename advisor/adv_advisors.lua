-------------------------------------------------------------------------------------
--                         Advisors
-------------------------------------------------------------------------------------
----------------------------------------------------------------------
-- Load what is needed 
dofile("_adv_sys.lua")
dofile("adv_const.lua")
dofile("adv_advisors_anim.lua")

-------------------------------------------------------------------------------------
-- Base advisor template. My Sims might have to create their own things here.
advisor_base_template = create_template
{
   class_id = 0,
   id = 0, 
   advice_type = 0,
   caption = "",
   name = "",
}

-------------------------------------------------------------------------------------
--Main advisor table and advisor records 
advisors = {n = 0}

function advisors : new (init_table, base_table, flat)
   local t = advisor_base_template : new (init_table, base_table, flat)
   local i = getn(self) +1
   self[i] = t -- add the table to the main advisors' repository
   self . n = self . n + 1 -- update the table count
   return t
end

---------------------
department_advisor = advisors : new (
{
   class_id = hex2dec('ca09f543'),
   id = advisor_ids.NULL, -- this one will be ingnored by the game
}, nil, nil)


---------------------
advisors : new (
{
   id = advisor_ids.ENVIRONMENT, 
   advice_type = advice_types.ENVIRONMENT,
   caption = "text@aa358803Environment Advisor",
   name = "text@ca75f7f3",
}
, department_advisor
,1)

---------------------
advisors : new (
{
   class_id = hex2dec('6a5f8755'),
   id = advisor_ids.HEALTH_EDUCATION, 
   advice_type = advice_types.HEALTH_EDUCATION,
   caption = "text@aa49638aHealth & Education Advisor",
   name = "text@0a75f82b",
}
, department_advisor
,1)

---------------------
advisors : new (
{
   class_id = hex2dec('2a5f877d'),
   id = advisor_ids.CITY_PLANNING, 
   advice_type = advice_types.CITY_PLANNING,
   caption = "text@4a358813City planning Advisor",
   name = "text@2a75f85c",
}
, department_advisor
,1)

---------------------
advisors : new (
{
   class_id = hex2dec('aa5292d7'),
   id = advisor_ids.FINANCES, 
   advice_type = advice_types.FINANCES,
   caption = "text@6a35881cFinances Advisor",
   name = "text@aa75f839",
}
, department_advisor
,1)

---------------------
advisors : new (
{
   class_id = hex2dec('4a3ad3e1'),
   id = advisor_ids.TRANSPORTATION, 
   advice_type = advice_types.TRANSPORTATION,
   caption = "text@8a358818Transportation Advisor",
   name = "text@6a77479b",
}
, department_advisor
,1)

---------------------
advisors : new (
{
      class_id = hex2dec('ca2c2a2f'),
      id = advisor_ids.UTILITIES, 
      advice_type = advice_types.UTILITIES,
      caption = "text@6a358809Utilities Advisor",
      name = "text@6a75f80d",
}
, department_advisor
,1)

---------------------
advisors : new (
{
   class_id = hex2dec('ea19e825'),
   id = advisor_ids.SAFETY, 
   advice_type = advice_types.SAFETY,
   caption = "text@4a358821Safety Advisor",
   name = "text@2a75f84c",
}
, department_advisor
,1)

---------------------
advisors : new (
{
   id = advisor_ids.FLUFF_NEWS, 
   advice_type = advice_types.FLUFF_NEWS,
   caption = "Fluffy News Advisor", -- doesn't have to be localized 
   name = "Fluffy Cat", -- doesn't have to be localized
}
, department_advisor
,1)


---------------------
advisors : new (
{
   class_id = hex2dec('4be372cd'),
   id = advisor_ids.CITY_SITUATIONS,
   advice_type = advice_types.CITY_SITUATIONS,
   caption = "City Situations",  -- do not localize
   name = "SituationManager",  -- do not localize
}
, department_advisor
, 1)
   
---------------------
mysim_advisor = advisors : new (
{
   class_id = hex2dec('4a1dbbbf'),
   id = advisor_ids.NULL, -- this one will be ingnored by the game
}, nil, nil)

---------------------
advisors : new (
{
   id = advisor_ids.MYSIM1, 
   advice_type = advice_types.MYSIM,
   caption = "MySim1",
}
, mysim_advisor
,1)

---------------------
advisors : new (
{
   id = advisor_ids.MYSIM2, 
   advice_type = advice_types.MYSIM,
   caption = "MySim2",
}
, mysim_advisor
,1)

---------------------
advisors : new (
{
   id = advisor_ids.MYSIM3, 
   advice_type = advice_types.MYSIM,
   caption = "MySim1",
}
, mysim_advisor
,1)

---------------------
advisors : new (
{
   id = advisor_ids.MYSIM4, 
   advice_type = advice_types.MYSIM,
   caption = "MySim4",
}
, mysim_advisor
,1)

---------------------
advisors : new (
{
   id = advisor_ids.MYSIM5, 
   advice_type = advice_types.MYSIM,
   caption = "MySim5",
}
, mysim_advisor
,1)

---------------------
advisors : new (
{
   class_id = hex2dec('0bf606a5'),
   id = advisor_ids.MY_STREET_SIM, 
   advice_type = advice_types.MYSIM,
   caption = "MyStreetSim",
}
, mysim_advisor
,1)

----------------------------------------------------------------------
--  Tests, debug etc.

