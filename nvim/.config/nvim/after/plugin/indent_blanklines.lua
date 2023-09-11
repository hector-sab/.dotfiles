-- The lines can be enabled/disabled at will with
-- - :IndentBlanklineToggle
-- - :IndentBlanklineEnable
-- - :IndentBlanklineDisable
--
-- To enable/disable the space/tab/eol characters you can do
-- - :set list
-- - :set nolist
--
-- To modify characters on the fly do
-- - :set listchars+=space:?
--
-- For more help on listchars look for :h 'listchars'
local ok, ib = pcall(require, 'indent_blankline')
if not ok then
    print("indent_blackline wasn't found. Skipping setup")
    return
end

vim.opt.list = true
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "tab:<->"


-- The option `space_char_blankline = "?"` can be set up if it's
-- desired to see `?` chars on empty lines that belong to an
-- indented section. For example, when defining a lua table it will
-- show the char if there's an empty line between items of the table.

-- The option `show_trailing_blankline_indent = false` can be set up if
-- it's desired to not see the indentation on empty lines.

local opts_show_indentation = {
    char = '┊',
}

local opts_show_current_context = {
    char = '',
    context_char = '│',
    show_current_context = true,
}

local opts_show_indentation_and_context = {
    char = '┊',
    context_char = '│',
    use_treesitter = true,
    show_current_context = true,
}

ib.setup(opts_show_indentation_and_context)
ib.setup(opts_show_indentation_and_context)
