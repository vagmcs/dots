call plug#begin('~/.config/nvim/autoload/plugged')
	" Improved syntax support
	Plug 'sheerun/vim-polyglot'
	" File system explorer
	Plug 'preservim/nerdtree'
	" Insert, delete brackets, parenthesis and quotes in pairs
	Plug 'jiangmiao/auto-pairs'
	" Start screen
	Plug 'mhinz/vim-startify'
	" Dev Icons
	Plug 'ryanoasis/vim-devicons'
	" Intellisense
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" Git
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	" Vim Wiki
	Plug 'vimwiki/vimwiki'
	" Status line
	Plug 'itchyny/lightline.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" Colorizer
	Plug 'norcalli/nvim-colorizer.lua'
	" PyWal colorscheme
	Plug 'dylanaraps/wal.vim'
	" OneDark colorscheme
	Plug 'joshdick/onedark.vim'
	" Vimtex for LaTeX
	Plug 'lervag/vimtex'
	" Snippets
	Plug 'sirver/ultisnips'
call plug#end()
