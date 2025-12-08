return {

  -- Detect tabstop and shiftwidth automatically
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  require 'plugins.harpoon',
  -- Pop up that tells which key combinations is needed to do something
  require 'plugins.which-key',

  -- TELESCOPE Tool for searching everything
  require 'plugins.telescope.telescope',
  -- Highlight todo, notes, etc in comments
  require 'plugins.toggleterm',

  require 'plugins.treesitter.treesitter',

  --FILE EXPLORER
  require 'plugins.neo-tree',
  require 'plugins.snacks',

  -- LSP --
  -- Specific plugin for Plugin development
  require 'plugins.lsp.lazydev',
  require 'plugins.lsp.lsp-config',

  require 'plugins.conform',
  require 'plugins.blink',

  -- Automatically adjust the indent size to much the same as the file
  require 'plugins.indent-line',

  -- UTIL
  -- A combination of small plugins for various things keybind related
  require 'plugins.util.mini-vim',
  -- Automatically adds the other pair, for example (, [, ", {
  require 'plugins.util.autopairs',
  -- Colors the TODO FIXME comments
  require 'plugins.util.todo-comments',
  require 'plugins.util.trouble',

  -- UI
  require 'plugins.ui.noice',

  -- GIT
  -- require 'plugins.git.diffview', -- With super + gc open the merge screen
  -- GIT SIGNS HAS SOMETHING ABOUT DIFF TOO, WHEN THE PROBLEM OCURR COMPARE DIFFVIEW AND GITSIGN
  require 'plugins.git.gitsigns',
  require 'plugins.git.neogit',

  -- #####COLORSCHEME##### --
  -- require 'colorscheme.tokyonight',
  require 'colorscheme.catppuchin',
}

--
-- require 'kickstart.plugins.debug',
-- require 'kickstart.plugins.lint',
-- require 'kickstart.plugins.neo-tree',
