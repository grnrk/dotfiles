" enter the current millenium
" must be first, because it changes other options as a side effect
set nocompatible

" Enable pathogen plugin manager
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
" needed for pathogen to be able to work magic
" and for tab settings below
filetype plugin indent on

" set <Leader> to comma
let mapleader=","
syntax on
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

" Global tab/indentation
set tabstop=4
set expandtab
set autoindent

" Tab completion + status bar display
"set wildmode=longest,list,full
set wildmenu

" File extension based settings
autocmd BufNewFile,BufRead *.py,*.sh
  \ set paste!
  \ expandtab
  \ autoindent
  \ textwidth=79
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

" SOLARIZED
"set background=light
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
let g:syntastic_check_on_wq = 0

"" modemap settings
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": ["puppet", "python", "sh", "yaml"],
    \ "passive_filetypes": ["ruby", "php"] }
" Set default python checker, flake8 = PEP8 + pyflakes
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_yaml_checkers = ['yamllint']
" Toggle syntasticCheck
nnoremap <C-s> :call SyntasticToggleMode()<cr>

" Pandoc
" Enable pandoc for these filetypes
let g:pandoc#filetypes#handled = ["pandoc", "markdown", "extra", "json"]
" Use markdown syntax (instead of pandoc-markdown) for markdown.
let g:pandoc#filetypes#pandoc_markdown = 0
" Disable folding
let g:pandoc#modules#disabled = ["folding"]
" Disable spellcheck
let g:pandoc#spell#enabled = 0

" Limelight
let g:limelight_conceal_ctermfg = 'gray'
function! LimelightToggle()
    Limelight!!
endfunc
nnoremap <C-l> :call LimelightToggle()<cr>

" Enables YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/config/ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 1

" Status line items in the right hand column.
" Appended after syntastic hijacking.
set statusline+=%=
set statusline+=%#CursorColumn#
" File type
set statusline+=\ %y         
" File encoding
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" File format
set statusline+=\[%{&fileformat}\]
" Line number, line column
set statusline+=\ %l,%c
" Colors for statuslines, current resp. non-current. To hilight active window.
hi StatusLine ctermbg=11 cterm=bold gui=bold
hi StatusLineNC ctermbg=8 cterm=none gui=none
