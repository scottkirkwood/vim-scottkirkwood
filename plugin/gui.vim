" -----------------------------
"    GUI Related
" -----------------------------

" Highlight as you search
set hlsearch

" Escape will also remove highlighting
nnoremap <ESC> :nohlsearch<CR><ESC>

" Color syntax highlighting on
syntax on

" Right click shows a menu
set mousemodel=popup
set nomousehide

" Remove left right scrollbars, scrollbars
set guioptions-=LRlr

" No toolbar
set guioptions-=T

" Ctrl-P autocomplete more bash like
set completeopt=longest,menu,preview
