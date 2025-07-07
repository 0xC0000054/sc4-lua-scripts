-----------------------------------------------------------------------------------------
-- This file defines advices for the the TRANSPORTATION
dofile("adv_transportation.lua") 

--------------------------------------------------------------------
-- Add EP1 specific advice in this section.
-- 

---Deletes old transportation messages From Release that are obsolete in EP1
--------------------------------------------------------------------
delete_advice('2a355b3b')
delete_advice('2a5df245')
delete_advice('0a5df6b5')
delete_advice('2a5e0015')
delete_advice('8a5e1013')
delete_advice('2a5e1249')
delete_advice('ca5e135c')
delete_advice('6a5e15da')
delete_advice('cbf183eb')
delete_advice('2a5e16da')
delete_advice('ca5e1ac0')
delete_advice('aa5e1d78')
delete_advice('0a5e23ea')
delete_advice('cbf18d6a')
delete_advice('6a5e2e4d')
delete_advice('6a5e2f31')
delete_advice('0a5e389a')
delete_advice('8a5e530f')
delete_advice('aa5e551d')
delete_advice('0a5e5605')
delete_advice('8a5e5681')
delete_advice('aa5e5799')
delete_advice('ea5e5805')
delete_advice('ea5e5cce')
delete_advice('ea5e5d1e')
delete_advice('6a5e5e9e')
delete_advice('2a5e62a2')
delete_advice('ea5e632d')
delete_advice('2a5e63bb')


---New EP1-specific transportation messages
--------------------------------------------------------------------
-------Testing record
a = create_advice_transportation('4c05d1b6')
a.trigger = "0"
a.title = [[trans data]]
a.message = [[#game.g_avenue_tile_count#-avenue tiles, #game.g_road_tile_count#-road tiles, #game.g_street_tile_count#-street tiles, #game.ga_rail_congestion#-avg.rr.cong, #game.g_rail_tile_count#-rr tiles, #game.ga_seaport_efficiency#-seaport.eff]]
a.priority  =tuning_constants.ADVICE_PRIORITY_HIGH


------------ Advice record ----
a = create_advice_transportation('8bf08937')
a.trigger  = "game.g_month > 3"
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8bf03811	Get Your City Moving! Meet Jamil Herd, Your Transportation Advisor]]
a.message   = [[text@0bf03834	Greetings, Mayor. I'm Jamil Herd, your transit man, here to give you the lowdown on everything that moves in the city. The most important thing for any Sim is to be able to get from place to place. Every house and business needs to face a road or street to develop, and that road or street needs to be connected somehow to every other road or street in the city. Any gaps or breaks and your Sims are stranded. But if you make sure every lot in the city accessible - each with a <a href="#link_id#game.tool_plop_network(network_tool_types.STREET)">street</a> in front - your Sims will be on the move.]]
a.priority  =tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
a = create_advice_transportation('abf095d2')
a.trigger  = "game.g_avenue_tile_count ==0 and game.g_road_tile_count == 0 and game.g_city_rci_population > 3000 and game.g_city_rci_population < 12000"
--early in a city's development, if the player has not yet laid any roads or avenues
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6bf0383c	The Open Road - The Best Route to a Growing City]]
a.message   = [[text@ebf03841	What a fine <a href="#link_id#game.window_map(map_window_types.TRAFFIC)">network of streets</a> you've built for #city#! North and south, up and down, our Sims love the quaint appeal of these lovely little lanes. But at some point our Sims will tire of the slow speed limits and four-way stops everywhere, and then it's time to start laying down some <a href="#link_id#game.tool_plop_network(network_tool_types.ROAD)">higher capacity roads</a>, either new routes or <a href="#link_id#game.tool_plop_network(network_tool_types.ROAD)">upgrading existing streets</a>. Roads are faster and more efficient than streets, with timed traffic signals and right-of-way over the quieter streets. For a Sim trying to get across town, the road is the way to go. By the way, if you extend any road to the edge of the city you connect to the great wide world outside - inviting more growth and development.]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.priority  =tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
--Crisis Looms As Sims Are Cut off From Livelihoods
a = create_advice_transportation('abf0972a')
a.trigger  = "game.g_car_zot_count > 0.3 * (game.g_num_rzone_ld_tiles+game.g_num_rzone_md_tiles+game.g_num_rzone_hd_tiles)/2 and game.g_city_rci_population < 3000 and game.g_city_rci_population > 300"
--count number of car zots, compare to number of R tiles, low population
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4bf03850	Crisis Looms As Sims Are Cut off From Livelihoods]]
a.message   = [[text@cbf03853	We have some frustrated sims in #city# today. They leave for work every morning but are stopped in their tracks because the <a href="#link_id#game.window_map(map_window_types.TRAFFIC)">streets don't connect</a>. So they are unable to get to their jobs, and I've heard that if they miss any more days then they'll probably get fired. Help them out, Mayor, and <a href="#link_id#game.tool_plop_network(network_tool_types.ROAD)">build roads</a> to connect your residential zones to your commercial and industrial zones.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--Relocate Street Traffic to the Open Road
a = create_advice_transportation('4bf09736')
a.trigger  = "game.g_avenue_tile_count + game.g_road_tile_count <  0.1 * game.g_street_tile_count and game.ga_street_congestion > 120"
--when a city has very few road tiles and congestion on the streets is getting bad
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0bf03856	Relocate Street Traffic to the Open Road]]
a.message   = [[text@8bf03859	#city# is really starting to grow, Mayor. Sims coming and going, to work, to play - but they have to be careful. I'm afraid our streets alone can't safely handle all that <a href="#link_id#game.window_map(map_window_types.TRAFFIC)">added traffic</a>. It's not only slow but also dangerous! You should consider creating a few <a href="#link_id#game.tool_plop_network(network_tool_types.ROAD)">higher-capacity roads</a> to take the traffic pressure off our lovely streets.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
--Traffic Jam On Side Street Has Local Sims Stewing
a = create_advice_transportation('8bf09867')
a.trigger  = "game.l_street_congestion_h > tuning_constants.TRAFFIC_CONGESTION_VERY_HIGH+15"
--game.l_street_congestion_h > high
a.frequency = tuning_constants.ADVICE_FREQUENCY_VERY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@abf03875	Traffic Jam on Side Street Has Local Sims Stewing]]
a.message   = [[text@6bf03879	I've received complaints from several sims on <a href="#link_id#game.camera_jump_and_zoom(game.l_street_congestion_h_subject,camera_zooms.MAX_IN)">this street</a> that the traffic has become unbearable. For some reason, more and more drivers find it necessary to take this route to get where they're going - endangering local pedestrians. You could consider <a href="#link_id#game.tool_plop_network(network_tool_types.ROAD)">upgrading the street to a road</a> to handle the extra traffic, or you could encourage those drivers to take an alternative route by <a href="#link_id#game.tool_plop_network(network_tool_types.ROAD)">building a new road</a> or <a href="#link_id#game.tool_plop_network(network_tool_types.AVENUE)">avenue</a> nearby as a bypass.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--Local Road Reaches Limit - A Chaos of Cars
a = create_advice_transportation('2bf09aa1')
a.trigger  = "game.l_road_congestion_h > tuning_constants.TRAFFIC_CONGESTION_VERY_HIGH"
--game.l_road_congestion_h > high
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2bf0387d	Local Road Reaches Limit - A Chaos of Cars]]
a.message   = [[text@2bf03881	 Ouch!  #city# has been experiencing some serious growing pains lately, Mayor. We've been getting chronic delays and recurring accidents on <a href="#link_id#game.camera_jump_and_zoom(game.l_road_congestion_h_subject,camera_zooms.MAX_IN)">this stretch of road</a>, and more and more drivers are getting road rage. The whole area is becoming a traffic nightmare, and we need to do something to relieve the strain. You could upgrade the road to an extra-wide <a href="#link_id#game.tool_plop_network(network_tool_types.AVENUE)">avenue</a>, which would probably require some expensive demolition. You could make this road two lanes <a href="#link_id#game.tool_plop_network(network_tool_types.ONEWAY)">one-way</a>, but you'd need to be sure you made another nearby parallel road <a href="#link_id#game.tool_plop_network(network_tool_types.ONEWAY)">one-way</a> in the opposite direction. Finally you could redirect the bulk of this traffic, bypassing these crowded roads, by beefing up capacity elsewhere in the vicinity.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--Big-Time Traffic Problems Hit Local Avenue
a = create_advice_transportation('6bf09be8')
a.trigger  = "game.l_avenue_congestion_h > tuning_constants.TRAFFIC_CONGESTION_VERY_HIGH"
--game.l_avenue_congestion_h > high
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2bf03885	Big-Time Traffic Problems Hit Local Avenue]]
a.message   = [[text@6bf0388a	It's bumper to bumper out there, Mayor, and <a href="#link_id#game.camera_jump(game.l_avenue_congestion_h_subject)">this particular avenue</a> is in especially bad shape. Every day at rush hour it becomes a virtual parking lot as commuters stew. Perhaps it's time to consider some major upgrades? What if we constructed a <a href="#link_id#game.tool_plop_network(network_tool_types.ELEVATED_RAIL)">rapid transit line</a> to give these drivers an alternative commute? Or you might consider building <a href="#link_id#game.tool_plop_network(network_tool_types.GROUND_HIWAY)">a highway</a> to handle the extra volume. Both are big investments, and you'll need to be sure that you provide proper access, such as <a href="#link_id#game.tool_plop_building(building_tool_types.ELEVATED_STATION)">transit stations</a> or <a href="#link_id#game.tool_plop_network(network_tool_types.HIWAY_RAMP)">highway ramps</a> - to ensure they will be used.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--"My Husband Went to Work - and Never Returned!"
a = create_advice_transportation('abf09c68')
a.trigger  = "0"
--morning commutes that take a one-way road have consistently failed evening commutes
---TRIGGER NOT AVAILABLE YET
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0bf0388d	"My Husband Went to Work - and Never Returned!"]]
a.message   = [[text@0bf03890	Something is very wrong with our current <a href="#link_id#game.window_map(map_window_types.TRAFFIC)">road network</a>, Mayor! I've been getting countless reports of sims going to work but then not able to get home. Critics say it could turn out to be a refugee problem of staggering proportions unless you quickly provide a route to get home again. The problem could be a one-way street with no opposite way, or it could be that you are missing a highway ramp somewhere. Look into it now, Mayor, while I petition for humanitarian aid.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
--Mayor Encouraged To Get On Board New Bus Proposal
a = create_advice_transportation('8bf09d10')
a.trigger  = "game.g_bus_station_count == 0 and game.g_city_r1_population > 3000 and (game.ga_road_congestion + game.ga_street_congestion)/2 > tuning_constants.TRAFFIC_CONGESTION_LOW"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2bf03893	Mayor Encouraged to Get on Board New Bus Proposal]]
a.message   = [[text@4bf03896	I've been running some numbers, and it looks to me like #city# is more than ready for some public mass transporation. Not only is <a href="#link_id#game.window_map(map_window_types.TRAFFIC)">traffic a headache</a>, a lot of our sims are rather poor and they cannot all afford a car of their own. So you can imagine that getting around town is difficult. Why not place a few <a href="#link_id#game.tool_plop_building(building_tool_types.BUS_STOP)">bus stops</a> around town - ideally at busy intersections in the middle of neighborhoods, commercial districts, and industrial zones.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
--Rail Access Sows the Seeds for Industrial Growth
a = create_advice_transportation('0bf180b2')
a.trigger  = "game.ga_freight_trip_length > 300 and game.g_rail_tile_count > 50 and game.g_rail_neighbor_connection_count > 0 and game.g_city_i_population > 600"
--average freight trip length
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4bf03899	Rail Access Sows the Seeds for Industrial Growth]]
a.message   = [[text@8bf0389c	If you haven't noticed already, Mayor, industries just go ga-ga over building sites with <a href="#link_id#game.window_map(map_window_types.I-D_DESIRABILITY)">direct access to rail</a>. Something about being able to ship large quantities quickly makes those factory owners open their wallets and invest, invest, invest! You know, if we extended some <a href="#link_id#game.tool_plop_network(network_tool_types.RAIL)">rail spurs</a> off of the main rail line, providing more direct rail access to more of our industrial zones, I'll be we'll have new industries knocking the door down to move into #city#.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
--Water: The Way? Or Simply <b>in</b> the Way?
a = create_advice_transportation('cbf180c6')
a.trigger  = "(100*256*game.g_water_tile_count) / game.g_city_tile_size > 25 and game.g_month > 5"
--new city, % of city tiles water > x
a.once = 1
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@cbf0389e	Water: The Way? Or Simply <b>in</b> the Way?]]
a.message   = [[text@0bf038a2	#city# is blessed to have such scenic waterways, Mayor. But they can be a wet blanket to a transportation planner. Try as you might, you can't pave water. Bridges are a reliable way to link to islands or cross rivers and bays, but they can be really expensive. So you might consider building a pair of <a href="#link_id#game.tool_plop_building(building_tool_types.CAR_FERRY)">ferry terminals</a> instead. Ferries are a pleasant alternative to big burly bridges, not to mention cheap!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
--Bridge Bottleneck Begs for New Crossing
a = create_advice_transportation('6bf18169')
a.trigger  = "game.l_bridge_congestion_h > tuning_constants.TRAFFIC_CONGESTION_HIGH"
--bridge congestion high
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@abf038a5	Bridge Bottleneck Begs for New Crossing]]
a.message   = [[text@2bf038ac	Traffic is a problem whereever it arises, but it's a huge problem when you have a <a href="#link_id#game.camera_jump(game.l_bridge_congestion_h_subject)">bridge that is overcrowded</a>. We need to find a way for more sims to get to the other side. The way I see it, we have three options: Upgrade the existing bridge to <a href="#link_id#game.tool_plop_network(network_tool_types.AVENUE)">higher volume</a>, which is really expensive. Build <a href="#link_id#game.tool_plop_network(network_tool_types.ROAD)">another bridge</a> nearby, also expensive. Or establish a <a href="#link_id#game.tool_plop_building(building_tool_types.CAR_FERRY)">ferry route</a> to shuttle cars from one shore to the other - not very efficient, but it sure is cheap.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--Single Ferry Terminal Baffles #city# Sims
a = create_advice_transportation('abf181d0')
a.trigger  = "(game.g_car_ferry_count == 1 and game.g_car_ferry_trip_failed) or (game.g_passenger_ferry_count == 1 and game.g_passnger_ferry_trip_failed)"
--ferry trip cannot be completed
--TRIP-FAILED TRIGGERS NOT YET AVAILABLE
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2bf038b0	Single Ferry Terminal Baffles #city# Sims]]
a.message   = [[text@2bf038b5	Starting a ferry service was a good idea, Mayor, but the ferry captain tells me he has nowhere to take his passengers, and he's <i>not</i> there to provide a pleasure cruise. We need at least one more ferry terminal somewhere in the city (or in a neighbor city). Build a "there" - as in "from here to there."]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--#city# Inaugurates First Ferry - Helpful Tips
a = create_advice_transportation('4bf18260')
a.trigger  = "game.g_car_ferry_trip_completed or game.g_passnger_ferry_trip_completed"
--ferry trip completed
--TRIP-COMPLETED TRIGGERS NOT YET AVAILABLE
a.once = 1
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4bf038b8	#city# Inaugurates First Ferry - Helpful Tips]]
a.message   = [[text@abf038bd	  I just returned from the maiden voyage of #city#'s new ferry system. Well done, Mayor. What a trip!  
Now that we're in the business of public water transport, I thought I'd point out a couple of things. Ferries come in two sizes: <a href="#link_id#game.tool_plop_building(building_tool_types.PASS_FERRY)">passenger-only shuttles</a> and larger and more expensive <a href="#link_id#game.tool_plop_building(building_tool_types.CAR_FERRY)">car-ferries</a> - and both must be connected to a road to function, and passenger shuttles always do better if you locate a <a href="#link_id#game.tool_plop_building(building_tool_types.BUS_STOP)">bus stop</a>, <a href="#link_id#game.tool_plop_building(building_tool_types.ELEVATED_STATION)">transit station</a>, or <a href="#link_id#game.tool_plop_building(building_tool_types.PUBLIC_PARKING)">parking garage</a> nearby.
You must also have at least two terminals of the same type to get a route started. Be sure to hae a continuous body of water between all terminals, and low bridges may block potential ferry routes. Ferries are able to take passengers to neighbor cities with ferry terminals too, providing an alternative commute. You might need to add more ferries as more users come to depend on them, or you might consider building more bridges instead.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
--Ferry Captain Swears Eternal Vengeance Against New Bridge
a = create_advice_transportation('abf182fa')
a.trigger  = "0"
-- event: a new bridge breaks an existing ferry path
--TRIGGERS NOT YET AVAILABLE
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4bf038c2	Ferry Captain Swears Eternal Vengeance Against New Bridge]]
a.message   = [[text@28bf038c7	Our ferry captain came to my office today swearing like a sailor. It seems the new bridge you have built has completely cut off his route, stranding his boats. He'd like to have you walk the gang-plank, Mayor! You don't have many good options, unfortunately. You could build him a new <a href="#link_id#game.tool_plop_building(building_tool_types.CAR_FERRY)">ferry terminal</a> on the same side of the new bridge, or you could <a href="#link_id#game.tool_button(button_tool_types.DEMOLISH)">discontinue ferry service</a> altogether. But if you do that, I suggest you beware of stray harpoons.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--#city# Builds First Highway - Helpful Tips
a = create_advice_transportation('6bf1845f')
a.trigger  = "game.g_groundhighway_tile_count > 4 or game.g_highway_tile_count > 4"
--when the first highway section of either type is laid
a.once = 1
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@cbf038ca	#city# Builds First Highway - Helpful Tips]]
a.message   = [[text@2bf038cd	 I just got a look at that big, beautiful ribbon of concrete we call a highway, Mayor. What a sight!  
Here's a bit of wisdom about highway planning, Mayor. <a href="#link_id#game.tool_plop_network(network_tool_types.GROUND_HIWAY)">Ground-level highways</a> are much less expensive than <a href="#link_id#game.tool_plop_network(network_tool_types.HIGHWAY)">elevated highways</a>, so if you're only connecting two developed areas or cities then I recommend building at <a href="#link_id#game.tool_plop_network(network_tool_types.GROUND_HIWAY)">ground-level</a> to save money. But if you need to cross roads or rail lines or create a highway exit, then you'll need to build sections that are <a href="#link_id#game.tool_plop_network(network_tool_types.HIGHWAY)">elevated</a> first - so that the roads can pass freely underneath. When your city is getting more crowded and dense, it's a good idea to rebuild more ground-level sections to elevated so that local traffic can flow more smoothly.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
--Construction Begins on #city# Rapid Transit
a = create_advice_transportation('abf1852b')
a.trigger  = "game.g_subway_tile_count > 3 or game.g_elevated_rail_tile_count > 3"
--when a transit line of either type is first laid
a.once = 1
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6bf038d0	Construction Begins on #city# Rapid Transit]]
a.message   = [[text@4bf038d4	So, you've taken the plunge and started building a rapid transit system for #city#. Exciting stuff! I tell you, there's nothing more efficient than rolling your sims around on dedicated rail lines. But unless you have tons of simoleons to spare, I recommend we start with a network of <a href="#link_id#game.tool_plop_network(network_tool_types.ELEVATED_RAIL)">elevated lines</a>, and as we can afford it build <a href="#link_id#game.tool_plop_network(network_tool_types.SUBWAY)">subway lines</a> in the more dense and valuable areas. And don't forget to add plenty of <a href="#link_id#game.tool_plop_building(building_tool_types.ELEVATED_STATION)">stations</a>!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
--Disjointed Rapid Transit Networks Disrupts Commuter Efficiency
a = create_advice_transportation('6bf1858f')
a.trigger  = "game.g_subway_tile_count > 10 and game.g_elevated_rail_tile_count > 10 and game.g_num_rapidtransit_transitions == 0"
--if there are elevated lines and there are subway lines, but there are not any transitions in city
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4bf038d7	Marriage proposed]]
a.message   = [[text@cbf038db	    Mayor, I think I need to point out that we've managed to build two completely independent transit networks in #city# - one above ground and one below. You know, if you <a href="#link_id#game.tool_plop_building(building_tool_types.SUB_EL_TRANSITION)">connected the two together</a> we could have one big network - which would be much more efficient.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL

------------ Advice record ----
--Rush Hour Commute Is Anything But Rushed
a = create_advice_transportation('abf18605')
a.trigger  = "game.l_road_connection_congestion_h > tuning_constants.TRAFFIC_CONGESTION_VERY_HIGH"
--congestion on any road nbr connection is high, and no avenue or highway connections
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4bf038de	Rush Hour Commute Is Anything But Rushed]]
a.message   = [[text@ebf038e3	   #city# had been getting more and more commuters traveling to and from neighbor cities every day, and every day there is a mass automobile exodus to the city limits. <a href="#link_id#game.camera_jump(game.l_road_connection_congestion_h_subject)">This road in particular</a> becomes a parking lot every morning and evening. We need to do more to loosen up that traffic jam. You could either <a href="#link_id#game.tool_plop_network(network_tool_types.ROAD)">build more roads</a> connecting to the same neighbor or upgrade that road to <a href="#link_id#game.tool_plop_network(network_tool_types.AVENUE)">an avenue</a>.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--Major Commute Requires Major Solutions
a = create_advice_transportation('4bf18b12')
a.trigger  = "game.l_avenue_connection_congestion_h > tuning_constants.TRAFFIC_CONGESTION_VERY_HIGH"
--volume on any avenue nbr connection is high, and no highway connections
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@cbfeedff Major Commute Requires Major Solutions]]
a.message   = [[text@abf038e7	 #city# has become a major commuter city, Mayor, with countless sims flocking in and out of town every day. As a result, we have major rush hour traffic - especially on <a href="#link_id#game.camera_jump(game.l_avenue_connection_congestion_h_subject)">this avenue</a>. Maybe it's time to take the next step and <a href="#link_id#game.tool_plop_network(network_tool_types.GROUND_HIWAY)">build a highway</a> from this city to the others? Or instead, you could encourage more public transportation - either by providing <a href="#link_id#game.tool_plop_building(building_tool_types.PASSENGER_RAILSTATION)">passenger rail stations</a> or by connecting a <a href="#link_id#game.tool_plop_network(network_tool_types.ELEVATED_RAIL)">rapid transit network</a> between cities. Big-time cities require big-time decisions. What will it be, Mayor?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--Single Bus Stop Has Sims Baffled
a = create_advice_transportation('6bf18b99')
a.trigger  = "game.g_bus_station_count == 1"
--only one bus station in a city
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2bf038ef	Single Bus Stop Has Sims Baffled]]
a.message   = [[text@8bf038f3	My grandmother used to tell me, "One bus stop does not a transit system make!" Well, it went something like that. #city# currently has only one bus stop, and sims who get on the bus there don't have anywhere else to get off. It's very frustrating, and it's no surprise that sims aren't taking the bus at all. I encourage you to be more generous and start building more <a href="#link_id#game.tool_plop_building(building_tool_types.BUS_STOP)">bus stops</a> around town.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--#city# Heralds New Bus Network - Helpful Tips
a = create_advice_transportation('abf18bfc')
a.trigger  = "game.g_bus_station_count > 1"
--second bus station in city is plopped
a.once = 1
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@abf038f6	#city# Heralds New Bus Network - Helpful Tips]]
a.message   = [[text@6bf038f9	So, you're serious about establishing a bus system, Mayor? Let me applaud you for your vision!
I have a couple of comments about busses that might serve you well. First, try to locate new <a href="#link_id#game.tool_plop_building(building_tool_types.BUS_STOP)">bus stops</a> by busy intersections yet within walking distance of where sims live and work. In low density residential areas, it might help to build a <a href="#link_id#game.tool_plop_building(building_tool_types.PUBLIC_PARKING)">public parking garage</a> next door to encourage sims to park and ride. Finally, remember that wealthy sims are much less likely to take the bus, and poorer sims are the most likely to ride. Keep these things in mind as you continue to expand #city#'s bus network.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
--Single Rapid Transit Station Has Sims Baffled
a = create_advice_transportation('6bf18c62')
a.trigger  = "(game.g_elevated_station_count + game.g_subway_station_count) == 1"
--only one rapid transit station in a city
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8bf038fd	Single Rapid Transit Station Has Sims Baffled]]
a.message   = [[text@abf03901	There are reports of excited sims boarding our new rapid transit system, and never heard from again! Mayor, it's critical that we build at least one more <a href="#link_id#game.tool_plop_building(building_tool_types.ELEVATED_STATION)">transit station</a> in town - and preferably more. Sims need to both board <b>and</b> disembark when they travel.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--#city# Unveils New Rapid Transit System - Helpful Tips
a = create_advice_transportation('6bf18cd6')
a.trigger  = "(game.g_elevated_station_count + game.g_subway_station_count) > 1"
--second rapid transit station in city is plopped
a.once = 1
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2bf03904	#city# Unveils New Rapid Transit System - Helpful Tips]]
a.message   = [[text@6bf03907	Mayor, I'm as giddy as a school bus over our new state-of-the-art rapid transit system. The rush I get as a train pulls into the station is almost as euphoric as sniffing fresh asphalt. 
I have a few words of advice for you on this occasion, Mayor. The <a href="#link_id#game.tool_plop_network(network_tool_types.ELEVATED_RAIL)">elevated lines</a> and the <a href="#link_id#game.tool_plop_network(network_tool_types.SUBWAY)">subway lines</a> are all a part of the same continuous system, and you need to build a <a href="#link_id#game.tool_plop_building(building_tool_types.SUB_EL_TRANSITION)">special transition</a> for them when you want a line to go from above to below ground. Build more <a href="#link_id#game.tool_plop_building(building_tool_types.ELEVATED_STATION)">stations</a> in densely built areas, and in lower density residential areas build <a href="#link_id#game.tool_plop_building(building_tool_types.PUBLIC_PARKING)">public parking garages</a> next to your stations to encourage more riders. Now, if you'll pardon me I plan to take my family for a ride on the new system tonight - back and forth until close!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

------------ Advice record ----
--Crash! Smash! Congestion Leads to Casualties
a = create_advice_transportation('ec0c30fd')
a.event = game_events.CAR_CRASH
a.trigger  = "1"
--car crash! (local) high congestion blamed - ONE (1st) TIME ONLY
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4c044599	Crash! Smash! Congestion Leads to Casualties]]
a.message   = [[text@2c04459d	 Did you hear that awful crunching sound, Mayor? We've had a serious auto accident at <a href="#link_id#game.camera_jump(game.event_subject())">this heavily congested intersection</a>! The hriek of metal on metal makes my skin crawl, and I guarantee you that if we don't take measures to remedy our traffic problems we'll be hearing more of the same. The good news is that business will boom for #city#'s scrap metal dealers.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--Local Train Jumps Tracks, Run-down Rails Suspected
a = create_advice_transportation('8c0c319f')
a.event = game_events.TRAIN_DERAIL
a.trigger  = "1"
--train derailment! (local) low funding blamed
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2c0445a1	Local Train Jumps Tracks, Run-down Rails Suspected]]
a.message   = [[text@ec04496f	We've got an emergency, Mayor! A <a href="#link_id#game.camera_jump(game.event_subject())">train has derailed</a>, causing massive damage. We need to <a href="#link_id#game.tool_button(button_tool_types.FIRE_DISPATCH);game.camera_jump_and_zoom(game.event_subject(),camera_zooms.MAX_IN)">dispatch emergency crews</a> right away! Meanwhile, I'll need to investigate the cause. I suspect poor maintenance of the track resulting from <a href="#link_id#game.window_budget(budget_window_types.TRANSPORT1)">underfunding</a>, but we can't rule out human error either.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.BAD_JOB


--------------------------------------------------------------------
-- This will try to execute triggers for all registerd advices 
-- to make sure they don't have any syntactic errors.

if (_sys.config_run == 0)
then
advices : run_triggers()
end
