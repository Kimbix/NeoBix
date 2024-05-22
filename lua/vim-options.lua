-- Keyboard
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- Mouse
vim.opt.mouse = 'a'

-- Tools
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- [[ Tabs ]] --
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- [[ Visuals ]] --
-- Sidebar options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

-- Lines wrap
vim.opt.wrap = true
vim.opt.breakindent = true

-- Status line options
vim.opt.showmode = false
vim.opt.cursorline = false
vim.opt.cmdheight = 0 -- Hides Command Line

-- In-File options
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- TODO: If you ever find out how to show the substitutions to the right
-- instead of up... poggers
vim.opt.inccommand = 'split'

-- File Visibility
vim.opt.scrolloff = 8

-- Search options
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<CMD>nohlsearch<CR>') -- THIS IS AWESOME

-- [[ Splits ]] --
vim.opt.splitright = true
vim.opt.splitbelow = true

-- [[ Files and System ]] --
vim.opt.undofile = true
vim.opt.clipboard = 'unnamedplus'

-- Vim itself
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
