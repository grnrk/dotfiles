" enter the current millenium
" must be first, because it changes other options as a side effect
set nocompatible
filetype plugin indent on

" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

" Load configuration
" Plugins
source ~/.config/nvim/vim/plugins.vim
" COC
source ~/.config/nvim/vim/coc.vim
" VimWiki
source ~/.config/nvim/vim/vimwiki.vim

syntax off  " Syntax hl handled by plugin

" set <Leader> to comma
let mapleader=","
set ignorecase
set noswapfile
set lazyredraw
set ttyfast
set title
" set paste
set pastetoggle=<Leader>p
set cursorline
" dont continue with comment after enter in insert or o/O
set formatoptions-=cro
" maintain undo history between sessions
set undofile
set undodir=~/.local/share/nvim/undo
" This is turned off because plugin lightline provides the same info.
set noshowmode

" Global tab/indentation
set tabstop=4
set expandtab
set autoindent
" Folding
" Open documents with folds open.
set nofoldenable
" Toggle folding/fold
nmap <space> za
" Toggle all folding
nmap <C-f> zi
" Filetypes with folding enabled
let g:markdown_folding = 1
" Tab completion + status bar display
"set wildmode=longest,list,full
set wildmenu

" File extension based settings
autocmd BufNewFile,BufRead *.py,*.sh
  \ set
  \ expandtab
  \ autoindent
  \ textwidth=100
  \ tabstop=4
  \ softtabstop=4
  \ shiftwidth=4

autocmd BufNewFile,BufRead *.yaml,*.yml,*.json
  \ set expandtab
  \ autoindent
  \ tabstop=2
  \ softtabstop=2
  \ shiftwidth=2

autocmd BufNewFile,BufRead *.md,*.markdown,*.MD
  \ set expandtab
  \ autoindent
  \ tabstop=2
  \ softtabstop=2
  \ shiftwidth=2

" limit textwidth for git commit edit message
autocmd BufNewFile,BufRead COMMIT_EDITMSG
  \ set
  \ textwidth=72

" Open help windows in vertical split to the right
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END
" Open git filetype to the right
autocmd FileType git wincmd L

" CFEngine3 syntax
au BufRead,BufNewFile *.cf set ft=cf3
au! Syntax cf3 source ~/.config/nvim/syntax/cf3.vim

set number
" Enable below to default to hybrid line numbers
" set relativenumber
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
nmap <silent> <Leader><Left> :vertical resize +10<CR>
nmap <silent> <Leader><Right> :vertical resize -10<CR>
nmap <silent> <Leader><Up> :resize +10<CR>
nmap <silent> <Leader><Down> :resize -10<CR>

" disable mouse
set mouse=

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

" Toggle search result hl
nmap <C-L> :set hlsearch!<CR>

" Instant md preview
map <leader>md :InstantMarkdownPreview<CR>
map <leader>mds :InstantMarkdownStop<CR>
" let g:instant_markdown_python = 1  " We use npm instant-markdown-d now...
let g:instant_markdown_autostart = 0
let g:instant_markdown_browser = "chromium"
