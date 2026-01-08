-- WARNING: TMUX
-- TODO: FINISH SETTING UP VIM MOTIONS INSIDE THE TERMINAL OF TMUX
--
-- WARNING: NVIM
-- TODO: SURROUND WORKS BUT I WANT TO REMOVE KEYBINDS
--
--
-- NOTE: KEEP SEEING THE TMUX PLUGINS
-- NOTE: KEEP COMPARING WITH THE OFICIAL LAZYVIM CONFIG
--
-- FIXME: MAKE THE FILE TREE NOT DISAPPER THE GITIGNORE FOLDERS
-- NOTE: COMPARE nvim-cmp WITH blink.cmp
-- TODO: SEARCH WHAT THINGS IT ADD blink.cmp to LSP.config
-- TODO: ADD PYTHON SNIPPETS

require 'config.keymaps'
require 'config.options'
require 'config.autocmd'


-- [[ Install `lazy.nvim` plugin manager (:Lazy)]]
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
