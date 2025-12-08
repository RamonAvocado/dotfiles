local M = {}

function M.setup() end
-- See `:help telescope.builtin`
local builtin = require 'telescope.builtin'
local map = vim.keymap.set
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>snv', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eo[V]im files' })

--
-- local function smart_files()
-- local ok = pcall(builtin.git_files, { show_untracked = true })
-- if not ok then builtin.find_files() end
-- end
--
--
-- -- Core
-- vim.keymap.set('n', '<leader>ff', smart_files, { desc = 'Telescope: Find files (smart)' })
-- map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope: Live grep' })
-- map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: Buffers' })
-- map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope: Help tags' })
-- map('n', '<leader>fr', builtin.resume, { desc = 'Telescope: Resume' })
-- map('n', '<leader>fo', builtin.oldfiles, { desc = 'Telescope: Old files' })
-- map('n', '<leader>fc', builtin.commands, { desc = 'Telescope: Commands' })
-- map('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope: Keymaps' })
--
--
-- -- Git
-- map('n', '<leader>gs', builtin.git_status, { desc = 'Telescope: Git status' })
-- map('n', '<leader>gc', builtin.git_commits, { desc = 'Telescope: Git commits' })
-- map('n', '<leader>gb', builtin.git_branches, { desc = 'Telescope: Git branches' })
--
--
-- -- LSP
-- map('n', '<leader>ld', builtin.lsp_definitions, { desc = 'Telescope (LSP): Definitions' })
-- map('n', '<leader>lr', builtin.lsp_references, { desc = 'Telescope (LSP): References' })
-- map('n', '<leader>li', builtin.lsp_implementations, { desc = 'Telescope (LSP): Implementations' })
-- map('n', '<leader>ls', builtin.lsp_document_symbols, { desc = 'Telescope (LSP): Document symbols' })
-- map('n', '<leader>lS', builtin.lsp_workspace_symbols, { desc = 'Telescope (LSP): Workspace symbols' })
-- map('n', '<leader>le', builtin.diagnostics, { desc = 'Telescope (LSP): Diagnostics (workspace)' })

return M
