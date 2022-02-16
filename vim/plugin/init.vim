" Make sure that space bar has nothing attached to it
" nnoremap <SPACE> <Nop>
" Set <Leader> to space bar
" let mapleader=" "

"set clipboard=unnamedplus

lua require "init"

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
