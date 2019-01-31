" enter the current millenium
" must be first, because it changes other options as a side effect
set nocompatible

" Enable pathogen plugin manager
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
" needed for pathogen to be able to work magic
" and for tab settings below
filetype plugin indent on

syntax on
set ignorecase
set autoindent
set noswapfile
"set paste
set cursorline
" dont continue with comment after enter in insert or o/O
set formatoptions-=cro

" "TABWIDTH"
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab


" default to hybrid line numbers
set number
"set relativenumber

" enable absolute line no toggle
function! RelNumberToggle()
  if(&relativenumber == 1)
    set relativenumber !
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call RelNumberToggle()<cr>

" Toggle whitespace visibility
function! WhiteSpaceToggle()
  if(&list == 1)
    set list !
  else
    set list
    set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵
  endif
endfunc

nnoremap <C-w> :call WhiteSpaceToggle()<cr>

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

" SOLARIZED
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

" SYNTASTIC SETTINGS
" recommended defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

"" modemap settings
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": ["puppet", "python", "sh"],
    \ "passive_filetypes": ["ruby", "php"] }
" Set default python checker, flake8 = PEP8 + pyflakes
let g:syntastic_python_checkers = ['flake8']

" Pandoc
" Enable pandoc for these filetypes
let g:pandoc#filetypes#handled = ["pandoc", "markdown", "extra", "json"]
" Use markdown syntax (instead of pandoc-markdown) for markdown.
let g:pandoc#filetypes#pandoc_markdown = 0
" Disable folding
let g:pandoc#modules#disabled = ["folding"]
" Disable spellcheck
let g:pandoc#spell#enabled = 0
