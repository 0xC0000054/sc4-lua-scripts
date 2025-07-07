--
-- generators.lua
--
-- Definitions of common global generator templates
--

dofile("_templates.lua")
------

-- to create pursuit vehicles to chase an automaton during city missions
generator.mission_pursuit_generator = 
{
	automata = {  },					
   count = 1,
	rate = 3,
	rate_scale = RateScale.PER_HOUR,
	max_count=8,
	radius = { 32, 64 },
	follow_roads = true,
   destroy_automata=true,
   delay = 6,
}
