-- A TERMINAL INSIDE NEOVIM

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    direction = 'horizontal', -- or 'vertical' / 'float'
    size = 12,
    shade_terminals = true,
    start_in_insert = true,
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)
    require('config.keymaps.toggleterm').setup()
  end,
}
