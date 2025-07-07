----------------------------------------------------------------------
--  This file defines things relevant to all advice resources.
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Load what is needed 
dofile("_adv_sys.lua")
dofile("adv_const.lua")

----------------------------------------------------------------------
-- Define global storage for all advice resources in the app
 
advices = {n = 0} -- All advice records are stored here

-- Set up base advice resource. It holds all properties that 
--  can be set for an advice and  sets these properties to 
-- default falues. At the moment we only allow to have 
-- a single base advice for advice resources. Like a single 
-- cohort.

base_advice = 
{
   _base=nil, -- no base advice for itself
   guid = 0, -- this will be persisted in saved games and will have to be set to each advice by hand. 
   class_id = hex2dec("8a09f5f4"), -- C++ advice class ID (cSC4Advice class by default) 
   type = advice_types . NULL, -- NULL types never get triggered 
   mood = advice_moods . NEUTRAL,
   priority = 100, --0 to 100 scale, 100 = highest
   title     = "",
   message = "",
   frequency   = 720, -- in days, 30 days min
   timeout   = 36000, -- in days, dissappear msg
   no_timeout = 0, -- if 1, ignore timeout; advice is only expired by trigger returning false
   trigger   = "0", -- never trigger this one
   once   = 0, -- show this advice only once
   news_only = 0, -- set to 1 for news-flipper messages only 
   event = 0, -- this has to be a valid event ID (see const file for the event table.)
   command = 0, -- game command to trigger along with the advice message
   persist = 0, -- if 1, message will remain visible once triggered whether or not trigger condition remains true (useful for random triggers)
   effects = {} -- Here is the format : a.effects = {effects.POOR_FIRE_COVERAGE, effects.UNHAPPY_SIMS}
}

TAG_ADVICE = newtag()
settag(base_advice, TAG_ADVICE)
settagmethod(tag(base_advice), "index", event_hierarchy_index)

-- save the base in the bag of all
advices._base = base_advice

-- Creates new advice with given GUID 
-- this is the function for creating new advice structure
function advices : create_advice(guid, base)
   local i = getn(self) +1
   local t = {}

   self[i] = t -- add the table to the main advice repository
   self . n = self . n + 1 -- update the table count

   settag(t, TAG_ADVICE)
   
   if(base == nil or type(base) ~= "table" or tag(base) ~= TAG_ADVICE) 
   then
      base = self._base -- set the base to the 'very' base defined in this file
   end

   t . _base = base
   t . guid = guid
   
   return t -- tables are returned by ref
end  

-- Deletes an advice with given GUID.
-- 
function advices : delete_advice(_guid)
   local guid = _guid
   if(type(guid) == 'string') then
      guid = hex2dec(_guid)
   end

   local i, n = 1, self.n
   while (i <= n)  do
      if (self[i].guid == guid) then
         self[i] = self[n]
         self.n = self.n - 1
         n = self.n
      else
         i = i +  1
      end
   end
end  

-- Same as above but added for simplicity
-- 
function delete_advice( guid )
   advices : delete_advice ( guid )
end

------------------------------------------------------------------------------------------------
-- This function takes code string and parses it and sees if it all the entities are 
-- used in it are known,  defined, spelled correctly, etc. After that it executes the 
-- trigger. The return value is a string containing problem report or NIL. 
--

function _validate_code_string (code_string)
   local emsg = nil
   local e = 1  
   local b =1 
   local len = strlen(code_string)
   local is_link

   
   -- Skip empty code strings
   if(len == 0)
      then return nil end
   
   -- See if it's a link
   code_string = gsub(code_string, "%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x", "#link_id#")

   local report_prefix = '"' .. code_string .. '"\n'
   local link_prefix = 'Link '..report_prefix 
   local trigger_prefix = 'Trigger '..report_prefix 

   b, is_link = strfind (code_string, "#link_id#", 1, 1) -- the source link format 
   
   if(is_link)
   then 
      if(b > 1) 
      then
         emsg = link_prefix .. '\tLinks have to begin with #link_id#. Your link begins with "'.. strsub(code_string, 1, b-1) ..'".\n' 
         return emsg
      end
      e = is_link -- set the end of the link to e
      code_string = strsub(code_string, e+1)
      len = strlen(code_string)
   end
      
   -- Update the report format 
   report_prefix = '"' .. code_string .. '"\n'
   if(is_link)
   then 
      link_prefix = 'Link '..report_prefix 
      emsg = link_prefix 
   else 
      trigger_prefix = 'Trigger '..report_prefix 
      emsg = trigger_prefix 
   end

   -- If the code is made of spaces return 
   b, e = strfind(code_string, '%s*')
   if(e and e == len)
   then 
      return nil 
   end

   -- First count variables and extract all variable pairs
   local var_pattern = '([%a%d_]+)'
   local var_count = 0, v1, v2

   b, e, v1 = strfind(code_string, var_pattern, 1)
   while (v1)
   do
--      print(v1)
      var_count = var_count + 1
      b, e, v1 = strfind(code_string, var_pattern, e + 1)
   end

--   print (var_count)
   -- We do have some variables. Collect variable pairs.
   -- Valid variables always come in the format of 'XXXX . ZZZZ' with possible spaces in between
   local var_pairs = {}
   local var_pair_pattern = '([%a%d_]+)%s*[.]%s*([%a_][%a%d_]+)'
   local var_pair_count = 0

   b, e, v1, v2 = strfind(code_string, var_pair_pattern)
   while (v1 and v2)
   do
--      print(tostring(v1), '-->', tostring(v2)) -- pair found
      var_pairs[tostring(v1)] = tostring(v2)
      var_count = var_count - 2
      b, e, v1, v2 = strfind(code_string, var_pair_pattern, e+1)
   end

--   print (var_count)
--   if(var_count ~= 0)
--   then 
--      emsg = emsg .. '\t'..
--         [[All variables have to be of 'TABLE_NAME . VARIABLE_NAME' format (e.g. 'game.g_population'). An incomplete pair of either '. --VARIABLE_NAME' or 'TABLE_NAME . form found. Please review your code.]]..'\n'
--   end
   
   -- scan all variable pairs and see if any of then are nil
   local gbl_table = globals()
   local k, v = next(var_pairs, nil)
   local bad_var_found
   while(k)
   do
   if(not rawget(gbl_table, k))
      then
         emsg = emsg..'\t<'..k..'.'..v..'> is unknown. '..'\t"'..k ..'"'..' -- is not found.\n'
         bad_var_found = 1
      elseif (not rawget(gbl_table[k], v))
      then
         emsg = emsg..'\t<'..k..'.'..v..'> is unknown. '..'\t"'..v ..'"'..' -- is not found in "'..k..'".\n'
         bad_var_found = 1
      end
      k, v = next(var_pairs, k)
   end

   if(not bad_var_found)
      then emsg = nil end 
   
   return emsg
end

-------------------------------------------------------------------------------------
-- Trys to execute advice triggers and reports generates error messages
--
function advices : run_triggers()
   local advice_count = getn(self)
   for i = 1, advice_count
   do
      trigger_string = self[i].trigger
      local message = _validate_code_string (trigger_string)
      if(message)
      then
         print ("*** Trigger validation test for advice '"..format('%X', self[i].guid).."' ...\n"..message)
      elseif(not dostring("__tr__ = (" .. trigger_string .. ")" ) )
      then
         print ("*** Trigger execution test for advice '"..format('%X', self[i].guid).."' ...\n"..'\tERROR')
      end
   end
end  

--------------------------------------------------------------------------------------------
-- Tests
-- 
if(1 or _sys.test == 0)
   then return 0 end

print ('+++  tests +++')
dofile("adv_game_data.lua")
tt = {}
tt["hello"] = "world"
tt["hell"] = "god"

print(_validate_code_string('0advisor_ids.MYSIM5{}; game.retire_advice() > 1.2'))

i, j, w1, w2 = strfind ('  (( hehe_ . that))', '%s*(%a[%a%d_]*)%s*[.]%s*(%a[%a%d_]*)')
print (i, j)
print (w1 .. '\n'.. w2)
