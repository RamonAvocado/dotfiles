return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional but recommended for icons
	keys = {
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
	},
	opts = function()
		-- Framework-free icons (adjust to taste)
		local diag_icons = {
			Error = " ",
			Warn = " ",
			Info = " ",
			Hint = " ",
		}

		-- Safe buffer delete helper (no Snacks)
		local function bufdelete(bufnr)
			bufnr = bufnr or 0
			-- If modified, don't force-delete; show message instead
			if vim.bo[bufnr].modified then
				vim.notify("Buffer has unsaved changes", vim.log.levels.WARN)
				return
			end
			pcall(vim.api.nvim_buf_delete, bufnr, { force = false })
		end

		return {
			options = {
				close_command = function(n) bufdelete(n) end,
				right_mouse_command = function(n) bufdelete(n) end,

				diagnostics = "nvim_lsp",
				always_show_bufferline = false,

				diagnostics_indicator = function(_, _, diag)
					local ret = ""
					if diag.error and diag.error > 0 then
						ret = ret .. diag_icons.Error .. diag.error .. " "
					end
					if diag.warning and diag.warning > 0 then
						ret = ret .. diag_icons.Warn .. diag.warning
					end
					return vim.trim(ret)
				end,

				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
					-- keep this offset if you use any layout/split plugin that sets this filetype
					{ filetype = "snacks_layout_box" },
				},

				-- Framework-free filetype icons:
				-- Prefer devicons if installed; fallback to nothing.
				get_element_icon = function(el)
					local ok, devicons = pcall(require, "nvim-web-devicons")
					if ok then
						local icon, hl = devicons.get_icon_by_filetype(el.filetype,
							{ default = true })
						return icon, hl
					end
					return nil
				end,
			},
		}
	end,
	config = function(_, opts)
		local ok, bufferline = pcall(require, "bufferline")
		if not ok then
			vim.notify("bufferline.nvim not found", vim.log.levels.ERROR)
			return
		end

		bufferline.setup(opts)

		-- Fix bufferline when restoring a session / when buffers change
		local group = vim.api.nvim_create_augroup("BufferlineRefresh", { clear = true })
		vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
			group = group,
			callback = function()
				vim.schedule(function()
					-- bufferline will redraw on its own, but this avoids edge cases after session load
					pcall(vim.cmd, "redrawtabline")
				end)
			end,
		})
	end,
}
