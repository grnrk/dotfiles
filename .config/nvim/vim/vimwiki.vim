" Vim Wiki
au FileType vimwiki setlocal shiftwidth=2 tabstop=2 expandtab
let g:vimwiki_global_ext = 0
let g:vimwiki_hl_headers = 1
let g:vimwiki_auto_header = 1
" Neither C or S is working properly...
nmap <Leader><CR> <Plug>VimwikiTabnewLink
" nmap <C-A-t> <Plug>VimwikiTabnewLink
" <S-CR> <Plug>VimwikiSplitLink

"let g:vimwiki_list = [{'path': '~/vimwiki/',
"                     \ 'links_space_char': '_',
"                     \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_list = [{'path': '~/vimwiki/',
                     \ 'links_space_char': '_',
                     \ 'template_path': '~/vimwiki/templates/',
	                 \ 'template_default': 'default',
                     \ 'path_html': '~/vimwiki/site_html/',
                     \ 'custom_wiki2html': 'vimwiki_markdown',
                     \ 'template_ext': '.tpl',
                     \ 'syntax': 'markdown', 'ext': '.md'}]
" Create diary files using custom templating script
au BufNewFile ~/vimwiki/diary/*.md :silent 0r !~/.config/nvim/bin/diary_template.py '%'

