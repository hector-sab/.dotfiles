local set = vim.keymap.set

-- Remap for dealing with moving between wrapped lines
set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- Diagnostics
set(
    'n', '[d', vim.diagnostic.goto_prev,
    { desc = 'Go to previous diagnostic message' }
)
set(
    'n', ']d', vim.diagnostic.goto_next,
    { desc = 'Go to next diagnostic message' }
)

-- TODO: Not working
set(
    'n', '<leader>e', vim.diagnostic.open_float,
    { desc = 'Open floating diagnostic message' }
)
set(
    'n', '<leader>q', vim.diagnostic.setloclist,
    { desc = 'Open diagnostics list' }
)


-- Yank
set(
    {'n', 'x'}, '<leader>y', '"+y',
    {desc = 'Yank selection to the OS clipboard'}
)
set(
    {'n', 'x'}, '<leader>Y', '"+y$',
    {desc = 'Yank line (from position) to the OS clipboard'}
)

-- Paste
set(
    {'n', 'x'}, '<leader>p', '"+p',
    {desc = 'Paste from the OS clipboard'}
)

-- NOTE: Disabling this as we can get the same effect by pasting
--   "0p which means 'paste from register 0'.
--   Take a look at https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text
--   for more info.
-- NOTE: This remap is intended to the following workflow:
--   - Yank text-A
--   - Visual select text-B else
--   - Paste text-A
--   - Visual select text-C else
--   - Paste text-A
--   Without this, text-B would be used in the next paste.
-- set(
--     'v', 'p', '"_dP',
--     {desc = 'Paste without modifying the original register'}
-- )

-- NOTE: Disabling as I don't see a point on having this behavior.
-- set(
--     {'n', 'x'}, 'x', '"_x',
--     {desc = 'Delete without changing the register'}
-- )
