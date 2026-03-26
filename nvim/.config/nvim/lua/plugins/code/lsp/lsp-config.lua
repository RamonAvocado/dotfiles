return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- TODO: SEARCH IF I CAN REQUIRE FROM ANOTHER FILE INSTEAD OF JUST REFERING TO GITHUB
    { 'j-hui/fidget.nvim', opts = {} },
    'saghen/blink.cmp',
  },
  config = function()
    require('config.autocmd.lsp-config').lsp_attach()
    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    }
    local original_capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = require('blink.cmp').get_lsp_capabilities(original_capabilities)

    -- NOTE: REMEMBER TO ADD HERE THE SERVER TO
    local servers = {
      -- Lua
      lua_ls = {
        -- cmd = { ... },
        -- filetypes = { ... },
        -- capabilities = {},
        -- settings = {
        --   Lua = {
        --     completion = {
        --       callSnippet = 'Replace',
        --     },
        --     -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        --     -- diagnostics = { disable = { 'missing-fields' } },
        --   },
        -- },
      },

      -- Python
      pyright = {},
      ruff = {},

      -- Bash
      bashls = {},

      -- Docker
      dockerls = {},
      docker_compose_language_service = {},

      -- html
      html = {},
      htmx = {},

      -- JavaScript
      ts_ls = {},
      oxlint = {},
    }
    -- `mason` had to be setup earlier: to configure its options see the
    -- `dependencies` table for `nvim-lspconfig` above.
    --
    -- You can add other tools here that you want Mason to install
    -- for you, so that they are available from within Neovim.

    require('mason-lspconfig').setup {
      ensure_installed = {},
      automatic_installation = false,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for ts_ls)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}

-- -- LSP servers and clients are able to communicate to each other what features they support.
-- --  By default, Neovim doesn't support everything that is in the LSP specification.
-- --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
-- --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
-- local capabilities = require('blink.cmp').get_lsp_capabilities()
