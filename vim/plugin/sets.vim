" Don't hide json quotes
set conceallevel=0

" Have 8 lines between the start/end of vim and the cursor
set scrolloff=8

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

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set splitbelow splitright

" Show all characters in the markdowns
set conceallevel=0
