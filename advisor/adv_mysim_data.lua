dofile("_adv_sys.lua")
dofile("adv_game_data.lua")
------------------------------------------------------------------------------------------
-- This files containes the definitions of various game variables and 
-- function accessible from Lua scripts/trigers.
--

------------------------------------------------------------------------------------------
-- My Sim data table
-- 
mysim = {}
 
mysim.state = 0     -- 1 = moving in, 2 = at home, 3 = at work, 4 = driving to work, 5 = driving back home, 6 = on the way to a destination
mysim.age = 0
mysim.wealth = 0    -- 1 = low, 2 = medium, 3 = high
mysim.eq = 0
mysim.hq = 0
mysim.delta_eq = 0  -- change in EQ over last six months
mysim.delta_hq = 0  -- change in HQ over last six months
mysim.le = 0        -- life expectancy
mysim.zodiac = 0    -- see zodiac IDs table in adv_const.lua
mysim.is_male = 0   -- if 0, my sim is female, otherwise male
mysim.generation = 0
mysim.retired = 0
mysim.desirability = 0 -- desirability of mysim's current home as determined by residential simulator for mysim's wealth class
mysim.home_building = 0
mysim.home_condition = 0
mysim.home_has_power = 0
mysim.home_has_water = 0
mysim.home_police_coverage = 0 -- value from police simulator (0-255) for home lot
mysim.home_fire_coverage = 0 -- value from fire protection simulator (0-255) for home lot
mysim.home_location = 0
mysim.home_occupant_wealth = 0 -- 1 = low, 2 = medium, 3 = high
mysim.local_police_funding = 0 -- funding level of closest police station to mysim's home (note this station may be very far away)
mysim.local_fire_funding = 0 -- ditto fire fire station funding
mysim.employed = 0
mysim.unemployed_days = 0
mysim.job_title = 0
mysim.job_building = 0
mysim.job_condition = 0
mysim.job_has_power = 0
mysim.job_has_water = 0
mysim.job_location = 0
mysim.last_commute_time = 0
mysim.last_local_disaster = 0 -- GUID (see disaster_ids in adv_const.lua)
mysim.home_has_road = 0
mysim.local_crime = 0
mysim.local_air_pollution = 0
mysim.local_water_pollution = 0
mysim.local_garbage = 0
mysim.local_radiation = 0
mysim.local_traffic_congestion = 0

-- trip/travel related variables.
-- most of the variables below will have meaningful values only when my sim is on the way to some destination. 
mysim.trip_traffic_congestion = 0
mysim.trip_pollution_air = 0
mysim.trip_pollution_water = 0
mysim.trip_pollution_garbage = 0
mysim.trip_crime = 0
mysim.trip_mayor_rating = 0

mysim.trip_time_ratio = 0 -- Value of 1 is "no trip delay" and 0.5 takes twice as long as expected.
                                                -- this number is reported for current cell My Sim is on.
mysim.trip_wait_length = 0

mysim.trip_eq = 0
mysim.trip_hq = 0
mysim.trip_distress1_p = 0
mysim.trip_distress2_p = 0
mysim.trip_distress3_p = 0 -- abaindoned
mysim.trip_wealth_high_p = 0
mysim.trip_wealth_med_p = 0
mysim.trip_wealth_low_p = 0
mysim.trip_landmark_nearby = 0
mysim.trip_landmark_funding_p = 0
mysim.trip_landmark_name = 0
mysim.trip_fire_nearby = 0
mysim.trip_riot_nearby = 0
mysim.trip_any_disaster_nearby = 0

mysim.trip_in_transit = 0
mysim.trip_at_location = 0 --inside building
mysim.trip_at_transit_switch = 0
mysim.trip_idle = 0
mysim.trip_on_bus = 0
mysim.trip_on_foot = 0
mysim.trip_on_subway = 0
mysim.trip_in_car= 0
mysim.trip_on_train = 0
mysim.trip_on_elevated_train = 0
mysim.trip_on_monorail = 0
mysim.last_player_trip_day = 0 -- (defaults to 0, a counter for when a player last dispatched or drove my sim somewhere)
mysim.last_trip_type = -1 --(a variable that stores what my sim’s last travel type was, so he can complain about the congestion on the proper network)

mysim.destination_subject = 0
mysim.name = 0

--*************************************************************
-- This function is called by the game to obtain an offset for idle animation.
-- The actual animation ID is a sum of the base animation ID obtained from 
-- game.mysim_idle_models table and this offset.
-- Offset IDs are defined by mysim_idle_animation_ids. 

function game.mysim_get_idle_animation_offset (mysim)
   -- Michael, add your logic that determines what idle off set to use here  
   if(type(mysim) ~= "table") -- check to see it the input is a mysim table
      then return mysim_idle_animation_ids.NONE end

--if mysim.trip_pollution > X then 
  -- return mysim_idle_animation_ids.CHOKE
--end

   if (mysim.trip_landmark_nearby > 0) and game.random_chance(30) then 
      return mysim_idle_animation_ids.CLAP
   
     elseif (mysim.trip_landmark_nearby > 0)  and game.random_chance(30) then 
      return mysim_idle_animation_ids.HOPCLAP

     elseif (mysim.trip_landmark_nearby > 0)  and game.random_chance(40) then 
      return mysim_idle_animation_ids.WHOOP
          
   elseif mysim.trip_crime > tuning_constants.CRIME_HIGH then 
      return mysim_idle_animation_ids.MUGGING --long 3dmax anim
      
   elseif (mysim.trip_fire_nearby > 0) or (mysim.trip_riot_nearby > 0) or (mysim.trip_any_disaster_nearby > 0) then 
      return mysim_idle_animation_ids.TANTRUM
   
     elseif mysim.trip_pollution_garbage > tuning_constants.POLLUTION_GARBAGE_MEDIUM then 
      return mysim_idle_animation_ids.REJECT
      
     elseif mysim.trip_pollution_air > tuning_constants.POLLUTION_HIGH then 
      return mysim_idle_animation_ids.CHOKE --long 3dmax anim
     
      elseif mysim.trip_traffic_congestion > tuning_constants.TRAFFIC_CONGESTION_VERY_HIGH then 
      return mysim_idle_animation_ids.BOOER

      elseif mysim.trip_mayor_rating > tuning_constants.AVG_MAYOR_RATING_VERYGOOD then 
      return mysim_idle_animation_ids.BOOYAH
      
      elseif mysim.trip_mayor_rating > tuning_constants.AVG_MAYOR_RATING_GOOD then 
      return mysim_idle_animation_ids.WOOHOO
            
      elseif mysim.trip_at_transit_switch > 0 and mysim.trip_time_ratio < .5 then 
      return mysim_idle_animation_ids.PHOOEE --waiting too long. 1 = no wait time.
      
end



--idle anim options:
 --   mysim_idle_animation_ids.HOPCLAP 
  --  mysim_idle_animation_ids.WHOOP 
    --mysim_idle_animation_ids.CLAP 
   -- mysim_idle_animation_ids.BOOYAH 
  --  mysim_idle_animation_ids.WOOHOO 
  --  mysim_idle_animation_ids.TANTRUM 
  --  mysim_idle_animation_ids.PHOOEE 
  --  mysim_idle_animation_ids.REJECT
  --  mysim_idle_animation_ids.NOWAY 
  --  mysim_idle_animation_ids.KISSMY
  --  mysim_idle_animation_ids.BOOER 
  --  mysim_idle_animation_ids.CHOKE
  --  mysim_idle_animation_ids.MUGGING
   return mysim_idle_animation_ids.GENERIC
end
