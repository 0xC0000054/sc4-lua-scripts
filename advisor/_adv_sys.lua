---------------------------------------------------------------------
-- This file can not include anything including it as it redefines
-- dofile() function. 
if (_included_files ~= nil) -- have we already been here?
   then return end

---------------------------------------------------------------------
--   Some global system parameters. Everything is set for debugging 
-- by default.
if (not _sys) then _sys = {} end
if (not _sys.debug) then _sys.debug = 1 end
if (not _sys.test)   then _sys.test = 1 end
if (not _sys.config_run)   then _sys.config_run = 0 end

---------------------------------------------------------------------
-- Replaced standard dofile to prevent interpreting same file
-- more than once. This is like header guards in C++.
_included_files = {}
_old_dofile  = dofile

---------------------------------------------------------------------
-- This has to be called by the app before reloading everything
-- _on_reload()
function _on_reload()
   _included_files = nil
   _sys = nil
end


---------------------------------------------------------------------
-- Used  for combining IDs. Has use the same algorith the app uses. 
-- This function is implemented by the application
if(not _combine_guids) 
then 
   function _combine_guids (guid1, guid2)
      return -1
   end
end


function dofile(file_name)
   local nopath_file_name  = strlower(file_name)

   -- strip any folder parts off of the file name
   local s, e = strfind(nopath_file_name, "[^/\\]+$") 
   if(s > 0 and e > 0 and s ~= e)
   then
      nopath_file_name = strsub(nopath_file_name, s, e)
   end

   -- proceed with dofile 
   local report = "dofile() -- '"..file_name.."' \t\t-- "
   local ok = not nil 
   if (_included_files[nopath_file_name] == nil)
   then
      -- process file in normal fashion
      _included_files[nopath_file_name] = 1
      ok = _old_dofile(file_name) -- the resource loader never returns 'nil' but the error code.
      if (ok )
      then
         report = report .. "Ok"
      else 
         _included_files[nopath_file_name] = nil
         report = report .. "Error"
      end 
   else 
      -- report = report .. "Skipped"
      return ok
   end

   print (report)
   return ok
end 


----------------------------------------------------------------------
-- Just a helper function converting hex strings to numbers

function hex2dec (hex_str)
   local n = tonumber (hex_str, 16) 
   return n
end

---------------------------------------------------------------------
--   Tags for relaying user data between scripts & engine

TAG_OCCUPANT = newtag()
TAG_AUTOMATON = newtag()


---------------------------------------------------------------------
--   Global tables used to store advisor resources 
TAG_ADVICE = newtag() -- a tag for an advice tables

---------------------------------------------------------------------------
-- A tool for making a table immutable 

TAG_CONST_TABLE = newtag() 

function event_const_settable (table, index, value)
   error("ERROR:\tConstant '"..tostring(index).."' can not be assigned to.")
end 

function event_const_gettable (table, index, value)
   local i, v 

   i, v = next(table, nil)
   while v
   do
      if index ==  i 
      then
         return v
      end         
      i,v = next(table,i)
   end
   
   print("ERROR:\tYou might have mistyped '"..tostring(index).."'.")
   return nil
end 

function make_table_const(table)
   if(_sys.debug ~= 0 and _sys.config_run ==0)
   then
      local tag = TAG_CONST_TABLE
      settag(table, tag)
      if (_sys.debug and _sys.debug ~= 0) -- we only want this to work while we are debugging
      then 
         settagmethod(tag, "settable", event_const_settable)
         settagmethod(tag, "gettable", event_const_gettable)
      end
   end
end

----------------------------------------------------------------------
--  Simple inheritance support handler
function event_hierarchy_index(table, index, value)
   local t = rawget(table, "_base")
   if (t ~= nil and type(t) == "table") 
   then
      return table._base[index]
   end
   return nil
end 

----------------------------------------------------------------------
--  Templated tables
TAG_TEMPLATED_TABLE = newtag() -- used for tables created from templates
TAG_TEMPLATE_TABLE   = newtag() -- used for template tables themselves

-------------
-- settable  event for templated tables
function settable_event_for_TAG_TEMPLATED_TABLE (t, i, v)
   if(tag(t) ~= TAG_TEMPLATED_TABLE  or type(t) ~= "table") 
   then 
      error("ERROR: parameter is not a templated table")
   end

   local tpl = rawget(t, "_template")
   
   if(tpl == nil or type(tpl) ~= "table" or tag(tpl) ~= TAG_TEMPLATE_TABLE)
   then
      error("ERROR: templated table has '_template' field missing.")
   end

   -- some of the fields are not settable
   if(_sys.debug == 1)
   then 
      assert(i ~= "_base" and i ~= "_template"  and i ~= "_flat",  "Can't assign to '_base','_template','_flat' ") 
   end

   if(rawget(t, "_flat")) -- flat model 
   then
      -- if the value is in template and the type matches set the value 
      local tpl_v = tpl[i] -- this scans the template hierarchy
      if (v  ~= nil and type(v) == type(tpl_v))
      then 
         rawset(t, i, v)
         return 
      end
      error("ERROR: Can't assign to '"..tostring(i).."'")
   else 
      -- scan the templdate and see if it has a memeber we are trying to set in this table
      for tpl_i, tpl_v in tpl do
         if(i == tpl_i) 
         then
            local tpl_v =  tpl[tpl_i]
            if(type(v) == type(tpl_v))
            then
               rawset(t, i, v)
               return 
            else
               error("ERROR: Can't assign to '"..tostring(i).."'")
            end
         end
      end
      
      local base_table = t._base
      if(base_table ~= nil and type(base_table) == "table" ) 
      then
         base_table[i] = v -- the index has not been found here. Try the base table.
         return
      end
      error("ERROR: Can't assign to '"..tostring(i).."'")
   end 
end

-------------
-- index event for templated tables
function index_event_for_TAG_TEMPLATED_TABLE(t, i, v)
   if(type(t) ~= "table" or tag(t) ~= TAG_TEMPLATED_TABLE ) 
   then 
      error("ERROR: table of type TAG_TEMPLATED_TABLE is expected")
   end
   local base_table = rawget(t, "_base")
   if(type(base_table) ~= "table")
   then
      print ("ERROR: Accessing unknown table field '"..tostring(i).."'. Typo?")
      return nil
   end

   return base_table[i]
end

-------------
-- index event for templated tables
function index_event_for_TAG_TEMPLATE_TABLE(t, i, v)
   if(type(t) ~= "table" or tag(t) ~= TAG_TEMPLATE_TABLE ) 
   then 
      error("ERROR: table of type TAG_TEMPLATE_TABLE is expected")
   end
   local base_table = rawget(t, "_base")
   if(type(base_table) ~= "table")
   then
      return nil
   end

   return base_table[i]
end

-------------
--set tag methods finally
settagmethod(TAG_TEMPLATE_TABLE, "index", index_event_for_TAG_TEMPLATE_TABLE)
settagmethod(TAG_TEMPLATED_TABLE, "index", index_event_for_TAG_TEMPLATED_TABLE)
settagmethod(TAG_TEMPLATED_TABLE, "settable", settable_event_for_TAG_TEMPLATED_TABLE)

-------------
-- This function takes one table that it uses as a template and creates another 
-- table based on this tamplate. It also set tag methods appropriately to support
-- inheritance. The base table has to be of TAG_TEMPLATED_TABLE type 
-- 'template' is a tables defining valid fields for new table and their initial values.
-- 'base_table' is a table that will be set as the base for the hierarchy 
--              created from the template. This table is alowed to be on any type.
function create_templated_table (template, base_table, flat_model, child)
   if (type(template) ~= "table" or tag(template) ~= TAG_TEMPLATE_TABLE) 
   then
      error("ERROR: 'template' parameter is not a proper template.")
   end

   -- if the 'bese_table' uses the same template as the parameter then
   -- we simply use the base to set up our new table
   local use_base = nil
   if (type(base_table) == "table" and tag(base_table) == TAG_TEMPLATED_TABLE)
   then
      local bt_template  = rawget(base_table, "_template")
      if(bt_template == template)
      then
         if(child)
         then
            return base_table  -- the function is called recursively so just return the base
         else
            use_base = base_table  -- creating a table based on another table with same template
         end
      end
   end

   -- create new table 
   local t = {}
   t._template = template 
   t._flat = (flat_model or rawget(template, "_flat")) 

   if(use_base ~= nil)
   then
      t._base = use_base
   else 
      base_template = rawget(template, "_base")
      if(base_template ~= nil)
      then 
         t._base = create_templated_table(base_template, base_table, flat_model, 1)
      end

      -- create a table by the template
      for i, v in template 
      do
          -- don't copy the new function or an entry found in the base table
         if(i ~= 'new' and i ~= '_base'  and i ~= '_flat')
         then 
            t[i] = v -- this way t.i take the type and initial values from its template
         end
      end
   end

   -- set the type
   settag(t, TAG_TEMPLATED_TABLE)
   return t
end

-------------
-- this function takes one table and makes it a template table suitable for 
-- making instances out of it 
function create_template (table)
   if(type(table) ~= 'table')
   then 
      error("ERROR: 'table' parameter is not a table.")
   end

   -- Set a mothod to create new tables based 'table'   
   -- Parameters are as follows  :
   --       'self' : template instance
   --       ['init_tab']  : Table to override defaults values from from template. 
   --       ['base_tab'] : Specifies the table to use as one of the bases in the hierarhcy. 
   --                               Basically it allowes virtual inheritance. 
   --       ['flat_model'] : If set makes it so that a table can have any field found in its 
   --                                   template hierarchy opposed to only those fields present in its
   --                                   own template. 
   table . new = 
      function (self, init_tab, base_tab, flat_model) 
         local t = create_templated_table (self, base_tab, flat_model)
         if (init_tab ~= nil and type (init_tab) == 'table')
         then 
            for i, v in init_tab -- init our new table using 'init_table'
            do
               t[i] = v
            end
         end
         return t
      end
   
   settag(table,  TAG_TEMPLATE_TABLE )
   return table
end


--------------------------------------------------------------------------------------------
-- Tests
-- 

if(1 or _sys.test == 0)
   then return 0 end

--  Tests, debug etc.
t = create_template
{
   hello = 1
}

t2 = create_template
{
   _base = t,
   bye = 1
}

--t2_instancei = t2 : new()
--t_instance = t : new()

advisor_template = create_template
{
   class_id = 0,
   advisor_id = 0,
   guid = 0,
   name = "Advisor",
   advice_types = {},
}

function advisor_template:get_class_id()
   print ("advisor_template:get_class_id()")
   return self.class_id
end

mysim_advisor_template = create_template
{
   _base = advisor_template,
   head_id = 0 
}

function mysim_advisor_template:get_class_id()
   print ("mysim_advisor_template:get_class_id()")
   return self.class_id
end 

mysim_advisor_template2 = create_template
{
   _base = mysim_advisor_template,
   text_id = 0 
}

function mysim_advisor_template2:get_class_id()
   print ("mysim_advisor_template2:get_class_id()")
   return self.class_id
end 

advisor_instance = advisor_template : new({class_id = 100}) 
mysim_advisor_instance = mysim_advisor_template : new(nil, advisor_instance) 
mysim_advisor_instance2 = mysim_advisor_template2 : new() 

print (advisor_instance:get_class_id())
print (mysim_advisor_instance:get_class_id())
print (mysim_advisor_instance2:get_class_id())

--mysim_advisor_instance.class_id = 10
--print (advisor_instance:get_class_id())
--print (mysim_advisor_instance:get_class_id())

mysim_advisor_instance2.class_id = 10
print (mysim_advisor_instance2:get_class_id())
print (mysim_advisor_instance:get_class_id())
print (advisor_instance:get_class_id())
