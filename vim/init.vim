""""""""""""""""""""
" Plugins
"""""""""""""""""""""
" Currently using vim-plug. For installation instructions take a look at
" https://github.com/junegunn/vim-plug
"
" NOTE: Vim plugins is: '~/.vim/plugged'
"       Nvim plugins dir is: stdpath('data') . '/plugged'
"           also known as ~/.local/share/nvim/plugged
call plug#begin(stdpath('data') . '/plugged')
" Theme. Look below for the color scheme
"Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'

" Used for git. I prefer sublime merge or vanilla git tbh.
" Plug 'tpope/vim-fugitive'
" Used for showing lines changed from the branch
Plug 'mhinz/vim-signify'

" Shows in which vim branch we are
Plug 'vim-airline/vim-airline'

" For typescript
Plug 'leafgarland/typescript-vim'

Plug 'vim-utils/vim-man'

" For C++ ?
" Plug 'lyuts/vim-rtags'

" TODO: Automatic nohighlight after search. Next plugin take care of that but
"       I am not sure if there's something better.
"Plug 'haya14busa/is.vim'

" Autocompletion.
" Note: If using jedi for python, make sure the latest version is installed
"       using `pip install -U jedi`
" NOTE: Check python interpreter being used
"       :CocCommand python.setInterpreter
" NOTE: Install npm install -g neovim.
" NOTE: To use the Microsoft Python Language Server go to :CocConfig and
"       write '{"python.jediEnabled": false}'. It will start downloading it
"       after that.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Show undo tree in lateral pane
Plug 'mbbill/undotree'

" Show indentation lines
Plug 'Yggdroot/indentLine'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Stratify. For sessions management.
Plug 'mhinz/vim-startify'

" Plug 'airblade/vim-rooter'

" Maximize panes
Plug 'szw/vim-maximizer'

" Ranger
Plug 'kevinhwang91/rnvimr'
call plug#end()




syntax on
let mapleader = " "


" Numerates the lines, and adds hybrid numeration
set nu rnu
" Automatically change to absolute numbering once we are editings
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
:augroup END



" Set the line character that should be colored
set colorcolumn=80
" NOTE: ctermX and guiX are used for terminal and gui version respectively.
"       For colors keywords look at
"       :help cterm-colors
highlight ColorColumn ctermbg=DarkGrey guibg=DarkGray


" Activate/deactivate spaces/tabs visualization in normal mode
nnoremap <F2> :<C-U>setlocal lcs=tab:>-,eol:$ list! list? <CR>
" Activate/deactivate spaces/tabs visualization in insert mode
inoremap <F2> <C-o>:set list!<CR>

" Allows pasting previous selection multiple times. For old behavior try
" SHIFT + p
vnoremap p pgvy

" Allow moving selected blocks of code up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


" Remove all the whitespaces after the last character of each line
fun! TrimWhitespaces()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TRIM_WHITESPACES
    autocmd!
    autocmd BufWritePre * :call TrimWhitespaces()
augroup END

" Set side explorer settings
" NOTE: Instead of NERDtree we use the default netrw
"       How to use it:
"       :Lexplore   or   :Le      <-- For explorer toggled to the left
"       :Vexplore   or   :Ve      <-- For vertical split
"       :Hexplore   or   :He      <-- For horizontal split
"       :Explore    or   :E       <-- For full pane explorer
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 30

" Create a lateral side explorer
" NOTE: Using `:Le` replaces the remap for me
"nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>pv :Lex<CR>

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif





"""""""""""""""""""""
" Custom commands/shortcuts


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undo Tree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show undo tree. History of changes we have done to the file
nnoremap <leader>u :UndotreeShow<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Not a plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow changing between windows using <leader> + [h, j, k, l]
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts for vim-fugitive
" Git Status
"nnoremap <leader>gs :Gstatus<CR>
" In merge conflict. Select the commit from the left
"nnoremap <leader>gh :diffget //2<CR>
" In merge conflict. Select the commit from the right
"nnoremap <leader>gh :diffget //3<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For JSONc. Colors correctly the comments
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType yaml set tabstop=2 | set softtabstop=2 | set shiftwidth=2
