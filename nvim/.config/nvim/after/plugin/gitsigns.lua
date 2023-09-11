local ok, gs = pcall(require, 'gitsigns')
if not ok then
    print("gitsigns wasn't found. Skipping setup")
    return
end

local signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
}


local function stage(t)
    if t.range ~= 0 then
        gs.stage_hunk({ t.line1, t.line2 })
    else
        gs.stage_hunk()
    end
end

vim.api.nvim_create_user_command("Stage", function(t) stage(t) end, { range = true })


gs.setup({
    signs = signs,
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl = true,  -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    -- _signs_staged_enable = true,
})
