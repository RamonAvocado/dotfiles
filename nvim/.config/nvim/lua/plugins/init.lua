return {

	-- Detect tabstop and shiftwidth automatically
	-- 'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

	require 'plugins.harpoon',
	--
	-- Pop up that tells which key combinations is needed to do something
	require 'plugins.which-key',

	-- TELESCOPE Tool for searching everything
	require 'plugins.telescope.telescope',

	-- TODO: TMUX
	require 'plugins.tmux',

	-- QOL
	require 'plugins.snacks.snacks',

	require "plugins.code",

	-- Automatically adjust the indent size to much the same as the file
	-- require 'plugins.indent-line',
	-- PERF: MINI-NVIM ECOSYSTEM
	require 'plugins.mini',

	-- UTIL
	-- Automatically adds the other pair, for example (, [, ", {
	-- Colors the TODO FIXME comments
	require 'plugins.util.todo-comments',
	-- FIXME: STILL QUITE NOT CONVINCED
	require 'plugins.util.trouble',

	-- UI
	require "plugins.ui.bufferline",
	-- require "plugins.ui.lualine",
	require 'plugins.ui.noice',

	-- GIT --
	require 'plugins.git',

	-- DOCKER --
	require "plugins.docker.lazy-docker",


	-- #####COLORSCHEME##### --
	-- require 'colorscheme.tokyonight',
	require 'colorscheme.catppuchin',

	require 'plugins.python.venv-selector',
}

--
-- require 'kickstart.plugins.debug',
-- require 'kickstart.plugins.lint',
