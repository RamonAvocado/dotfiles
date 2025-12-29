return {

	-- Detect tabstop and shiftwidth automatically
	'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

	-- TODO: FOR NOW I DONT HAVE EDGY ENABLED
	-- require 'plugins.edgy',

	require 'plugins.harpoon',
	-- Pop up that tells which key combinations is needed to do something
	require 'plugins.which-key',

	-- TELESCOPE Tool for searching everything
	require 'plugins.telescope.telescope',

	require 'plugins.treesitter.treesitter',

	-- TODO: TMUX
	require 'plugins.tmux',

	-- LOT OF QOL
	require 'plugins.snacks.snacks',

	-- LSP --
	-- Specific plugin for Plugin development
	require 'plugins.lsp.lazydev',
	require 'plugins.lsp.lsp-config',

	-- LINTING
	require 'plugins.linter.conform',
	require 'plugins.linter.blink',

	-- Automatically adjust the indent size to much the same as the file
	-- require 'plugins.indent-line',
	-- PERF: MINI-NVIM ECOSYSTEM
	require 'plugins.mini',

	-- UTIL
	-- A combination of small plugins for various things keybind related
	-- require 'plugins.util.mini-vim',
	-- Automatically adds the other pair, for example (, [, ", {
	-- Colors the TODO FIXME comments
	require 'plugins.util.todo-comments',
	-- SUPERTAB
	-- require 'plugins.util.nvim-cmp',

	-- FIXME: STILL QUITE NOT CONVINCED
	require 'plugins.util.trouble',

	-- UI
	require "plugins.ui.bufferline",
	-- require "plugins.ui.lualine",
	require 'plugins.ui.noice',

	-- GIT --
	-- require 'plugins.git.diffview', -- With super + gc open the merge screen
	-- GIT SIGNS HAS SOMETHING ABOUT DIFF TOO, WHEN THE PROBLEM OCURR COMPARE DIFFVIEW AND GITSIGN
	require 'plugins.git.gitsigns',
	require 'plugins.git.neogit',

	-- DOCKER --
	require "plugins.docker.lazy-docker",


	-- #####COLORSCHEME##### --
	require 'colorscheme.tokyonight',
	-- require 'colorscheme.catppuchin',

	require 'plugins.python.venv-selector',
}

--
-- require 'kickstart.plugins.debug',
-- require 'kickstart.plugins.lint',
