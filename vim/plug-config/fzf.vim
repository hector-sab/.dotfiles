"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://www.youtube.com/watch?v=on1AzaZzQ7k
" https://www.chrisatmachine.com/Neovim/08-fzf/
nnoremap <c-p> :FZF<CR>

nnoremap <leader>ps :Rg<CR>

" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \ fzf#vim#with_preview(), <bang>0)
