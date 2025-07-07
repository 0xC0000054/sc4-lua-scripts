--
-- _sfx.lua
--
-- Contains definitions for sound effect track ID's.  These are from
-- SC4AudioConstants.h
--
-- NOTE: these are currently mirrored in Advisors\sit_constants.lua.  Please keep
-- the two files in sync
--
--------------------------------------
-- prevent this file from being included multiple times
if not rawget(globals(), "_sfx_lua") then
_sfx_lua = 1



SFX = {                 ----  			sfx = {SFX.Automata_StrikeSmall},
   Automata_Panic          = "0xa9f14c47",
   Automata_ArmyDrill      = "0xea55b3ca",	-- Begin Added 08/05/02 by Marc Farly
   Automata_BooLarge1      = "0xca55b40d",
   Automata_BooMedium      = "0xca55b6f2",
   Automata_BooSmall       = "0x8a55b719",
   Automata_CheerLarge1    = "0xca55b733",
   Automata_CheerMedium    = "0xaa55b748",
   Automata_CheerSmall     = "0xaa55b75a",
   Automata_RiotLarge      = "0x2a55b78a",
   Automata_RiotMedium     = "0xea55b7ac",
   Automata_RiotSmall      = "0x0a55b7cc",
   Automata_StrikeLarge    = "0x8a55b7de",
   Automata_StrikeMedium   = "0xaa55b75a",
   Automata_StrikeSmall    = "0xaa55b80b",
   Automata_ThemeparkWalla = "0x6a55b892",	-- "Walla" is nonspecific crowd dialog, as heard during a party
   Automata_WallaLarge     = "0xea55b81f",
   Automata_WallaMedium    = "0x0a44b832",
   Automata_WallaSmall     = "0xea55b845",
   Automata_ZooWalla       = "0xaa55b8b6",	-- End Added 08/05/02 by Marc Farly
   Animal_Chimp		= "0xca777589",
   Prison_Siren		= "0xea777468",
   Automata_KidsPlay	= "0x6a55b28a",		-- Can be used for children arriving to and leaving school
   Automata_Park_Crowd	= "0xeaa70cd3",	-- Use for park crowds. Added 10/03/02 by Marc Farly
   }


-- end include check
end