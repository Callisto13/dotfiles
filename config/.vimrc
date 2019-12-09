set nowrap
set noswapfile

set background=dark
set colorcolumn=80
colorscheme hybrid
let g:airline_theme='hybrid'

hi clear SpellBad
hi clear SpellCap
hi clear SpellRare
hi clear SpellLocal
hi SpellBad cterm=underline
hi SpellBad gui=undercurl

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_virtualtext_prefix = '  >>  '

let NERDTreeShowHidden=1

" nnoremap <leader><leader> <c-^>
nnoremap ,, <c-^>
nnoremap <silent> ,b :FZFBuffers<cr>
nnoremap <Tab> :nohl<cr>
imap <C-a> <ESC>^i
imap <C-e> <ESC>$a
nmap ,. gc$
vmap ,. gc
