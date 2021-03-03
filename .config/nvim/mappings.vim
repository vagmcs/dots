
" You can't stop me from saving
cmap w!! w !sudo tee %


" Save
nnoremap <C-s> :w<CR>
" Quit
nnoremap <C-Q> :wq!<CR>


" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimTeX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

:nmap <C-b> :w<CR>:VimtexCompileSS<CR>
:nmap <C-n> :VimtexClean<CR>
:nmap <C-o> :VimtexView<CR>

