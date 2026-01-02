local M = {}

function M.setup()
	return {
		{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle Pin" },
		{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
		{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete Buffers to the Right" },
		{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete Buffers to the Left" },

		{ "<S-h>",      "<Cmd>BufferLineCyclePrev<CR>",            desc = "Prev Buffer" },
		{ "<S-l>",      "<Cmd>BufferLineCycleNext<CR>",            desc = "Next Buffer" },
		{ "[b",         "<Cmd>BufferLineCyclePrev<CR>",            desc = "Prev Buffer" },
		{ "]b",         "<Cmd>BufferLineCycleNext<CR>",            desc = "Next Buffer" },

		{ "[B",         "<Cmd>BufferLineMovePrev<CR>",             desc = "Move buffer prev" },
		{ "]B",         "<Cmd>BufferLineMoveNext<CR>",             desc = "Move buffer next" },
		{
			"<leader>bd",
			function()
				require("snacks").bufdelete()
			end,
			desc = "Delete Buffer"
		},
		{
			"<leader>bo",
			function()
				require("snacks").bufdelete.other()
			end,
			desc = "Delete Other Buffers"
		},
		{ "<leader>bD", "<cmd>:bd<cr>", desc = "Delete Buffer and Window" },
	}
end

return M
