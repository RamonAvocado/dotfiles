return {
  'sindrets/diffview.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    require('config.keymaps.diffview').setup()
  end,
}
