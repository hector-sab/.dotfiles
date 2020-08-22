"""""""""""""""""""""
" Common how-to's
"""""""""""""""""""""
" *** SEARCH ***
" - Search letters in the same line
" |1|   f + letter              to seaerch forward in the same line the
" |2|   <SHIFT + f> + <letter>  to search backwards in the same line
" |3|   t + letter              to search forward and place cursor one col 
"                               before
" |4|   <SHIFT + t> + <letter>  to search backwards and place cursor one col 
"                               before
" 
" - Search text in the current buffer
" |1|   /<my-text>     to search text forward
" |2|   ?<my-text>     to search backwards
" |3|   <SHIFT + *>    to search the work under the cursor
"
" - Jumping
" Use (,) or [,]
"
" - Capitalize
" It needs to be in visual mode
" |1|   <SHIFT + u>      for upper case
" |2|   u                for lower case
"
" - Increment/Decrement number
" |1|   CTRL + a     Incrementes a number
" |2|   CTRL + x     Decrements a number
"
"  - Convert spaces to tabs
"  |1| :set tabstop=2     "To match the indentation of the file
"  |2| :set noexpandtab   "Use tab characters for new tabs
"  |3| :%retab!           "Reindent all existing tabs 
" 
" SOURCE: https://stackoverflow.com/a/9105889/5969548
"
"  - Convert tabs to spaces
"  |1| :set tabstop=2     "To match the indentation of the file
"  |2| :set expandtab     "Use spaces characters for new tabs
"  |3| :retab             "Reindent all existing tabs
"
" - Comment multiple lines
"  |1| CTRL-V              "Enter Visual-Block mode
"  |2| Move up-down        "Select all desired lines init
"  |3| SHIFT-i             "Enter Insert mode
"  |4| Write #, //, etc    "Write correct comment character
"  |5| ESC                 "Exit mode and apply to all selected lines
"
" - Autocomplete
"  i_CTRL-p               "Autocomplete <<< 
"  i_CTRL-n               "Autocomplete
"  i_CTRL-x_CTRL-n        "Autocomplete using the words in the current file
"
" NOTE: For Vim help try `:h ins-completion`
" NOTE: i_CTRL referers to CTRL in insert mode
"
" * Undo/Redo
"  ------------
"    u        "Undo
"  CTRL-r     "Redo
"
"  NOTE: They must be in normal mode
"  SOURE: https://vim.fandom.com/wiki/Undo_and_Redo#
"
"""""""""""""""""""""""""""
" About some commands in case I forget...
"""""""""""""""""""""""""""
" <CR>  : Is like pressing Enter so it gets executed
" <C-U> : Remove all characters between the cursor position and the
"         beginning of the line. 
"         https://vi.stackexchange.com/a/9752/19783
" <C-o> : Run a single normal mode command from insert mode
"         https://vi.stackexchange.com/a/13165/19783
"
"""""""""""""""""""""""""""
" Resourses
"""""""""""""""""""""""""""
" Mapping on Vim: https://learnvimscriptthehardway.stevelosh.com/chapters/05.html
"                 https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
" Copy/Paste    : https://linuxize.com/post/how-to-copy-cut-paste-in-vim/
"
"""""""""""""""""""""""""""
" Notes
"""""""""""""""""""""""""""
" - Official repo from Ubuntu may have not been compiled to have +clipboard (allows copy
"   from-to vim). An alternative is vim-gtk3
" - Linux has two clipboards, thus we may need to sync them. If using KDE, use klipper
"   (built-in) to sync them. However, anything you select will be copied into the clipboard
"   if synchronized
"
"
" Useful
"
" - Check healt of neovim installation `:checkhealt` or `vim -c checkhealt`
" - Check all the key bindings `:help index`
" - Check the binding of a particular key/combination with `:verbose imap
"   <tab>` (for example)

syntax on
let mapleader = " "

" Move between buffers, even if it has unsaved changes.
" Also used by Coc.nvim for go to definitions with unsaved buffers.
set hidden
"
" Give more space for displaying messages. Dark bar below the nvim bar.
set cmdheight=2

" Disable Mouse
" set mouse=
" set ttymouse=

" Disable error/EOL messages/sounds
set noerrorbells

" Define tabs and stuff as 4 spaces
set tabstop=4 softtabstop=4
set shiftwidth=4

" Convert tabs to spaces
set expandtab

" NOTE: Auto indent is on by default on nvim, and it's
"       required by smartindent
set autoindent
" TODO: Check if it works well with python
"set smartindent

" Numerates the lines, and adds hybrid numeration
set nu rnu
" Automatically change to absolute numbering once we are editings
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
:augroup END

" Continue text off-screen 
" set nowrap

set ignorecase
set smartcase

" NOTE: Swap not really required since we have undofile.
set noswapfile

" NOTE: Backup not really required since we have undofile.
set nobackup

" NOTE: Undo dir is already default to where it should be. You can read the
"       documentation with the following commands:
"       :help base-directories
"       :help undodir
" set undodir=~/.local/share/nvim

" NOTE: For more information check
"       :h persistent-undo
set undofile

" Allows incremental search. On by default in nvim
" NOTE: Lool at is.vim, the highlight looks much nicer
"       https://github.com/haya14busa/is.vim
set incsearch


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

" Allow copying from vim registry to system clipboard
" NOTE: Make sure xclip is installed. Check alternatives with `:h clipboard`
set clipboard+=unnamedplus

" TODO: Figure out how to make copy to clipboard work through OSC52
" Copy yanke buffer to  system clipboard
" Use OSC52 to put things into the system clipboard, works over SSH!
"function! Osc52Yank()
"    let buffer=system('base64 -w0', @0) " -wO to disable 76 char line wrapping
"    let buffer='\ePtmux;\e\e]52;c;'.buffer.'\x07\e\\'
"    silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape(g:tty)
"endfunction

" Disbale auto-indent when pasting something
" TODO: Check the following link for automatic paste mode
"       https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
" TODO: Check paste mode in normal mode
"Enables paste mode in insert mode. Is it really needed in normal mode tho?
set pastetoggle=<F3> 
"Invert paste option in normal mode
"nnoremap <F3> :set invpaste paste?<CR> 


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

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

set splitbelow splitright

" Show all characters in the markdowns
set conceallevel=0

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

" Use ripgrep
" NOTE: It requires ripgrep in your system.
"       sudo apt install ripgrep
"Plug 'jremmen/vim-ripgrep'

" Used for git. I prefer sublime merge or vanilla git tbh. 
Plug 'tpope/vim-fugitive'
" Used for showing lines changed from the branch
Plug 'mhinz/vim-signify'

" Shows in which vim branch we are
Plug 'vim-airline/vim-airline'

" For typescript
Plug 'leafgarland/typescript-vim'

Plug 'vim-utils/vim-man'

" For C++ ?
" Plug 'lyuts/vim-rtags'

" Find path files and more... Replaced with fzf
" NOTE: Use CTRL + P to open the search
" Plug 'kien/ctrlp.vim'

" TODO: Automatic nohighlight after search. Next plugin take care of that but
"       I am not sure if there's something better.
"Plug 'haya14busa/is.vim'

" NOTE1: Once installed, we have to go to the plug directory and install.py.
" NOTE2: FOR PYTHON. If a virtual enviroment for python is present, deactivate
"       it. Otherwise there will be problems.
"       Also `pip install pynvim` for each environment where nvim is going to
"       be used.
" Note3: If NOTE2 does not work. try checking out 
"        github.com/ycm-core/YouCompleteMe#working-with-virtual-environments
"Plug 'ycm-core/YouCompleteMe'

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

" fzf
set rtp^=/home/hector/.local/share/nvim/plugged/fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()



"""""""""""""""""""""
" Custom commands/shortcuts
"""""""""""""""""""""

" Set color scheme
" Allows vim to show correcto colors somehow
set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RipGrep
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if executable('rg')
"    let g:rg_derive_root='true'
"endif
"" Opens the ripgrep search
"nnoremap <leader>ps :Rg<SPACE>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore things we may not be interested in searching for
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"let g:ctrlp_working_path_mode = 0

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
nnoremap <leader>gs :Gstatus<CR>
" In merge conflict. Select the commit from the left
nnoremap <leader>gh :diffget //2<CR>
" In merge conflict. Select the commit from the right
nnoremap <leader>gh :diffget //3<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For JSONc. Colors correctly the comments
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType yaml set tabstop=2 | set softtabstop=2 | set shiftwidth=2


source ~/.config/nvim/plug-config/coc.vim
