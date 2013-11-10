" -----------------------------
"    Style related
" -----------------------------

" was 100 character line width
set textwidth=80

" I don't like indenting after the parenthesis, this removes it.
setlocal cinoptions+=W2s

" Force to tabs, everything N spaces.
set tabstop=2           " use n columns to represent tab
set shiftwidth=2        " number of spaces to use for <<, >> indent
"set softtabstop=2       " Not needed if expandtab is used
set expandtab           " always use spaces
set nocindent           " no c style indenting
set nosmartindent       " Don't be smart
set cinoptions=W2s      " indent continuation lines 2x tabstop (Google style)

" These now in sensible.vim
set autoindent          " copy indent from current line when starting a new
set backspace=indent,eol,start " From Google
set smarttab            " Tab inserts, bs removes indent
set incsearch           " incremental search
set laststatus=2        " tell vim to always show the status line, even if there's only one window.
set showcmd             " Show partial commands in the status line
                        " Also shows how many characters selected in visual mode, cursor position, etc.
set wildmenu
set autoread            " Auto load any changed files
set autowrite           " Write any changed buffers before make, etc.


" Show nbsp and tabs as special chars, don't show EOL.
set list listchars=tab:->,nbsp:%

" Color the 81st column for wide lines
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Show whitespace at end of the line
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

" Indent block, but stay in indent mode.
"vnoremap < <gv
"vnoremap > >gv

" Capitalize visually selected text first letter only
vnoremap <leader>C <C-O>:s/\<\(.\)\(\k*\)\>/\u\1\L\2/g<CR>

" Change name_with_underscores to NamesInCameCase for visually selected text.
vnoremap <leader>c <C-O>:s/_\([a-z]\)/\u\1/g<CR>gUl

" Change CamelCase to name_with_underscore for visually selected text.
vnoremap <leader>u <C-O>:s/\<\@!\([A-Z]\)/\_\l\1/g<CR>gul
