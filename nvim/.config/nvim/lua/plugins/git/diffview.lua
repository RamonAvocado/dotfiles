return {
  'sindrets/diffview.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    require('config.keymaps.git.diffview').setup()
  end,
}
