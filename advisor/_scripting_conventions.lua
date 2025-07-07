-----------------------------------------------------------------------------------------------
 Conventions and other information on advisor scrips.
------------------------------------------------------------------------------------------------

-----------------------------------
-- Files --------------------------- 

adv_<advisor name>.lua  
         Files holding advice messages for particular advisor or advice category.

adv_const.lua  
         File holding various game constants.

adv_game_data.lua  
         Files holding simulation variables and functions exposed to LUA.

-----------------------------------------------------
-- Naming conventions --------------------------- 

1. All names but constants have to be lower case : 'game_events'. 
2. Names of constants are upper case : 'game_events.NEW_CITY' 

---------------------------------------------
-- Text tokens --------------------------- 

Format for all text tokens is    #token name#. Tokens are replaced by the game with appropriate strings. All predefined tokens have to be in lower case. Here is a list of predefined tokens you can use:

            #city#                  -- City name.
            #mayor#              -- Mayor's name.
            #population#       -- The population count.
            #year#                 -- Current year.

Aside from predefined tokens you can use tokens made of LUA code 
            #game.g_population#  -- will be replaced with population count. 
            #game . g_police_funding_p#  -- will be replaced police funding percentage. 

For LUA tokens you might need to use one of the token type tags 
     m@   --  for money amounts.
     d@   --  for dates.
     t@   --  for time.
     n@   --  for numbers (optional). This is also the default type tag.
     s@   --  for strings (optional).

For instance # m@ game . g_budget# will be replaced with the value of total city budget variable. Type tags are needed for lacalization purposes.  

Here is the list of predefined advice specific tokens

            #advisor#            -- The name of the advisor the message belongs to.
            #link_id#            -- Every advice link has to beging with token as its prefix (read more on Links).

The list of predefined neighbor deal specific tokens

            #nd_city#            -- The name of neighbor city.
            #nd_cost#            -- Deal cost (monthly)
            #nd_amount#        -- Deal amount (monthly)

The list of predefined reward building specific tokens

            #building_initial_cost#            -- The plop cost that the reward building.
            #building_monthly_cost#            -- Monthly cost that that reward building important for buisness deal buildings.

This list will be updated as new tokens being added.

---------------------------------------------
-- HTML links   --------------------------- 

The links are used by the advisor system for performing game specific actions. Usually the link will be edited in the HTML editor. After that, however you will have to go and update it to accomodate for appliation needs. Your final version of a link has to look something like this

   <a href="#link_id# game . camera_zoom(camera_zooms.MIDDLE)">Zoom MIDDLE</a>

Here #link_id# is a token used by the applicaiton to associate the link with the advice message/advisor object the link belongs to. Of course,  game.camera_... can be replaced with any valid game action. The 'Zoom MIDDLE' part is what will have to get localized. After edit advice message with an HTML editor your link may look like this 

   <a href="#link_id#%20game%20.%20camera_zoom%28camera_zooms.MIDDLE%29">Zoom MIDDLE</a>
   
don`t get alarmed as HTML requires certain characters to be replaced with their codes. The applicaiton will convert these codes back to their readable form. FYI, some of the codes you might see are as follows
   
   %20 - space character ' '
   %28 - '('
   %29 - ')'

----------------------------------------------------
-- Localizable strings --------------------------- 

Every string intended for localization has to be of the following format 

   text@hex_id 
   
where hex_id is a GUID of the usual form of 8 hexadecial digits.  Here are the exemples of valid strings

   1. "text@12341234 -- This is general greeting message from the Utility advisor."
   2. 'text@abcdabcd'
   3. [[text@abcdabcd Blah, blah, blah ...]]
   4. [[text@ABCDDCBAThe text following the string id is FYI only.]]

Only <text@hex_id> part is important for application. That hex_id has to be a valid string id from our string database. In case the application failes to load the string from the string database the string is used as is.

---------------------------------------------
-- LUA languge --------------------------- 

-- Strings 
The following are valid LUA strings 

   'hello' -- can't use (", new line, etc.) inside the string body
   "hello"--  can't use (', new line, etc.) inside the string body
   [[hello world]] -- can use anything inside the string body including new line characters (Enter key on your keyboard).

-- Variables
pop_in_thousands = game.g_population / 1000
pop_threshold_big_city = 100000
pop_threshold_metropolis = 3000000

One can create variables on a as needed bases. Make sure they don`t collide with anything else (add some prefix or suffix to them).

-- Functions
function get_pop_in_thousands ()
   return game.g_population / 1000
end

The difference between variable 'pop_in_thousands'and the function above is that the function will always give current game population value in 1000s while the variable will give that number computed at the time when the script was executed, at game start up in this case. Just as with variables one can define new function on as needed bases.Make sure they don`t collide with any other names in our scripts.

-- Tables 

Tables are bags of variables or/and functions They are a good way to group logically related things together to make sure there are no collisions with anything else in scripts and for organizational purposes. It is a good idea to put your tuning variables into a table, as well as some helper functions one may use in the scripts.

Here are some examples of tables.

1.   t = {} -- empty table. Single character names is a bad style. Please descriptive names for everything.

2.   tt = {x=1, y=2.5} -- you can acces x using t.x syntax. Same goes for 'y'

3.   ttt = {}                  -- These two lines are equivalent to ttt = {z = 7, my_variable = 10000} 
      ttt.z = 7
      ttt.my_variable = 10000

4.   ttt.pop_in_thousands = 
         function () 
            return game.g_population / 1000 
         end
      You can call this function like this 
         ttt.pop_in_thousands(). 
      Calling a function will result in a value returned by the function. One could make a token out of this value for instance like this %ttt.pop_in_thousands()%. At run time this token would be substituted with the number giving the population in thousands. 
      
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
