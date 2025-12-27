--[[

WARNING: TMUX
TODO: FINISH SETTING UP VIM MOTIONS INSIDE THE TERMINAL OF TMUX
TODO: DONT NEED TO CONFIRM WHEN CLOSING A PANEL

WARNING: NVIM
TODO: SOLVE THE MINI.NVIM PROBLEM WITH LAZY NOT DETECTING
TODO: REMOVE ALL EDGY DEPENDENCIES
TODO: ADD A COOL STATUS BAR
TODO: ENABLE OPENING AND CLOSING OF FOLDERS WITH HL IN THE FILE EXPLORER

NOTE: KEEP SEEING THE TMUX PLUGINS
NOTE: KEEP COMPARING WITH THE OFICIAL LAZYVIM CONFIG

KNOW HOW TO USE THE AUTOFORMATTER AND THE AUTOCOMPLETER
ADD FLASH FOR BETTER f function

IMPROVE UI

THINK FOR OTHER TERMINAL, MORE MODERN ALTERNATIVES-
  MAYBE EDGY-NVIM IS GOOD
  OR MAYBE WITH SNACKS I CAN USE THAT
  SNACKS HAS OTHER FILE EXPLORER FROM FOKE



'stevearc/conform.nvim', - AUTOFORMATO
'saghen/blink.cmp', - AUTOCOMPLETADO

'nvim-treesitter/nvim-treesitter', - TREESITTER
--]]

require 'config.keymaps'
require 'config.options'
require 'config.autocmd'

-- [[ Install `lazy.nvim` plugin manager ]]
-- Open the plugin manager [:Lazy]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup('plugins', { -- PLUGIN MANAGER
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
