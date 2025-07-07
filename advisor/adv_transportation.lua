-----------------------------------------------------------------------------------------
-- This file defines advices for the the TRANSPORTATION
dofile("_adv_sys.lua") 
dofile("_adv_advice.lua") 
dofile("adv_game_data.lua") 

-- helper funcition
function create_advice_transportation_with_base(guid_string, base_advice)
   local a =  advices : create_advice(tonumber(guid_string, 16), base_advice)
   a.type   = advice_types . TRANSPORTATION
   return a
end

-- helper funcition
function create_advice_transportation(guid_string)
   local a =  create_advice_transportation_with_base(guid_string, nil)
   return a
end
--
--

----------------------------------------------------------------------
-- Advice fields 

--type      = advice_types . TRANSPORTATION  ,
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
a = create_advice_transportation('2a355b3b')
a.trigger  = "game.g_month > 3"
a.once = 1
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea50e830  Celebrate City Birth--Roads Make Perfect Gift
]]
a.message   = [[text@aa50e837  Greetings, Mayor. I'm Glint Wheels, your transit man, here to give you the skinny on moving in the city. You can really put a shine on #city# by placing some roads in good spots. And think of the city's zones--the exchange of goods and services can't go anywhere unless they're connected by roads. You could even zip a road 'round each zone--touring your great city will be easier than ever, and your Sims will be singing with the tops down.
]]
a.priority  =tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB
--a.event = game_events.NEW_CITY -- has to be commented out for this advice to work correctly


------------ Advice record ----
--Can't Squeeze Between Cars--Sims Glued To The Grid
a = create_advice_transportation('2a5df245')
a.trigger  = "game.ga_road_congestion > tuning_constants.TRAFFIC_CONGESTION_MEDIUM and  game.g_population > tuning_constants.POPULATION_STEP_4"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca50e83c  Can't Squeeze Between Cars--Sims Glued To The Grid]]
a.message   = [[text@2a50e841c The complaints are coming in by phone, fax and letter, Mayor. But not by car or road, because those roads are flat-out FILLED with traffic. I might be a mite prejudiced, but I'd say that a new <a href="#link_id#game.tool_plop_building(building_tool_types.BUS_STOP)">bus stop</a>, <a href="#link_id#game.tool_plop_network(network_tool_types.RAIL)">rail lines</a> or <a href="#link_id#game.tool_plop_network(network_tool_types.SUBWAY)">subway</a>  might put smiles back on those sour Sim faces. And why not put in a few new roads? I won't have to whisper it--you need to boost the transit budget so you can continue to be the Commerce Czar.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB



------------ Advice record ----
--No Forward, No Reverse: Traffic At Its Worst
a = create_advice_transportation('0a5df6b5')
a.trigger  = "game.ga_road_congestion > tuning_constants.TRAFFIC_CONGESTION_HIGH"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a50e845  No Forward, No Reverse: Traffic At Its Worst]]
a.message   = [[text@ea50e848 Well grab my Bott's Dots, but we've got a serious situation at hand in #city#. Like the shark, a city will die if it doesn't move--and we've got one stuck city! You've got to assess the traffic system and either add <a href="#link_id#game.tool_plop_network(network_tool_types.ROAD)">roads</a> or <a href="#link_id#game.tool_plop_network(network_tool_types.SUBWAY)">subways</a> or both. And let's not forget our <a href="#link_id#game.window_budget(budget_window_types.TRANSPORT1)">Transportation Budget</a> while we're at it. You can't tackle traffic without a burly budget. Get 'em rolling, Mayor.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB



------------ Advice record ----
--City Dead On Its Feet: Congestion Calamity
a = create_advice_transportation('2a5e0015')
a.trigger  = "game.ga_road_congestion >tuning_constants.TRAFFIC_CONGESTION_HIGH and game.g_population > tuning_constants.POPULATION_STEP_6"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_SHORT
a.title   = [[text@0a50e84e  City Dead On Its Feet: Congestion Calamity]]
a.message   = [[text@aa50e853 Mayor, Mayor, Mayor, sit down and take a breath. But not for long--your city is crying foul. Foul traffic, that is. This <a href="#link_id#game.camera_jump(game.l_road_congestion_h_subject)">section </a> of the city has so many cars so crammed together that they can't even open their doors. Sims are crawling out the windows, and they just might crawl out of our city if we don't put in improvements to the traffic system. Take the high road and make a highway--fast.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--Roadways A Grim Graveyard; Can Trains Sustain City?
a = create_advice_transportation('8a5e1013')
a.trigger  = " game.ga_road_congestion > tuning_constants.TRAFFIC_CONGESTION_MEDIUM and game.g_train_station_count < 1 and game.g_subway_station_count < 1 and game.g_population > tuning_constants.POPULATION_STEP_6"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a50e858  Roadways A Grim Graveyard; Can Trains Sustain City]]
a.message   = [[text@8a50e85f Ah Mayor, there's something about the sound of a train--especially when it drowns out the sound of whining Sims. They've been complaining about traffic conditions again, and I think only a well-placed <a href="#link_id#game.tool_plop_network(network_tool_types.RAIL)">train</a> can coddle them. Perhaps a <a href="#link_id#game.tool_plop_network(network_tool_types.SUBWAY)">subway</a> as well. Let's make our city move.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--If You're Not On The Bus, You're Standing Still
a = create_advice_transportation('2a5e1249')
a.trigger  = " game.ga_road_congestion > tuning_constants.TRAFFIC_CONGESTION_MEDIUM and game.g_bus_station_count < 1 and game.g_population > tuning_constants.POPULATION_STEP_5"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca50e863  If You're Not On The Bus, You're Standing Still]]
a.message   = [[text@2a50e867 Mayor, even here in your office I can hear the honking of frustrated Sims. They don't cotton to crowded traffic, and I don't blame them. I think there's something soothing about a bus ride, and they will too, if you put in some <a href="#link_id#game.tool_plop_building(building_tool_types.BUS_STOP)">bus stops</a>. Take your Sims for a ride--they'll thank you for it.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL


------------ Advice record ----
--Traffic Problems Begone, Transit Wizard Declares
a = create_advice_transportation('ca5e135c')
a.trigger  = " game.ga_road_congestion > tuning_constants.TRAFFIC_CONGESTION_MEDIUM and game.g_bus_station_count < 1 and game.g_subway_station_count < 1 and game.g_population > tuning_constants.POPULATION_STEP_6"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea50e86c  Traffic Problems Begone, Transit Wizard Declares]]
a.message   = [[text@6a50e871 Mayor, one consequence of a successful city is growth--and that means growing problems as well. #City# is stretching its boundaries, but its citizens are stuck. And they'll stay there until we put up some <a href="#link_id#game.tool_plop_building(building_tool_types.BUS_STOP)">bus stops</a>., or some <a href="#link_id#game.tool_plop_network(network_tool_types.RAIL)">rail lines</a>, or even a <a href="#link_id#game.tool_plop_network(network_tool_types.SUBWAY)">subway</a> or two.  Keep those Sims striding, is what I say. And don't forget that mass transit can be a BIG answer to big traffic problems--get enough Sims swooshing underground and traffic problems will swoosh away with them. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL


------------ Advice record ----
--Mayor, the reason I'm closing your door is to prevent any irate Sims from coming in. Of course, with all the traffic in #city#, it might take them a while to get here. They're hopping mad, and only a good rail or subway system will soothe them. Toss in a couple of bus stops too and you might get some handshakes as well. 

a = create_advice_transportation('6a5e15da')
a.trigger  = " game.ga_road_congestion > tuning_constants.TRAFFIC_CONGESTION_MEDIUM and game.g_masstransit_funding_p == 0"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a50e875Sims Troubled About Traffic]]
a.message   = [[text@0a50e87a Got the lowdown on the traffic situation, Mayor. Pretty much, it's too many cars clogging the roads. Might be a smooth move to drop in a <a href="#link_id#game.tool_plop_network(network_tool_types.SUBWAY)">subway line</a>, or build a <a href="#link_id#game.tool_plop_network(network_tool_types.RAIL)">rail system</a>. Could steam up that lady in Finance, that's a fact, but a city can't grow unless traffic flows, dig?  ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB


------------ Advice record ----
--Traffic Tie-ups Scream "Try Trains!" 
a = create_advice_transportation('2a5e16da')
a.trigger  = " game.ga_rail_congestion > tuning_constants.RAIL_CONGESTION_HIGH and game.g_train_station_count > 0 and game.g_population > tuning_constants.POPULATION_STEP_4"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca50e87e Traffic Tie-ups Scream "Try Trains!]]
a.message   = [[text@4a50e883 Man oh man, we've got commuters calling night and day complaining about congested trains. A person can't tell where his elbow begins and another person's ends. A new <a href="#link_id#game.tool_plop_building(building_tool_types.PASSENGER_RAILSTATION)">train station</a> or more <a href="#link_id#game.tool_plop_network(network_tool_types.RAIL)">rail lines</a> might be just the ticket to keep me off those phones. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--Frozen Traffic Calls For Transit Thaw
a = create_advice_transportation('ca5e1ac0')
a.trigger  = " game.ga_road_congestion > tuning_constants.TRAFFIC_CONGESTION_MEDIUM and game.g_masstransit_funding_p > 1 and game.g_population > tuning_constants.POPULATION_STEP_5"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea50e889 Frozen Traffic Calls For Transit Thaw]]
a.message   = [[text@ea50e88c Hate to make it sound like I only complain, but it seems like for every one Sim happy about #city# transit, there are two with their fangs out. Better <a href="#link_id#game.window_map(map_window_types.TRAFFIC)">scan</a> the road system for bad connections, and verify if all our mass transit stops are strategically placed--our Sims are a bit sniffy about having to walk a block when they can ride. But boy can they run off at the mouth. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

------------ Advice record ----
--#City# One Sweet Cruise Behind The Wheel
a = create_advice_transportation('aa5e1d78')
a.trigger  = "game.ga_road_congestion < tuning_constants.TRAFFIC_CONGESTION_LOW and game.ga_rail_congestion < tuning_constants.TRAFFIC_CONGESTION_LOW and game.ga_subway_congestion < tuning_constants.TRAFFIC_CONGESTION_LOW and game.g_population > tuning_constants.POPULATION_STEP_4"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aa50e891 #City# One Sweet Cruise Behind The Wheel]]
a.message   = [[text@ca50e894 Hear that, Mayor? That's the sound of people getting to where they want to go. All our roads are rolling, and all your Sims are strolling--good transit systems make beautiful music, don't they? Something tells me that sitting in the sun early this afternoon might be in the cards. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

----------- Advice record ----
--Sims Can't Ride, Sims Can't Roll--No Roads
a = create_advice_transportation('0a5e23ea')
a.trigger  = "game.g_road_tile_count < 1 and game.ga_road_congestion > tuning_constants.TRAFFIC_CONGESTION_MEDIUM and game.g_population > tuning_constants.POPULATION_STEP_3"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea50e899 Sims Can't Ride, Sims Can't Roll--No Roads]]
a.message   = [[text@ca50e89c Whoa, Mayor, I don't want to be the one to sound the alarm, but the lack of roads in #city# IS alarming. And plain bad for business. Put the plan in motion--lay some <a href="#link_id#game.tool_plop_network(network_tool_types.ROAD)">roads</a> and watch city growth scoot. You can always consider a blend of subways and rail stations too, though that seems to get under the collar of that gal in Finance. My mother used to say you can't please everybody; at least if people are unhappy, they'll be able to go for a drive. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL


----------- Advice record ----
--Sims Chafing At Blocked Highways; Might Fly The Coop
a = create_advice_transportation('6a5e2e4d')
a.trigger  = "0"
--Trigger to be 20% or more trips fail.
--Waiting on trigger
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aa50e8a5 Sims Chafing At Blocked Highways; Might Fly The Coop]]
a.message   = [[text@2a50e8af Mayor, I'd rather be whistling a little tune than telling you this, but here it is: Sims are stuck. <a href="#link_id#game.window_map(map_window_types.TRAFFIC)">Lousy roads</a>--or no roads--mean no city growth, and unless you link up all your zones with good roads, or even mass transit, we're sunk. Sims will vacate, sure as the day is long. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Sulking Sims Caught In Cars
a = create_advice_transportation('6a5e2f31')
a.trigger  = "0"
--Trigger to be Avg. trip time > X
--Question
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a50e8b4 ]]
a.message   = [[text@2a50e8b8 Mayor, I was just out cruising the city to get a feel for the public face, and I'm sorry to say, that public face is scowling. It's because Sim after stagnated Sim is <a href="#link_id#game.window_map(map_window_types.TRAFFIC)">stuck in traffic</a>  somewhere in #city#. Let's re-route the roads so that the work ride is brisk, or put the work where the Sims don't have to use a map to get to it. I know from experience--long car rides make a body ornery.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

---------- Advice record ----
--Savage Traffic Riles Sims
a = create_advice_transportation('0a5e389a')
a.trigger  = "game.ga_road_congestion < tuning_constants.TRAFFIC_CONGESTION_MEDIUM and game.ga_rail_congestion < tuning_constants.TRAFFIC_CONGESTION_MEDIUM and game.ga_subway_congestion < tuning_constants.TRAFFIC_CONGESTION_MEDIUM and game.trend_slope(game_trends.G_POPULATION,tuning_constants.TREND_MEDIUM) > tuning_constants.SLOPE_UP and game.g_population > tuning_constants.POPULATION_STEP_6 "
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a50e8c0 ]]
a.message   = [[text@8a50e8c4 Mayor, I like to fly light, but sometimes you've got to pack a little extra. Take our city traffic, for example. We're rolling steady right now, no serious problems, but our Sims are on the increase, and you know that could mean clogged roads. <a href="#link_id#game.window_map(map_window_types.TRAFFIC)">Scout ahead</a> for possible problems, and we'll breathe easy for a while.
]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL


--------- Advice record ----
--Road Fund Piggy About To Burst; Sims Squeal
a = create_advice_transportation('ca5e392b')
a.trigger  = "game.g_masstransit_funding_p > tuning_constants.FUNDING_EXCESSIVE and game.g_pothole_count ==0"
--Road funding level is 110%  to 120%, no potholes exist.
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a50e8c8]]
a.message   = [[text@2a50e8cc Mayor, the media's all in a tizzy about us having a couple of bucks extra in the <a href="#link_id#game.window_budget(budget_window_types.TRANSPORT1)">kitty</a> for our transit system. I have to scratch my head in wonder to see how many folks want to make a fuss about nothing. Ah well, no brains, no headache. That money will go to good use, trust me.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB

--------- Advice record ----
--Roads Worthy And Budget Not Busted
a = create_advice_transportation('ea5e39fc')
a.trigger  = "game.g_masstransit_funding_p < tuning_constants.FUNDING_HIGH and game.g_masstransit_funding_p > tuning_constants.FUNDING_MEDIUM and game.g_pothole_count ==0"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a50e8d1]]
a.message   = [[text@2a50e8d5 I'm no doomsayer, that's for sure Mayor, and my main message is that we've got the coin to cover our asphalt, and Sims are riding high on our good roads. But just keep in mind that a <a href="#link_id#game.window_budget(budget_window_types.TRANSPORT1)">road budget</a> can disappear fast, so we might want to kick up the funding to cover any unforeseen problems.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

--------- Advice record ----
--Potholes Suspected In Missing Car Reports
a = create_advice_transportation('aa5e3b73')
a.trigger  = "game.g_pothole_count> (game.g_road_tile_count+game.g_street_tile_count+game.g_highway_tile_count)*.1 and game.g_population > tuning_constants.POPULATION_STEP_3 and game.g_road_funding_p < tuning_constants.FUNDING_MEDIUM"
--Road funding level low < x but >y, and < X% of road tiles have become potholed
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea50e8d9]]
a.message   = [[text@6a50e8dc I'll admit, Mayor, I have heard some stories about some of our citizen's cars getting a bit banged up because of all the potholes. It would be a simple thing to shift some funds, say from those cash-guzzling power plants, over to sensible expenditures, like <a href="#link_id#game.window_budget(budget_window_types.TRANSPORT1)">road funding</a>. We could even tear up some little-used roads to concentrate cash on new. Say the word and it's done, Mayor.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MED_HIGH
a.mood = advice_moods.NEUTRAL


--------- Advice record ----
--Roads Like Cat food and Craters; Sim Drivers Demented
a = create_advice_transportation('6a5e3d81')
a.trigger  = "0"
--Road funding level < x, %potholes>X
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a50e8e1]]
a.message   = [[text@8a50e8e5 My, our Sim drivers have got their dander up. The roads are so bad they are leaving their cars sitting in the streets and walking. You might as well have spilled a million pounds of ball-bearings, the traffic's so bad. There are answers, Mayor: they are green and go in wallets, but we need lots of them, and fast, I'm afraid. It's a road to ruin without those riches. Increase the <a href="#link_id#game.window_budget(budget_window_types.TRANSPORT1)">transit funding</a> now!]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB

--------- Advice record ----
--Transit System Rails Are Gold-Plated With City Coin
a = create_advice_transportation('4a5e3e16')
a.trigger  = "0"
--Rail funding level is between 110 - 120%
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca50e8e9]]
a.message   = [[text@ca50e8ed Oh dear, the naysayers are out of the closet and clamoring. All the noise is centered on our healthy <a href="#link_id#game.window_budget(budget_window_types.TRANSPORT1)">rail funding</a> level, which is just where it should be, as any citizen with good sense should know. Rail systems are complex and expensive, and any padding in a budget is protective, not excessive. Why don't these grumblers go grouse in front of the Finance department--those guys jingle when they walk. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB


--------- Advice record ----
--Steady As She Goes For Mass Transit Monies
a = create_advice_transportation('ca5e3eeb')
a.trigger  = "0"
--Rail funding is 90-110%
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a50e8f3]]
a.message   = [[text@6a50e8f7 I'm no alarmist, Mayor, far from it. I believe that when you're in the groove, stay put. So when I say that we've got a good thing going with our <a href="#link_id#game.window_budget(budget_window_types.TRANSPORT1)">rail funding</a>, that means that it's always cool to keep the funding flame burning. Keep the money pump primed and our transit system will shine. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL



--------- Advice record ----
--Transit Workers Ticked Off; Strike Looms
a = create_advice_transportation('aa5e3f71')
a.trigger  = "game.g_transit_strike_chance > tuning_constants.STRIKE_HIGH"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a50e8fb]]
a.message   = [[text@2a50e8ff Mayor, you know I play it straight--I know the difference between budget need and budget greed. The severely low <a href="#link_id#game.window_budget(budget_window_types.TRANSPORT1)">transit funding</a> is going to topple our whole system, and our loyal workers are talking strike. There's more than smoke here Mayor--smother this fire with some transit dollars, or we'll all burn.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB

--------- Advice record ----
--System Strangled By Transit Strike; Sims Inflamed
a = create_advice_transportation('8a5e4014')
a.event = game_events.MASS_TRANSIT_STRIKE_STARTED
a.trigger  = "game.g_transit_strike> 0" 
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a50e903]]
a.message   = [[text@6a50e907 It's a sad moment, Mayor. Our rail lines are silent and our Sims are screaming. The only thing that will restore sanity (and our striking workers back to their posts) is to boost the <a href="#link_id#game.window_budget(budget_window_types.TRANSPORT1)"> mass transit funding</a>--immediately. We're too fine a city to go down like this. Stop the shame, stop the pain.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.BAD_JOB
a.effects = effects.TRANSIT_STRIKE


--------- Advice record ----
--Airport For Airheads? Planes Are Pain, For Now
a = create_advice_transportation('2a5e4139')
a.trigger  = "0" 
--disabled for EP1 on 8/4;  coming up when airport is over capacity, so it's giving the wrong message completely
--"game.ga_airport_efficiency < tuning_constants.AIRPORT_EFFICIENT_LOW and game.g_population > tuning_constants.POPULATION_STEP_4 and (game.g_medium_airport_count + game.g_small_airport_count + game.g_large_airport_count > 0)"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6a50e90c]]
a.message   = [[text@0a50e910 Mayor, airport food might have a bad reputation, but could it have driven all the passengers away? Maybe there are lousy roads, perhaps poor power, or surrounding businesses are busting, but there's no one out there to ride the planes. Better address those concerns; you might even have to put it out of its misery if you can't come up with a solution that flies.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL


--------- Advice record ----
--Business Commuters Clamor For Airport Glamour
a = create_advice_transportation('0a5e41bb')
a.trigger  = [[game.g_city_co2_population + game.g_city_co3_population > 7000 and game.g_medium_airport_s1_count+
game.g_small_airport_s1_count +
game.g_large_airport_s1_count +
game.g_medium_airport_s2_count +
game.g_small_airport_s2_count +
game.g_large_airport_s2_count +
game.g_medium_airport_s3_count +
game.g_small_airport_s3_count +
game.g_large_airport_s3_count == 0]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_VERY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aa50e914]]
a.message   = [[text@2a50e91e Mayor, I know that you don't bend when business leaders lean on you, but sometimes even those characters say something compelling. They're squawking that they're losing business because we don't have a <a href="#link_id#game.tool_plop_building(building_tool_types.AIRPORT_MUNICIPAL_PHASE1)">commuter airport</a>. I think it might be worth the green to spring for it--you'll be able to fly in more reporters when you have important announcements.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.NEUTRAL

--------- Advice record ----
--Big Business Can't Take Wing Without Municipal Airport
a = create_advice_transportation('2a5e4268')
a.trigger  = [[game.g_city_co2_population + game.g_city_co3_population > 40000 and game.g_medium_airport_s2_count +
game.g_small_airport_s2_count +
game.g_large_airport_s2_count +
game.g_medium_airport_s3_count +
game.g_small_airport_s3_count +
game.g_large_airport_s3_count == 0 and game.g_current_co2_cap > tuning_constants.CAP_MEDIUM]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a50e926]]
a.message   = [[text@ea50e92a Mayor, we're taking a lot of flak from local business bigwigs about our lack of a <a href="#link_id#game.tool_plop_building(building_tool_types.AIRPORT_MUNICIPAL_PHASE1)">municipal airport</a>. They are fixating--loudly--on the fact that a bigger airport means bigger business. Sure, we'll have to dig for dollars, but I'll think if we go for it, we'll hit paydirt in the end. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.NEUTRAL


--------- Advice record ----
--Mayor Getting The Business About International Airport
a = create_advice_transportation('2a5e431d')
a.trigger  = [[game.g_city_co2_population + game.g_city_co3_population > 225000 and game.g_medium_airport_s3_count +
game.g_small_airport_s3_count +
game.g_large_airport_s3_count == 0 and game.g_current_co2_cap > tuning_constants.CAP_MEDIUM]]
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ca50e930]]
a.message   = [[text@0a50e934 Mayor, now I know why they call it a hotline. I've been on the phone all morning with #city# business gurus who claim that we'll never be more than a two-bit burg if our flight facilities aren't expanded with an  <a href="#link_id#game.tool_plop_building(building_tool_types.AIRPORT_INTERNATIONAL_PHASE1)">international airport</a>. I agree that the pennies will be pretty on this one, but they've got me convinced that this is an idea that can fly big bucks into city coffers. I say let's take off on it. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.NEUTRAL


--------- Advice record ----
--One If By Sea: Manufacturers March For #City# Seaport
a = create_advice_transportation('8a5e43d2')
a.trigger  = "0"
--Industry hits cap
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aa50e939]]
a.message   = [[text@6a50e93d Just when I think our department has all the ground covered, we get hit with demands for the water too. I'm hearing it from all industry sides that without a <a href="#link_id#game.tool_plop_building(building_tool_types. building_tool_types.SEAPORT_PHASE1)">seaport</a>  to export their goods, they'll go under. This situation won't be ship-shape until we get our port built Mayor. Anchors aweigh! ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.NEUTRAL


--------- Advice record ----
a = create_advice_transportation('6a5e46be')
a.trigger  = "1"
--Commuter Airport wants to expand from stage 1 to stage 2
a.frequency = tuning_constants.ADVICE_FREQUENCY_VERY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a50e941]]
a.message   = [[text@2a50e945 All the financial flyboys behind our airport are bucking to make it bigger. They have got a case: the more flights in and out, the more moolah makes its way into #city#. I think investing in airport expansion will make our city more solid from the ground up, Mayor--do you? <a href="#link_id#game.event_feedback();game.retire_advice(1)">YES</a> <a href="#link_id#game.retire_advice(1)">NO</a> ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.NEUTRAL
a.event =game_events.GROW_SMALL_AIRPORT1

--------- Advice record ----
a = create_advice_transportation('0b3be865')
a.trigger  = "1"
--Commuter Airport wants to expand from stage 2 to stage 3
a.frequency = tuning_constants.ADVICE_FREQUENCY_VERY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a50e941]]
a.message   = [[text@2a50e945 ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.NEUTRAL
a.event =game_events.GROW_SMALL_AIRPORT2


--------- Advice record ----
a = create_advice_transportation('6a5e4ca6')
a.trigger  = "1"
--Municipal Airport wants to expand from stage 1 to stage 2
a.frequency = tuning_constants.ADVICE_FREQUENCY_VERY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@0a50e949]]
a.message   = [[text@ca50e94d Mayor, there's nothing that twists my toes more than transit trouble, whether it's on the ground or in the air. Right now we've got a combination of both--our airport is so stuffed with people going in and out that passengers can barely breathe. It's clear to me that airport expansion will soothe Sims, pre-flight and post. Agreed?  <a href="#link_id#game.event_feedback();game.retire_advice(1)">YES</a> <a href="#link_id#game.retire_advice(1)">NO</a> ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.NEUTRAL
a.event = game_events.GROW_MEDIUM_AIRPORT1

--------- Advice record ----
a = create_advice_transportation('6a5e520f')
a.trigger  = "1"
--Municipal Airport wants to expand from stage 2 to stage 3
a.frequency = tuning_constants.ADVICE_FREQUENCY_VERY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@4a50e951]]
a.message   = [[text@ca50e956 Mayor, have you been to the airport lately? I doubt it, since you wouldn't be sleeping nightts knowing it's in this condition. The gates are jammed from so many passengers trying to get in and out of our thronging terminals. We need relief, and it can only come in the form of airport expansion. Let's get that gaggle of travelers off the ground, shall we?  <a href="#link_id#game.event_feedback();game.retire_advice(1)">YES</a> <a href="#link_id#game.retire_advice(1)">NO</a> ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.NEUTRAL
a.event =game_events.GROW_MEDIUM_AIRPORT2

--------- Advice record ----
a = create_advice_transportation('ca74bedf')
a.trigger  = "1"
--International Airport wants to expand from stage 1 to stage 2
a.frequency = tuning_constants.ADVICE_FREQUENCY_VERY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a50e960]]
a.message   = [[text@6a50e966 The passengers are piling up at our international airport, Mayor. It's so crowded that people can't pull their tickets from their pockets. Let's give them some breathing room--unfold that airport with some expansion funding, OK?   <a href="#link_id#game.event_feedback();game.retire_advice(1)">YES</a> <a href="#link_id#game.retire_advice(1)">NO</a> ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.NEUTRAL
a.event =game_events.GROW_LARGE_AIRPORT1

--------- Advice record ----
a = create_advice_transportation('8b3be8d7')
a.trigger  = "1"
--International Airport wants to expand from stage 2 to stage 3
a.frequency = tuning_constants.ADVICE_FREQUENCY_VERY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a50e960]]
a.message   = [[text@6a50e966 ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_URGENT
a.mood = advice_moods.NEUTRAL
a.event =game_events.GROW_LARGE_AIRPORT2

--------- Advice record ----
--Planning Ahead Before Traffic Stops Dead
a = create_advice_transportation('8a5e530f')
a.trigger  = "game.g_bus_station_count ==0 and game.g_train_station_count ==0 and game.g_subway_station_count ==0 and game.ga_road_congestion >  tuning_constants.TRAFFIC_CONGESTION_LOW and game.g_population > tuning_constants.POPULATION_STEP_4 "
--No mass transit (no bus stops, subway or rail), population > X, ATC>very_low_traffic_congestion
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea50e972]]
a.message   = [[text@aa50e976 Mayor, sometimes the simple rules apply. You get what you pay for. In the case of mass transit, it does dial up the dollars, but boy can it clean up congestion. Conditions aren't critical now, but #city# is growing, and you'd be ahead of the curve if you thought about putting in some high-ride capacity soon. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.NEUTRAL


--------- Advice record ----
--Subway Could Straighten Traffic Snakes
a = create_advice_transportation('aa5e551d')
a.trigger  = "game.g_subway_station_count == 0 and game.g_population > tuning_constants.POPULATION_STEP_5 and game.ga_road_congestion >   tuning_constants.TRAFFIC_CONGESTION_MEDIUM"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea50e97b]]
a.message   = [[text@ca50e980 You know, Mayor, a body does tire of hearing how just because something's expensive, it's not worth it. Right now, we've got Sims looking for swift ways to get to and from work, and there's no swifter than a nice <a href="#link_id#game.tool_plop_network(network_tool_types.SUBWAY)">subway </a>. Place some tracks near <a href="#link_id#game.window_map(map_window_types.TRAFFIC)">busy intersections</a> and connect the various zones with lines and you've got a swinging system. Let that Finance bean-counter sweat--our Sims won't. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.NEUTRAL

--------- Advice record ----
--#City# Busses Would Add Travel Plusses
a = create_advice_transportation('0a5e5605')
a.trigger  = "game.g_bus_station_count == 0 and game.g_population > tuning_constants.POPULATION_STEP_3 and game.ga_road_congestion > tuning_constants.TRAFFIC_CONGESTION_MEDIUM"
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aa50e984]]
a.message   = [[text@8a50e989 Mayor, there's nothing that puts the horns on my goat like traffic snarls. But we've got a sweet deal here in that we could snap those snarls just by putting in a #city# bus system. Yes, just put in enough <a href="#link_id#game.tool_plop_building(building_tool_types.BUS_STOP)">stops</a> and get all your critical zones connected with the bus lines and we're good to go. And go and go.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.NEUTRAL


--------- Advice record ----
--Black Hole Of A Bus Stop Stymies System
a = create_advice_transportation('8a5e5681')
a.trigger  = "game.g_bus_station_count > 3 and game.l_bus_station_utilization_pl < tuning_constants.STATION_UTILIZATION_LOW and game.g_population > tuning_constants.POPULATION_STEP_4"
-- utilization (vol. of riders/capacity) of any bus stop <5%, Pop > x (enough to warrant mass transit)
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea50e98d]]
a.message   = [[text@4a50e992 Mayor, sometimes just a single bug can bog down an entire system. Take this <a href="#link_id#game.camera_jump(game.l_bus_station_utilization_pl_subject)">bus stop</a>--please. Stale joke, I know, but I'm serious that this stop is going nowhere. Let's assess our traffic system and patterns, and see if we can't dump this one in favor of one that bustles.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.NEUTRAL


--------- Advice record ----
--Subway Stop Stagnant; Troubles Traffic Throughput
a = create_advice_transportation('aa5e5799')
a.trigger  = "game.g_subway_tile_count > 0 and game.l_subway_station_utilization_pl < tuning_constants.STATION_UTILIZATION_LOW and game.g_population > tuning_constants.POPULATION_STEP_5 and game.g_subway_station_count > 0"
-- utilization (vol. of riders/capacity) of any subway stop <5%, Pop > x (enough to warrant mass transit)
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea50e996]]
a.message   = [[text@4a50e99bCold gravy in the morning! I can't stand waste, Mayor, especially when it puts a kink in my traffic system. Right here we've got a <a href="#link_id#game.camera_jump(game.l_subway_station_utilization_pl_subject)">subway stop</a> that's pretty much unused. It's not contributing anything to good Sim dispatch. Can't we check our network so that we can better utilize this stop elsewhere?]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.NEUTRAL

--------- Advice record ----
--Sims Scanting Subway System
a = create_advice_transportation('ea5e5805')
a.trigger  = "game.g_subway_tile_count > 0 and game.ga_subway_station_utilization_p < tuning_constants.STATION_UTILIZATION_MEDIUM and game.g_population > tuning_constants.POPULATION_STEP_5 "
--avg. utilization (vol. of riders/capacity) of subway stations <30%
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea50e9a0]]
a.message   = [[text@0a50e9a6 Lord knows there are some ridership deficits in our subway system. I suspect that we've haven't placed the tracks where the Sims want to be taken, or maybe there's a shortage of strategically placed stops. There's no way of knowing unless you check the <a href="#link_id#game.window_map(map_window_types.TRAFFIC)">traffic data view</a>, Mayor. Let's put some bodies in those babies before the system goes kaput.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL





--------- Advice record ----
--Transit System Shines; All Sims Totally Tripping
a = create_advice_transportation('ea5e5cce')
a.trigger  = "game.ga_subway_station_utilization_p > tuning_constants.STATION_UTILIZATION_HIGH and game.ga_bus_station_utilization_p > tuning_constants.STATION_UTILIZATION_HIGH and game.ga_train_station_utilization_p  > tuning_constants.STATION_UTILIZATION_HIGH"
--avg. utilization (vol. of riders/capacity) of rail, bus, or subway stops >60%, overall ridership  >X % of population (enough folks are riding them)
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a50e9ab]]
a.message   = [[text@6a50e9af Now this IS cool--we've got peak ridership levels throughout #city# for our mass transit system. We've got Sims bopping on busses, rollicking on the rails and singing on the subways. Congrats to you Mayor--those cars are garaged and the city is on cruise control.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.GREAT_JOB




--------- Advice record ----
--Mass Transit Not Cutting Congestion; Sims Steamed
a = create_advice_transportation('ea5e5d1e')
a.trigger  = "(game.g_subway_station_count > 2 and game.ga_road_congestion > tuning_constants.TRAFFIC_CONGESTION_HIGH and game.ga_subway_station_utilization_p < tuning_constants.STATION_UTILIZATION_LOW) or (game.g_train_station_count >2 and  game.ga_road_congestion > tuning_constants.TRAFFIC_CONGESTION_HIGH and game.ga_train_station_utilization_p  < tuning_constants.STATION_UTILIZATION_LOW)"
--At least 2 Subway or 2 rail stations and lines exist. Average rail congestion very low compared to average traffic congestion.
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6a50e9b4]]
a.message   = [[text@6a50e9b8 Mayor, I've been popping myself in the head ever since I read this report that Sims aren't using our mass transit. Waste is woeful--we've got to place our transit lines parallel to those <a href="#link_id#game.window_map(map_window_types.TRAFFIC)">car-filled roads</a> to give Sims a clear alternative, and put all <a href="#link_id#game.tool_plop_building(building_tool_types.PASSENGER_RAILSTATION)">rail</a> and <a href="#link_id#game.tool_plop_building(building_tool_types.SUBWAY_ENTRANCE)">subway</a>  stops in sensible spots that Sims can get to without sweat. We might even have to remove those dead stations--we're still getting burned for their upkeep, even if they're empty. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.BAD_JOB


--------- Advice record ----
--Subway Sims Can't Get In--Or Out; System Swamped
a = create_advice_transportation('6a5e5e9e')
a.trigger  = "game.ga_subway_congestion > tuning_constants.TRAFFIC_CONGESTION_HIGH and game.g_subway_station_count > 0"
--Rail traffic congestion >x, subways exist. Rotate this with ADV_BAD_TRAFFIC_3
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a50e9bc]]
a.message   = [[text@ea50e9c2 Well, popularity has its price--we've got subway cars that are so jammed with Sims that their eyes are bulging. We've got to <a href="#link_id#game.tool_plop_network(network_tool_types.SUBWAY)">expand our system</a> before the windows are blown out of all the cars.  This is a case where we can't just consider it--we've got to do it. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL


--------- Advice record ----
--Trains Teeming; Sims Scream For Rail Relief
a = create_advice_transportation('0a5e5f9c')
a.trigger  = "game.ga_rail_congestion > tuning_constants.TRAFFIC_CONGESTION_HIGH and game.g_train_station_count > 0"
--Rail traffic congestion  > x and trains exist
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a50e9c7]]
a.message   = [[text@ca50e9ca Mayor, there's nothing romantic about a train ride where some passenger's fork is in your food. We've got so many Sims packed in too few cars that they can't tell which shoes are theirs to tie. I'm not trying to railroad you--you better consider <a href="#link_id#game.tool_plop_network(network_tool_types.RAIL)">expanding the rail network</a> e before it grinds to a halt. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL


--------- Advice record ----
--No Roads To Hit--Driven Sims Can't Drive
a = create_advice_transportation('2a5e62a2')
a.trigger  = "game.g_population > tuning_constants.POPULATION_STEP_3 and game.g_road_tile_count == 0"
--Zones can't find transportation. (suggested trigger- no roads exist)
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@2a50e9cf]]
a.message   = [[text@ca50e9d4 It's pretty hard to believe that a city like ours would have such gaps in its road network, but they are glaring ones. And Sims are glaring about it. Let's ensure that our road web has <a href="#link_id#game.tool_plop_network(network_tool_types.ROAD)">lines</a> out to every city corner and every city curve, so Sims can put the pedal to the metal. ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL


--------- Advice record ----
--No Roads To Hit--Driven Sims Can't Drive
a = create_advice_transportation('ea5e632d')
a.trigger  = "game.g_transit_strike_chance > tuning_constants.STRIKE_HIGH"
--transit strike probability >x
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@8a50e9d9]]
a.message   = [[text@aa50e9dd Mayor, you know me as a man who doesn't play games--and I'm here to tell you that our transit workers might just walk out, and that's a game nobody wins. It's all a <a href="#link_id#game.window_budget(budget_window_types.TRANSPORT1)"> matter of money</a>: if they get a little more jingle in their jangle, they'll stick to the job. How 'bout it? ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.BAD_JOB


--------- Advice record ----
--Transit Workers Strike Blow; City Could Shudder To A Stop
a = create_advice_transportation('2a5e63bb')
a.trigger  = "1"
--Transit strike occurring (must have rail or subway for strike to occur)
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6a50e9e5]]
a.message   = [[text@4a511eca Well, pop me in the nose and call me Blinky--we've got a full-blown transit strike happening! #City# will come to a crashing halt unless we get our systems up and moving again. This is no time to play Scrooge with the swag, Mayor--give the workers the <a href="#link_id#game.window_budget(budget_window_types.TRANSPORT1)"> raise</a> and let's see those city wheels roll.  ]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.ALARM
a.event =game_events.MASS_TRANSIT_STRIKE_STARTED

--------- Advice record ----
--Seaport Could Pave #City# Waters With Gold
a = create_advice_transportation('4a5e643d')
a.trigger  = "0"
--#city_pop#<1K and #coastline_check#=yes and #num_seaports#=0
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@ea511133]]
a.message   = [[text@ca5111bd Mayor, just look at those sweet waters shine at our city's edge. Can't you just see ship after ship taking away our goods and bringing home the bacon? Why don't you build a <a href="#link_id#game.tool_plop_building(building_tool_types. building_tool_types.SEAPORT_PHASE1)">seaport</a> there now so that our budding industries have a mobile market? Spend a dollar to make a million, I say.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.NEUTRAL


--------- Advice record ----
--Seaport All by Its Lonesome; Land Lines Useless
a = create_advice_transportation('ea5e6734')
a.trigger  = "0"
--There is no check for seaport having no road.
a.frequency = tuning_constants.ADVICE_FREQUENCY_MEDIUM
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@aa5111d3]]
a.message   = [[text@0a5111db]]
a.priority  = tuning_constants.ADVICE_PRIORITY_MEDIUM
a.mood = advice_moods.NEUTRAL

--NEW FOR CORE

------------ Advice record ----
--Local Rail a Little Too Local
a = create_advice_transportation('8c0c31a7') 
a.trigger  = "game.g_rail_tile_count > 15 and game.g_rail_neighbor_connection_count == 0 and game.g_num_izone_l_tiles	+ game.g_num_izone_h_tiles > 30"
--no rail connections, some rail exists, some industry zoned
a.frequency = tuning_constants.ADVICE_FREQUENCY_LOW
a.timeout = tuning_constants.ADVICE_TIMEOUT_MEDIUM
a.title   = [[text@6c04497c	Local Rail a Little Too Local]]
a.message   = [[text@6c044980	That's a fine stretch of steel there, that rail line of ours. Unfortunately, it will never have the priviledge of carrying a train - that is, unless you decide finally to connect it to somewhere. We have to <a href="#link_id#game.tool_plop_network(network_tool_types.RAIL)">extend the line</a> to the edge of the city and make a connection to the world outside. Otherwise, all #city# gets is a one-way ticket to nowhere.]]
a.priority  = tuning_constants.ADVICE_PRIORITY_HIGH
a.mood = advice_moods.NEUTRAL


--------------------------------------------------------------------
-- This will try to execute triggers for all registerd advices 
-- to make sure they don't have any syntactic errors.

if (_sys.config_run == 0)
then
   advices : run_triggers()
end
