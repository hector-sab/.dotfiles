local ok_mason, mason = pcall(require, 'mason')
local ok_mason_lsp, mason_lsp = pcall(require, 'mason-lspconfig')
local ok_lsp_conf, lsp_conf = pcall(require, 'lspconfig')

if not ok_mason then
    vim.print("Mason couldn't load correctly. Skipping LSP setup.")
elseif not ok_mason_lsp then
    vim.print("Mason LSP Config couldn't load correctly. Skipping LSP setup.")
elseif ok_lsp_conf then
    vim.print("LSP Config couldn't load correctly. Skipping LSP setup.")
end

local ensure_installed = {
    'lua_ls',
}

-- Custom configs
-- Lua ls configuration for lspconfig
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
local lua_nvim_config = {
    Lua = {
        runtime = {
            version = 'LuaJIT'
        },
        workspace = {
            checkThirdParty = false,
            library = {
                vim.env.VIMRUNTIME,
            }
        },
    }
}

local function setup_lua_nvim_config(client)
    local path = client.workspace_folders[1].name

    local condition_a = vim.loop.fs_stat(path .. '/.luarc.json')
    local condition_b = vim.loop.fs_stat(path .. '/.luarc.jsonc')

    if not condition_a and not condition_b then
        client.config.settings = vim.tbl_deep_extend(
            'force', client.config.settings, lua_nvim_config
        )

        client.notofy(
            'workspace/didChangeConfiguration',
            { settings = client.config.settings }
        )
    end
    return true
end


-- python

-- Setups
mason.setup({})
mason_lsp.setup({
    ensure_installed = ensure_installed
})
lsp_conf.lua_ls.setup({ on_init = setup_lua_nvim_config })
lsp_conf.pyright.setup({})
lsp_conf.gopls.setup({})



-- Enable keymaps only when a server is attached to the current buffer

local function keymaps_callback(ev)
    local set = vim.keymap.set
    local buf = vim.lsp.buf

    -- Enables completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings
    local opts = { buffer = ev.buf }

    set('n', 'gD', buf.declaration, opts)
    local telescope_ok, telescope_btin = pcall(require, 'telescope.builtin')
    if telescope_ok then
        set('n', 'gd', telescope_btin.lsp_definitions, { desc = '[G]oto [D]efinitions' })
        set('n', 'gr', telescope_btin.lsp_references, { desc = '[G]oto [R]eferences' })
        -- TODO: Fix telescope goto implementation
        --set('n', 'gi', telescope_btin.lsp_implementation, { desc = '[G]oto [I]mplementation' })
        set('n', 'gi', buf.implementation, opts, { desc = '[G]oto [I]mplementation'})
        set('n' , '<leader>D', telescope_btin.lsp_type_definitions, { desc = 'Type [D]efinition' })
    else
        set('n', 'gd', buf.definition, opts, { desc = '[G]oto [D]efinitions'})
        set('n', 'gr', buf.references, opts, { desc = '[G]oto [R]eferences'})
        set('n', 'gi', buf.implementation, opts, { desc = '[G]oto [I]mplementation'})
    end

    -- NOTE: There's some messages when using K already...
    --   Where do they come from?
    set('n', 'K', buf.hover, opts)
    set('n', '<C-k', buf.signature_help, opts)
    -- TODO: How can I use the workspaces?
    -- set('n', '<space>wa', buf.add_workspace_folder, opts)
    -- set('n', '<space>wr', buf.remove_workspace_folder, opts)
    -- set('n', '<space>wl',
    --     function() print(vim.inspect(buf.list_workspace_folders)) end,
    --     opts
    -- )

    set('n', '<space>D', buf.type_definition, opts)
    set('n', '<space>rn', buf.rename, opts)
    set({ 'n', 'v' }, '<space>ca', buf.code_action, opts)
    -- TODO: How to use format?
    set('n', '<space>f', function() buf.format { async = true } end, opts)
end

vim.api.nvim_create_autocmd(
    'LspAttach',
    {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = keymaps_callback
    }
)
