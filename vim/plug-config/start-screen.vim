""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stratify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://www.chrisatmachine.com/Neovim/11-startify/
" https://www.youtube.com/watch?v=9IcXJvoPHCY&t=344s
let g:startify_session_dir = stdpath('data') . '/sessions'

" Modify start menu
let g:startify_lists = [
    \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
    \ { 'type': 'files',     'header': ['   Files']          },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \]


" Add bookmarks
let g:startify_bookmarks = [
    \ {'a': '~/.config/nvim/'},
    \ '~/.config/nvim/init.vim'
    \ ]
