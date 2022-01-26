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

`mkdir ~/.local/share/nvim/site/config`
`cp /usr/lib/ycmd/ycm_extra_conf.py  ~/.local/share/nvim/site/config/`

Add to ~/.config/nvim/init.vim:
```
let g:ycm_global_ycm_extra_conf = " ~/.local/share/nvim/site/config/ycm_extra_conf.py"
filetype on
```

## Instant markdown

Markdown preview generator  
https://github.com/instant-markdown/vim-instant-markdown

**Dependencies:**  
  * python [smdv](https://pypi.org/project/smdv/)
  * pandoc


## VimWiki
### MD2HTML
Markdown to HTML conversion is provided by [`vimwiki_markdown`](https://github.com/WnP/vimwiki_markdown/)  
This is enabled in the `custom_wiki2html` paramter.
