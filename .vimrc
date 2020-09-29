" __ __   ____   ____  ___ ___    __ _____
" |  |  | /    | /    ||   |   |  /  ] ___/
" |  |  ||  o  ||   __|| _   _ | /  (   \_ 
" |  |  ||     ||  |  ||  \_/  |/  / \__  |
" |  :  ||  _  ||  |_ ||   |   /   \_/  \ |
"  \   / |  |  ||     ||   |   \     \    |
"   \_/  |__|__||___,_||___|___|\____|\___|


set nocompatible
filetype plugin on
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
	Plug 'itchyny/lightline.vim'
	Plug 'lervag/vimtex'
	Plug 'sirver/ultisnips'
	Plug 'dylanaraps/wal'
	Plug 'vimwiki/vimwiki'
	Plug 'severin-lemaignan/vim-minimap'
	Plug 'KeitaNakamura/tex-conceal.vim'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Enables PyWal theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme wal


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Numbers, Tabs and Spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number 

set tabstop=4
set shiftwidth=4
set smarttab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildmenu
set hlsearch
set incsearch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set mouse=nicr


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" "Remap ESC to ii
:imap ii <Esc>
:nmap <C-b> :w<CR>:VimtexCompileSS<CR>
:nmap <C-c> :VimtexClean<CR>
:nmap <C-v> :VimtexView<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set noshowmode
set laststatus=2

let g:lightline = { 'colorscheme': 'wombat' }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimtex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tex_flavor='latex'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_quickfix_mode=0

set conceallevel=2
let g:tex_conceal='abdmgs'
hi clear Conceal


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/ultisnips']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spellcheck
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal spell
set spelllang=en,el


