# Neovim
Get Appimage **v0.5.1** from [Neovim on GitHub](https://github.com/neovim/neovim)

## Runtimepath
Plugins and other stuff are installed to `.local/share/nvim/`.  
Run `:set runtimepath?` to see which other dirs are sourced.

# VIM
Current config also works with vim8.

# Plugins

Managed with [Vim Plug](https://github.com/junegunn/vim-plug)

## YouCompleteMe
https://github.com/Valloric/YouCompleteMe

### Installation
`apt install vim-youcompleteme`

`vam --target-dir $HOME/.local/share/nvim/site install youcompleteme`

`cp /usr/lib/ycmd/ycm_extra_conf.py ~/.config/nvim/config/`

Add to ~/.config/nvim/init.vim:
```
let g:ycm_global_ycm_extra_conf = "~/.vim/config/ycm_extra_conf.py"
filetype on
```
