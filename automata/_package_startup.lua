--#-package:00000001#
--
-- _package_startup.lua
--
-- This is the entry point for the automata scripts when they are read as resource
-- files.  It initializes the dofile() mechanism and then loads _config.lua, the standard
-- entry point.
--

-- re-assign "dofile" in scripts to the published function _dofile_from_resource
if (rawget(globals(), "_dofile_from_resource") ~= nil) and
     (rawget(globals(), "__old_dofile") == nil) then 
   __old_dofile = dofile                        -- set this so that _system.lua doesn't try to overwrite dofile again
   dofile = _dofile_from_resource
end

-- then include the main entry point
dofile("_config.lua");