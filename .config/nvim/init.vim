set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Vim Plug
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomasr/molokai' 
Plug 'tmhedberg/SimpylFold'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tmsvg/pear-tree'
Plug 'vimwiki/vimwiki'
call plug#end()
" plug#end() Automatically executes filetype plugin indent on and syntax enable.
syntax off
