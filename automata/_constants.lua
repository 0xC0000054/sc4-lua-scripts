--
-- _constants.lua
-- 
-- commonly-used constants for automata scripts
--

--------------------------------------
-- prevent this file from being included multiple times
if not rawget(globals(), "_constants_lua") then
_constants_lua = 1
--------------------------------------
dofile("_system.lua");


-- effect trigger id's
effects = {
   FIRE_STRIKE_ACTIVE              = "0x2a5f6e60",
   POLICE_STRIKE_ACTIVE          = "0x2a5f6e61",
   HEALTH_STRIKE_ACTIVE          = "0x2a5f6e62",
   EDUCATION_STRIKE_ACTIVE    = "0x2a5f6e63",
   TRANSIT_STRIKE_ACTIVE        = "0x2a5f6e64",
}

automata_priority = {
   NORMAL      = 0,
   LOW         = 25,
   MEDIUM      = 50,
   HIGH        = 75,
   PRETTY_HIGH = 125,
   EVEN_HIGHER = 150,
   HIGHEST     = 255
}

kPI = 3.14159265359
kAngle1Degree = 0.01745329252
kVelocity1KPH = 0.0002777778


-- keep a list of occupant groups you want the automata managers to keep track of
-- if a group is in this list, then scripts can call
--      sc4game.automata.get_source_building_count(group)
-- to get the number of buildings of that group that currently exist in the city
--
track_buildings = {
   hex2dec('0x1305'),            -- passenger rail
   hex2dec('0x1306'),            -- freight rail
   hex2dec('0x150A'),            -- landmark
   hex2dec('0x150F'),            -- schools_k6
   hex2dec('0x13110'),           -- CS1 (CS$)
   hex2dec('0x13120'),           -- CS2 (CS$$)
   hex2dec('0x13130'),           -- CS3 (CS$$$)
   hex2dec('0x1307'),            -- Monorail station
}

--------------------------------------
-- end include check
end
