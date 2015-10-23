" -----------------------------
"    GUI Related
" -----------------------------

if has('gui_running')
  " Right click shows a menu
  set mousemodel=popup
  set nomousehide
else
  " something for console Vim

  " Turn of paren matching
  let loaded_matchparen = 1
endif

" Highlight as you search
set hlsearch

" Escape will also remove highlighting
" use :noh  this causes problems on the first keystroke
" nnoremap <ESC> :nohlsearch<CR><ESC>

" Color syntax highlighting on
syntax on

" Remove left right scrollbars, scrollbars
set guioptions-=LRlr

" No toolbar
set guioptions-=T

" Ctrl-P autocomplete more bash like
set completeopt=longest,menu,preview

" Nice characters for airline powerline
" May need new consolas font.
let g:airline_powerline_fonts = 1
