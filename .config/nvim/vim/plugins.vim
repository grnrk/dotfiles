" Vim Plug
" https://github.com/junegunn/vim-plug
call plug#begin()

" Make sure you use single quotes!

Plug 'shaunsingh/nord.nvim'
" Original with less settings: https://github.com/nordtheme/vim

" Markdown highlights
Plug 'lukas-reineke/headlines.nvim'

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

" Syntax HL
Plug 'sheerun/vim-polyglot'

" Git integration
Plug 'tpope/vim-fugitive'

" Character pairing (cannot be used simultaneousley with <CR> for accepting selection in COC)
" Plug 'tmsvg/pear-tree'

Plug 'vimwiki/vimwiki'

Plug 'instant-markdown/vim-instant-markdown'

" Snippets library for coc-snippets
Plug 'honza/vim-snippets'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" plug#end() Automatically executes filetype plugin indent on and syntax enable.
