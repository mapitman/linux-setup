execute pathogen#infect()
call pathogen#helptags() 
colorscheme atom-dark-256
set nocompatible
syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set completeopt-=preview
let g:neocomplete#enable_at_startup=1
set cursorline
nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
au BufEnter /private/tmp/crontab.* setl backupcopy=yes
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:tagbar_type_go = {
     \ 'ctagstype' : 'go',
     \ 'kinds'     : [
         \ 'p:package',
         \ 'i:imports:1',
         \ 'c:constants',
         \ 'v:variables',
         \ 't:types',
         \ 'n:interfaces',
         \ 'w:fields',
         \ 'e:embedded',
         \ 'm:methods',
         \ 'r:constructor',
         \ 'f:functions'
     \ ],
     \ 'sro' : '.',
     \ 'kind2scope' : {
         \ 't' : 'ctype',
         \ 'n' : 'ntype'
     \ },
     \ 'scope2kind' : {
         \ 'ctype' : 't',
         \ 'ntype' : 'n'
     \ },
     \ 'ctagsbin'  : 'gotags',
     \ 'ctagsargs' : '-sort -silent'
     \ }
