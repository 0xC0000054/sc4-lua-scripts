--
-- _config.lua
--
-- This is the "master" script file for the automata types and automata controller objects,
-- the main entry point for the automata scripting system
--

if (not rawget(globals(), "_system_lua")) then
	dofile("_system.lua");
end

--------------------------------------
-- Globals
-- Don't modify this section!
--
dofile("_templates.lua");

--------------------------------------



---------------------------
-- Script includes
--
-- Add any additional files HERE, to the end of this block
--
dofile("_sfx.lua");
dofile("_keycodes.lua");
dofile("_constants.lua");
dofile("vehicles.lua");
dofile("aircraft.lua");
dofile("accidents.lua");
dofile("ambulance.lua");
dofile("ape_escape.lua");
dofile("armybase.lua");
dofile("army_peds.lua");
dofile("army_jumpjacks.lua");
dofile("armytank.lua");
dofile("arson.lua");
dofile("attractors.lua");
dofile("biz.lua");
dofile("bus_stop.lua");
dofile("college.lua");
dofile("construction.lua");
dofile("convention.lua");
dofile("countryclub.lua");
dofile("courthouse.lua");
dofile("crowd.lua");
dofile("crowd_biz.lua");
dofile("crowd_sm.lua");
dofile("crowd_mower.lua");
dofile("crowd_sm_stand.lua");
dofile("crowd_whitecoat.lua");
dofile("disasters.lua");
dofile("doggy.lua");
dofile("dmv.lua");
dofile("fire.lua");
dofile("fireworks_crowd.lua");
--~ dofile("france.lua");
--~ dofile("gallery.lua");
dofile("garbage.lua");
dofile("generators.lua");
dofile("hearse.lua");
--~ dofile("green_happy.lua");
dofile("jailbreak.lua");
dofile("kidcrowd.lua");
dofile("landmark_ogle.lua");
dofile("landmark_queue.lua");
dofile("maxis.lua");
dofile("museum.lua");
dofile("my_sim_died.lua");
dofile("niteclub.lua");
dofile("nuclear.lua");
dofile("opera.lua");
dofile("pedestrians.lua");
dofile("police_station_big.lua");
dofile("police_stations.lua");
dofile("recycle.lua");
--~ dofile("reward.lua");
dofile("riots.lua");
dofile("simcrowd.lua");
dofile("schools.lua");
dofile("schools_hs.lua");
dofile("stadium.lua");
dofile("strikers.lua");
dofile("statefair.lua");
dofile("Taxi.lua");
--~ dofile("tourist.lua");
dofile("toxic.lua");
dofile("tv_magnet.lua");
dofile("tv_station.lua");
dofile("vip.lua");
dofile("watercraft.lua");
dofile("wildlife.lua");
dofile("worship.lua");
dofile("zoomanji.lua");
dofile("mayorlimo.lua");
dofile("trains.lua");
dofile("icecream.lua");

---------------------------

---------------------------
-- Verification
-- Does template and type checking on the expected tables, which were generated
-- by the above dofile's.  (We can comment this out in shipping versions, for optimization)
--
--verify_all_templates();		-- defined in _system.lua
---------------------------

