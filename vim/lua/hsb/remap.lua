vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move up or down selected lines, also auto indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Makes sure that when joining lines with J, the cursor stays at the
-- beginning of the line.
vim.keymap.set("n", "J", "mzJ`z")

-- Makes sure to have a centered position when navigating with <C-d>/<C-u>
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keeps search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without losing the copied registry when highlighting things
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Allow copying to the system registry
-- NOTE: Y copies from its position to the end of the line, as C and D. In VIM
--   it used to be a bit similar to yy. More on how it worked in VIM on
--   https://vi.stackexchange.com/questions/6061/why-is-y-a-synonym-for-yy-instead-of-y
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Allows deleting and not copying to the registry
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Might as well add jk to the remap?
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Format buffer using the LSP
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Gives a regex for replacing the word below the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
