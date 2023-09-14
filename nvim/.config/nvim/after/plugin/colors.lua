-- USAGE: Call `:Colorize` aith `dark` or `light`
-- TODO: Why using the colorscheme disables the print messages?
--   Now I have to use :messages
local ok, tokyonight = pcall(require, 'tokyonight')
if not ok then
    vim.print("tokyonight color scheme wasn't found. Skipping color setup")
    return
end

local dark = 'tokyonight-storm'
local light = 'tokyonight-day'

local cache_dir = vim.fn.stdpath('cache') .. '/hsb'
local cache_path = cache_dir .. '/colors.json'

local function ensure_cache_dir(dir)
    if vim.fn.isdirectory(dir) == 0 then
        local ok, result = pcall(vim.fn.mkdir, dir)
        if not ok then
            vim.print(result)
        end
    end
end

local function save_cache(path, data)
    local ok, result = pcall(
        vim.fn.writefile, {vim.json.encode(data)}, path
    )
    if not ok then
        vim.print(result)
    end
end

local function set_background(color)
    local options = {color_scheme = 'dark'}

    ensure_cache_dir(cache_dir)

    if vim.fn.filereadable(cache_path) == 1 then
        local data = vim.fn.readfile(cache_path)
        options = vim.json.decode(data[1])
    end
    
    if color then
        options.color_scheme = color
    end

    if options.color_scheme == 'dark' then
        vim.cmd.colorscheme(dark)
    else
        vim.cmd.colorscheme(light)
    end

    save_cache(cache_path, options)
end

local function udc_set_background(args)
    set_background(args.args)
end


set_background()
vim.api.nvim_create_user_command("Colorize", udc_set_background, {nargs='?'})
