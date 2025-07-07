-----------------------------------------------------
-- Main script file where we just include all 
-- scripts relevant to the advisor system.
-- It is only used during development for 
-- the game uses packages for script loading.

-----------------------------------------------------
-- system files
dofile("package_sys.lua")

-- set debug mode
_sys.config_run = 0
_sys.test = 1
_sys.debug = 1

-- startup files 
dofile("package_startup.lua")

-- advice files 
dofile("package_advisors.lua")

-- tutorial
dofile("package_tutorial.lua")

-- EP1 package is a part of core at the moment. 
dofile("package_ep1_advisors.lua")

--------------------------------------------------------------------
-- This will try to execute triggers for all registerd advices 
-- to make sure they don't have any syntactic errors.

if (_sys.config_run == 0)
then
   advices : run_triggers()
end
