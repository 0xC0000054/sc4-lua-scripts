--
-- yimby.lua
--

dofile("_templates.lua")
dofile("reward.lua")

--This lua simply references the existing Reward.lua---------------------------------------------------------------------------------------
-- Finally, create a controller reference to an occupant group with attached attractors & generators

occupant_group.yimby = 
{
	group_id = "0x1920",		-- this should be a GUID defined in ingred.ini's "occupant groups" value map - building group number
	controllers = {
		"reward_sims",
      "reward_pull",
      "tv_pull",
		"tv_in",
		},
}
-- verification
-- this function checks all tables against _templates.lua, for typos, required fields, and correct value types
-- It slows down parsing of the scripts, however -- include it when making quick changes but comment
-- it out when the scripts are stable
--~ verify_all_templates()
