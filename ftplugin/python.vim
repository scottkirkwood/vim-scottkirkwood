" Python related settings.
set errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
nmap <buffer> <F5> :w\|!python %<CR>
nmap <buffer> <F5> :make<CR>

au BufRead,BufEnter */20p/* set shiftwidth=4 softtabstop=4
