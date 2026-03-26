return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = require 'config.keymaps.conform',
  opts = {
    notify_on_error = true,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_format' },
      bash = { 'shellharden' },
      markdown = { 'prettierd' },
      json = { 'prettierd' },
      yaml = { 'prettierd' },
      html = { 'prettierd' },
      javascript = { 'prettierd' },
    },
  },
}
