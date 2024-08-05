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

local tokyonight = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
}

local lsp = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
}

local completion = {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
}

-- Highlight todo, notes, etc in comments
local todo_comments = {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false }
}

local mason_dap = {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
        'williamboman/mason.nvim',
        'mfussenegger/nvim-dap',
    },
    cmd = { 'DapInstall', 'DapUninstall' },
    opts = {
        automatic_installation = true,
        handlers = {},
        ensure_installed = {
            'delve'
        }
    }
}

local nvim_dap = {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',
    },
    config = function (_, opts)
        local dap = require('dap')
        local dapui = require('dapui')

        dap.set_log_level('INFO')
        dapui.setup(opts)
        dap.listeners.after.event_initialized['dapui_config'] = function ()
            dapui.open({})
        end
        dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close({})
        end
        dap.listeners.before.event_exited['dapui_config'] = function ()
            dapui.close({})
        end
    end
}

local dap_go = {
    'leoluz/nvim-dap-go',
    config = function ()
        require('dap-go').setup()
    end
}


local plugins = {
    telescope,
    harpoon,
    treesitter,
    undotree,
    'lukas-reineke/indent-blankline.nvim',
    'tpope/vim-fugitive',  -- Testing out
    'lewis6991/gitsigns.nvim',
    tokyonight,
    todo_comments,
    mason_dap,
    dap_go,
    nvim_dap,
}

vim.list_extend(plugins, lsp)
vim.list_extend(plugins, completion)

lazy.setup(plugins)

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
