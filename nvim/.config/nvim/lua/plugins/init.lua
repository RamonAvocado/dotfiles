return {

  -- Detect tabstop and shiftwidth automatically
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  require 'plugins.harpoon',
  require 'plugins.which-key',
  require 'plugins.telescope',
  -- Highlight todo, notes, etc in comments
  require 'plugins.toggleterm',

  require 'plugins.treesitter.treesitter',
  require 'plugins.neo-tree',

  -- LSP --
  -- Specific plugin for Plugin development
  require 'plugins.lsp.lazydev',
  require 'plugins.lsp.lsp-config',

  require 'plugins.conform',
  require 'plugins.blink',
  require 'plugins.snacks',

  -- Automatically adjust the indent size to much the same as the file
  require 'plugins.indent-line',

  -- A combination of small plugins for various things keybind related
  require 'plugins.util.mini-vim',
  -- Automatically adds the other pair, for example (, [, ", {
  require 'plugins.util.autopairs',
  -- Colors the TODO FIXME comments
  require 'plugins.util.todo-comments',
  require 'plugins.util.trouble',

  -- GIT
  -- require 'plugins.git.diffview', -- With super + gc open the merge screen
  -- GIT SIGNS HAS SOMETHING ABOUT DIFF TOO, WHEN THE PROBLEM OCURR COMPARE DIFFVIEW AND GITSIGN
  require 'plugins.git.gitsigns',
  require 'plugins.git.neogit',

  -- #####COLORSCHEME##### --
  require 'colorscheme.tokyonight',
}

--
-- require 'kickstart.plugins.debug',
-- require 'kickstart.plugins.lint',
-- require 'kickstart.plugins.neo-tree',
