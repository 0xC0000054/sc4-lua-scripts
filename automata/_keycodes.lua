--
-- _keycodes.lua
--
-- Contains virtual key codes.  Used for player-drive automata effects
-- Source file: RZKeys.h
--

if (rawget(globals(), "_keycodes_lua") == nil) then
_keycodes_lua = 1


dofile("_system.lua");

--
-- drive commands
--
-- These are abstract drive commands usable in key_effects tables in automata groups
-- Multiple keys can be mapped to the same drive_command

drive_command = {}

drive_command.ACCELERATE         = 0
drive_command.BRAKE              = 1
drive_command.TURN_LEFT          = 2
drive_command.TURN_RIGHT         = 3
drive_command.OFF_ROAD           = 4
drive_command.CLIMB              = 5
drive_command.DIVE               = 6
drive_command.SPECIAL            = 7
drive_command.AIM                = 8
drive_command.ALTERNATE          = 9
drive_command.LAND               =10
drive_command.POWERUP            =11
drive_command.POWERDOWN          =12


--
-- keycodes
--

keycode = {}

--Digit keys. RZ_VK_0 thru RZ_VK_9 are the same as ASCII '0' thru '9' (= 0x30 - = 0x39)
keycode.VK_0              = hex2dec('0x30')   --The '0' digit key.
keycode.VK_1              = hex2dec('0x31')   --The '1' digit key. 
keycode.VK_2              = hex2dec('0x32')   --The '2' digit key. 
keycode.VK_3              = hex2dec('0x33')   --The '3' digit key. 
keycode.VK_4              = hex2dec('0x34')   --The '4' digit key. 
keycode.VK_5              = hex2dec('0x35')   --The '5' digit key. 
keycode.VK_6              = hex2dec('0x36')   --The '6' digit key. 
keycode.VK_7              = hex2dec('0x37')   --The '7' digit key. 
keycode.VK_8              = hex2dec('0x38')   --The '8' digit key. 
keycode.VK_9              = hex2dec('0x39')   --The '9' digit key. 

--Letter keys. RZ_VK_A thru RZ_VK_Z are the same as ASCII 'A' thru 'Z' (= 0x41 - = 0x5A)
keycode.VK_A              = hex2dec('0x41')   --The 'A' key.
keycode.VK_B              = hex2dec('0x42')   --The 'B' key. 
keycode.VK_C              = hex2dec('0x43')   --The 'C' key. 
keycode.VK_D              = hex2dec('0x44')   --The 'D' key. 
keycode.VK_E              = hex2dec('0x45')   --The 'E' key. 
keycode.VK_F              = hex2dec('0x46')   --The 'F' key. 
keycode.VK_G              = hex2dec('0x47')   --The 'G' key. 
keycode.VK_H              = hex2dec('0x48')   --The 'H' key. 
keycode.VK_I              = hex2dec('0x49')   --The 'I' key. 
keycode.VK_J              = hex2dec('0x4A')   --The 'J' key. 
keycode.VK_K              = hex2dec('0x4B')   --The 'K' key.
keycode.VK_L              = hex2dec('0x4C')   --The 'L' key. 
keycode.VK_M              = hex2dec('0x4D')   --The 'M' key. 
keycode.VK_N              = hex2dec('0x4E')   --The 'N' key. 
keycode.VK_O              = hex2dec('0x4F')   --The 'O' key. 
keycode.VK_P              = hex2dec('0x50')   --The 'P' key. 
keycode.VK_Q              = hex2dec('0x51')   --The 'Q' key. 
keycode.VK_R              = hex2dec('0x52')   --The 'R' key. 
keycode.VK_S              = hex2dec('0x53')   --The 'S' key. 
keycode.VK_T              = hex2dec('0x54')   --The 'T' key. 
keycode.VK_U              = hex2dec('0x55')   --The 'U' key.
keycode.VK_V              = hex2dec('0x56')   --The 'V' key. 
keycode.VK_W              = hex2dec('0x57')   --The 'W' key. 
keycode.VK_X              = hex2dec('0x58')   --The 'X' key. 
keycode.VK_Y              = hex2dec('0x59')   --The 'Y' key. 
keycode.VK_Z              = hex2dec('0x5A')   --The 'Z' key. 

--Modifier keys.
keycode.VK_SHIFT          = hex2dec('0x10')   --Either of the shirt keys.
keycode.VK_LSHIFT         = hex2dec('0xA0')   --The left shift key in particular.
keycode.VK_RSHIFT         = hex2dec('0xA1')   --The right shift key in particular.

keycode.VK_CONTROL        = hex2dec('0x11')   --Either of the control keys.
keycode.VK_LCONTROL       = hex2dec('0xA2')   --The left control key in particular.
keycode.VK_RCONTROL       = hex2dec('0xA3')   --The right control key in particular.

keycode.VK_ALT            = hex2dec('0x12')   --Either of the alt keys.
keycode.VK_LALT           = hex2dec('0xA4')   --The left alt key in particular.
keycode.VK_RALT           = hex2dec('0xA5')   --The right alt key in particular.

keycode.VK_OPTION         = hex2dec('0x12')   --Either of the (Macintosh) option keys.
keycode.VK_LOPTION        = hex2dec('0xA4')   --The left option key in particular.
keycode.VK_ROPTION        = hex2dec('0xA5')   --The right option key in particular.

keycode.VK_WIN            = hex2dec('0x5B')   --Win32-specific: Either of the "Windows" keys.
keycode.VK_LWIN           = hex2dec('0x5B')   --Win32-specific: The left "Windows" key.
keycode.VK_RWIN           = hex2dec('0x5C')   --Win32-specific: The right "Windows" key.

--Standalone keys
keycode.VK_NONE           = hex2dec('0x00')   --No key in particular.
keycode.VK_BACK           = hex2dec('0x08')   --Backspace key.
keycode.VK_TAB            = hex2dec('0x09')   --The tab key.
keycode.VK_RETURN         = hex2dec('0x0D')   --Either of the return and enter keys.
keycode.VK_PAUSE          = hex2dec('0x13')   --The pause (a.k.a break) key, as returned by Windows without control depressed.
keycode.VK_CANCEL         = hex2dec('0x03')   --The break (a.k.a pause) key, as returned by Windows with control depressed.
keycode.VK_ESCAPE         = hex2dec('0x1B')   --The esc key.
keycode.VK_SPACE          = hex2dec('0x20')   --The spacebar key.
keycode.VK_PRIOR          = hex2dec('0x21')   --The Page up key.
keycode.VK_NEXT           = hex2dec('0x22')   --The Page down key.
keycode.VK_END            = hex2dec('0x23')   --The End key.
keycode.VK_HOME           = hex2dec('0x24')   --The Home key.
keycode.VK_LEFT           = hex2dec('0x25')   --The left arrow key.
keycode.VK_UP             = hex2dec('0x26')   --The up arrow key.
keycode.VK_RIGHT          = hex2dec('0x27')   --The right arrow key.
keycode.VK_DOWN           = hex2dec('0x28')   --The down arrow key.
keycode.VK_SNAPSHOT       = hex2dec('0x2C')   --The PrintScrn (print screen) key.
keycode.VK_INSERT         = hex2dec('0x2D')   --The insert key.
keycode.VK_DELETE         = hex2dec('0x2E')   --The delete key.
keycode.VK_HELP           = hex2dec('0x2F')   --The help key, if there is one.
keycode.VK_SLEEP          = hex2dec('0x5F')   --The computer sleep key, if it has one.
keycode.VK_APPS           = hex2dec('0x5D')   --Win32-specific: The "applications" key. 

keycode.VK_NUMPAD0        = hex2dec('0x60')   --The number pad '0' key.
keycode.VK_NUMPAD1        = hex2dec('0x61')   --The number pad '1' key.
keycode.VK_NUMPAD2        = hex2dec('0x62')   --The number pad '2' key.
keycode.VK_NUMPAD3        = hex2dec('0x63')   --The number pad '3' key.
keycode.VK_NUMPAD4        = hex2dec('0x64')   --The number pad '4' key.
keycode.VK_NUMPAD5        = hex2dec('0x65')   --The number pad '5' key.
keycode.VK_NUMPAD6        = hex2dec('0x66')   --The number pad '6' key.
keycode.VK_NUMPAD7        = hex2dec('0x67')   --The number pad '7' key.
keycode.VK_NUMPAD8        = hex2dec('0x68')   --The number pad '8' key.
keycode.VK_NUMPAD9        = hex2dec('0x69')   --The number pad '9' key.
keycode.VK_MULTIPLY       = hex2dec('0x6A')   --The number pad '*' key.
keycode.VK_ADD            = hex2dec('0x6B')   --The number pad '+' key.
keycode.VK_SUBTRACT       = hex2dec('0x6D')   --The number pad '-' key.
keycode.VK_DECIMAL        = hex2dec('0x6E')   --The number pad '.' key.
keycode.VK_DIVIDE         = hex2dec('0x6F')   --The number pad '/' key.
keycode.VK_F1             = hex2dec('0x70')   --The F1 key.
keycode.VK_F2             = hex2dec('0x71')   --The F2 key.
keycode.VK_F3             = hex2dec('0x72')   --The F3 key.
keycode.VK_F4             = hex2dec('0x73')   --The F4 key.
keycode.VK_F5             = hex2dec('0x74')   --The F5 key.
keycode.VK_F6             = hex2dec('0x75')   --The F6 key.
keycode.VK_F7             = hex2dec('0x76')   --The F7 key.
keycode.VK_F8             = hex2dec('0x77')   --The F8 key.
keycode.VK_F9             = hex2dec('0x78')   --The F9 key.
keycode.VK_F10            = hex2dec('0x79')   --The F10 key.
keycode.VK_F11            = hex2dec('0x7A')   --The F11 key.
keycode.VK_F12            = hex2dec('0x7B')   --The F12 key.
keycode.VK_F13            = hex2dec('0x7C')   --The F13 key.
keycode.VK_F14            = hex2dec('0x7D')   --The F14 key.
keycode.VK_F15            = hex2dec('0x7E')   --The F15 key.

--Other miscellaneous keyboard keys.
keycode.VK_SEMICOLON      = hex2dec('0xBA')   --The ';' key.             --Appears on US keyboards only.
keycode.VK_EQUALS         = hex2dec('0xBB')   --The '=' key.
keycode.VK_COMMA          = hex2dec('0xBC')   --The ',' key.
keycode.VK_MAIN_MINUS     = hex2dec('0xBD')   --The non-numpad '-' key.
keycode.VK_PERIOD         = hex2dec('0xBE')   --The non-numpad '.' key.
keycode.VK_FORWARD_SLASH  = hex2dec('0xBF')   --The non-numpad '/' key.  --Appears on US keyboards only.
keycode.VK_BACKWARD_SLASH = hex2dec('0xDC')   --The '\' key.             --Appears on US keyboards only.
keycode.VK_ACCENT         = hex2dec('0xC0')   --The '`' key.             --Appears on US keyboards only.
keycode.VK_OPEN_BRACKET   = hex2dec('0xDB')   --The '[' key.             --Appears on US keyboards only.
keycode.VK_CLOSE_BRACKET  = hex2dec('0xDD')   --The ']' key.             --Appears on US keyboards only.
keycode.VK_SINGLE_QUOTE   = hex2dec('0xDE')   --The ''' key.             --Appears on US keyboards only.

--IME (input method editor) keys, used for typing in Asian symbolic characters
keycode.VK_KANA           = hex2dec('0x15')   --IME Kana mode            --Generally appears on Asian keyboards only.
keycode.VK_HANGUL         = hex2dec('0x15')   --IME Hangul mode          --Generally appears on Asian keyboards only.
keycode.VK_JUNJA          = hex2dec('0x17')   --IME Junja mode           --Generally appears on Asian keyboards only.
keycode.VK_FINAL          = hex2dec('0x18')   --IME final mode           --Generally appears on Asian keyboards only.
keycode.VK_HANJA          = hex2dec('0x19')   --IME Hanja mode           --Generally appears on Asian keyboards only.
keycode.VK_KANJI          = hex2dec('0x19')   --IME Kanji mode           --Generally appears on Asian keyboards only.
keycode.VK_CONVERT        = hex2dec('0x1C')   --IME convert              --Generally appears on Asian keyboards only.
keycode.VK_NONCONVERT     = hex2dec('0x1D')   --IME nonconvert           --Generally appears on Asian keyboards only.
keycode.VK_ACCEPT         = hex2dec('0x1E')   --IME accept               --Generally appears on Asian keyboards only.
keycode.VK_MODECHANGE     = hex2dec('0x1F')   --IME mode change request  --Generally appears on Asian keyboards only.


--
-- drive keymap
--
-- This lists all the keys that can be used for the automata drive_commands at the top of the file.
-- NOTE: DEPRECATED!  These are currently contained in the PlayerDrive accelerator table.
-- 
drive_keymap = {}

   --~ drive_keymap[drive_command.ACCELERATE] = {   keycode.VK_UP,    keycode.VK_W,  keycode.VK_NUMPAD8   }
   --~ drive_keymap[drive_command.BRAKE]      = {   keycode.VK_DOWN,  keycode.VK_S,  keycode.VK_NUMPAD2   }
   --~ drive_keymap[drive_command.TURN_LEFT]  = {   keycode.VK_LEFT,  keycode.VK_A,  keycode.VK_NUMPAD4   }
   --~ drive_keymap[drive_command.TURN_RIGHT] = {   keycode.VK_RIGHT, keycode.VK_D,  keycode.VK_NUMPAD6   }
   --~ drive_keymap[drive_command.OFF_ROAD]   = {   keycode.VK_SHIFT                                      }
   --~ drive_keymap[drive_command.CLIMB]      = {   keycode.VK_HOME,  keycode.VK_E,  keycode.VK_NUMPAD9   }
   --~ drive_keymap[drive_command.DIVE]       = {   keycode.VK_END,   keycode.VK_C,  keycode.VK_NUMPAD3   }
   --~ drive_keymap[drive_command.SPECIAL]    = {   keycode.VK_SPACE                                      }
   --~ drive_keymap[drive_command.AIM]        = {   }  -- uses mouse buttons, not key
   --~ drive_keymap[drive_command.ALTERNATE]  = {   keycode.VK_RETURN                                     }
   --~ --drive_keymap[drive_command.LAND]     = {   keycode.VK_HOME                                       }--toggle = true
   --~ drive_keymap[drive_command.POWERUP]    = {   keycode.VK_PERIOD                                     }
   --~ drive_keymap[drive_command.POWERDOWN]  = {   keycode.VK_COMMA                                      }

end -- sentry
