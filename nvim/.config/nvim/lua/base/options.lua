-- Enables true colors
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.numberwidth = 3
vim.wo.signcolumn = 'yes'

-- Better search experience
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Nicer tabs
local tab_size = 4
vim.opt.tabstop = tab_size
vim.opt.shiftwidth = tab_size
-- NOTE: Not sure if softtabstop is useful but the following answer
--   explains nicely what it does: https://vi.stackexchange.com/a/28017/19783
-- vim.opt.softtabstop = tab_size
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.hidden = true

-- Great buffer changes history
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = true
vim.opt.updatetime = 300

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.colorcolumn = {80}

vim.opt.showtabline = 1
vim.opt.cmdheight = 2
vim.opt.laststatus = 3

vim.opt.completeopt = {'menuone', 'noinsert', 'noselect', 'preview'}

vim.opt.conceallevel = 0
vim.opt.cursorline = true

-- vim.opt.fileencoding = 'utf-8'
-- vim.opt.pumheight = 10

vim.opt.timeoutlen = 200
vim.opt.updatetime = 300
