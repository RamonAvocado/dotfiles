local M = {
  {
    '<leader>tt',
    function()
      -- Snacks.terminal()
      require('snacks').terminal()
    end,
    desc = 'Toggle Terminal',
  },
}

function M.setup()
  vim.keymap.set('t', '<C-q>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
end

return M
