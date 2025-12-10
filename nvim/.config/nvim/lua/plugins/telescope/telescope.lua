return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      -- pickers = {}
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- local ok = pcall(require('telescope.builtin').git_files, { show_untracked = true })
    -- if not ok then
    --   require('telescope.builtin').find_files()
    -- end

    require('config.keymaps.telescope').setup()
  end,
}

-- {
-- 'nvim-telescope/telescope.nvim',
-- branch = '0.1.x',
-- dependencies = { 'nvim-lua/plenary.nvim' },
-- config = function()
-- local telescope = require('telescope')
-- local builtin = require('telescope.builtin')
--
--
-- telescope.setup {
-- defaults = {
-- mappings = {
-- i = {
-- ["<C-j>"] = "move_selection_next",
-- ["<C-k>"] = "move_selection_previous",
-- },
-- },
-- },
-- }
--
--
-- local map = vim.keymap.set
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
-- end,
-- }
