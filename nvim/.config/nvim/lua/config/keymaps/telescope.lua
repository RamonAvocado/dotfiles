local M = {}

function M.setup() end

local builtin = require 'telescope.builtin' -- See `:help telescope.builtin`
local map = vim.keymap.set

local search_literal = function()
  builtin.live_grep {
    additional_args = function()
      return { '--fixed-strings' }
    end,
    prompt_title = 'Search (literal)',
  }
end

local search_neovim_config = function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end

local search_grep_file = function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 15,
    previewer = false,
  })
end

-- WARNING: HELP STUFF
-- FOR SEARCHING DOCUMENTATION
map('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' }) -- SEARCHING FOR KEYMAPS A GOOD WAY TO KNOW WHICH COMMANDS ARE ACTIVE
map('n', '<leader>snv', search_neovim_config, { desc = '[S]earch [N]eo[V]im files' })
map('n', '<leader>sst', builtin.builtin, { desc = '[S]earch [S]elect [T]elescope' }) -- TO SEARCH ALL THE TELESCOPE FUNCTIONALITIES

map('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>s<leader>', search_literal, { desc = '[S]earch text' })
map('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>sp', builtin.resume, { desc = '[S]earch [P]revious' })

-- TODO: Maybe only search in the harpoon files
map('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

-- SEARCH THINGS IN THE CURRENT BUFFERS
map('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

-- WARNING: FILES STUFF
-- FIND FILES IN THE PROYECT
-- TODO: CHANGE THIS TO ONLY SEARCH IN THE CURRENT GIT PROYECT
map('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>/', search_grep_file, { desc = '[/] Fuzzily search in current file' })

-- WARNING: GIT STUFF
map('n', '<leader>sGs', builtin.git_status, { desc = 'Telescope: [G]it status' })
map('n', '<leader>sGS', builtin.git_stash, { desc = 'Telescope: [G]it stash' })
map('n', '<leader>sGc', builtin.git_commits, { desc = 'Telescope: [G]it commits' })
map('n', '<leader>sGb', builtin.git_branches, { desc = 'Telescope: [G]it branches' })

--
-- local function smart_files()
-- local ok = pcall(builtin.git_files, { show_untracked = true })
-- if not ok then builtin.find_files() end
-- end
--
--
-- -- Core
-- map('n', '<leader>ff', smart_files, { desc = 'Telescope: Find files (smart)' })
-- map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope: Live grep' })
-- map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: Buffers' })
-- map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope: Help tags' })
-- map('n', '<leader>fr', builtin.resume, { desc = 'Telescope: Resume' })
-- map('n', '<leader>fo', builtin.oldfiles, { desc = 'Telescope: Old files' })
-- map('n', '<leader>fc', builtin.commands, { desc = 'Telescope: Commands' })
-- map('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope: Keymaps' })
--
-- -- LSP
-- map('n', '<leader>ld', builtin.lsp_definitions, { desc = 'Telescope (LSP): Definitions' })
-- map('n', '<leader>lr', builtin.lsp_references, { desc = 'Telescope (LSP): References' })
-- map('n', '<leader>li', builtin.lsp_implementations, { desc = 'Telescope (LSP): Implementations' })
-- map('n', '<leader>ls', builtin.lsp_document_symbols, { desc = 'Telescope (LSP): Document symbols' })
-- map('n', '<leader>lS', builtin.lsp_workspace_symbols, { desc = 'Telescope (LSP): Workspace symbols' })
-- map('n', '<leader>le', builtin.diagnostics, { desc = 'Telescope (LSP): Diagnostics (workspace)' })

return M
