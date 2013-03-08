" -----------------------------
"    Tab Related
" -----------------------------

" Show tabs all the time, even when only one buffer.
set showtabline=2

" New Tab (Ctrl-Shift-T)
nnoremap <silent> <C-S-T> :tabnew<CR>
inoremap <silent> <C-S-T> <C-O>:tabnew<CR>

" When switching buffers, if it's already in a tab, use that one
set switchbuf=usetab

" Pop the stack
"map <C-S-t> :po<CR>

"" Go file, opens in a new tab
nnoremap gf <C-W>gf

" Alt-1 - Alt-10 go to the N-th tab
nmap <A-1> :tabn 1<CR>
imap <A-1> <C-O>:tabn 1<CR>
nmap <A-2> :tabn 2<CR>
imap <A-2> <C-O>:tabn 2<CR>
nmap <A-3> :tabn 3<CR>
imap <A-3> <C-O>:tabn 3<CR>
nmap <A-4> :tabn 4<CR>
imap <A-4> <C-O>:tabn 4<CR>
nmap <A-5> :tabn 5<CR>
imap <A-5> <C-O>:tabn 5<CR>
nmap <A-6> :tabn 6<CR>
imap <A-6> <C-O>:tabn 6<CR>
nmap <A-7> :tabn 7<CR>
imap <A-7> <C-O>:tabn 7<CR>
nmap <A-8> :tabn 8<CR>
imap <A-8> <C-O>:tabn 8<CR>
nmap <A-9> :tabn 9<CR>
imap <A-9> <C-O>:tabn 9<CR>
nmap <A-0> :tabn 10<CR>
imap <A-0> <C-O>:tabn 10<CR>

function! TabLeft()
  let tab_number = tabpagenr() - 1
  if tab_number == 0
    execute "tabm" tabpagenr('$') - 1
  else
    execute "tabm" tab_number - 1
  endif
endfunction

function! TabRight()
  let tab_number = tabpagenr() - 1
  let last_tab_number = tabpagenr('$') - 1
  if tab_number == last_tab_number
    execute "tabm" 0
  else
    execute "tabm" tab_number + 1
  endif
endfunction

noremap <silent> <S-C-PageUp> :call TabLeft()<CR>
noremap <silent> <S-C-PageDown> :call TabRight()<CR>

