local set = vim.keymap.set

local ok, ut = pcall(require, 'undotree')
if not ok then
    print("Undotree wasn't found. Skipping buffers keymaps")
    return
end

ut.setup({
    float_diff = false,
    layout = 'left_left_bottom',
})

vim.keymap.set('n', '<leader>u', ut.toggle, { noremap = true, silent = true })
