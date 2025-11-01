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
