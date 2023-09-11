local ok, ts = pcall(require, 'nvim-treesitter')
if not ok then
    print("Treesitter is not available. Skipping setup")
    return
end

local configs = require('nvim-treesitter.configs')

default_languages = {'c', 'cpp', 'go', 'lua', 'python', 'rust', 'javascript', 'vim', 'vimdoc'}

configs.setup({
    ensure_installed = default_languages,
    auto_install = false,
    highlight = {enabled = true},
    additional_vim_regex_highlighting = false,
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<M-space>',
        },
    },
    -- textobjects = {
    --     select = {
    --       enable = true,
    --       lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
    --       keymaps = {
    --         -- You can use the capture groups defined in textobjects.scm
    --         ['aa'] = '@parameter.outer',
    --         ['ia'] = '@parameter.inner',
    --         ['af'] = '@function.outer',
    --         ['if'] = '@function.inner',
    --         ['ac'] = '@class.outer',
    --         ['ic'] = '@class.inner',
    --       },
    --     },
    -- },
    -- move = {
    --   enable = true,
    --   set_jumps = true, -- whether to set jumps in the jumplist
    --   goto_next_start = {
    --     [']m'] = '@function.outer',
    --     [']]'] = '@class.outer',
    --   },
    --   goto_next_end = {
    --     [']M'] = '@function.outer',
    --     [']['] = '@class.outer',
    --   },
    --   goto_previous_start = {
    --     ['[m'] = '@function.outer',
    --     ['[['] = '@class.outer',
    --   },
    --   goto_previous_end = {
    --     ['[M'] = '@function.outer',
    --     ['[]'] = '@class.outer',
    --   },
    -- },
    -- swap = {
    --   enable = true,
    --   swap_next = {
    --     ['<leader>a'] = '@parameter.inner',
    --   },
    --   swap_previous = {
    --     ['<leader>A'] = '@parameter.inner',
    --   },
    -- },
})
