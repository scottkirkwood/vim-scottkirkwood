" Vim File by Scott Kirkwood <scott@forusers.com>

" Not straight vi
set nocompatible

" Split window to the right.
set splitright

" highlight the current line, adjust the color
"set cursorline
"highlight CursorLine term=none cterm=none ctermbg=3

" Highlight word under cursor, a little annoying
"highlight flicker gui=bold guifg=black
"autocmd CursorMoved <buffer> exe 'match flicker /\V\<'.escape(expand('<cword>'), '/').'\>/'

" Edit alternate file.
"map gg :e#<CR>

" Yank to selection register
" Note Vim 7.3.74+ has unnamedplus
set clipboard=unnamedplus

" make visual selection go to the clipboard
set guioptions+=a

" Inconsolata font
set gfn=Inconsolata\ For\ Powerline\ Medium\ 12

" Font for presentations
"set gfn=Inconsolata\ Bold\ 16

" Eclim
" Import class under cursor
"nmap <leader>i :JavaImport<cr>
"nmap <leader>p :ProjectProblems<cr>
"nmap <leader>c :JavaCorrect<cr>

" Search for visually selected text, escapes special chars.
vmap // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" Snippets
let g:snips_author = 'Scott Kirkwood'
let g:snips_email = 'scottkirkwood@google.com'
let g:snips_ldap = 'scottkirkwood'

let g:UltiSnipsExpandTrigger = '<c-j>'

let g:ycm_confirm_extra_conf = 0

" Default supertab to use completion
" let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

" Notes:

" Read a command into current buffer
" : r! ls *.c

" Write and execute the current buffer (assuming it's a shell command)
" :w !sh

" TODO make this into a function
" s/\([a-z0-9A-Z_:]\+\)="\(\w\+\)"/<item name="\1">\2<\/item>/
" s/<item name="\([^"]\+\)">\([^<]\+\)<\/item>/\1="\2"/

" My library for resolving merge conflicts.
"source ~/bin/resolve_all.vim

" DIFF

