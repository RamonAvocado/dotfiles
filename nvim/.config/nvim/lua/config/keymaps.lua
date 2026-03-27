vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set
----------------------KEYMAPS OF LAZYVIM-------------------
-- better up/down
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- better indenting

local indenting_left = '<M-1>'
local indenting_right = '<M-2>'
map('n', indenting_left .. indenting_left, '<<')
map('n', indenting_right .. indenting_right, '>>')
map('i', indenting_left, '<')
map('i', indenting_right, '>')
map('v', indenting_left, '<')
map('v', indenting_right, '>')
map('x', indenting_left, '<gv')
map('x', indenting_right, '>gv')

-- quit
map('n', '<leader>qQ', '<cmd>qa<cr>', { desc = 'Quit All' }) -- EXIT NEOVIM
map('n', '<leader>qq', '<cmd>:q<CR>', { desc = 'Close window' }) -- EXIT THE CURRENT FILE

-- save
map('n', '<leader>w', '<cmd>:w<CR>', { desc = 'Save file' }) -- SAVE THE CURRENT FILE
-----------------------------------------------------------

-- map('n', '<leader>pv', vim.cmd.Ex, { desc = 'Exit the current file' }) -- EXIT THE CURRENT FILE
map('v', 'J', ":m '>+1<CR>gv=gv") -- TO MOVE AROUND THE LINE/S YOU HAVE SELECTED
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', 'J', 'mzJ`z') -- KEEP THE CURSOR IN PLACE WHEN YOU BRING LINE UP

map('n', '<C-d>', '<C-d>zz', { desc = 'Move down half a page' }) -- TO KEEP THE CURSOR CENTERED WHEN YOU MOVE AROUND HALF PAGES
map('n', '<C-u>', '<C-u>zz', { desc = 'Move up half a page' })

map('n', 'n', 'nzzzv', { desc = 'Keep the cursor centered when searching for words' }) -- TO KEEP THE CURSOR CENTERED WHEN SEARCHING FOR WORDS
map('n', 'N', 'Nzzzv', { desc = 'Keep the cursor centered when searching for words' })

-- System clipboard (not the Neovim buffer)
map({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'which_key_ignore' }) -- DELETE THINGS WITHOUT COPYING THEM
map({ 'n', 'v' }, '<leader>p', [["+p]], { desc = 'Paste from system clipboard' })
map('x', '<leader>p', [["_dP]], { desc = 'Not copy things when deleting' })

map({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Copy things into system clipboard' })
map('n', '<leader>Y', [["+Y]], { desc = 'which_key_ignore' })

-- This is going to get me cancelled
map('i', '<C-c>', '<Esc>')
map('i', 'ß', '<Esc>', { noremap = true, silent = true }) -- TO EXIT QUICKLY WITHOUT USINS CTRL, THIS USES ALT+GR

-- DONT KNOW WHAT THEY DO
map('n', 'Q', '<nop>')
-- map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- map('n', '<leader>ff', vim.lsp.buf.format)

-- map('n', 'grnf', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace all the word that im standing on' }) -- TO REPLACE ALL THE WORD NAMED THE SAME AS THE ONE IM STANDING
map('n', 'grnf', [[:.,$s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word under cursor from this line downward' }) -- TO WORD NAMED THE SAME AS THE ONE IM STANDING ONWARDS
-- map('x', 'grnf', [["sy:%s/<C-r>s/<C-r>s/gI<Left><Left><Left>]], { desc = 'Replace all occurrences of selected text' })
map('x', 'grnf', [["sy:'<,$s/<C-r>s/<C-r>s/gI<Left><Left><Left>]], { desc = 'Replace selected text from selection start line downward' })

map('n', '<leader>fx', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Makes the current file executable' }) -- TO MAKE SCRIPS EXECUTABLE

-- [[ Basic Keymaps ]]
--  See `:help map()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- TIP: Disable arrow keys in normal mode
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
