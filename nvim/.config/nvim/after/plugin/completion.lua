local ok_cmp, cmp = pcall(require, 'cmp')
local ok_snip, luasnip = pcall(require, 'luasnip')
if not ok_cmp then
    print('Cmp not available. Skipping completion setup')
end
if not ok_snip then
    print('LuaSnip not available. Skipping completion setup')
end

local snippet = {
    expand = function(args)
        luasnip.lsp_expand(args.body)
    end
}

local mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false })
})

local sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' }
})

cmp.setup({
    snippet = snippet,
    mapping = mapping,
    sources = sources
})
