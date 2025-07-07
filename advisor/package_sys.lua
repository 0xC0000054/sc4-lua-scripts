--#-package:00000001# -- package signature 
-- This is a system package used by all LUA scripts 
--
-- replace dofile with the applicaiton installed function
if(_dofile_from_resource)
then 
   dofile = _dofile_from_resource
end

-- System table is set up for release by default .
_sys = {}
_sys.debug = 0
_sys.test = 0
_sys.config_run = 1
