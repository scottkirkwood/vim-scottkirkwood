" -----------------------------
"    Carpel Tunnel Related
" -----------------------------

" Map semicolon to be colon
" This means that we loose the semicolon which is used to 
" repeat last ft command
nnoremap ; :

" Special leader character is the spacebar
let mapleader=" "

" Set shorter timeout wait for mapleader
let timeoutLen=400

" Make F1 an extra escape key (hit it too often by accident)
map <F1> <ESC>
imap <F1> <ESC>

" Now up and down makes more sense when there's a long, wrapped line.
nnoremap k gk
nnoremap j gj

" pull full path name into paste buffer for attachment to email etc
nnoremap <silent> <F2> :let @*=expand("%:p")<cr>:echo "Filename '".expand("%:p")."' copied to clipboard"<cr>

" Make it a little like SciTE or visual studio
nmap <F4> :cnext
nmap <F8> :cwindow<CR>
nmap <F4> :cnext<CR>
nmap <S-F4> :cprev<CR>

" F5 lists all buffers, just type the number
nmap <F3> :ls<CR>:buffer<SPACE>

" Show line numbers flip-flop
nmap <F12> :set number!<CR>
