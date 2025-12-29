return {
	{
		"<leader>gd",
		function()
			require("lazydocker").open()
		end,
		desc = "[G]oto Lazy[D]ocker",
	},
}
