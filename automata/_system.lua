--
-- _system.lua
--
-- global tables and functions for automata controller scripts

-- Don't change this file!


-- only execute this script once
if (rawget(globals(), "_system_lua") == nil) then
_system_lua = 1


print("Executing _system.lua...")
print("NOTE! All tables supporting inheritance through '_parent' field \n\thave to be created via 'TTT' prefix.")

--------------------------------------
-- Global constants
--
--true = 1
--false = nil
--------------------------------------

--------------------------------------
-- Helper function
--
function hex2dec (hex_str)
   local n = tonumber (hex_str, 16) 
   return n
end


--------------------------------------
-- Global tables
--
templates = {}				-- contains template specifications, for verifying scripts

attractor = {}					-- properties for automata attractors
generator = {}				-- properties for automata generators
occupant_group = {}		-- properties for occupants that have attached attractors and/or generators
automata_group = {}		-- occupant groups for automata

function verify_all_templates()
   if (rawget(globals(), "_IN_GAME") == nil) then
      print("Verifying templates...");
   
      verify_template("attractor", attractor, templates.attractor_list)
      verify_template("generator", generator, templates.generator_list)
      verify_template("occupant_group", occupant_group, templates.occupant_group_list)
      verify_template("automata_group", automata_group, templates.automata_group_list)
   
      verify_automata_names(attractor, "attractor")
      verify_automata_names(generator, "generator")
      verify_controller_names()
   end
end
--------------------------------------

function verify_controller_names()
   local ndx,val
   local controllerTable
   local controlleri, controllerv
   local foundController

   ndx,val = next(occupant_group, nil)
   while ndx do
      controllerTable = rawget(val, "controllers")
      if (controllerTable ~= nil) then
         controlleri, controllerName = next(controllerTable, nil)
         while controlleri do
            foundController = rawget(attractor, controllerName)
            if (foundController == nil) then
               foundController = rawget(generator, controllerName)
               if (foundController == nil) then
                  print("WARNING: Controller '"..controllerName.."' used by 'occupant_group."..ndx.."' wasn't found!");
               end
            end
            controlleri, controllerName = next(controllerTable, controlleri)
         end
      else
         print("WARNING: occupant_group."..ndx.." has no controllers list.");
      end
      ndx,val = next(occupant_group, ndx)
   end
end

function verify_automata_names(master_table, master_table_name)
   local ndx, val
   local automataTable
   local autoi, autov
   local foundAuto

   ndx, val = next(master_table, nil)
   while ndx do
      automataTable = rawget(val, "automata")
      if (automataTable ~= nil) then
         autoi,autov = next(automataTable, nil)
         while autoi do
            foundAuto = rawget(automata_group, autov)
            if (foundAuto == nil) then
               print("WARNING: Automata group '"..autov.."' used by '"..master_table_name.."."..ndx.."' wasn't found!");
            end
            autoi,autov = next(automataTable,autoi)
         end
      end
      ndx, val = next(master_table, ndx)
   end
end


---------------------------
-- Working Directory
--
-- prepend a global dofile directory (set by the C++ side) to all dofile() calls
--
if (rawget(globals(), "__old_dofile") == nil) then			-- only define this once!
	__old_dofile = dofile
	dofile = function(filename)
		local filePath
		filePath = filename
		if (rawget(globals(), "__dofile_directory") ~= nil) then
			filePath = __dofile_directory..filename
		end
		return __old_dofile(filePath)
	end
end

---------------------------


--------------------------------------
-- Simple Inheritance
--
-- Any attempt to access a non-existent field in a table will try the
-- access in the _parent table
function event_inheritance(table, index)
        local p = rawget(table, "_parent")		-- use rawget to avoid infinite recursion
        if (p ~= nil) then
			return p[index]
        else
			-- don't error out; we want to be able to check a field's existence without causing an error
			return nil
        end
end

-- set the tag method for all tables
TTT_TAG = newtag()
settagmethod(TTT_TAG, "index", event_inheritance)

function TTT(t)
   local tab = t
   if(type(t) ~= "table") 
      then tab = {} end
   if(tag(tab) <= 0) 
      then 
         settag(tab, TTT_TAG) 
      else 
         print('---', tag(tab))
      end
   return tab
end
--------------------------------------


--------------------------------------
-- Variable Declaration
--
-- Attempts to get the value of undeclared global variables will
-- result in an error
function event_getglobal(name)
	local v=rawget(globals(),name)
	if name == "false" then			-- special case; "false" == nil
		return nil
	elseif v then
		return v
	else
		error("Undefined global variable '"..name.."'")
	end	
end

TAG_GBL = newtag()
settagmethod(TAG_GBL,"gettable", event_getglobal)
settag(globals(), TAG_GBL)
--------------------------------------


--------------------------------------
-- Templates
--
-- Various functions and tags to allow tables to check for required fields &
-- field types


-- Template Markers
--
-- The required_field() marker can nest one of the other field markers, but
-- required_field() MUST be the outermost marker, e.g.
-- 	day_of_week = required_field(type_list( "string" )		-- OK!
--  day_of_week = type_list( required_field("string") )		-- WRONG!
-- 

-- required_field()
--
-- When used in a template, marks a field as being required.  Any tables created
-- using that template will fail if they don't have a field with the same index and
-- correct type.
-- "field_type" - a string containing a lua type name, or another template table
tag_RequiredField = newtag()
function required_field(field_type)
	local newtable = {}
	newtable.type = field_type
	settag(newtable, tag_RequiredField)
	return newtable
end

-- type_list()
--
-- When used in a template, marks the field as being a homogenous list, i.e.
-- it can contain one or more values, but they must all be of the same type
-- "field_type" - a string containing a lua type name, or another template table
tag_TypeList = newtag()
function type_list(field_type)
	local newtable = {}
	newtable.type = field_type
	settag(newtable, tag_TypeList)
	return newtable
end

-- subset_of()
--
-- When used in a template, specifies that the field can contain one or more
-- values, but each element must have the same type as one of the elements
-- in the "superset_table" table.  Similar to type_list, but can contain multiple
-- types instead of requiring a homogenous list.
--
tag_SubsetOf = newtag()
function subset_of(superset_table)
	local newtable = {}
	if (type(superset_table) ~= "table") then
		error("subset_of(): superset_table must be a table!");
	end
	
	newtable.superset = superset_table
	settag(newtable, tag_SubsetOf)
	return newtable
end

-- literal()
--
-- can be used in place of a type in other functions, to require the field
-- to be of a certain value.
-- e.g. template = subset_of( { literal("matthew"), literal("mark"), literal("luke"), literal("john") } )
--
-- will allow gospel = { "matthew", "mark" }
-- and gospel = "john"
-- but not gospel = { "matthew", "mark", "luke", "ringo" }
--
tag_LiteralValue = newtag()
function literal(value)
	local newtable = {}
	if (type(value) == "table") then
		error("literal(): Tables are not allowed as literal values in templates.");
	end
	newtable.value = value
	settag(newtable, tag_LiteralValue)
	return newtable
end

-- value_table()
--
-- equivalent to a subset_of() + literal()
-- e.g. template = value_table( { "matthew", "mark", "luke", "john" } )
-- is identical to above example
--
function value_table(superset_table)
	local new_superset = {}
	local i,v
	
	if (type(superset_table) ~= "table") then
		error("value_table(): superset_table must be a table!");
	end

	-- convert superset_table to a table of literal()s
	i,v = next(superset_table, nil)
	while i do
		new_superset[i] = literal(v)
		i,v = next(superset_table, i)
	end
	return subset_of(new_superset)
end


--
-- Verification Functions
--

errorStrings = {}

-- add_error_string()
--
function add_error_string(bSilent, string_table, new_string)
	if (not bSilent) then
		local max_ndx = getn(string_table)
		string_table[max_ndx + 1] = new_string
	end
end

-- print_error_strings()
--
function print_error_strings(string_table)
	local i,v
	i,v = next(string_table, nil)
	while i do
		print(v)
		i,v = next(string_table, i)
	end
	errorStrings = {}
end

-- build_table_name
--
function build_table_name(base_name, index)
	if (type(index) == "string") then			-- return strings in "parent.field" format
		return base_name.."."..index
	else												-- and everything else in "parent[field]" format
		return base_name.."["..tostring(index).."]"
	end
end

-- verify_type_list()
-- Checks the given "new_value" against a "list_type".  All fields of "new_value"
-- must be of type "list_type".
-- "new_table_name" -- the qualified "parent.parent.field" name of new_value, for
--	error reporting
function verify_type_list(new_table_name, new_value, list_type, bSilent)
	local i,v
	local bValid
	
	bValid = true

	if (type(new_value) == "table") then
		i,v = next(new_value, nil)
		while i do
			-- ignore fields starting with underscore _, they're system fields
			if (strsub(tostring(i), 1, 1) ~= "_") then
				if (type(list_type) == "table") then
					bValid = verify_template(build_table_name(new_table_name, i), v, list_type, bSilent)
						and bValid;
				else
					bValid = verify_type_list(build_table_name(new_table_name,i), v, list_type, bSilent)
						and bValid;
				end
			end
			i,v = next(new_value, i)
		end
	else
		-- it's a single value, make sure it conforms to type
		if (type(list_type) == "table") then
			-- and that type is a template
			bValid = verify_template(new_table_name, new_value, list_type, bSilent)
				and bValid;
		elseif (type(list_type) == "string") then
			-- and that type is a string containing a lua type name
			if (type(new_value) ~= list_type) then
				add_error_string(bSilent, errorStrings, new_table_name..": Value must be of type '"..list_type.."'");
				bValid = false
			end
		else
			if (type(new_value) ~= type(list_type)) then
				add_error_string(bSilent, errorStrings, new_table_name..": Value must be of type '"..type(list_type).."'");
				bValid = false
			end
		end
	end

	print_error_strings(errorStrings);
	
	return bValid
end

-- verify_field_in_subset()
-- Checks a single field to make sure an equivalent exists in superset_table.
-- Should be called by verify_subset_of() ONLY, to prevent template errors caused by recursion
function verify_field_in_subset(field_name, field_value, superset_table, bSilent)
	local bFoundMatch
	local bValid
	local i,v
	
	bValid = true
	
	-- make sure field_value exists somewhere in superset_table
	bFoundMatch = false
	i,v = next(superset_table, nil)
	while (i ~= nil) and (bFoundMatch == false) do
		if (type(v) == "table") then
			-- check it as a template
			bFoundMatch = verify_template(field_name, field_value, v, true)	-- silent
		elseif (type(v) == "string") then
			if (type(field_value) == v) then
				bFoundMatch = true
			end
		elseif (type(field_value) == type(v)) then
			-- matches a non-table element in superset; we're done
			bFoundMatch = true
		end
		i,v = next(superset_table, i)
	end
	if (bFoundMatch == false) then
		bValid = false
		add_error_string(bSilent, errorStrings, field_name..": Value '"..tostring(field_value).."' not allowed by template table.");
	end
	
	return bValid
end

-- verify_subset_of()
-- Checks a given table field "new_value" to make sure that it conforms to one or more
-- of the elements inside "superset_table"
-- "new_table_name" -- fully-qualified "parent.field" name of new_value, for error reporting
function verify_subset_of(new_table_name, new_value, superset_table, bSilent)
	local i,v
	local bFoundMatch
	local bValid
	
	bValid = true
	
	if (type(superset_table) ~= "table") then
		error("verify_subset_of '"..new_table_name.."': superset_table must be a table!");
	end
	
	if (type(new_value) == "table") then
		-- check each member of new_value table to make sure it belongs in superset_table
		i,v = next(new_value, nil)
		while i do
			-- ignore fields starting with underscore _, they're system fields
			if (strsub(tostring(i), 1,1) ~= "_") then
				bValid = verify_field_in_subset(build_table_name(new_table_name,i), v, superset_table, bSilent)
					and bValid;
			end
			i,v = next(new_value, i)
		end
	else
		bValid = verify_field_in_subset(new_table_name, new_value, superset_table, bSilent);
	end

	print_error_strings(errorStrings);
	
	return bValid
end

-- verify_literal_value
--
function verify_literal_value(new_table_name, new_value, template_value, bSilent)
	local bValid
	
	bValid = true
	
	if (type(new_value) ~= type(template_value)) then
		add_error_string(bSilent, errorStrings, new_table_name..": Value must be literal value '"..tostring(template_value).."'");
		bValid = false
	elseif (new_value ~= template_value) then
		add_error_string(bSilent, errorStrings, new_table_name..": Value must be literal value '"..tostring(template_value).."'");
		bValid = false
	end

	print_error_strings(errorStrings);
	
	return bValid
end

-- verify_template
--
-- Checks all fields in "new_table" to make sure that the table conforms to the rules of
-- "template_table".  Returns true if new_table is valid
-- "new_table_name" -- fully qualified field name in the form "parent.field", for error reporting
-- "bSilent" -- if non-nil, this function will print warning messages for invalid fields
function verify_template(new_table_name, new_table, template_table, bSilent)
--   print ("@@@ tag "..tostring(tag(template_table)).."type "..type(template_table) )
	local index,value
	local foundField
	local required_type
	local bValid

	if (type(new_table_name) ~= "string") then
		error("verify_template: new_table_name must be a string!");
	elseif (type(template_table) ~= "table") then
		error("verify_template '"..new_table_name.."': template_table must be a table!");
	end
	
	bValid = true
	
	if (tag(template_table) == tag_TypeList) then
		bValid = verify_type_list(new_table_name, new_table, template_table.type, bSilent)
	elseif (tag(template_table) == tag_SubsetOf) then
		bValid = verify_subset_of(new_table_name, new_table, template_table.superset, bSilent)
	elseif (tag(template_table) == tag_LiteralValue) then
		bValid = verify_literal_value(new_table_name, new_table, template_table.value, bSilent)
	else
		if (type(new_table) ~= "table") then
			error("verify_template '"..new_table_name.."': new_table must be a table!");
		end
		
		-- verify that all fields in new_table are also contained in template_table
		index,value = next(new_table, nil)
		while index do
			-- ignore special system indices
			if (strsub(index, 1, 1) ~= "_") then
				foundField = template_table[index];
				if (foundField == nil) then
					-- field not found warning
					add_error_string(bSilent, errorStrings, new_table_name..": Field '"..index.."' not found in template.");
					bValid = false
				else
					-- field found; do type checking
					if (tag(foundField) == tag_RequiredField) then
						required_type = foundField.type
					else 
						required_type = foundField
					end
					
					if (type(required_type) == "table") then
						-- it's another table; treat it as a sub-template
						bValid = verify_template(build_table_name(new_table_name,index), value, required_type, bSilent)
							and bValid;
					elseif (type(required_type) == "string") then
						-- it's a string representing a lua type name
						if (type(value) ~= required_type) then
							add_error_string(bSilent, errorStrings, new_table_name..": Field '"..index.."' must be of type '"..required_type.."'");
							bValid = false
						end
					else
						-- using a non-string constant to specify the type, which is weird but allowed
						if (type(value) ~= type(required_type)) then
							add_error_string(bSilent, errorStrings, new_table_name..": Field '"..index.."' must be of type '"..type(required_type).."'");
							bValid = false
						end
					end
				end
			end
			
			index, value = next(new_table, index)
		end
		
		-- now, verify that all required fields in template_table exist in new_table
		index, value = next(template_table, nil)
		while index do
			if (tag(value) == tag_RequiredField) then
				foundField = new_table[index]
				if (foundField == nil) then
					add_error_string(bSilent, errorStrings, new_table_name..": Field '"..index.."' is required.");
					bValid = false
				end
				-- note that we've already done type-checking in the above loop, so it's not needed here
			end
			index, value = next(template_table, index)
		end
		
		-- run post-verify function, if it exists
		if (type(template_table) == "table") then
			foundField = rawget(template_table, "_post_verify_function")
			if (foundField ~= nil) then
				bValid = call(foundField, new_table, errorStrings)
			end
		end
	end
	
	print_error_strings(errorStrings);
	
	return bValid
end

--------------------------------------

-- end sentry
end