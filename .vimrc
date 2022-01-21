" enter the current millenium
" must be first, because it changes other options as a side effect
set nocompatible

" Is this still needed???
filetype plugin indent on
:
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

" set <Leader> to comma
let mapleader=","
set ignorecase
set noswapfile
set lazyredraw
set ttyfast
set title
set paste
set pastetoggle=<Leader>p
set cursorline
" dont continue with comment after enter in insert or o/O
set formatoptions-=cro
" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
" This is turned off because plugin lightline provides the same info.
set noshowmode

" Global tab/indentation
set tabstop=4
set expandtab
set autoindent
" Open documents with folds open.
set nofoldenable
" Enable toggle folding/fold
nmap <space> za
" Enable toggle all folding
nmap <C-f> zi
" Tab completion + status bar display
"set wildmode=longest,list,full
set wildmenu

" File extension based settings
autocmd BufNewFile,BufRead *.py,*.sh
  \ set paste!
  \ expandtab
  \ autoindent
  \ textwidth=100
  \ tabstop=4
  \ softtabstop=4
  \ shiftwidth=4

autocmd BufNewFile,BufRead *.yaml,*.yml
  \ set expandtab
  \ autoindent
  \ tabstop=2
  \ softtabstop=2
  \ shiftwidth=2

" limit textwidth for git commit edit message
autocmd BufNewFile,BufRead COMMIT_EDITMSG
  \ set paste!
  \ textwidth=72

" default to hybrid line numbers
set number
set relativenumber
nmap <Leader>n :set number!<cr>
nmap <C-n> :set relativenumber!<cr>


" Toggle whitespace visibility
function! WhiteSpaceToggle()
  if(&list == 1)
    set list !
  else
    set list
    set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵,space:⎵
  endif
endfunc

nmap <C-w> :call WhiteSpaceToggle()<cr>

" window navigation rebindings
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
" window rotation rebindings
nmap <silent> <C-A-Up> :wincmd K<CR>
nmap <silent> <C-A-Down> :wincmd J<CR>
nmap <silent> <C-A-Left> :wincmd H<CR>
nmap <silent> <C-A-Right> :wincmd L<CR>
" window resize keybindings
nmap <silent> <Leader>> :vertical resize +10<CR>
nmap <silent> <Leader>< :vertical resize -10<CR>
nmap <silent> <Leader>+ :resize +10<CR>
nmap <silent> <Leader>- :resize -10<CR>

" disable mouse
set mouse-=a

" show status line at all times
set laststatus=2
" Open tabs when switching buffers. to the existing tab if the buffer is open, or creating a new one if not
set switchbuf=usetab,newtab
" COLORS!
" enable 256 colors
set t_Co=256

" MOLOKAI
let g:molokai_original = 1
colorscheme molokai

" NERDTree
map <C-t> :NERDTreeToggle<CR>
" Exit vim if the only window left is NERDTree.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" SYNTAX HIGHLIGHTING
" vim-polygot is used for improved syntax hl in favour of `syntax on`

" Toggle search result hl
nmap <C-L> :set hlsearch!<CR>

" YouCompleteMe settings
" Reference: /usr/share/vim-youcompleteme/doc/youcompleteme.txt 
let g:ycm_global_ycm_extra_conf = "~/.vim/config/ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 1
" Turn off doc auto hover
let g:ycm_auto_hover = ""
" Ycm keybindings
nmap gd :YcmCompleter GoTo<CR>
"nmap gh :YcmCompleter GetDoc<CR>
nmap gh <plug>(YCMHover)

" ALE settings
" https://github.com/dense-analysis/ale
" Run :ALEinfo to see what's configured

" let g:ale_lint_on_enter = 0
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
" ALE keybindings
nmap <silent> <C-s> <Plug>(ale_toggle)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" By default, all available (installed) tools for all supported languages
" will be run. This selects a subset:
let g:ale_linters = {
\   'python': ['flake8', 'mypy', 'black'],
\}
let b:ale_fixers = {
\    'javascript': ['prettier', 'eslint'],
\    'python': ['black'],
\}

" Enable lightline-ale to provide ale status for lightline
let g:lightline = {}
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }
let g:lightline.active = {
        \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
        \            [ 'lineinfo' ],
	    \            [ 'percent' ],
	    \            [ 'fileformat', 'fileencoding', 'filetype'] ] }

call plug#begin()
" Make sure you use single quotes
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomasr/molokai'  " colors/molokai.vim is symlinked to .vim/colors
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

" Vim Wiki
au FileType vimwiki setlocal shiftwidth=2 tabstop=2 expandtab
