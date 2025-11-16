-- Smart toggle/focus for Neo-tree
local function toggle_neotree()
  local manager = require 'neo-tree.sources.manager'
  local state = manager.get_state 'filesystem'
  local tree_win = state and state.winid
  local cur_win = vim.api.nvim_get_current_win()

  if tree_win and vim.api.nvim_win_is_valid(tree_win) then
    if cur_win == tree_win then
      -- If you're already in the Neo-tree window → close it
      require('neo-tree.command').execute { action = 'close' }
    else
      -- If Neo-tree is open but you're elsewhere → focus it
      vim.api.nvim_set_current_win(tree_win)
    end
  else
    -- If Neo-tree isn't open → open it
    require('neo-tree.command').execute { action = 'show' }
  end
end

local M = {}

function M.setup()
  vim.keymap.set('n', '<leader>e', toggle_neotree, { desc = 'Toggle file explorer' })
end

return M
