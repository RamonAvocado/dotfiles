local M = {
  {
    '<leader>tt',
    function()
      -- Snacks.terminal()
      require('snacks').terminal()
    end,
    desc = 'Toggle Terminal',
  },
  -- {
  --   '<leader>tf',
  --   function()
  --     require('snacks').terminal { float = true }
  --   end,
  --   desc = 'Terminal: Float',
  -- },
}

function M.setup()
  vim.keymap.set('t', '<C-q>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
end

return M
