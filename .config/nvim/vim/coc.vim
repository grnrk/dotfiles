
let g:coc_global_extensions = ['coc-json', 'coc-yaml', 'coc-vimlsp', 'coc-markdownlint', 'coc-pyright', 'coc-sh', 'coc-snippets']

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file

"" Original tab completion (No snippets)
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" 
" " Make <CR> to accept selected completion item or notify coc.nvim to format
" " <C-g>u breaks current undo, please make your own choice
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"" END Oririginal tab completion

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" <CR> for accepting selection does not work with autopairing plugins 

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

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting code
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')
" Below don't work.. :(
" nmap <Leader>f :Format<CR>
" nnoremap <silent> <leader>f :call CocActionAsync('format')<CR>

" see `:h coc-status` for integrations with external statusline plugins
let g:lightline = {
      \ 'colorscheme': 'default',
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
