-----------------------------------------------------------------------------------------
-- This file contains a single table of application data used by advisors
-- Perhaps it will need to be split in a number of files.
--
dofile("_adv_sys.lua") -- this is for development purposes only
dofile("_adv_advice.lua") -- this is for development purposes only

----------------------------------------------------------------------
-- Define global storage for data comimg from the game.

game = {}
TAG_GAME_DATA = newtag()
settag(game, TAG_GAME_DATA )

------------------------------------------------------------------------------------------
-- Abbreviations 

-- prefixes ---------------------------------------------
--          g -- Global value (city-wide). 
--          l  -- Local  value value that has location object associated with it.
--          a   -- Average value. 
--          t   -- Trend value. 

-- suffixes ---------------------------------------------
--          p --   Values representing a percentages. 
--          h   -- The highest value in its domain. 
--          l   --  The lowest value in its domain.
--         subject -- Used for objects associated with variables using 
--                           'l' (local) prefix. This object holds the locality 
--                            data related to that variable. Hence
--                            game.l_air_pollution_h_subject is a locality
--                            object for the cell with the highest air pollution value.

------------------------------------------------------------------------------------------
-- Functions

-- For internal use only ----------------------
game.advice_info = function () return 0 end -- for testing perposes only 

-- Misc game tools -------------------------
game.trend_slope = function (trend_type, period_in_months) return 0 end --returns a trand value between from (-100, +100) for the period of time (see game_trends for trend types)
game.trend_value = function (trend_type, num_months_ago) return 0 end --returns a value the trend variable had 'num_months_ago'
game.trend_count = function (trend_type, period_in_months) return 0 end --returns a sample count for the period of time
game.trend_delta = function (trend_type, period_in_months)  --returns a growith percentage
   local past_value = game.trend_value(trend_type, period_in_months) + 0.00001 -- for avoiding the division pbolems
   local present_value = game.trend_value(trend_type, 0) 
   local result = (present_value / past_value - 1) * 100 
   return result 
end 

game.tool_plop_network = function (network_type) end -- E.g. game.tool_plop_network(network_tool_types.SUBWAY). See more types in network_tool_types.
game.tool_plop_zone = function (zone_type) end -- E.g. game.tool_plop_zone(zone_tool_types.SUBWAY). See more types in zone_tool_types.
game.tool_plop_building = function (building_type) end -- E.g. game.tool_plop_building(building_tool_types.LOCALPRECINCT4CAR). See more types in building_tool_types.
game.tool_plop_flora = function (flora_type) end -- E.g. game.tool_plop_flora(flora_tool_types.OAK_TREE). See more types in flora_tool_types.
game.tool_button = function (button_type) end -- E.g. game.tool_button(button_tool_types.DEMOLISH). See more types in button_tool_types.

game.window_budget = function (budget_window_type) end -- E.g. game.window_budget(budget_window_types.TAXES). See more types in budget_window_types.
game.window_map = function (map_window_type) end -- E.g. game.window_map(map_window_types.***). See more types in map_window_types.
game.window_data_map = function (map_window_type)  game.window_map(map_window_type) end -- same as above
game.window_graph = function (graph_window_type) end -- E.g. game.window_graph(graph_window_types.***). See more types in graph_window_types.
game.window_query = function (subject)  end  -- this will open query window for the subject (school, hospical, fire house, etc.)

-- Camera ------------------
      -- camera_jump moves the camera to the event or local var subject. If the subject is not given it will attempt to 
      -- access the event subject. So for event-related messages you can call this with no parameters 
      -- or use      nil      as a parameter like this          game.camera_jump()     or     game.camera_jump(nil).
game.camera_jump = function (subject) end 
game.camera_zoom = function (zoom_level) end -- set zoom level to 'zoom_level'
game.camera_jump_and_zoom = function (subject,zoom_level) -- move camera to subject and set zoom level to 'zoom_level'
   game.camera_jump(subject)
   game.camera_zoom(zoom_level)
end 

-- Ordinances --------------
game.ordinance_is_on = function (ord_guid) return 0 end -- returns true if the ordinace is in force
game.ordinance_set_off    = function (ord_guid) end -- repeals the ordinance 
game.ordinance_set_on    = function (ord_guid) end -- enacts the ordinance 
game.ordinance_is_available  = function (ord_guid) return 0 end -- checks if the ordinance is available
game.ordinance_name    = function (ord_guid) return '***' end -- returns ord text name 
game.ordinance_description  = function (ord_guid) return '***' end -- returns ord text description
game.ordinance_enact_fee  = function (ord_guid) return 0 end -- the fee charged to enact an ordinance 
game.ordinance_repeal_fee  = function (ord_guid) return 0 end -- the fee charged to repeal an ordinance 
game.ordinance_monthly_cost  = function (ord_guid) return 0 end -- the monthly income/expense associated with the ordinance 

-- Advice specific ------------
game.event_feedback = function (response)  end  -- Sends a message to the app withe the  event ID as message type and 'response' value (0 in case of error) as a parameter
game.expire_advice   = function ()  end  --this makes the advice message to expire on the next 'business' day
game.retire_advice   = function ()  end  --causes the advice message to be removed immediately from the UI
game.advice_subject = function ()  end  -- returns back the subject associated with the advice message. E.g. camera_jump( game.advice_subject() )
game.event_subject   = function ()  return game.advice_subject() end -- same as above
game.building_is_group = function (building_subject, group_id) return 0 end -- only useful during MYSIM_BUILDING_ADD event
game.is_building_group = function (building_subject, group_id) return game.building_is_group(building_subject, group_id) end -- same as above
game.event_building_is_group = function (group_id) return game.building_is_group(game.event_subject(), group_id) end -- only useful during MYSIM_BUILDING_ADD event
game.event_building_distance = function () return 0 end -- only useful during MYSIM_BUILDING_ADD event
game.event_disaster_distance = function () return 0 end -- only useful during MYSIM disasater events
game.mysim_distance_to_closest_building = function(group_id) return 0 end -- only useful for My Sims
game.mysim_distance_to_closest_landmark_or_reward = function(guid) return 0 end -- only useful for My Sims
game.mysim_local_school_grade = function(group_id) return 0 end -- only useful for My Sims
game.mysim_local_hospital_grade = function(group_id) return 0 end -- only useful for My Sims
game.mysim_trip_check_destination_groups = function(...) return 0 end -- only useful for My Sims. Can be called with multiple grou IDs. E.g. game.mysim_trip_check_destination_groups(hex2dec('4001'), hex2dec('4107'), hex2dec('4102'))
game.mysim_get_idle_animation_offset = function(mysim) return 0 end -- this is called by the app to compute the offset for idle animation.
game.mysim_select_car_style = function() sc4game.mysims_ui.pop_select_car_dialog() end -- pops a car style selection dialog for current current mysim
game.mysim_select_pedestrian_style = function() sc4game.mysims_ui.pop_select_pedestrian_dialog() end -- pops a pedestrian style selection dialog for current current mysim
game.mysim_dispatch_tool = function() error"Hello!" end -- Creates my sim dispatch tool 

game.random_chance = function (percentage) return 0 end -- useful if you want to give a trigger a percentage change of occuring; e.g. game.random_chance(5) will have a 5% chance of being true
game.nd_cancel = function () end -- cancels a neighbor deal set as an advice susbject (game.advice_subject())
game.reward_instance_count = function (reward_guid) return 0 end -- returns the count for reward buildings by that building's  GUID
game.is_tutorial = function (tutorial_guid) return 0 end -- if tutorial guid is not specified it will check if current city is a tutorial city

-- City Situations ------------
game.trigger_event = function(eventGUID) end                   -- triggers one of the events in game_events, to trigger advisor msg
game.unlock_reward_building = function(buildingGUID) end       -- makes a conditional (reward) building available to the player.  Use special_buildings GUIDs in adv_const.lua
game.get_reward_building_state = function(buildingGUID) return reward_state.HIDDEN end    -- returns reward_state constant for the given building
game.difficulty_level = function () return -1 end



------------------------------------------------------------------------------------------
-- Game Data Registry ------------

if (sc4game == nil) then

sc4game = {}

sc4game.mysims = {}
   sc4game.mysims.get_sim = function(simIndex) end
   sc4game.mysims.get_count = function() end

sc4game.automata = {}
   sc4game.automata.create_automaton = function(autoGroup, x, y, z, flags, modelType, modelGroup, modelInstance, priority) end
   sc4game.automata.create_controller = function(controllerName, x, y, z) end
   sc4game.automata.attach_controller = function(controllerName, occupantTarget) end
   sc4game.automata.attach_controller_group = function(groupName, occupantTarget) end
   sc4game.automata.detach_controller = function(controllerName, occupantTarget) end
   sc4game.automata.detach_controller_group = function(groupName, occupantTarget) end

   -- IMPORTANT: This function will ONLY work for groups that are listed in the table 
   -- called "tracked_buildings" inside the file Automata\_constants.lua!
   sc4game.automata.get_source_building_count = function(groupGuid) return 0 end

sc4game.sitmgr = {}
   sc4game.sitmgr.get_success_count = function(missionGUID) return 0 end
   sc4game.sitmgr.activate_situation = function(missionGUID) end
   sc4game.sitmgr.get_current_target = function() end
   sc4game.sitmgr.get_active_auto = function() end
   sc4game.sitmgr.num_targets = function() return 0 end
   sc4game.sitmgr.cur_target_index = function() return 0 end
   sc4game.sitmgr.get_target_name = function() return "" end
   sc4game.sitmgr.show_CSI = function(bShow) end
   sc4game.sitmgr.num_targets_remaining = function() return 0 end
   
sc4game.effects = {}
   sc4game.effects.create_effect = function(effectName, x, y, z) end

sc4game.aura = {}
   sc4game.aura.add_transient_effect = function(x, z, radius, magnitude) end
   sc4game.aura.end_strike = function(department) end

sc4game.budget = {}
   sc4game.budget.total_funds = function() end
   sc4game.budget.deposit_funds = function(simoleons) end

sc4game.mysims_ui = {}
   sc4game.mysims_ui.pop_select_car_dialog = function() end
   sc4game.mysims_ui.pop_select_pedestrian_dialog = function() end

-- NOTE: UNRELIABLE!  Use sc4game.automata.get_source_building_count(building_groups.LANDMARK) instead!
sc4game.civic = {}
   sc4game.civic.get_landmark_count = function() return 0 end

end


------------------------------------------------------------------------------------------
-- Helper functions

-- returns "true" if all of the missions in the guidTable have been completed, false
-- if not.
-- example:
--    if (missions_completed( { 'abcdef00', '01234567', '18675309' } )
--
function missions_completed( guidTable )
   local i,guid
   local bResult

   if (type(guidTable) == "table") then
      bResult = true
      for i,guid in guidTable do
         if (sc4game.sitmgr.get_success_count(guid) == 0) then
            bResult = false
         end
      end
   else
      bResult = true
      if (sc4game.sitmgr.get_success_count(guidTable) == 0) then
         bResult = false
      end
   end

   return bResult
end

------------------------------------------------------------------------------------------
-- Safety

-- Fire-related ----------

game. g_fire_funding_p = 0 
game. g_fire_station_count = 0 
game. ga_flammability = 0 
game. ga_fire_coverage = 0 -- average level of protection for all zoned cells. (0,100)
game.g_fire_coverage_p = 0 -- percentage of all zoned cells whose f. voverage is > 0
game.g_fire_strike = 0 -- set to non-zero if there a fire strike is going
game.g_fire_strike_chance = 0 -- % chance a strike will start this month
game.g_fire_repath_attempts = 0

game.l_flammability_h = 0 -- the hot spot value
game.l_flammability_h_subject = 0 -- the hot spot location 
game.l_fire_funding_p = 0 -- for the fire station with the minimum funding
game.l_fire_funding_p_subject = 0 -- the fire station for the value above
game.l_fire_station_no_roads = 0 -- non-zero if there is a fire station with no access 
game.l_fire_station_no_roads_subject = 0 -- the fire station object above


-- Police-realted 
game.g_police_funding_p = 0
game.ga_crime = 0 
game.g_jail_capacity = 0
game.g_inmate_count = 0
game.g_criminal_count = 0
game.g_crime_commited_count = 0
game.g_arrest_count = 0
game.g_police_station_count = 0
game.g_jail_count = 0
game.g_police_strike = 0
game.g_police_strike_chance = 0
game.ga_police_coverage = 0
game.g_police_coverage_p = 0
game.g_jailbreak = 0
game.g_police_repath_attempts = 0

game.l_crime_h = 0 -- crime hot spot
game.l_crime_h_subject = 0 -- the map location for the value above 
game.l_police_no_roads = 0 -- non zero if there is a police station with no road access 
game.l_police_no_roads_subject = 0 -- the police station for the above case 
game.l_police_funding_p = 0 -- minimum amount of funding among all police stations 
game.l_police_funding_p_subject  = 0 -- the police station for the above case 

-- Disaster-related 
game.g_disasters_in_progress = 0
game.g_disasters_damage_cost = 0
game.g_disasters_damage_building_count = 0
game.g_disasters_police_dispatch_effectiveness = 0
game.g_disasters_fire_dispatch_effectiveness = 0
game.g_disasters_riot_ended = 0
game.g_disasters_riot_started = 0
game.g_disasters_fire_ended = 0
game.g_disasters_fire_started = 0
game.g_disasters_fire_cause_arson = 0
game.g_disasters_fire_cause_effects = 0
game.g_disasters_fire_cause_flammability = 0

------------------------------------------------------------------------------------------
-- Utility 

-- Power ---------------
game.g_power_funding_p = 0 
game.g_power_plant_count = 0
game.g_power_plant_count_coal = 0
game.g_power_plant_count_gas = 0
game.g_power_plant_count_oil = 0
game.g_power_plant_count_wind = 0
game.g_power_plant_count_solar = 0
game.g_power_plant_count_nuclear = 0
game.g_power_plant_count_waste = 0
game.g_power_plant_count_fusion = 0
game.g_aged_power_plant_count = 0 -- those over 80% or their life
game.g_power_pole_count = 0
game.g_power_production_capacity = 0
game.g_power_consumed = 0
game.g_power_imported = 0
game.g_power_exported = 0
game.g_overworked_power_plant_count = 0 -- for those working over their capacity
game.g_unpowered_building_count = 0
game.g_power_strike = 0
game.g_power_strike_chance = 0
game.l_power_plant_funding_pl = 0
game.l_power_plant_funding_pl_subject = 0
game.l_power_plant_age_h = 0
game.l_power_plant_age_h_subject = 0

-- Plumbing ---------------
game.g_water_funding_p = 0
game.g_water_source_count = 0
game.g_water_production_capacity = 0
game.g_water_consumed = 0
game.g_water_imported = 0
game.g_water_exported = 0
game.g_water_pipe_count = 0
game.g_water_distressed_pipe_count = 0
game.g_water_burst_pipe_count = 0
game.g_watered_building_count = 0
game.g_unwatered_building_count = 0
game.g_water_pollution_pump_shutdown_count = 0 -- the count for pump shutdowns for pollution reasons
game.l_water_building_funding_pl = 0
game.l_water_building_funding_pl_subject = 0
game.l_water_building_age_h = 0
game.l_water_building_age_h_subject = 0

-- Pollution ---------------

game.g_pollution_funding_p = 0
game.g_incinerator_count = 0
game.g_waste_to_energy_building_count = 0
game.g_water_treatment_plant_count = 0
game.g_recycling_center_count = 0
game.g_incinerator_capacity_daily = 0
game.g_waste_to_energy_capacity_daily = 0
game.g_recycling_center_effect_p = 0 -- % effect of recycling centers
game.ga_air_pollution = 0 
game.ga_water_pollution = 0 
game.ga_garbage_pollution = 0 
game.g_uncollected_garbage = 0
game.g_landfill_capacity = 0
game.g_available_landfill_capacity = 0

game.g_garbage_produced = 0
game.g_garbage_imported = 0
game.g_garbage_exported = 0
game.g_garbage_recycled = 0
game.g_garbage_to_energy = 0 -- garbage converted to energy this month 
game.g_garbage_to_landfill = 0 -- garbage sent to landfill this month 

game.l_air_pollution_h = 0 -- local air pollution
game.l_air_pollution_h_subject = 0 -- location object for the above value
game.l_water_pollution_h = 0 -- local water pollution
game.l_water_pollution_h_subject = 0 -- location object for the above value
game.l_uncollected_garbage_h = 0 --local garbage pollution
game.l_uncollected_garbage_h_subject = 0 -- location object for the above value

-- Neighbor deals -------------
game.g_nd_count_buy_water = 0
game.g_nd_count_sell_water = 0
game.g_nd_count_buy_power = 0
game.g_nd_count_sell_power = 0
game.g_nd_count_export_garbage = 0
game.g_nd_count_import_garbage = 0

game.g_nd_connection_present_water = 0
game.g_nd_connection_present_power = 0
game.g_nd_connection_present_garbage = 0

game.g_nd_can_buy_water = 0 
game.g_nd_can_buy_power = 0
game.g_nd_can_export_garbage = 0
game.g_nd_can_sell_water = 0
game.g_nd_can_sell_power = 0
game.g_nd_can_import_garbage = 0

------------------------------------------------------------------------------------------------
-- Transportation 

-- Traffic -------------------
game.g_pothole_count = 0
game.g_road_funding_p = 0
game.g_masstransit_funding_p = 0
game.g_transit_strike = 0
game.g_transit_strike_chance = 0
game.ga_freight_trip_length = 0

game.g_bus_station_count = 0
game.ga_bus_station_utilization_p = 0
game.l_bus_station_utilization_pl = 0
game.l_bus_station_utilization_pl_subject = 0

game.g_monorail_station_count = 0
game.ga_monorail_station_utilization_p = 0
game.l_monorail_station_utilization_pl = 0
game.l_monorail_station_utilization_pl_subject = 0

game.g_monorail_station_count = 0
game.ga_monorail_station_utilization_p = 0
game.l_monorail_station_utilization_pl = 0
game.l_monorail_station_utilization_pl_subject = 0

game.g_train_station_count = 0
game.ga_train_station_utilization_p = 0
game.l_train_station_utilization_pl = 0
game.l_train_station_utilization_pl_subject = 0
 
game.g_subway_station_count = 0
game.ga_subway_station_utilization_p = 0
game.l_subway_station_utilization_pl = 0
game.l_subway_station_utilization_pl_subject = 0
 
game.g_road_tile_count = 0
game.g_rail_tile_count = 0
game.g_subway_tile_count = 0
game.g_highway_tile_count = 0
game.g_street_tile_count = 0
 
game.ga_road_congestion = 0 -- from 0 and up. Values under about 100 (duh!) indicate no congestion.
game.g_road_congestion_tile_count = 0
game.l_road_congestion_h = 0
game.l_road_congestion_h_subject = 0

game.ga_rail_congestion = 0 -- from 0 and up. Values under about 100 (duh!) indicate no congestion.
game.g_rail_congestion_tile_count = 0
game.l_rail_congestion_h = 0
game.l_rail_congestion_h_subject = 0

game.ga_subway_congestion = 0 -- from 0 and up. Values under about 100 (duh!) indicate no congestion.
game.g_subway_congestion_tile_count = 0
game.l_subway_congestion_h = 0
game.l_subway_congestion_h_subject = 0

-- Ports -------------------
game.ga_airport_efficiency = 0
game.ga_seaport_efficiency = 0

game.g_medium_airport_count = 0 -- all stages
game.g_small_airport_count = 0
game.g_large_airport_count = 0
game.g_medium_airport_s1_count = 0 -- stage 1
game.g_small_airport_s1_count = 0
game.g_large_airport_s1_count = 0
game.g_medium_airport_s2_count = 0 -- stage 2
game.g_small_airport_s2_count = 0
game.g_large_airport_s2_count = 0
game.g_medium_airport_s3_count = 0 -- stage 2
game.g_small_airport_s3_count = 0
game.g_large_airport_s3_count = 0

game.g_seaport_count = 0 -- all stages
game.g_seaport_s1_count = 0 -- stage 1
game.g_seaport_s2_count = 0 -- stage 2
game.g_seaport_s3_count = 0 -- stage 3

------------------------------------------------------------------------------------------------
-- Finances 

-- Budget
game.g_funds = 0

game.g_income_monthly = 0
game.g_expense_monthly = 0

game.g_tax_rate_r_low = 0
game.g_tax_rate_r_med = 0
game.g_tax_rate_r_high = 0

game.g_tax_rate_cs_low = 0
game.g_tax_rate_cs_med = 0
game.g_tax_rate_cs_high = 0

game.g_tax_rate_co_med = 0
game.g_tax_rate_co_high = 0

game.g_tax_rate_i_resource = 0
game.g_tax_rate_i_dirty = 0
game.g_tax_rate_i_manufacturing = 0
game.g_tax_rate_i_hightech = 0

game.g_tax_income = 0

game.g_borrowed = 0
game.g_borrowing_limit = 0
game.g_bond_payments_monthly = 0

game.g_nd_income = 0
game.g_nd_expense = 0

------------------------------------------------------------------------------------------------
-- City planning 

game.ga_mayor_rating	= 0 -- all mayor ratings range from -100 to +100
game.l_mayor_rating_l= 0 
game.l_mayor_rating_l_subject = 0
game.l_mayor_rating_h = 0 
game.l_mayor_rating_h_subject = 0

game.g_population = 0
game.g_city_rci_population	= 0
game.g_city_r_population	= 0
game.g_city_c_population	= 0
game.g_city_i_population	= 0
game.g_city_r1_population	= 0
game.g_city_r2_population	= 0
game.g_city_r3_population	= 0
game.g_city_ir_population	= 0
game.g_city_id_population	= 0
game.g_city_im_population	= 0
game.g_city_iht_population	= 0
game.g_city_co2_population	= 0
game.g_city_co3_population	= 0
game.g_city_cs1_population	= 0
game.g_city_cs2_population	= 0
game.g_city_cs3_population	= 0
game.g_region_rci_population	= 0
game.g_region_r_population	= 0
game.g_region_c_population	= 0
game.g_region_i_population	= 0
game.g_city_workforce_population	= 0
game.g_region_workforce_population	= 0
game.g_r1_demand	= 0
game.g_r2_demand	= 0
game.g_r3_demand	= 0
game.g_co2_demand	= 0
game.g_co3_demand	= 0
game.g_r1_active_demand	= 0
game.g_r2_active_demand	= 0
game.g_r3_active_demand	= 0
game.g_co2_active_demand	= 0
game.g_co3_active_demand	= 0
game.g_id_active_demand	= 0
game.g_im_active_demand	= 0
game.g_iht_active_demand	= 0
game.g_workforce_demand	= 0
game.g_workforce_active_demand	= 0
game.g_current_id_cap	= 0
game.g_current_im_cap	= 0
game.g_current_iht_cap	= 0
game.g_current_co2_cap	= 0
game.g_current_co3_cap	= 0
game.g_current_r1_cap	= 0
game.g_current_r2_cap	= 0
game.g_current_r3_cap	= 0
game.g_tax_rate_neutral	= 0
game.g_num_rzone_ld_tiles	= 0
game.g_num_rzone_md_tiles	= 0
game.g_num_rzone_hd_tiles	= 0
game.g_num_czone_ld_tiles	= 0
game.g_num_czone_md_tiles	= 0
game.g_num_czone_hd_tiles	= 0
game.g_num_izone_r_tiles	= 0
game.g_num_izone_l_tiles	= 0
game.g_num_izone_h_tiles	= 0
game.g_num_rail_neighbors	= 0
game.g_num_road_neighbors	= 0
game.g_num_avenue_neighbors	= 0
game.g_num_cities_connected		= 0
game.g_num_cities_adjacent	= 0
game.g_num_cities_connected_indirectly	= 0
game.g_city_has_sea	= 0

-- Extrapolated ----------------------
game.g_r1_demand_extrap = 0
game.g_r2_demand_extrap = 0
game.g_r3_demand_extrap = 0
game.g_r_demand_extrap = 0

game.g_cs1_demand_extrap = 0
game.g_cs2_demand_extrap = 0
game.g_cs3_demand_extrap = 0
game.g_co2_demand_extrap = 0
game.g_co3_demand_extrap = 0
game.g_c_demand_extrap = 0

game.g_ir_demand_extrap = 0
game.g_id_demand_extrap = 0
game.g_im_demand_extrap = 0
game.g_ih_demand_extrap = 0
game.g_i_demand_extrap = 0

-- Misc -----------------------------
game.g_num_buildings = 0
game.g_num_parks = 0
game.g_num_recreation = 0

game.g_parks_funding_p = 0
game.g_landmarks_funding_p = 0
--------------------------------------------------------------------------------------------------
-- EQ ----------------------------

-- Health ----------------------

game.g_health_funding_p = 0 -- --Budget sim
game.g_num_hospitals = 0 -- --cISC4ResidentialSimulator::GetHospitalSystemTotals
game.g_num_clinics = 0 -- --cISC4ResidentialSimulator::GetHospitalSystemTotals
game.l_hospital_funding_l = 0 -- Budget sim or cISC4ResidentialSimulator::GetHospitalQueryData
game.l_hospital_funding_l_subject = 0 --
game.l_clinic_funding_l = 0 -- Budget sim or cISC4ResidentialSimulator::GetHospitalQueryData
game.l_clinic_funding_l_subject = 0 --
game.g_health_strike = 0 -- cISC4ResidentialSimulator::HealthIsOnStrike
game.g_health_strike_chance = 0 -- cISC4ResidentialSimulator::ChanceOfHealthStrike
game.g_health_coverage_p = 0 -- cISC4ResidentialSimulator::GetHospitalSystemTotals & cISC4ResidentialSimulator::GetPopulation
game.ga_health_grade = 0 -- cISC4ResidentialSimulator::GetHealthSystemRating
game.l_hospital_grade_l = 0 -- cISC4ResidentialSimulator::GetHospitalQueryData
game.l_hospital_grade_l_subject = 0 --
game.l_clinic_grade_l = 0 -- cISC4ResidentialSimulator::GetHospitalQueryData
game.l_clinic_grade_l_subject = 0 --
game.ga_life_exp = 0 -- cISC4ResidentialSimulator::GetGlobalLE
game.ga_health = 0 -- cISC4ResidentialSimulator::GetGlobalHQ
game.ga_education = 0 -- cISC4ResidentialSimulator::GetGlobalEQ
game.l_tract_life_exp_l = 0 -- LE is directly tied to HQ.  Therefore, the tract with the highest
game.l_tract_life_exp_l_subject = 0 -- LE is directly tied to HQ.  Therefore, the tract with the highest
game.l_tract_life_exp_h = 0 --     HQ will always be the tract with the highest LE.
game.l_tract_life_exp_h_subject = 0 --     HQ will always be the tract with the highest LE.
game.l_tract_hq_l = 0 -- cISC4ResidentialSimulator:: GetHQMinAndMaxTractCoords
game.l_tract_hq_l_subject = 0 -- cISC4ResidentialSimulator:: GetHQMinAndMaxTractCoords
game.l_tract_hq_h = 0 -- cISC4ResidentialSimulator:: GetHQMinAndMaxTractCoords
game.l_tract_hq_h_subject = 0 -- cISC4ResidentialSimulator:: GetHQMinAndMaxTractCoords
game.g_num_treated_patients = 0 -- cISC4ResidentialSimulator::GetHospitalSystemTotals
game.g_health_capacity = 0 -- ?	cISC4ResidentialSimulator::GetHospitalSystemTotals

-- Education	--------------------

game.g_education_funding_p = 0 -- Budget sim	
game.l_school_funding_l = 0 -- ?	Budget sim or cISC4ResidentialSimulator::GetSchoolQueryData
game.l_school_funding_l_subject = 0 -- ?	Budget sim or cISC4ResidentialSimulator::GetSchoolQueryData
game.g_school_strike = 0 -- cISC4ResidentialSimulator::SchoolIsOnStrike
game.g_school_strike_chance = 0 -- cISC4ResidentialSimulator::ChanceOfSchoolStrike
game.g_education_coverage_p = 0 -- cISC4ResidentialSimulator::GetSchoolSystemTotals & cISC4ResidentialSimulator::GetPopulation
game.ga_school_grade = 0 -- cISC4ResidentialSimulator::GetSchoolSystemRating or GetSchoolSystemTotals 
game.l_school_grade_l = 0 -- cISC4ResidentialSimulator::GetSchoolQueryData
game.l_school_grade_l_subject = 0 -- cISC4ResidentialSimulator::GetSchoolQueryData
game.g_num_educational_buildings = 0 -- ?	cISC4ResidentialSimulator::GetSchoolSystemTotals
game.g_num_schools = 0 -- cISC4ResidentialSimulator::GetSchoolSystemTotals
game.g_num_elem_schools = 0 -- cISC4ResidentialSimulator::GetSchoolSystemTotals
game.g_num_high_schools = 0 -- cISC4ResidentialSimulator::GetSchoolSystemTotals
game.g_num_colleges = 0 -- cISC4ResidentialSimulator::GetSchoolSystemTotals
game.g_num_libraries = 0 -- cISC4ResidentialSimulator::GetSchoolSystemTotals
game.g_num_museums = 0 -- cISC4ResidentialSimulator::GetSchoolSystemTotals
game.g_num_library_served = 0 -- cISC4ResidentialSimulator::GetSchoolSystemTotals
game.g_num_museum_served = 0 -- cISC4ResidentialSimulator::GetSchoolSystemTotals
game.l_museum_grade_l = 0 -- 	cISC4ResidentialSimulator::GetSchoolSystemTotals
game.l_museum_grade_l_subject = 0 --
game.l_library_grade_l = 0 -- 	cISC4ResidentialSimulator::GetSchoolSystemTotals
game.l_library_grade_l_subject = 0 --
game.ga_museum_grade = 0 -- cISC4ResidentialSimulator::GetSchoolSystemTotals
game.ga_library_grade = 0 -- cISC4ResidentialSimulator::GetSchoolSystemTotals
game.l_tract_eq_l = 0 -- cISC4ResidentialSimulator:: GetEQMinAndMaxTractCoords
game.l_tract_eq_l_subject = 0 -- cISC4ResidentialSimulator:: GetEQMinAndMaxTractCoords
game.l_tract_eq_h = 0 -- cISC4ResidentialSimulator:: GetEQMinAndMaxTractCoords
game.l_tract_eq_h_subject = 0 -- cISC4ResidentialSimulator:: GetEQMinAndMaxTractCoords

---------------------------------------------------------------------
-- Time --------------------

game.g_day = 0
game.g_month = 0
game.g_year = 0 -- some constant-based year count. At this point the initial (for a new city) year is 2000.
game.g_year_count = 0 -- zero-based year count. For new cities this is set to zero, increasing by 1 every game year. 
game.g_date = 0

----------------------------------------------------------------------
-- EP1

game.ga_bridge_congestion = 0 --	average bridge tiles congestion
game.ga_road_congestion = 0 --	confirm that this measures roads ONLY - no streets included
game.ga_street_congestion	 = 0 --	the average congestion of streets ONLY in the city
game.ga_avenue_congestion	 = 0 --	the average congestion of streets ONLY in the city
game.ga_elevated_congestion	 = 0 --	the average congestion of streets ONLY in the city
game.ga_monorail_congestion	 = 0 --	the average congestion of streets ONLY in the city
game.ga_freight_trip_length	 = 0 --	the average trip length of all freight trips in the city

game.ga_elevated_station_utilization_p	 = 0 --	the average utilzation of elevated rapid transit stations in the city (see existing subway station utilization)
game.g_elevated_station_count	 = 0 --	count the number of elevated rapid transit station in the city
game.l_elevated_station_utilization_pl = 0
game.l_elevated_station_utilization_pl_subject = 0

game.ga_bus_station_utilization_p	 = 0 --	the average utilzation of elevated rapid transit stations in the city (see existing subway station utilization)
game.g_bus_station_count	 = 0 --	count the number of elevated rapid transit station in the city
game.l_bus_station_utilization_pl = 0
game.l_bus_station_utilization_pl_subject = 0

game.ga_monorail_station_utilization_p	 = 0 --	the average utilzation of elevated rapid transit stations in the city (see existing subway station utilization)
game.g_monorail_station_count	 = 0 --	count the number of elevated rapid transit station in the city
game.l_monorail_station_utilization_pl = 0
game.l_monorail_station_utilization_pl_subject = 0

game.g_train_freight_depot_count	 = 0 --	count the number of rail freight depots plopped in the city
game.g_seaport_count	 = 0 --	count the number of seaports plopped in the city
game.g_car_ferry_count	 = 0 --	count the number of car ferry terminals in the city'
game.g_passenger_ferry_count	 = 0 --	count the number of passenger ferry terminals in the city

game.l_road_congestion_h	 = 0 --	confirm that this looks for congestion on roads ONLY - no streets
game.l_street_congestion_h	 = 0 --	the congestion level of the most congested street in the city
game.l_avenue_congestion_h	 = 0 --	the congestion level of the most congested avenue in the city

game.l_road_congestion_h_subject	 = 0 --	confirm that this looks for congestion on roads ONLY - no streets
game.l_street_congestion_h_subject	 = 0 --	the location of the most congested street tile in the city
game.l_avenue_congestion_h_subject	 = 0 --	the location of the most congested avenue in the city

game.l_bridge_congestion_h	 = 0 --	the congestion level of the most congested bridge tile in the city
game.l_road_connection_congestion_h	 = 0 --	the congestion level of the the most congested road neighbor connection in the city
game.l_avenue_connection_congestion_h	 = 0 --	the congestion level of the most congested avenue neighbor connection in the city

game.l_bridge_congestion_h_subject	 = 0 --	the location of the most congested bridge tile in the city
game.l_road_connection_congestion_h_subject	 = 0 --	the location of the most congested road neighbor connection in the city
game.l_avenue_connection_congestion_h_subject	 = 0 --	the location of the most congested avenue neighbor connection in the city

game.g_dirtroad_tile_count	 = 0 --	count then number of tiles with dirt road occupants in the city
game.g_avenue_tile_count	 = 0 --	count the number of tiles with avenue occupants in the city
game.g_street_tile_count	 = 0 --	count the number of tiles with street occupants in the city
game.g_city_tile_size	 = 0 --	the size of the city in tiles: i.e. 4096, 16384, or 65536
game.g_water_tile_count	 = 0 --	the number of tiles in a city that are occupied by water
game.g_groundhighway_tile_count	 = 0 --	count the number of tiles with ground-level highway occupants in the city
game.g_elevated_rail_tile_count	 = 0 --	count the number of tiles with elevated rapid transit occupants in the city
game.g_monorail_tile_count	 = 0 --	count the number of tiles with monorail transit occupants in the city
game.g_bridge_tile_count	 = 0 --	total bridge tile count

game.g_num_rapidtransit_transitions	 = 0 --	count the number of subway-to-elevated rapid transit track transitions in the city
game.g_num_tollbooths	 = 0 --	count then number of tollbooths plopped in the city
game.g_seaport_volume	 = 0 --	count the number of freght trips that reach all seaports in the city

game.g_car_ferry_trip_completed	 = 0 --	a car ferry terminal completes a test trip
game.g_passnger_ferry_trip_completed	 = 0 --	a passnger ferry terminal completes a test trip
game.g_return_trip_failed_count	 = 0 --	the number of commute return trips that could not find their destination
game.g_car_ferry_trip_failed	 = 0 --	a car ferry terminal cannot complete a test trip to another car ferry terminal nor find a car ferry neighbor connection
game.g_passnger_ferry_trip_failed	 = 0 --	a passnger ferry terminal cannot complete a test trip to another car ferry terminal nor find a car ferry neighbor connection

game.l_seaport_water_edge_no_access	 = 0 --	a seaport cannot complete a test trip to a water edge of the city
game.l_seaport_water_edge_no_access_subject	 = 0 --	location of the seaport that cannot complete test trip

game.g_car_zot_count	 = 0 --	count the number of car zots (can't complete trip) appearing in the city

game.l_ferry_no_road_access	 = 0 --	a car ferry terminal has a car zot
game.l_shuttle_no_road_access	 = 0 --	a passenger ferryterminal has a car zot
game.g_seaport_no_road_access	 = 0 --	a seaport has a car zot
game.g_airport_no_road_access	 = 0 --	an airport has a car zot

game.l_ferry_no_road_access_subject	 = 0 --	location of the car ferry terminal with a car zot
game.l_shuttle_no_road_access_subject	 = 0 --	location of the passnger ferry terminal with a car zot
game.g_seaport_no_road_access_subject	 = 0 --	location of the seaport with a car zot
game.g_airport_no_road_access_subject	 = 0 --	location of airport with a car zot

game.g_rail_neighbor_connection_count	 = 0 --	count the number of neighbor city rail connections in the city

