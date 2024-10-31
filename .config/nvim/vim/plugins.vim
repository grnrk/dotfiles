" Vim Plug
" https://github.com/junegunn/vim-plug
call plug#begin()

Plug 'shaunsingh/nord.nvim'
" Original with less settings: https://github.com/nordtheme/vim

" Markdown TOC popup menu
Plug 'AntonVanAssche/md-headers.nvim'
" Requirement for md-headers.nvim
Plug 'nvim-lua/plenary.nvim'

" In terminal md preview
Plug 'ellisonleao/glow.nvim'

" Browser preview
Plug 'instant-markdown/vim-instant-markdown'

" Markdown improved default view
Plug 'MeanderingProgrammer/render-markdown.nvim'
" Icon support for render-markdown.nvim, one of
" Plug 'echasnovski/mini.icons'
Plug 'nvim-tree/nvim-web-devicons'

" No more set paste!
Plug 'ConradIrwin/vim-bracketed-paste'

Plug 'ctrlpvim/ctrlp.vim'

" General folding improved
Plug 'Konfekt/FastFold'
" Python folding
Plug 'tmhedberg/SimpylFold'

Plug 'scrooloose/nerdtree'

" Statusbar
Plug 'itchyny/lightline.vim'

" No nonsense syntax HL that `just works`
Plug 'sheerun/vim-polyglot'
" TreeSitter is used for markdown because required by md-headers.nvim and render-markdown.nvim
" Also good for vim. See lua/init.vim for full list of loaded langs.
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Git integration
Plug 'tpope/vim-fugitive'

" Character pairing (cannot be used simultaneousley with <CR> for accepting selection in COC)
Plug 'tmsvg/pear-tree'

" Snippets library for coc-snippets
Plug 'honza/vim-snippets'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" plug#end() Automatically executes filetype plugin indent on and syntax enable.
