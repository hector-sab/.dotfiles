require "user.plugins"
require "user.options"
require "user.keymaps"
require "user.colorscheme"
require "user.cmp"

--require('packer').startup(function()
--	-- Packer can manage itself
--	use 'wbthomason/packer.nvim'
--
--	use 'mbbill/undotree'
--
--	use {
--	  'nvim-telescope/telescope.nvim',
--	  requires = { {'nvim-lua/plenary.nvim'} }
--	}
--
--	use {
--	'nvim-telescope/telescope-fzf-native.nvim',
--	run = 'make'
--	}
--end)


-- Telescope
-- Make Telescope exit on one ESC
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

require("telescope").setup{
  defaults = {
    mappings = {
      n = {
        ["<M-p>"] = action_layout.toggle_preview
      },
      i = {
        ["<esc>"] = actions.close,
        ["<M-p>"] = action_layout.toggle_preview
      },
    },
  }
}

-- Use fzf-native
--require('telescope').load_extension('fzf')
