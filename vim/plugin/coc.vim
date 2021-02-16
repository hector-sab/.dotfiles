""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Debug
"let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']

" Creates pair of parentesis etc..
let g:coc_global_extensions = ['coc-pairs', 'coc-json', 'coc-python', 'coc-html']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Allows COC <TAB> to work as tab when it is not intending to autocomplete
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" It feels like it's doing the same as TAB
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
" Goes to definition
nmap <silent> gd <Plug>(coc-definition)
" TODO: What is a type definition?
nmap <silent> gy <Plug>(coc-type-definition)
" TODO: What is implementation?
nmap <silent> gi <Plug>(coc-implementation)
" Shows all the reference to that function
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" NOTE: SHIFT + k, or upper case k
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"https://github.com/neoclide/coc-python/issues/63
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

