local map = vim.keymap.set
local M = {}

function M.setup()
	map('n', '<leader>e', function() require("snacks").explorer() end, { desc = 'Open file explorer' })
end

return M
