local M = {}
function M.setup()
  local keys = {
    {
      '<leader>H',
      function()
        require('harpoon'):list():add()
      end,
      desc = 'Harpoon File',
    },
    {
      '<leader>h',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = 'Harpoon Quick Menu',
    },
  }

  for i = 1, 9 do
    table.insert(keys, {
      '<leader>' .. i,
      function()
        require('harpoon'):list():select(i)
      end,
      desc = 'which_key_ignore',
    })
  end

  for i = 1, 9 do
    table.insert(keys, {
      '<leader>H' .. i,
      function()
        local list = require('harpoon'):list()

        -- build a proper HarpoonListItem for the *current* buffer
        local item = list.config.create_list_item(list.config)

        -- override this slot
        list.items[i] = item

        -- keep length in sync so :select(i) works
        if i > list._length then
          list._length = i
        end
      end,
      desc = 'which_key_ignore',
      -- desc = 'a',
    })
  end
  return keys
end

return M
