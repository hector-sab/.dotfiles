local options = {
	-- Search
	hlsearch = true,
	ignorecase = true,
	smartcase = true,
	incsearch = true,
	--
	backup = false,
	swapfile = false,
	hidden = true,
	undofile = true,
	writebackup = false,
	--
	number = true,
	relativenumber = true,
	numberwidth = 4,
	--
	splitbelow = true,
	splitright = true,
	--
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	smartindent = true,
	autoindent = true,
	--
	scrolloff = 8,
	sidescrolloff = 8,
	--
	colorcolumn = {80},
	clipboard = "unnamedplus",
	cmdheight = 2,
	completeopt = {"menuone", "noselect"},
	conceallevel = 0,
	cursorline = true,
	fileencoding = "utf-8",
	mouse = "",
	pumheight = 10,
	showmode = true,
	showtabline = 1,
	signcolumn = "number",
	termguicolors = true,
	timeoutlen = 1000,
	updatetime = 300,
	wrap = false,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Improved hybrid number_relateivenumber mode
-- It will only show relative numbers on the window with focus or if in
-- edit mode.
vim.cmd([[
	augroup numbertoggle
		autocmd!
		autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
		autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
	augroup END
]])

-- TODO: Change the colorcolumn color
