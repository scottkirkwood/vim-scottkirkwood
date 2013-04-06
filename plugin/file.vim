" -----------------------------
"    Directory/File Related
" -----------------------------

" make filename auto-complete work like bash
set wildmode=longest:full
set wildignore=*.swp,*.bak,*.pwc,*.class

" Remember the last position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Change to the directory the file in your current buffer is in
set autochdir

" Save temp files here instead of all over the place.
" May need to run mkdir -p /var/tmp/${USER}/vim
set dir=/var/tmp/${USER}/vim/
set undodir=/var/tmp/${USER}/vim/

" Save all when focus is lost
" Run :autocmd! FocusLost to remove if running through ssh
autocmd FocusLost * :wa

" Stop the warnings about open .swp files.
set shortmess+=A

" Always browse in the buffer's directory
set browsedir=buffer

" Put spell check words in this file
set spellfile=~/.spellfile.add

" Hide the buffers instead of closing them
set hidden

