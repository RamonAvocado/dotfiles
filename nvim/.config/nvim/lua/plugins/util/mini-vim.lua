-- Collection of various small independent plugins/modules
return {
  'nvim-mini/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    --[[
    Better Around/Inside textobjects
     Examples:
      - va)  - [V]isually select [A]round [)]paren
      - yinq - [Y]ank [I]nside [N]ext [Q]uote
      - ci'  - [C]hange [I]nside [']quote

    NOTE: https://github.com/nvim-mini/mini.ai
    Main textobject prefixes
    around = 'a',
    inside = 'i',

    NOTE:
    Next/last variants, Map LSP selection manually (see `:h MiniAi.config`)
    around_next = 'an',
    inside_next = 'in',
    around_last = 'al',
    inside_last = 'il',

    NOTE:
    Move cursor to corresponding edge of `a` textobject
    goto_left = 'g[',
    goto_right = 'g]'

    --]]

    require('mini.surround').setup()
    --[[
    NOTE:
    Add/delete/replace surroundings (brackets, quotes, etc.)
     - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
     - sd'   - [S]urround [D]elete [']quotes
     - sr)'  - [S]urround [R]eplace [)] [']

    -- ]]

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
