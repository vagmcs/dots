--
-- General
--
vim.opt.clipboard = "unnamedplus"
vim.opt.splitbelow = true
vim.opt.splitright = true

--
-- Numbers, Tabs and Spaces
--
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.numberwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

--
-- Coding
--
vim.scrolloff = 8
vim.opt.colorcolumn = "120"
vim.signcolumn = "yes"

--
-- Backup
--
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.updatetime = 50

--
-- Searching
--
vim.opt.hlsearch = false
vim.opt.incsearch = true

--
-- Mouse Scrolling
--
vim.opt.mouse = 'a'
vim.opt.ruler = true
vim.opt.cursorline = true

--
-- Commands
--
vim.cmd [[set iskeyword+=-]]
