-- For setup look at the after directory
local ok, lazy = pcall(require, 'lazy')
if not ok then
    print("Lazy was not found. Plugins can't be installed")
    return
end

local telescope = {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.2',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
    }
}

local harpoon = {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim"
    }
}

local treesitter = {
    'nvim-treesitter/nvim-treesitter',
    -- dependencies = {
    --     'nvim-treesitter/nvim-treesitter-textobjects',
    -- },
    build = ':TSUpdate',
}

local undotree = {
    'jiaoshijie/undotree',
    -- name = 'jundotree',
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
}

local plugins = {
    telescope,
    harpoon,
    treesitter,
    undotree,
    'lukas-reineke/indent-blankline.nvim',
    'tpope/vim-fugitive',  -- Testing out
    'lewis6991/gitsigns.nvim',
}

lazy.setup(plugins)

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
