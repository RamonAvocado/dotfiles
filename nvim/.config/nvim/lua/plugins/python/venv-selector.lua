-- This function gets called by the plugin when a new result from fd is received
-- You can change the filename displayed here to what you like.
-- Here in the example for linux/mac we replace the home directory with '~' and remove the /bin/python part.
local function shorter_name(filename)
  return filename:gsub(os.getenv 'HOME', '~'):gsub('/bin/python', '')
end

return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } }, -- optional: you can also use fzf-lua, snacks, mini-pick instead.
  },
  ft = 'python', -- Load when opening Python files
  keys = {
    { ',v', '<cmd>VenvSelect<cr>' }, -- Open picker on keymap
  },
  opts = {
    options = {
      -- If you put the callback here as a global option, its used for all searches (including the default ones by the plugin)
      on_telescope_result_callback = shorter_name,
    },
    search = {
      my_venvs = {
        command = 'fd python$ ~/repos/', -- Sample command, need to be changed for your own venvs
        -- If you put the callback here, its only called for your "my_venvs" search
        on_telescope_result_callback = shorter_name,
      },
    },
  },
}

