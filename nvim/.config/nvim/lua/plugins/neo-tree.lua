-- FILE TREE
return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  config = function()
    require('neo-tree').setup {
      filesystem = {
        filtered_items = {
          visible = true, -- Permite alternar visibilidad con I
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    }
    require('config.keymaps.neo-tree').setup()
  end,
}

-- opts = {
-- filesystem = { -- EXISTS FILESYSTEM, BUFFERS, GIT_STATUS
-- window = {
-- mappings = { ['\\'] = 'close_window',
-- },
-- },
-- },
-- },
--
-- https://github.com/saifulapm/neotree-file-nesting-config/tree/main MAYBE ADD THIS
