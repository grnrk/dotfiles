set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
source ~/.config/nvim/plugins.vim

" Instant md preview
map <leader>md :InstantMarkdownPreview<CR>
map <leader>mds :InstantMarkdownStop<CR>
let g:instant_markdown_python = 1  " Uses smdv and removes the JS dependency.
let g:instant_markdown_autostart = 0
