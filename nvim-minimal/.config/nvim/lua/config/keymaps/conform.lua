return {
	{
		'<leader>ff',
		function()
			require('conform').format { async = true, lsp_format = 'fallback' }
		end,
		mode = '',
		desc = '[F]ormat buffer',
	}
}
