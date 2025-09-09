--
-- https://neovim.io/doc/user/lua-guide.html#_vim.opt
--

-- sets the global leader key
vim.g.mapleader = ' '

-- sets the local leader key
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--vim.schedule(function()
--  vim.opt.clipboard = 'unnamedplus'
--end)

-- preserve indentation when wrapping lines
vim.opt.breakindent = true

-- persitent undo accross sessions
vim.opt.undofile = true

-- make searches case-insensitive
vim.opt.ignorecase = true

-- make searches case-sensitive when starting with captial letter
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- open vertical splits on the right
vim.opt.splitright = true

-- open horizontal splits below
vim.opt.splitbelow = true

-- display specific whitespace characters with symbols
vim.opt.list = true
-- symbols for tabs, trailing whitespaces, non-breaking spaces
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- minimum space (in lines) between cursor and top/bottom of window
vim.opt.scrolloff = 10

-- require confirmation if performing an operation that would fail
-- e.g. :q in an buffer with unsaved changes
vim.opt.confirm = true

-- number of spaces a tab represents
vim.o.tabstop = 2

-- number of spaces per level of indentation
vim.o.shiftwidth = 2

-- converts tabs to spaces when typing or indenting
vim.o.expandtab = true
