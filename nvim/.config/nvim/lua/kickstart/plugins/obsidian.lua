return {
  'epwalsh/obsidian.nvim',
  version = '*',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    workspaces = {
      { name = 'second-brain', path = '~/Obsidian' }, -- set your vault path
    },
    daily_notes = { folder = 'daily' },
    completion = { nvim_cmp = true },
    picker = { name = 'telescope.nvim' },
    ui = { enable = true },
  },
}
