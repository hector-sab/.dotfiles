local set = vim.keymap.set

local ok, harpoon = pcall(require, 'harpoon')
if not ok then
    print("Harpoon wasn't found. Skipping buffers keymaps")
    return
end

local ui = require('harpoon.ui')
local mark = require('harpoon.mark')

local go_to_harpoon_buffer = function(mark)
    return function()
        ui.nav_file(mark)
    end
end

set(
    'n', '<leader>ht', ui.toggle_quick_menu,
    {desc = 'Toggle harpoon quick menu'}
)

set(
    'n', '<leader>a', mark.add_file,
    {desc = 'Ads buffer to harpoon'}
)

set(
    'n', '<C-h>', go_to_harpoon_buffer(1),
    {desc = 'Go to harpoon mark 1'}
)

set(
    'n', '<C-j>', go_to_harpoon_buffer(2),
    {desc = 'Go to harpoon mark 2'}
)

set(
    'n', '<C-k>', go_to_harpoon_buffer(3),
    {desc = 'Go to harpoon mark 3'}
)

set(
    'n', '<C-l>', go_to_harpoon_buffer(4),
    {desc = 'Go to harpoon mark 4'}
)
