local M = {}

function M.setup()
  local map = vim.keymap.set
  map('n', '<leader>tt', function()
    require('toggleterm.terminal').Terminal:new({ direction = 'horizontal' }):toggle()
  end, { desc = 'ToggleTerm horizontal' })

  map('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', { desc = 'ToggleTerm float' })

  map('n', '<leader>r', function()
    local ft = vim.bo.filetype
    local file = vim.fn.expand '%'
    local shellfile = vim.fn.shellescape(file)
    local cmd = ({
      python = 'python ' .. shellfile,
      javascript = 'node ' .. shellfile,
      typescript = 'ts-node ' .. shellfile,
      lua = 'lua ' .. shellfile,
    })[ft]
    if cmd then
      require('toggleterm').exec(cmd, 1)
    end
  end, { desc = 'Run current file in ToggleTerm' })

  vim.api.nvim_create_autocmd('TermOpen', {
    pattern = '*',
    callback = function()
      local map = function(lhs, rhs)
        vim.keymap.set('t', lhs, rhs, { buffer = true, silent = true })
      end

      -- Salir del modo terminal
      map('<Esc>', [[<C-\><C-n>]])
      -- Navegar entre ventanas desde terminal
      map('<C-h>', [[<C-\><C-n><C-w>h]])
      map('<C-j>', [[<C-\><C-n><C-w>j]])
      map('<C-k>', [[<C-\><C-n><C-w>k]])
      map('<C-l>', [[<C-\><C-n><C-w>l]])
      -- 🔥 Cerrar terminal con Ctrl+C
      vim.keymap.set('t', '<C-c>', function()
        vim.cmd 'bdelete!'
      end, { buffer = true, silent = true, desc = 'Close terminal buffer' })
    end,
  })
end

return M
