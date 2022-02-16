" Make sure that space bar has nothing attached to it
" nnoremap <SPACE> <Nop>
" Set <Leader> to space bar
" let mapleader=" "

"set clipboard=unnamedplus

lua require "init"


" Disable auto tabs for yaml
" NOTE: This didn't work, but was close. Next SO actually solved it.
" https://unix.stackexchange.com/questions/609612/disable-auto-tabs-when-putting-your-first-comment-in-a-yaml-files-with-vim-edito
"set indentkeys-=0#
"
" https://stackoverflow.com/questions/9333134/prevent-gvim-from-auto-indenting-comments
filetype plugin indent on
autocmd BufNewFile,BufReadPost * if &filetype == "yaml" | set expandtab shiftwidth=2 indentkeys-=0# | endif

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
