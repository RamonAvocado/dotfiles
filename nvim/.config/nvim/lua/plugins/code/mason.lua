return {
  {
    'mason-org/mason.nvim',
    cmd = 'Mason',
    build = ':MasonUpdate',
    opts = {},
  },
  {
    'mason-org/mason-lspconfig.nvim', -- Instalation in mason-tool-installer
    dependencies = { 'mason-org/mason.nvim' },
    opts = {
      ensure_installed = {},
      automatic_installation = false,
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'mason-org/mason.nvim' },
    config = function()
      require('mason-tool-installer').setup {
        ensure_installed = {
          -- Lua
          'lua-language-server', -- LSP
          'stylua', --FORMATTER

          -- Python
          'pyright', -- LSP
          'ruff', -- LINTER and FORMATTER

          -- Bash
          'bashls', -- LSP
          'shellharden', -- LINTER and FORMATTER

          -- Markdown, Json, Yaml
          'prettierd', -- FORMATTER

          -- Docker
          'docker_compose_language_service', -- LSP Docker Compose
          'dockerls', -- LSP Dockerfile
          'hadolint', -- LINTER

          -- HTML
          'html-lsp',
          'htmx-lsp',
          'htmlhint',
        },
      }
    end,
  },
}
