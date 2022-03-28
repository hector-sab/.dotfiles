local colorscheme = "tokyonight"
local background = "dark"

if colorscheme == "gruvbox-material" then
    -- Contrast
    -- Valid options: hard, medium, soft
    vim.cmd("let g:gruvbox_material_background = 'hard'")

    -- Valid options: material, mix, original
    vim.cmd("let g:gruvbox_material_palette = 'material'")
end

-- Valid options: dark, light
vim.cmd("set background=" .. background)

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
