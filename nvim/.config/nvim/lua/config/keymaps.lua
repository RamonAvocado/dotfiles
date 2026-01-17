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
map('x', '<', '<gv')
map('x', '>', '>gv')

-- quit
map('n', '<leader>qQ', '<cmd>qa<cr>', { desc = 'Quit All' }) -- EXIT NEOVIM
map('n', '<leader>qq', '<cmd>:q<CR>', { desc = 'Close window' }) -- EXIT THE CURRENT FILE

-- save
map('n', '<leader>w', '<cmd>:w<CR>', { desc = 'Save file' }) -- SAVE THE CURRENT FILE
-----------------------------------------------------------

-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Exit the current file' }) -- EXIT THE CURRENT FILE

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") -- TO MOVE AROUND THE LINE/S YOU HAVE SELECTED
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z') -- KEEP THE CURSOR IN PLACE WHEN YOU BRING LINE UP

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move down half a page' }) -- TO KEEP THE CURSOR CENTERED WHEN YOU MOVE AROUND HALF PAGES
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move up half a page' })

vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Keep the cursor centered when searching for words' }) -- TO KEEP THE CURSOR CENTERED WHEN SEARCHING FOR WORDS
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Keep the cursor centered when searching for words' })

-- Paste from system clipboard (not the Neovim buffer)
vim.keymap.set({ 'n', 'v' }, '<leader>pp', [["+p]], { desc = 'Paste from system clipboard' })
-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Not copy things when deleting' }) -- NOT OVERRIDE THE COPY BUFFER WHEN PASTEING STUFF

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Copy things into system clipboard' }) -- COPY THINGS OUTSIDE NEOVIM
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]]) -- DELETE THINGS WITHOUT COPYING THEM

-- This is going to get me cancelled
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('i', 'ß', '<Esc>', { noremap = true, silent = true }) -- TO EXIT QUICKLY WITHOUT USINS CTRL, THIS USES ALT+GR

-- DONT KNOW WHAT THEY DO
-- vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format) -- TO FORMAT THE CODE

-- vim.keymap.set('n', 'grnf', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace all the word that im standing on' }) -- TO REPLACE ALL THE WORD NAMED THE SAME AS THE ONE IM STANDING
vim.keymap.set('n', 'grnf', [[:.,$s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word under cursor from this line downward' }) -- TO WORD NAMED THE SAME AS THE ONE IM STANDING ONWARDS
-- vim.keymap.set('x', 'grnf', [["sy:%s/<C-r>s/<C-r>s/gI<Left><Left><Left>]], { desc = 'Replace all occurrences of selected text' })
vim.keymap.set('x', 'grnf', [["sy:'<,$s/<C-r>s/<C-r>s/gI<Left><Left><Left>]], { desc = 'Replace selected text from selection start line downward' })

vim.keymap.set('n', '<leader>fx', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Makes the current file executable' }) -- TO MAKE SCRIPS EXECUTABLE

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>od', vim.diagnostic.setloclist, { desc = '[O]pen [D]iagnostic quickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')



-- TEMPORAL --
vim.keymap.set('v', "t", '<')
vim.keymap.set('v', "T", '>')
