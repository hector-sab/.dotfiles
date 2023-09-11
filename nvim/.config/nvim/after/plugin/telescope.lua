local set = vim.keymap.set

local ok, telescope = pcall(require, 'telescope')
if not ok then
    print("Telescope was not found. Keymaps can't be setup for this plugin")
    return
end

local builtin = require('telescope.builtin')

local find_all_files = function()
    builtin.find_files({
        hidden = true
    })
end

set(
    'n', '<leader>?', builtin.oldfiles,
    {desc = 'Finds recently opened files'}
)

set(
    'n', '<leader><space>', builtin.buffers,
    {desc = 'Find existing buffers'}
)

set(
    'n', '<leader>/', builtin.current_buffer_fuzzy_find,
    {desc = 'Fuzzy search in current buffer'}
)

set(
    'n', '<leader>pf', builtin.find_files,
    {desc = 'Finds [P]roject [F]iles'}
)

set(
    'n', '<leader>pa', find_all_files,
    {desc = 'Finds [P]roject files [A]ll'}
)

set(
    'n', '<leader>gf', builtin.git_files,
    {desc = 'Find [G]it [F]iles'}
)

set(
    'n', '<leader>sh', builtin.help_tags,
    {desc = '[S]earch [H]elp'}
)

set(
    'n', '<leader>sg', builtin.live_grep,
    {desc = '[S]earch by [G]rep'}
)

set(
    'n', '<leader>sd', builtin.diagnostics,
    {desc = '[S]earch [D]iagnostics'}
)

set(
    'n', '<leader>sd', builtin.diagnostics,
    {desc = '[S]earch [D]iagnostics'}
)

set(
    'n', '<leader>sr', builtin.resume,
    {desc = '[S]earch [R]esume'}
)
