-------------------------------------------------------------------------------------
--                         Advisor UI Animations 
-------------------------------------------------------------------------------------
----------------------------------------------------------------------
-- Load what is needed 
dofile("adv_advisors.lua")

----------------------------------------------------------------------------------------------------
-- Head records 

-- Gender constants 
advisor_genders = 
{
   M = 1,
   F = 2,
}
make_table_const (advisor_genders )

-- Animation types constants
advisor_anim_types = 
{
   NEUTRAL = 0,
   HAPPY = 1,
   ATTENTION = 2,
   ALARMED = 3,
   
   NEUTRAL_TO_HAPPY = 4,
   NEUTRAL_TO_ALARMED = 5,
   NEUTRAL_TO_ATTENTION = 6,
   
   HAPPY_TO_NEUTRAL = 7,
   ALARMED_TO_NEUTRAL = 8,
   ATTENTION_TO_NEUTRAL = 9
}
make_table_const (advisor_anim_types )

-- Main head animation table
advisor_heads = {n = 0}

-- to create new head record
function advisor_heads : new_record(advisor_type, gender)
   self.n = getn(self)+1

   local t = {} 
   self[self.n] = t     

   -- setup the record
   t.advisor_type = advisor_type
   t.advisor_gender = gender
   return t
end

------------------------------------------------------------------------------------------------------------------
-- Define the resources
-- the file name format is as follows:           TYPE_GENDER_COUNT_HAPPY_GUID.S3D
-- 

-- UTL, M, 0 
hr = advisor_heads : new_record(advisor_ids.UTILITIES, advisor_genders.M)

hr[advisor_anim_types.NEUTRAL]                = hex2dec("2a42b500")
hr[advisor_anim_types.HAPPY]                  = hex2dec("2a42b502")
hr[advisor_anim_types.ATTENTION]              = hex2dec("2a42b505")
hr[advisor_anim_types.ALARMED]                = hex2dec("2a42b508")
   
hr[advisor_anim_types.NEUTRAL_TO_HAPPY]       = hex2dec("2a42b500")
hr[advisor_anim_types.NEUTRAL_TO_ALARMED]     = hex2dec("2a42b502")
hr[advisor_anim_types.NEUTRAL_TO_ATTENTION]   = hex2dec("2a42b505")
   
hr[advisor_anim_types.HAPPY_TO_NEUTRAL]       = hex2dec("2a42b508")
hr[advisor_anim_types.ALARMED_TO_NEUTRAL]     = hex2dec("2a42b500")
hr[advisor_anim_types.ATTENTION_TO_NEUTRAL]   = hex2dec("2a42b500")

-- ENV, M, 0 
hr = advisor_heads : new_record(advisor_ids.ENVIRONMENT, advisor_genders.F)

hr[advisor_anim_types.NEUTRAL]                = hex2dec("2a42b520")
hr[advisor_anim_types.HAPPY]                  = hex2dec("2a42b522")
hr[advisor_anim_types.ATTENTION]              = hex2dec("2a42b525")
hr[advisor_anim_types.ALARMED]                = hex2dec("2a42b528")
   
hr[advisor_anim_types.NEUTRAL_TO_HAPPY]       = hex2dec("2a42b520")
hr[advisor_anim_types.NEUTRAL_TO_ALARMED]     = hex2dec("2a42b522")
hr[advisor_anim_types.NEUTRAL_TO_ATTENTION]   = hex2dec("2a42b525")
   
hr[advisor_anim_types.HAPPY_TO_NEUTRAL]       = hex2dec("2a42b528")
hr[advisor_anim_types.ALARMED_TO_NEUTRAL]     = hex2dec("2a42b520")
hr[advisor_anim_types.ATTENTION_TO_NEUTRAL]   = hex2dec("2a42b520")

-- FIN, M, 0 
hr = advisor_heads : new_record(advisor_ids.FINANCES, advisor_genders.F)

hr[advisor_anim_types.NEUTRAL]                = hex2dec("2a42b540")
hr[advisor_anim_types.HAPPY]                  = hex2dec("2a42b542")
hr[advisor_anim_types.ATTENTION]              = hex2dec("2a42b545")
hr[advisor_anim_types.ALARMED]                = hex2dec("2a42b548")
   
hr[advisor_anim_types.NEUTRAL_TO_HAPPY]       = hex2dec("2a42b540")
hr[advisor_anim_types.NEUTRAL_TO_ALARMED]     = hex2dec("2a42b542")
hr[advisor_anim_types.NEUTRAL_TO_ATTENTION]   = hex2dec("2a42b545")
   
hr[advisor_anim_types.HAPPY_TO_NEUTRAL]       = hex2dec("2a42b548")
hr[advisor_anim_types.ALARMED_TO_NEUTRAL]     = hex2dec("2a42b540")
hr[advisor_anim_types.ATTENTION_TO_NEUTRAL]   = hex2dec("2a42b540")

-- SFT, M, 0 
hr = advisor_heads : new_record(advisor_ids.SAFETY, advisor_genders.M)

hr[advisor_anim_types.NEUTRAL]                = hex2dec("2a42b510")
hr[advisor_anim_types.HAPPY]                  = hex2dec("2a42b512")
hr[advisor_anim_types.ATTENTION]              = hex2dec("2a42b515")
hr[advisor_anim_types.ALARMED]                = hex2dec("2a42b518")
   
hr[advisor_anim_types.NEUTRAL_TO_HAPPY]       = hex2dec("2a42b510")
hr[advisor_anim_types.NEUTRAL_TO_ALARMED]     = hex2dec("2a42b512")
hr[advisor_anim_types.NEUTRAL_TO_ATTENTION]   = hex2dec("2a42b515")
   
hr[advisor_anim_types.HAPPY_TO_NEUTRAL]       = hex2dec("2a42b518")
hr[advisor_anim_types.ALARMED_TO_NEUTRAL]     = hex2dec("2a42b510")
hr[advisor_anim_types.ATTENTION_TO_NEUTRAL]   = hex2dec("2a42b510")

-- HNQ, M, 0 
hr = advisor_heads : new_record(advisor_ids.HEALTH_EDUCATION, advisor_genders.F)

hr[advisor_anim_types.NEUTRAL]                = hex2dec("2a42b550")
hr[advisor_anim_types.HAPPY]                  = hex2dec("2a42b552")
hr[advisor_anim_types.ATTENTION]              = hex2dec("2a42b555")
hr[advisor_anim_types.ALARMED]                = hex2dec("2a42b558")
   
hr[advisor_anim_types.NEUTRAL_TO_HAPPY]       = hex2dec("2a42b550")
hr[advisor_anim_types.NEUTRAL_TO_ALARMED]     = hex2dec("2a42b552")
hr[advisor_anim_types.NEUTRAL_TO_ATTENTION]   = hex2dec("2a42b555")
   
hr[advisor_anim_types.HAPPY_TO_NEUTRAL]       = hex2dec("2a42b558")
hr[advisor_anim_types.ALARMED_TO_NEUTRAL]     = hex2dec("2a42b550")
hr[advisor_anim_types.ATTENTION_TO_NEUTRAL]   = hex2dec("2a42b550")

-- CTP, M, 0 
hr = advisor_heads : new_record(advisor_ids.CITY_PLANNING, advisor_genders.M)

hr[advisor_anim_types.NEUTRAL]                = hex2dec("2a42b560")
hr[advisor_anim_types.HAPPY]                  = hex2dec("2a42b562")
hr[advisor_anim_types.ATTENTION]              = hex2dec("2a42b565")
hr[advisor_anim_types.ALARMED]                = hex2dec("2a42b568")
   
hr[advisor_anim_types.NEUTRAL_TO_HAPPY]       = hex2dec("2a42b560")
hr[advisor_anim_types.NEUTRAL_TO_ALARMED]     = hex2dec("2a42b562")
hr[advisor_anim_types.NEUTRAL_TO_ATTENTION]   = hex2dec("2a42b565")
   
hr[advisor_anim_types.HAPPY_TO_NEUTRAL]       = hex2dec("2a42b568")
hr[advisor_anim_types.ALARMED_TO_NEUTRAL]     = hex2dec("2a42b560")
hr[advisor_anim_types.ATTENTION_TO_NEUTRAL]   = hex2dec("2a42b560")

-- TRN, M, 0 
hr = advisor_heads : new_record(advisor_ids.TRANSPORTATION, advisor_genders.M)

hr[advisor_anim_types.NEUTRAL]                = hex2dec("2a42b530")
hr[advisor_anim_types.HAPPY]                  = hex2dec("2a42b532")
hr[advisor_anim_types.ATTENTION]              = hex2dec("2a42b535")
hr[advisor_anim_types.ALARMED]                = hex2dec("2a42b538")

hr[advisor_anim_types.NEUTRAL_TO_HAPPY]       = hex2dec("2a42b530")
hr[advisor_anim_types.NEUTRAL_TO_ALARMED]     = hex2dec("2a42b532")
hr[advisor_anim_types.NEUTRAL_TO_ATTENTION]   = hex2dec("2a42b535")

hr[advisor_anim_types.HAPPY_TO_NEUTRAL]       = hex2dec("2a42b538")
hr[advisor_anim_types.ALARMED_TO_NEUTRAL]     = hex2dec("2a42b530")
hr[advisor_anim_types.ATTENTION_TO_NEUTRAL]   = hex2dec("2a42b530")

--evil
hr = advisor_heads : new_record(advisor_ids.CITY_SITUATIONS, advisor_genders.M)

hr[advisor_anim_types.NEUTRAL]                = hex2dec("ec202412")
hr[advisor_anim_types.HAPPY]                  = hex2dec("ec202412")
hr[advisor_anim_types.ATTENTION]              = hex2dec("ec202410")
hr[advisor_anim_types.ALARMED]                = hex2dec("ec202410")

hr[advisor_anim_types.NEUTRAL_TO_HAPPY]       = hex2dec("ec202412")
hr[advisor_anim_types.NEUTRAL_TO_ALARMED]     = hex2dec("ec202410")
hr[advisor_anim_types.NEUTRAL_TO_ATTENTION]   = hex2dec("ec202410")

hr[advisor_anim_types.HAPPY_TO_NEUTRAL]       = hex2dec("ec202412")
hr[advisor_anim_types.ALARMED_TO_NEUTRAL]     = hex2dec("ec202410")
hr[advisor_anim_types.ATTENTION_TO_NEUTRAL]   = hex2dec("ec202410")


