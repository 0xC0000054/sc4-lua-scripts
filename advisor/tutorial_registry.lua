
--************************************************************************************
---------------------------------------------------------------------
-- This files describes tutorials in SC4
--------------------------------------------------------------------------------
-- Tutorial registry 
--

-- Main tutorial table
tutorial_registry = 
{
   default_regions = {},
   tutorials = {},

   add_tutorial  = 
      function (self, _guid, _order, _region_dir)
         self.tutorials[_guid] = 
         {
            order = _order, 
            region_dir = _region_dir,
            task_first = 0,
            task_count = 0,
            task_guid = _guid,

            set_task_range = 
               function (self, _task_first, _task_count)
                  self.task_first = _task_first
                  self.task_count = _task_count
               end
         }
      end,
   
   add_default_region   = 
      function (self, _exp_pack_id, _region_dir)
         self.default_regions[_exp_pack_id] = 
         {
            region_dir = _region_dir
         }
      end,

   set_task_range_and_print_info = 
      function (self, tutorial_guid, task_first, task_count)
         local tutorial= self.tutorials[hex2dec(tutorial_guid)]
         local info = 'Tutorial "'..tutorial_guid..'" : '..tostring(task_count)..' steps.'
         if (tutorial) then 
            tutorial : set_task_range(task_first, task_count)
         else 
            info = info .. ' - Not registerd.'
         end
         print(info)
      end
}

function hex2dec(hex_string)
   return tonumber(hex_string, 16)
end

--************************************************************************************
--------------------------------------------------------------------------------------
-- Register default region for the main build
--

tutorial_registry:add_default_region(0, 'timbuktu')
tutorial_registry:add_default_region(1, 'timbuktu')

--------------------------------------------------------------------------------------
-- Register tutorials for the main build
--

--old Mayor Tutorial
--tutorial_registry : add_tutorial(h2n('8a5b7a6c'), 0, 'maxisland')
   
--Getting Started
tutorial_registry : add_tutorial(hex2dec('abfad020'), 0, 'timbuktu')
   
--Terraforming
tutorial_registry : add_tutorial(hex2dec('ea5d6dc8'), 1, 'timbuktu')

--Making Money
tutorial_registry : add_tutorial(hex2dec('0bfdb71b'), 2, 'timbuktu')

--Big City
tutorial_registry : add_tutorial(hex2dec('cc02d3a3'), 3, 'timbuktu')

--What's New
tutorial_registry : add_tutorial(hex2dec('2c12d0e9'), 4, 'timbuktu')