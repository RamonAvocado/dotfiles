vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex) -- EXIT THE CURRENT FILE

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") -- TO MOVE AROUND THE LINE/S YOU HAVE SELECTED
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z') -- KEEP THE CURSOR IN PLACE WHEN YOU BRING LINE UP

vim.keymap.set('n', '<C-d>', '<C-d>zz') -- TO KEEP THE CURSOR CENTERED WHEN YOU MOVE AROUND HALF PAGES
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', 'n', 'nzzzv') -- TO KEEP THE CURSOR CENTERED WHEN SEARCHING FOR WORDS
vim.keymap.set('n', 'N', 'Nzzzv')

-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]]) -- NOT OVERRIDE THE COPY BUFFER WHEN PASTEING STUFF

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]]) -- COPY THINGS OUTSIDE NEOVIM
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]]) -- DELETE THINGS WITHOUT COPYING THEM

-- This is going to get me cancelled
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('i', 'ß', '<Esc>', { noremap = true, silent = true }) -- TO EXIT QUICKLY WITHOUT USINS CTRL, THIS USES ALT+GR

-- DONT KNOW WHAT THEY DO
-- vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format) -- TO FORMAT THE CODE

-- DONT KNOW WHAT THEY DO
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- TO REPLACE ALL THE WORD NAMED THE SAME AS THE ONE IM STANDING
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true }) -- TO MAKE SCRIPS EXECUTABLE

-- NOTE: ALL OF THIS IS FOR TOGGLETERM

-- Hide/show the terminal (same as above, just a mnemonic)
-- vim.keymap.set({ 'n', 't' }, '<leader>tt', function()
--   require('toggleterm').toggle(1)
-- end, { desc = 'Terminal: toggle #1 (works in terminal too)' })

-- FIXME: ESTE COMANDO ES EL MODIFICADO DE ARRIBA
vim.keymap.set({ 'n', 't' }, '<leader>tt', function()
  local ok, term = pcall(require, 'toggleterm')
  if not ok then
    vim.notify('toggleterm no está cargado', vim.log.levels.WARN)
    return
  end
  term.toggle(1)
end, { desc = 'Terminal: toggle #1 (normal/terminal)' })

-- Focus the first toggleterm (or open if missing)
vim.keymap.set('n', '<leader>tj', function()
  require('toggleterm').toggle(1) -- jump to it if hidden, shows it if closed
end, { desc = 'Terminal: focus/toggle #1' })

-- Close the terminal window (hide). If you really want to kill the job, use the mapping below
vim.keymap.set('n', '<leader>th', function()
  require('toggleterm').toggle(1)
end, { desc = 'Terminal: hide' })

-- Kill the terminal process & buffer completely
vim.keymap.set('n', '<leader>tq', function()
  local ok, tt = pcall(require, 'toggleterm.terminal')
  if not ok then
    return
  end
  local term = tt.get(1)
  if term and term:is_open() then
    term:shutdown() -- stops job & closes window/buffer
  end
end, { desc = 'Terminal: quit (kill job)' })

-- From anywhere, run current file in term #1 (kept here for convenience)
vim.keymap.set('n', '<leader>rf', function()
  vim.cmd 'w'
  vim.cmd("TermExec size=12 direction=horizontal cmd='python " .. vim.fn.expand '%' .. "'")
end, { desc = 'Run current file (python %)' })

-- Quality-of-life: in terminal mode, make <Esc> go Normal and use Ctrl-h/j/k/l to move
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = 'term://*',
  callback = function()
    local opts = { buffer = 0, noremap = true, silent = true }
    vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], opts)
    vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], opts)
    vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], opts)
    vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], opts)
  end,
})
