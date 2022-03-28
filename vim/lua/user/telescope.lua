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
        ["<M-p>"] = action_layout.toggle_preview,
      },
    },
    pickers = {
      live_grep = {
        only_sort_text = true
      }
    }
  }
}

-- Use fzf-native
require('telescope').load_extension('fzf')
