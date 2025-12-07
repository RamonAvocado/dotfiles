--[[
--
FIXME: LISTA DE PLUGINS QUE VIENEN INSTALADOS CON KICKSTART

lazy.nvim 
'lewis6991/gitsigns.nvim', - COSAS DE GIT
'folke/which-key.nvim', - VER LAS POSIBLES COMBINACIONES DE TECLAS QUE TIENES
'nvim-telescope/telescope.nvim', - VIM TELESCOPE CREO QUE ES PARA BUSCAR ARCHIVOS Y DE TODO
NOTE: COSAS DEL LSP

'folke/lazydev.nvim',
'neovim/nvim-lspconfig',

'stevearc/conform.nvim', - AUTOFORMATO
'saghen/blink.cmp', - AUTOCOMPLETADO

'folke/tokyonight.nvim', - COLOR GUAPO
'folke/todo-comments.nvim', - COMENTARIOS CON COLORES
'echasnovski/mini.nvim', - COLECCION DE ALGUNOS PLUGINS PEQUEÑITOS
'nvim-treesitter/nvim-treesitter', - TREESITTER

FIXME: LISTA DE PLUGINS QUE VIENEN INSTALADOS CON KICKSTART

--]]
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)

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
require('lazy').setup({ -- PLUGIN MANAGER
  require 'plugins.init',
}, {
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

-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
--    This is the easiest way to modularize your config.
--
--  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
-- { import = 'custom.plugins' },

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
