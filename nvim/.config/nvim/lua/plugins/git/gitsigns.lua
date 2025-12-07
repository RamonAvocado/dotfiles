-- Adds git related signs to the gutter, as well as utilities for managing changes
-- return {
--   "gitsigns.nvim",
--   opts = function()
--     Snacks.toggle({
--       name = "Git Signs",
--       get = function()
--         return require("gitsigns.config").config.signcolumn
--       end,
--       set = function(state)
--         require("gitsigns").toggle_signs(state)
--       end,
--     }):map("<leader>uG")
--   end,
-- }
return {
  {
    'lewis6991/gitsigns.nvim',
    -- event = 'LazyFile',
    opts = {
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
        untracked = { text = '▎' },
      },
      signs_staged = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
      },
      on_attach = function(buffer)
        require('config.keymaps.git.gitsigns').setup(buffer)
      end,
    },
  },
}
