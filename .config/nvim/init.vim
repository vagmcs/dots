" _   _         __     ___
"| \ | | ___  __\ \   / (_)_ __ ___
"|  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
"| |\  |  __/ (_) \ V / | | | | | | |
"|_| \_|\___|\___/ \_/  |_|_| |_| |_|
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Source plugins and key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ${HOME}/.config/nvim/plugins.vim
source ${HOME}/.config/nvim/mappings.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

set splitbelow							" Horizontal splits must automatically be below
set splitright							" Vertical splits must automatically be to the right

set clipboard=unnamedplus

set showtabline=2						" Always show open tabs

set pumheight=10 						" Makes popup menu smaller
set iskeyword+=- 						" Treat dash separated words as a word text object"

set nobackup                " Recommended by COC
set nowritebackup           " Recommended by COC
set formatoptions-=cro      " Stop newline continution of comments
set updatetime=500          " Faster completion


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Numbers, Tabs and Spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number					" Enable line numbers

set tabstop=2				" Insert 2 spaces for a tab
set shiftwidth=2		" Change the number of spaces inserted for indentation
set smarttab				" Makes tabs smarter
set autoindent			" Good auto indent
set smartindent			" Makes indenting smart


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildmenu
set hlsearch
set incsearch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set mouse=a			" Enable mouse in all modes
set ruler				" Show the cursor position all the times
set cursorline	" Enable highlighting of the cursor line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimtex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_quickfix_mode = 0
let g:livepreview_previewer = 'zathura'
autocmd Filetype tex setl updatetime=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set noshowmode		" No need to see things like -- INSERT -- anymore
set laststatus=2 	" Always display the status line

let g:lightline = {
\		'colorscheme': 'onedark',
\		'active': {
\			'left': [	[ 'mode', 'paste' ], 
\								[ 'gitbranch', 'readonly', 'filename', 'modified' ]	]
\		},
\		'component_function': {
\			'gitbranch': 'FugitiveHead'
\		}
\ }

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Enable theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 1

syntax enable								" Enables syntax highlighing
set background=dark 				" Tell vim what the background color looks like
colorscheme onedark 				" Use the one dark colorscheme

set termguicolors

lua require'colorizer'.setup()

