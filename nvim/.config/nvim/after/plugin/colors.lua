local ok, tokyonight = pcall(require, 'tokyonight')
if not ok then
    print("tokyonight color scheme wasn't found. Skipping color setup")
    return
end

local dark = 'tokyonight'
local light = 'tokyonight-day'

vim.cmd.colorscheme(dark)
