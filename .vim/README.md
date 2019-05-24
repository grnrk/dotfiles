# Plugins

## YouCompleteMe
https://github.com/Valloric/YouCompleteMe

### Installation
`apt install vim-youcompleteme vim-nox`

`vam install youcompleteme`

`cp /usr/lib/ycmd/ycm_extra_conf.py ~/.vim/config/`

Add to ~/.vimrc
```
let g:ycm_global_ycm_extra_conf = "~/.vim/config/ycm_extra_conf.py"
filetype on
```
