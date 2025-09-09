--
-- https://neovim.io/doc/user/lua.html#_lua-module:-vim.keymap
--

-- vim.keymap.set('{mode}', '{new-keybinding}', '{what-gets-executed}')

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center after going half a page down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center after going half a page up' })

vim.keymap.set('n', '<leader>nb', ':enew<CR>', { noremap = true, silent = true, desc = 'Create [N]ew [B]uffer' })

vim.keymap.set('n', '<leader>e', '<cmd>Oil .<CR>', { desc = 'Open oil.nvim in the current dir' })

vim.keymap.set('n', '<leader>g', '<cmd>LazyGit<CR>', { desc = 'Open LazyGit' })
