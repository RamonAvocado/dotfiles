-- FILE TREE
return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {}
    require('config.keymaps.neo-tree').setup()
  end,
}

-- return {
--   'akinsho/toggleterm.nvim',
--   version = '*',
--   opts = {
--     persist_size = false,
--     size = function(term)
--       if term.direction == 'horizontal' then
--         return 12 -- lines
--       elseif term.direction == 'vertical' then
--         return math.floor(vim.o.columns * 0.35) -- 40% of screen width
--       elseif term.direction == 'float' then
--         return 20 -- ignored for float (kept for completeness)
--       end
--     end,
--     shade_terminals = true,
--     start_in_insert = true,
--   },
--   config = function(_, opts)
--     require('toggleterm').setup(opts)
--     require('config.keymaps.toggleterm').setup()
--   end,
-- }
