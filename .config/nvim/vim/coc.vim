
let g:coc_global_extensions = ['coc-json', 'coc-yaml', 'coc-vimlsp', 'coc-markdownlint', 'coc-pyright', 'coc-sh', 'coc-snippets', 'coc-tsserver', 'coc-prettier' ]

" Disable startup warnings since system neovim is below reccomended version and appimage neovim makes color go ugh.
let g:coc_disable_startup_warning = 1

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" PearTree interferes with COC <CR> for accepting selection
" Below disables automapping so we can fix COC mapping.
" See https://github.com/tmsvg/pear-tree/issues/33 for alternative solutions 
let g:pear_tree_map_special_keys = 0
" Default mappings:
imap <BS> <Plug>(PearTreeBackspace)
imap <Esc> <Plug>(PearTreeFinishExpansion)
" Get PearTreeExpand working with coc.nvim
imap <expr> <CR> pumvisible() ? coc#_select_confirm() : "\<Plug>(PearTreeExpand)"


" Jump to next position in snippet
let g:coc_snippet_next = '<tab>'
"" END Tab completion with coc-snippets

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" diagnostics keybindings
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nnoremap <silent> <C-s> :call CocAction('diagnosticToggleBuffer')<CR>
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
" nmap <silent> <C-k> <Plug>(coc-diagnostic-prev-error)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)
" nmap <silent> <C-j> <Plug>(coc-diagnostic-next-error)

" GoTo code navigation
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use H to show documentation in preview window
nnoremap <silent> H :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('H', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting code
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')
" Leader don't work.. :(
" nmap <Leader>f :Format<CR>
" nnoremap <silent> <leader>f :call CocActionAsync('format')<CR>
" But others do..
" nnoremap <C-i> :call CocActionAsync('format')<CR>
nnoremap <C-i> :Format<CR>

" see `:h coc-status` for integrations with external statusline plugins
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Markdownlint fix
" nnoremap <silent> <leader>mf :call CocCommand markdownlint.fixAll<CR>
nmap <silent> mdf :CocCommand markdownlint.fixAll<cr>

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
