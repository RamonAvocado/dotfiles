return {
  -- LSP --
  -- Specific plugin for Plugin development
  require 'plugins.code.mason',
  require 'plugins.code.lsp.lsp-config',
  require 'plugins.code.lsp.lazydev',

  require 'plugins.code.linter.lint',

  require 'plugins.code.formatter.conform',

  require 'plugins.code.completion.blink',
  -- require 'plugins.code.completion.nvim-cmp',

  require 'plugins.code.treesitter.treesitter',
  -- require 'plugins.code.treesitter.treesitter-new',
}
